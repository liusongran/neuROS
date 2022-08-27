#include <stdint.h>

#define COMM_ITEM_DATA_POOL_ITEM_SIZE       100     // data_pool item size in bytes
#define COMM_ITEM_DATA_POOL_ITEM_MAX_NUM    10      // data_pool item maximum number
#define COMM_ITEM_DATA_POOL_MAX_NUM         4       // data_pool maximum number

typedef struct data_pool_item_s
{
    /// timestamp: when this msg created
    uint32_t timestamp;
    /// data content
    uint8_t data[COMM_ITEM_DATA_POOL_ITEM_SIZE];
}data_pool_item_t;

typedef struct data_pool_s
{
    /// data_pool_index
    uint8_t data_pool_index;
    /// data_storage
    data_pool_item_t data_pool[COMM_ITEM_DATA_POOL_ITEM_MAX_NUM];
} data_pool_t;

/// 
typedef struct ring_buffer_s
{
    /// owner type: pub or sub
    bool owner_type;
    /// owner ID: index of owner_type
    uint8_t owner_id;
    /// owner entity of this buffer in case of usage
    void * owner;
    /// maximum element number
    uint8_t depth; 
    /// read index
    uint8_t rd_idx;
    /// write index
    uint8_t wr_idx;
    /// data type, may need include a `msg` structure
    msg_t msg;
    /// data_pool_index
    data_pool_t * ptr_data_pool;
} ring_buffer_t;


// API functions here, MARK:TODO_List_srliu
ring_buf_init();
ring_buf_free();
ring_buf_clear();
ring_buf_full();
ring_buf_empty();
ring_buf_write();
ring_buf_read();
