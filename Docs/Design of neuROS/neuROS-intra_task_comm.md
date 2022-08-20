## Design of intra-task communication paradigm in neuROS
This proposal is used to make Micro-ROS applications be able to do intra-process like communications when they are in the same `executor` or in different `executor`s declared in the same `main()` function.

### IntraManager (ITAM) Design
#### 1. off-line configuration
1. data structure
- refer to **[FILE: Middlewares/rmw_microxrcedds/src/types.c]**
> - dual-list for data item management, static memory block for `data item structure` and `data entity`
> - dual-list should be lock-protected in multi-threaded, consider thread-A publish data directly to this memory pool while thread-B is publishing at the same time.

2. API services
- `RMW_INIT_MEMORY`
- `rmw_uxrce_fini_session_memory`
- `rmw_uxrce_fini_subscription_memory`
- `rmw_uxrce_find_static_input_buffer_by_owner`
- `rmw_uxrce_clean_expired_static_input_buffer`
- ...
#### 2. runtime behavior