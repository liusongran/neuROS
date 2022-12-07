#include "item/item_publisher.h"
#include "item/item_subscription.h"
#include "item/pub_to_sub.h"
#include "../../../rcl/src/subscription_impl.h"

uint64_t sub_global_id;
sub_info_t *sub_map_head;

void sub_map_init(){
	sub_map_head=(sub_info_t*)malloc(sizeof(sub_info_t));
	sub_map_head->next=NULL;
	sub_global_id=1;
}

uint64_t get_subscription_id(const rcl_subscription_t *sub){
	sub_info_t *s=sub_map_head->next;
	while(s!=NULL){
		if(s->sub==sub)
			return s->id;
		s=s->next;
	}
	return -1;
}

uint64_t get_next_unique_id_2(){
	//此处省略异常处理，当pub_glo_id的值溢出时应从头开始赋值
	return sub_global_id++;
}

//一个subscription对应一个ring_buffer
ring_buffer_t sub_ring_buffer_init(const rcl_subscription_t *sub){
	ring_buffer_t ring_buffer;
	ring_buffer.owner_type=SUB;
	//ring_buffer.sub_owner=get_subscription_info(sub);
	ring_buffer.read_index=0;
	ring_buffer.write_index=0;
	return ring_buffer;
}

sub_info_t* sub_map_add(const rcl_subscription_t *sub){
	sub_info_t *temp=(sub_info_t*)malloc(sizeof(sub_info_t));
	temp->sub=sub;
	temp->topic_name=sub->impl->rmw_handle->topic_name;
	temp->QoS=sub->impl->actual_qos;
	temp->id=get_next_unique_id_2();
	temp->sub_ring_buffer=sub_ring_buffer_init(sub);
	temp->ring_buffer_ready=0;//初始化标志位
	temp->next=sub_map_head->next;//头插法
	sub_map_head->next=temp;
	pub_info_t *pub=pub_map_head->next;
	while(pub!=NULL){
		if(can_communicate(pub,temp))
			insert_sub_for_pub(pub,temp);
		pub=pub->next;
	}
	return temp;
}

sub_info_t* get_subscription_info(const rcl_subscription_t *sub){
	sub_info_t* s=sub_map_head->next;
	while(s!=NULL){
		if(s->sub==sub)
			return s;
		s=s->next;
	}
	return sub_map_add(sub);
}

void sub_map_remove(const rcl_subscription_t *sub){
	pub_to_sub_t *temp=pub_to_sub_head->next;
	while(temp!=NULL){
		sub_t *s=&temp->sub_head;
		while(s->next!=NULL){
			if(s->next->sub->sub==sub){
				sub_t *temp1=s->next;
				s->next=temp1->next;
				free(temp1);
				break;
			}
			s=s->next;
		}
		temp=temp->next;
	}
	sub_info_t *s=sub_map_head;
	while(s->next!=NULL){
		if(s->next->sub==sub){
			sub_info_t *t=s->next;
			s->next=t->next;
			free(s);
			return;
		}
		s=s->next;
	}
}
bool check_sub_ring_buffer(const rcl_subscription_t * subscription){
	sub_info_t* s=get_subscription_info(subscription);
	return s->ring_buffer_ready;
}

void take_sub_message(const rcl_subscription_t * subscription,void * ros_message){
	sub_info_t* s=get_subscription_info(subscription);
	data_pool_t data_pool;
	ring_buf_read(&s->sub_ring_buffer,&data_pool);
	if(ring_buf_empty(s->sub_ring_buffer))
		s->ring_buffer_ready=false;
	ros_message=data_pool.data_pool[data_pool.size-1]->data;
}
