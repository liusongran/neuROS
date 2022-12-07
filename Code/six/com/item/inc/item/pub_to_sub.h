#ifndef COM_ITEM_INC_ITEM_PUB_TO_SUB_H_
#define COM_ITEM_INC_ITEM_PUB_TO_SUB_H_

#include "item/item_publisher.h"
#include "item/item_subscription.h"

#define PUBTOSUBMAXNUM 10

typedef struct sub_t{
	sub_info_t *sub;

	struct sub_t *next;
}sub_t;

typedef struct pub_to_sub_t{
	pub_info_t *pub;
	sub_t sub_head;//头结点

	struct pub_to_sub_t *next;
}pub_to_sub_t;

extern pub_to_sub_t *pub_to_sub_head;

void pub_to_sub_init();
bool can_communicate(pub_info_t* pub,sub_info_t* sub);
void insert_sub_for_pub(pub_info_t* pub,sub_info_t* sub);
sub_t* get_pub_to_sub_info(const rcl_publisher_t *pub);
void pub_to_sub_publish(const rcl_publisher_t * publisher,const void * ros_message);

#endif /* COM_ITEM_INC_ITEM_PUB_TO_SUB_H_ */
