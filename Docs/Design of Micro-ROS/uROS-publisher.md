### I. Creating a publisher

1. `rclc_publisher_init_default(...)`: Creates an rcl publisher.
2. `rclc_publisher_init(...)`: Creates an rcl publisher with defined QoS.
3. `rcl_publisher_init(...)`: After calling this function on a `rcl_publisher_t`, it can be used to publish messages of the given type to the given topic using `rcl_publish(...)`. The given `rcl_node_t` must be valid and the resulting `rcl_publisher_t` is only valid as long as the given `rcl_node_t` remains valid. The `rosidl_message_type_support_t` is obtained on a per *.msg* type basis. When the user defines a ROS message, code is generated which provides the required `rosidl_message_type_support_t` object. This object can be obtained using a language appropriate mechanism.
4. `rmw_create_publisher(...)`: This function can fail, and therefore return `NULL`, if: - **node** is not a valid non-null handle for this rmw implementation, as returned by `rmw_create_node()` - **type_support** is a not valid non-null message type support, as returned by `ROSIDL_GET_MSG_TYPE_SUPPORT()` - **topic_name** is not a valid non-null topic name, according to `rmw_validate_full_topic_name()` - **qos_profile** is not a fully specified non-null profile i.e. no UNKNOWN policies - publisher_options is not a valid non-null option set, as returned by `rmw_get_default_publisher_options()` - **memory allocation** fails during publisher creation.
   - `create_topic(...)`: Create topic in rmw layer.
   - `uxr_object_id(...)`: 
   - `uxr_buffer_create_publisher_bin(...)`: Buffers into the stream identified by `stream_id` an XRCE CREATE submessage with an XRCE Subscriber payload. The submessage will be sent when `uxr_flash_output_streams` or `uxr_run_session` function are called. As a result of the reception of this submessage, the Agent will create an XRCE Publisher according to the binary provided in the CREATE submessage.
   - `run_xrce_session(...)`: Create publisher
   - `uxr_object_id(...)`: 
   - `uxr_buffer_create_datawriter_bin(...)`: Buffers into the stream identified by `stream_id` an XRCE CREATE submessage with an XRCE DataWriter payload. The submessage will be sent when `uxr_flash_output_streams` or `uxr_run_session` function are called. As a result of the reception of this submessage, the Agent will create an XRCE DataWriter according to the binary provided in the CREATE submessage.
   - `run_xrce_session(...)`: 
5. `rmw_publisher_get_actual_qos(...)`: Query the underlying middleware to determine the qos settings of the publisher.
6. 

