
#ifndef COMM_ITAM_INTERNAL__MEMORY_H_
#define COMM_ITAM_INTERNAL__MEMORY_H_

#include <stdbool.h>
#include <stddef.h>

//!! #include <uxr/client/profile/multithread/multithread.h>

// memory pool item structure
typedef struct comm_itam_mempool_item_t {
  struct comm_itam_mempool_item_t * prev;
  struct comm_itam_mempool_item_t * next;
  void * data;
  bool is_dynamic_memory;
} comm_itam_mempool_item_t;

// memory pool structure
typedef struct comm_itam_mempool_t {
  struct comm_itam_mempool_item_t * allocateditems;
  struct comm_itam_mempool_item_t * freeitems;

  size_t element_size;
  bool is_initialized;
  bool is_dynamic_allowed;

#ifdef UCLIENT_PROFILE_MULTITHREAD
  uxrMutex mutex;
#endif  // UCLIENT_PROFILE_MULTITHREAD
} comm_itam_mempool_t;


/**
 * private library functions
 */

bool has_memory(
  comm_itam_mempool_t * mem);

comm_itam_mempool_item_t * get_memory(
  comm_itam_mempool_t * mem);

void put_memory(
  comm_itam_mempool_t * mem,
  comm_itam_mempool_item_t * item);

#endif  // COMM_ITAM_INTERNAL__MEMORY_H_
