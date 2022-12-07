#include "item/item_publisher.h"
#include "item/item_subscription.h"
#include "item/pub_to_sub.h"
#include "../../../rcl/src/publisher_impl.h"

uint64_t pub_global_id;//全局变量，初始值应设为1
pub_info_t *pub_map_head;

void pub_map_init(){
	pub_map_head=(pub_info_t*)malloc(sizeof(pub_info_t));//为头结点分配地址空间
	pub_map_head->next=NULL;
	pub_global_id=1;
}

uint64_t get_publisher_id(const rcl_publisher_t *pub){
	pub_info_t *p=pub_map_head->next;
	while(p!=NULL){
		if(p->pub==pub)
			return p->id;
		p=p->next;
	}
	return -1;//返回-1表示查找失败
}

uint64_t get_next_unique_id_1(){
	//此处省略异常处理，当pub_glo_id的值溢出时应从头开始赋值
	return pub_global_id++;
}

//一个publisher对应一个ring_buffer
ring_buffer_t pub_ring_buffer_init(const rcl_publisher_t *pub){
	ring_buffer_t ring_buffer;
	ring_buffer.owner_type=PUB;
	//ring_buffer.pub_owner=get_publisher_info(pub);
	ring_buffer.read_index=0;
	ring_buffer.write_index=0;
	return ring_buffer;
}

pub_info_t* pub_map_add(const rcl_publisher_t *pub){
	pub_info_t *temp=(pub_info_t*)malloc(sizeof(pub_info_t));//分配地址空间
	temp->pub=pub;
	temp->topic_name=pub->impl->rmw_handle->topic_name;
	temp->QoS=pub->impl->actual_qos;
	temp->id=get_next_unique_id_1();
	temp->pub_ring_buffer=pub_ring_buffer_init(pub);
	//头插法插入pub_map
	temp->next=pub_map_head->next;
	pub_map_head->next=temp;
	//更新pub_to_sub映射
	pub_to_sub_t *t=(pub_to_sub_t*)malloc(sizeof(pub_to_sub_t));//分配地址空间
	t->pub=temp;
	t->sub_head.next=NULL;
	//头插法插入pub_to_sub
	t->next=pub_to_sub_head->next;
	pub_to_sub_head->next=t;

	sub_info_t *sub=sub_map_head->next;
	while(sub!=NULL){
		if(can_communicate(temp, sub))
			insert_sub_for_pub(temp,sub);
		sub=sub->next;
	}
	return temp;
}

pub_info_t* get_publisher_info(const rcl_publisher_t *pub){
	pub_info_t* p=pub_map_head->next;
	while(p!=NULL){
		if(p->pub==pub)
			return p;
		p=p->next;
	}
	return pub_map_add(pub);
}

void pub_map_remove(const rcl_publisher_t *pub){
	//使用链表存储的优点在此处展现，删除时比较方便
	pub_to_sub_t *temp=pub_to_sub_head;
	while(temp->next!=NULL){
		if(temp->next->pub->pub==pub){
			//先删除pub_to_sub中对应的pub
			pub_to_sub_t *temp1=temp->next;
			temp->next=temp1->next;//删除
			free(temp1);//释放
			break;
		}
		temp=temp->next;
	}
	pub_info_t *p=pub_map_head;//指向头结点
	while(p->next!=NULL){
		if(p->next->pub==pub){
			//再删除pub_map中对应的pub
			pub_info_t *t=p->next;
			p->next=t->next;//删除操作
			free(t);//释放空间
			return;
		}
		p=p->next;
	}
}
