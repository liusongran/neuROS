#include <item/item_memory_pool.h>

///publish message
// 1. save message into this publisher's memory pool
// 2. save this message to related sub's memory pooll
// 3. trigger signal to wait_set
commItem_publish();
