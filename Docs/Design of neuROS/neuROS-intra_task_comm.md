## Design of inter-task communication paradigm in neuROS
This proposal is used to make Micro-ROS applications be able to do inter-process like communications when they are in different `executor`s declared in different `main()` functions, without participants of lower DDS/RMW layer.

### Basic Idea

#### 1. Slaver Task

<img src="/Users/liusongran/Library/Application Support/typora-user-images/image-20220922110338323.png" alt="image-20220922110338323" style="zoom:35%;" />

- `Event Pool` for **each** slaver task to store ready callbacks, `Event Pool` strcuture mainly has three items: *Callback pointer* points to callback function entity, *Msg pointer* points to data enetiy located in `ITEM` memory pool.

> Design alternatives:
>
> 1. `Event Pool` in FIFO queue (current implementation) of Ring-buffer?
>
> 2. Queue size?
>
> 3. Queue item update strategy under limited queue size? [**MARK1: ROS2 design**]
>
>    - no duplicate callback in Queue, at any time.
>
>    - how to update?
>
>      <img src="/Users/liusongran/Library/Application Support/typora-user-images/image-20220922111712620.png" alt="image-20220922111712620" style="zoom:40%;" />
>
> 4. **MARK2:selector**: for each Slaver task
>
> 5. **MARK3:dispatcher or event-trigger executor task**

#### 2. InterManager (ITEM)

1. ITEM memory pool

   <img src="/Users/liusongran/Library/Application Support/typora-user-images/image-20220922112446460.png" alt="image-20220922112446460" style="zoom:57%;" />

   - Each pub/sub has its own ring-buffer (store structure) and mem-pool (store data entity)

     <img src="/Users/liusongran/Library/Application Support/typora-user-images/image-20220922113225245.png" alt="image-20220922113225245" style="zoom:33%;" />

     <img src="https://design.ros2.org/img/intraprocess_communication/new_ipc.png" alt="Proposed IPC Block Diagram" style="zoom: 37%;" />

   

2. ..

### InterManager (ITEM) Design

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