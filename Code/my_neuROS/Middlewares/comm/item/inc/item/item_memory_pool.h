#include <stdint.h>
#include <item/ring_buffer.h>
#include <item/relation_matrix.h>


typedef struct item_memory_pool_item_s
{
    ring_buffer_t *     ptr_ring_buffer;
    relation_matrix_t * ptr_relation_matrix;
};





commItem_memory_pool_init();
/// add item to pool based on some strategy
commItem_memory_pool_add_item();
/// add item to pool based on some strategy
commItem_memory_pool_remove_item();