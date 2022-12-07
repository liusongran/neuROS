#ifndef COM_ITEM_INC_ITEM_ITEM_PUBLISHER_H_
#define COM_ITEM_INC_ITEM_ITEM_PUBLISHER_H_

#include "rcl/publisher.h"
#include "item/ring_buffer.h"

typedef struct pub_info_t{
	const rcl_publisher_t* pub;
	const char* topic_name;
	rmw_qos_profile_t QoS;
	uint64_t id;

	ring_buffer_t pub_ring_buffer;

	struct pub_info_t *next;//使用链表存储
}pub_info_t;//相当于对pub封装一下，加入额外信息

extern uint64_t pub_global_id;//全局变量，初始值应设为1
extern pub_info_t *pub_map_head;//头结点

//各种函数声明
void pub_map_init();//pub_map初始化
uint64_t get_publisher_id(const rcl_publisher_t *pub);
pub_info_t* pub_map_add(const rcl_publisher_t *pub);
pub_info_t* get_publisher_info(const rcl_publisher_t *pub);
void pub_map_remove(const rcl_publisher_t *pub);

#endif /* COM_ITEM_INC_ITEM_ITEM_PUBLISHER_H_ */
