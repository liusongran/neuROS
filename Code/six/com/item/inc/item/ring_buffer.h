#ifndef COM_ITEM_INC_ITEM_RING_BUFFER_H_
#define COM_ITEM_INC_ITEM_RING_BUFFER_H_

#include <stdint.h>
#include <stdbool.h>

#define COMM_ITEM_DATA_POOL_ITEM_SIZE       100     // data_pool item size in bytes
#define COMM_ITEM_DATA_POOL_ITEM_MAX_NUM    10      // data_pool item maximum number
#define COMM_ITEM_DATA_POOL_MAX_NUM         10       // data_pool maximum number

typedef struct data_pool_item_s
{
    /// timestamp: when this msg created
    uint64_t timestamp;
    /// data content
    char data[COMM_ITEM_DATA_POOL_ITEM_SIZE];//一个消息可能有许多数据，将数据暂且声明为char型
}data_pool_item_t;

typedef struct data_pool_s
{
	int size;
	//考虑将此处由数组改为链表
    data_pool_item_t *data_pool[COMM_ITEM_DATA_POOL_ITEM_MAX_NUM];//一次可能发送许多个消息，只是一次发送，故不需要定义成循环队列
}data_pool_t;

typedef enum{
	PUB,
	SUB
}Owner_Type;

//1.pub发送消息msg到ring_buffer中，对应的sub从ring_buffer中取消息msg处理
//2.一个pub可能不止一次发送msg，一次可能发送许多个消息，一个消息可能有许多数据，所以需要一个data_pool_t存储一次发送的消息
//3.消息的类型是不确定的

typedef struct ring_buffer_s
{
    /// owner type: pub or sub
	Owner_Type owner_type;

	/*
    /// owner entity of this buffer in case of usage
    union{
    	pub_info_t *pub_owner;
    	sub_info_t *sub_owner;
    };
    */

    /// data type, may need include a `msg_t` structure
    //void* msg_type;//发送的数据类型，void* 可以指向任何数据类型，根据需求进行强制类型转换
    //默认发送的数据为char型

	uint64_t read_index;//相当于循环队列中的front
	uint64_t write_index;//相当于循环队列中的rear
    /// data_pool_index
    data_pool_t *ptr_data_pool[COMM_ITEM_DATA_POOL_MAX_NUM];
} ring_buffer_t;

uint64_t get_clocktime();
data_pool_t* data_pool_init();
data_pool_item_t data_pool_item_init(const void * ros_message);
data_pool_t* data_pool_add_item(data_pool_t* data_pool,const void * ros_message);
bool ring_buf_put(ring_buffer_t *ring_buf,data_pool_t *pool);
bool ring_buf_read(ring_buffer_t *ring_buf,data_pool_t *pool);

#endif /* COM_ITEM_INC_ITEM_RING_BUFFER_H_ */
