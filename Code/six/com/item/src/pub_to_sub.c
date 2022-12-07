#include "item/pub_to_sub.h"

pub_to_sub_t *pub_to_sub_head;

void pub_to_sub_init(){
	pub_to_sub_head=(pub_to_sub_t*)malloc(sizeof(pub_to_sub_t));
	pub_to_sub_head->next=NULL;
}

bool can_communicate(pub_info_t* pub,sub_info_t* sub){
	if(strcmp(pub->topic_name,sub->topic_name)!=0)
		return false;
	if(pub->QoS.reliability!=sub->QoS.reliability)
		return false;
	if(pub->QoS.durability!=sub->QoS.durability)
		return false;
	return true;
}

void insert_sub_for_pub(pub_info_t* pub,sub_info_t* sub){
	pub_to_sub_t *temp=pub_to_sub_head->next;
	while(temp!=NULL){
		if(temp->pub==pub)
			break;
		temp=temp->next;
	}
	sub_t *s=(sub_t*)malloc(sizeof(sub_t));
	s->sub=sub;
	s->next=temp->sub_head.next;//头插法
	temp->sub_head.next=s;
}

sub_t* get_pub_to_sub_info(const rcl_publisher_t *pub){
	pub_to_sub_t *temp=pub_to_sub_head->next;
	while(temp!=NULL){
		if(temp->pub->pub==pub)
			break;
		temp=temp->next;
	}
	return temp->sub_head.next;
}

void pub_to_sub_publish(const rcl_publisher_t * publisher,const void * ros_message){
	pub_info_t* pub=get_publisher_info(publisher);
	ring_buf_put(&pub->pub_ring_buffer, data_pool_add_item(data_pool_init(), ros_message));
	sub_t* sub=get_pub_to_sub_info(publisher);
	while(sub!=NULL){
		//pub和sub不能合用同一份data_pool，需要分别初始化data_pool并加入对应的ring_buffer中
		ring_buf_put(&sub->sub->sub_ring_buffer,data_pool_add_item(data_pool_init(), ros_message));
		sub->sub->ring_buffer_ready=1;//修改标志位
		sub=sub->next;
	}
}

