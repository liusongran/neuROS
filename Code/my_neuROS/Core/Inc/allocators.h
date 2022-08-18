#ifndef _ALLOCATORS_H_
#define _ALLOCATORS_H_

#include <stdlib.h>

extern int absoluteUsedMemory;
extern int usedMemory;

void * microros_allocate(size_t size, void * state);
void microros_deallocate(void * pointer, void * state);
void * microros_reallocate(void * pointer, size_t size, void * state);
void * microros_zero_allocate(size_t number_of_elements, size_t size_of_element, void * state);

#endif // _ALLOCATORS_H_
