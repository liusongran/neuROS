#ifndef COM_ITEM_INC_ITEM_ITEM_SUBSCRIPTION_H_
#define COM_ITEM_INC_ITEM_ITEM_SUBSCRIPTION_H_

#include "rcl/subscription.h"
#include "item/ring_buffer.h"

typedef struct sub_info_t{
	const rcl_subscription_t* sub;
	const char* topic_name;
	rmw_qos_profile_t QoS;
	uint64_t id;
	//bool use_take_shared_method;

	ring_buffer_t sub_ring_buffer;
	int ring_buffer_ready;

	struct sub_info_t *next;//使用链表存储
}sub_info_t;

extern uint64_t sub_global_id;//全局变量，初始值设置为1
extern sub_info_t *sub_map_head;//头结点

void sub_map_init();
uint64_t get_subscription_id(const rcl_subscription_t *sub);
sub_info_t* sub_map_add(const rcl_subscription_t *sub);
sub_info_t* get_subscription_info(const rcl_subscription_t *sub);
void sub_map_remove(const rcl_subscription_t *sub);
bool check_sub_ring_buffer(const rcl_subscription_t * subscription);
void take_sub_message(const rcl_subscription_t * subscription,void * ros_message);

#endif /* COM_ITEM_INC_ITEM_ITEM_SUBSCRIPTION_H_ */
