#include "item/ring_buffer.h"
#include "time.h"
#include <string.h>
#include <stdlib.h>

uint64_t get_clocktime() {
    long int ns;
    uint64_t all;
    time_t sec;
    struct timespec spec;
    clock_gettime(CLOCK_REALTIME, &spec);
    sec = spec.tv_sec;
    ns = spec.tv_nsec;
    all = (uint64_t) sec * 1000000000UL + (uint64_t) ns;
    return all;
}

bool ring_buf_full(ring_buffer_t ring_buf){
	return (ring_buf.write_index+1)%COMM_ITEM_DATA_POOL_MAX_NUM==ring_buf.read_index;
}

bool ring_buf_empty(ring_buffer_t ring_buf){
	return ring_buf.write_index==ring_buf.read_index;
}

data_pool_t* data_pool_init(){
	data_pool_t *data_pool=(data_pool_t *)malloc(sizeof(data_pool_t));
	data_pool->size=0;
	return data_pool;
}

/*
data_pool_item_t data_pool_item_init(const void * ros_message){
	data_pool_item_t item;
	item.timestamp=get_clocktime();
	strcpy(item.data,ros_message);
	return item;
}


void data_pool_add_item(data_pool_t *data_pool,data_pool_item_t *item){
	data_pool->data_pool[data_pool->size++]=item;
	//此处省略数组满的异常处理
}
*/

data_pool_t* data_pool_add_item(data_pool_t* data_pool,const void * ros_message){
	data_pool_item_t *item=(data_pool_item_t *)malloc(sizeof(data_pool_item_t));//分配地址空间
	item->timestamp=get_clocktime();
	strcpy(item->data,ros_message);
	data_pool->data_pool[data_pool->size++]=item;
	//此处省略数组满的异常处理
	return data_pool;
}

bool ring_buf_put(ring_buffer_t *ring_buf,data_pool_t *pool){
	if(ring_buf_full(*ring_buf))
		return false;
	ring_buf->ptr_data_pool[ring_buf->write_index]=pool;
	ring_buf->write_index=(ring_buf->write_index+1)%COMM_ITEM_DATA_POOL_MAX_NUM;
	return true;
}

bool ring_buf_read(ring_buffer_t *ring_buf,data_pool_t *pool){
	if(ring_buf_empty(*ring_buf))
		return false;
	pool=ring_buf->ptr_data_pool[ring_buf->read_index];
	ring_buf->read_index=(ring_buf->read_index+1)%COMM_ITEM_DATA_POOL_MAX_NUM;
	return true;
}
