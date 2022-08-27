#include <itam_internal/memory.h>
#include <string.h>

#include <rmw_microxrcedds_c/config.h>
#include <rmw/allocators.h>

//!!#include <uxr/client/profile/multithread/multithread.h>
#define COMM_LOCK(...)   
#define COMM_UNLOCK(...)   

bool has_memory(
        comm_itam_mempool_t * mem) 
{
    COMM_LOCK(&mem->mutex);
    {
        bool rv = mem->freeitems != NULL ? true : false;
    }
    COMM_UNLOCK(&mem->mutex);

    return rv;
}

comm_itam_mempool_item_t * get_memory(
        comm_itam_mempool_t * mem)
{
    COMM_LOCK(&mem->mutex);
    {
        comm_itam_mempool_item_t * item = NULL;
        if (has_memory(mem)) {
            // Gets item from free pool
            item = mem->freeitems;
            mem->freeitems = item->next;
            if (mem->freeitems) {
                mem->freeitems->prev = NULL;
            }
            // Puts item in allocated pool
            item->next = mem->allocateditems;
            if (item->next) {
                item->next->prev = item;
            }
            item->prev = NULL;
            mem->allocateditems = item;
        }
    }
    COMM_UNLOCK(&mem->mutex);

    return item;
}

void put_memory(
        comm_itam_mempool_t * mem,
        comm_itam_mempool_item_t * item)
{
    COMM_LOCK(&mem->mutex);
    {
        // Gets item from allocated pool
        if (item->prev) {
            item->prev->next = item->next;
        }
        if (item->next) {
            item->next->prev = item->prev;
        }
        if (mem->allocateditems == item) {
            mem->allocateditems = item->next;
        }
        // Puts item in free pool
        item->next = mem->freeitems;
        if (item->next) {
            item->next->prev = item;
        }
        item->prev = NULL;
        mem->freeitems = item;
    }
    COMM_UNLOCK(&mem->mutex);
}
