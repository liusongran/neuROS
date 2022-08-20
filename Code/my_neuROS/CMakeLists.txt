cmake_minimum_required(VERSION 3.21)

# Setup compiler settings
set(CMAKE_C_STANDARD                11)
set(CMAKE_C_STANDARD_REQUIRED       ON)
set(CMAKE_C_EXTENSIONS              ON)
set(CMAKE_CXX_STANDARD              20)
set(CMAKE_CXX_STANDARD_REQUIRED     ON)
set(CMAKE_CXX_EXTENSIONS            ON)
set(PROJ_PATH                       ${CMAKE_CURRENT_SOURCE_DIR})
message("Build type: "              ${CMAKE_BUILD_TYPE})

#
# Core project settings
#
project(neuROS)
enable_language(C CXX ASM)

#
# Core MCU flags, CPU, instruction set and FPU setup
# Needs to be set properly for your MCU
#
set(CPU_PARAMETERS
    -mthumb

    # This needs attention to properly set for used MCU
    -mcpu=cortex-m4
    -mfpu=fpv4-sp-d16
    -mfloat-abi=hard
)

# Set linker script
set(linker_script_SRC               ${PROJ_PATH}/STM32F446ZETX_FLASH.ld)
set(EXECUTABLE                      ${CMAKE_PROJECT_NAME})


#
# List of source files to compile
#
set(sources_SRCS
# NOTE: -Apps
    ${PROJ_PATH}/Apps/ping_pong/app.c 
# NOTE: -Core/Src
    ${PROJ_PATH}/Core/Src/custom_memory_manager.c 
    ${PROJ_PATH}/Core/Src/dma_transport.c 
    ${PROJ_PATH}/Core/Src/freertos.c 
    ${PROJ_PATH}/Core/Src/main.c 
    ${PROJ_PATH}/Core/Src/microros_allocators.c 
    ${PROJ_PATH}/Core/Src/microros_time.c 
    ${PROJ_PATH}/Core/Src/microros_transports.c 
    ${PROJ_PATH}/Core/Src/stm32f4xx_hal_msp.c 
    ${PROJ_PATH}/Core/Src/stm32f4xx_it.c 
    ${PROJ_PATH}/Core/Src/syscalls.c 
    ${PROJ_PATH}/Core/Src/sysmem.c 
    ${PROJ_PATH}/Core/Src/system_stm32f4xx.c 
# NOTE: -Core/Startup
    ${PROJ_PATH}/Core/Startup/startup_stm32f446zetx.s
# NOTE: -Drivers/STM32F4xx_HAL_Driver/Src
    ${PROJ_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c
    ${PROJ_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c
    ${PROJ_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.c
    ${PROJ_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma_ex.c
    ${PROJ_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_exti.c
    ${PROJ_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.c
    ${PROJ_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.c
    ${PROJ_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ramfunc.c
    ${PROJ_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.c
    ${PROJ_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c
    ${PROJ_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.c
    ${PROJ_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c
    ${PROJ_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.c
    ${PROJ_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.c
    ${PROJ_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.c
    ${PROJ_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_uart.c 
# NOTE: -Middlewares/eProsima/Micro-CDR
    ${PROJ_PATH}/Middlewares/eProsima/Micro-CDR/src/c/common.c 
    ${PROJ_PATH}/Middlewares/eProsima/Micro-CDR/src/c/types/array.c
    ${PROJ_PATH}/Middlewares/eProsima/Micro-CDR/src/c/types/basic.c
    ${PROJ_PATH}/Middlewares/eProsima/Micro-CDR/src/c/types/sequence.c
    ${PROJ_PATH}/Middlewares/eProsima/Micro-CDR/src/c/types/string.c 
# NOTE: -Middlewares/eProsima/Micro-XRCE-DDS-Client
    ${PROJ_PATH}/Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/core/log/log.c 
    ${PROJ_PATH}/Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/core/serialization/xrce_header.c
    ${PROJ_PATH}/Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/core/serialization/xrce_subheader.c
    ${PROJ_PATH}/Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/core/serialization/xrce_types.c 
    ${PROJ_PATH}/Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/core/session/common_create_entities.c
    ${PROJ_PATH}/Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/core/session/create_entities_bin.c
    ${PROJ_PATH}/Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/core/session/create_entities_ref.c
    ${PROJ_PATH}/Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/core/session/create_entities_xml.c
    ${PROJ_PATH}/Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/core/session/object_id.c
    ${PROJ_PATH}/Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/core/session/read_access.c
    ${PROJ_PATH}/Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/core/session/session.c
    ${PROJ_PATH}/Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/core/session/session_info.c
    ${PROJ_PATH}/Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/core/session/submessage.c
    ${PROJ_PATH}/Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/core/session/write_access.c 
    ${PROJ_PATH}/Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/core/session/stream/input_best_effort_stream.c
    ${PROJ_PATH}/Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/core/session/stream/input_reliable_stream.c
    ${PROJ_PATH}/Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/core/session/stream/output_best_effort_stream.c
    ${PROJ_PATH}/Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/core/session/stream/output_reliable_stream.c
    ${PROJ_PATH}/Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/core/session/stream/seq_num.c
    ${PROJ_PATH}/Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/core/session/stream/stream_id.c
    ${PROJ_PATH}/Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/core/session/stream/stream_storage.c 
    ${PROJ_PATH}/Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/profile/discovery/discovery.c 
    ${PROJ_PATH}/Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/profile/transport/custom/custom_transport.c 
    ${PROJ_PATH}/Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/profile/transport/stream_framing/stream_framing_protocol.c 
    ${PROJ_PATH}/Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/util/ping.c
    ${PROJ_PATH}/Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/util/time.c 
# NOTE: -Middlewares/others/micro_ros_utilities
    ${PROJ_PATH}/Middlewares/others/micro_ros_utilities/src/string_utilities.c
    ${PROJ_PATH}/Middlewares/others/micro_ros_utilities/src/type_utilities.c 
# NOTE: -Middlewares/others/rcl_action
    ${PROJ_PATH}/Middlewares/others/rcl_action/src/action_client.c
    ${PROJ_PATH}/Middlewares/others/rcl_action/src/action_server.c
    ${PROJ_PATH}/Middlewares/others/rcl_action/src/goal_handle.c
    ${PROJ_PATH}/Middlewares/others/rcl_action/src/goal_state_machine.c
    ${PROJ_PATH}/Middlewares/others/rcl_action/src/graph.c
    ${PROJ_PATH}/Middlewares/others/rcl_action/src/names.c
    ${PROJ_PATH}/Middlewares/others/rcl_action/src/types.c 
# NOTE: -Middlewares/others/rcutils
    ${PROJ_PATH}/Middlewares/others/rcutils/src/allocator.c
    ${PROJ_PATH}/Middlewares/others/rcutils/src/array_list.c
    ${PROJ_PATH}/Middlewares/others/rcutils/src/atomic_64bits.c
    ${PROJ_PATH}/Middlewares/others/rcutils/src/char_array.c
    ${PROJ_PATH}/Middlewares/others/rcutils/src/cmdline_parser.c
    ${PROJ_PATH}/Middlewares/others/rcutils/src/env.c
    ${PROJ_PATH}/Middlewares/others/rcutils/src/error_handling.c
    ${PROJ_PATH}/Middlewares/others/rcutils/src/filesystem.c
    ${PROJ_PATH}/Middlewares/others/rcutils/src/find.c
    ${PROJ_PATH}/Middlewares/others/rcutils/src/format_string.c
    ${PROJ_PATH}/Middlewares/others/rcutils/src/hash_map.c
    ${PROJ_PATH}/Middlewares/others/rcutils/src/logging.c
    ${PROJ_PATH}/Middlewares/others/rcutils/src/process.c
    ${PROJ_PATH}/Middlewares/others/rcutils/src/qsort.c
    ${PROJ_PATH}/Middlewares/others/rcutils/src/repl_str.c
    ${PROJ_PATH}/Middlewares/others/rcutils/src/shared_library.c
    ${PROJ_PATH}/Middlewares/others/rcutils/src/snprintf.c
    ${PROJ_PATH}/Middlewares/others/rcutils/src/split.c
    ${PROJ_PATH}/Middlewares/others/rcutils/src/strcasecmp.c
    ${PROJ_PATH}/Middlewares/others/rcutils/src/strdup.c
    ${PROJ_PATH}/Middlewares/others/rcutils/src/strerror.c
    ${PROJ_PATH}/Middlewares/others/rcutils/src/string_array.c
    ${PROJ_PATH}/Middlewares/others/rcutils/src/string_map.c
    ${PROJ_PATH}/Middlewares/others/rcutils/src/time.c
    ${PROJ_PATH}/Middlewares/others/rcutils/src/time_unix.c
    ${PROJ_PATH}/Middlewares/others/rcutils/src/uint8_array.c 
    ${PROJ_PATH}/Middlewares/others/rcutils/src/testing/fault_injection.c 
# NOTE: -Middlewares/others/rosidl_runtime_c
    ${PROJ_PATH}/Middlewares/others/rosidl_runtime_c/src/message_type_support.c
    ${PROJ_PATH}/Middlewares/others/rosidl_runtime_c/src/primitives_sequence_functions.c
    ${PROJ_PATH}/Middlewares/others/rosidl_runtime_c/src/sequence_bound.c
    ${PROJ_PATH}/Middlewares/others/rosidl_runtime_c/src/service_type_support.c
    ${PROJ_PATH}/Middlewares/others/rosidl_runtime_c/src/string_functions.c
    ${PROJ_PATH}/Middlewares/others/rosidl_runtime_c/src/u16string_functions.c 
# NOTE: -Middlewares/others/rosidl_typesupport
    ${PROJ_PATH}/Middlewares/others/rosidl_typesupport/src/identifier.c 
# NOTE: -Middlewares/others/rosidl_typesupport_introspection_c
    ${PROJ_PATH}/Middlewares/others/rosidl_typesupport_introspection_c/src/identifier.c 
# NOTE: -Middlewares/others/rosidl_typesupport_microxrcedds
    ${PROJ_PATH}/Middlewares/others/rosidl_typesupport_microxrcedds/src/identifier.c 
# NOTE: -Middlewares/rcl
    ${PROJ_PATH}/Middlewares/rcl/src/client.c
    ${PROJ_PATH}/Middlewares/rcl/src/common.c
    ${PROJ_PATH}/Middlewares/rcl/src/context.c
    ${PROJ_PATH}/Middlewares/rcl/src/domain_id.c
    ${PROJ_PATH}/Middlewares/rcl/src/event.c
    ${PROJ_PATH}/Middlewares/rcl/src/expand_topic_name.c
    ${PROJ_PATH}/Middlewares/rcl/src/graph.c
    ${PROJ_PATH}/Middlewares/rcl/src/guard_condition.c
    ${PROJ_PATH}/Middlewares/rcl/src/init.c
    ${PROJ_PATH}/Middlewares/rcl/src/init_options.c
    ${PROJ_PATH}/Middlewares/rcl/src/lexer.c
    ${PROJ_PATH}/Middlewares/rcl/src/lexer_lookahead.c
    ${PROJ_PATH}/Middlewares/rcl/src/localhost.c
    ${PROJ_PATH}/Middlewares/rcl/src/network_flow_endpoints.c
    ${PROJ_PATH}/Middlewares/rcl/src/node.c
    ${PROJ_PATH}/Middlewares/rcl/src/node_options.c
    ${PROJ_PATH}/Middlewares/rcl/src/node_resolve_name.c
    ${PROJ_PATH}/Middlewares/rcl/src/publisher.c
    ${PROJ_PATH}/Middlewares/rcl/src/remap.c
    ${PROJ_PATH}/Middlewares/rcl/src/rmw_implementation_identifier_check.c
    ${PROJ_PATH}/Middlewares/rcl/src/security.c
    ${PROJ_PATH}/Middlewares/rcl/src/service.c
    ${PROJ_PATH}/Middlewares/rcl/src/subscription.c
    ${PROJ_PATH}/Middlewares/rcl/src/time.c
    ${PROJ_PATH}/Middlewares/rcl/src/timer.c
    ${PROJ_PATH}/Middlewares/rcl/src/validate_enclave_name.c
    ${PROJ_PATH}/Middlewares/rcl/src/validate_topic_name.c
    ${PROJ_PATH}/Middlewares/rcl/src/wait.c 
# NOTE: -Middlewares/rclc
    ${PROJ_PATH}/Middlewares/rclc/src/action_client.c
    ${PROJ_PATH}/Middlewares/rclc/src/action_goal_handle.c
    ${PROJ_PATH}/Middlewares/rclc/src/action_server.c
    ${PROJ_PATH}/Middlewares/rclc/src/client.c
    ${PROJ_PATH}/Middlewares/rclc/src/executor.c
    ${PROJ_PATH}/Middlewares/rclc/src/executor_handle.c
    ${PROJ_PATH}/Middlewares/rclc/src/init.c
    ${PROJ_PATH}/Middlewares/rclc/src/node.c
    ${PROJ_PATH}/Middlewares/rclc/src/publisher.c
    ${PROJ_PATH}/Middlewares/rclc/src/service.c
    ${PROJ_PATH}/Middlewares/rclc/src/sleep.c
    ${PROJ_PATH}/Middlewares/rclc/src/subscription.c
    ${PROJ_PATH}/Middlewares/rclc/src/timer.c 
# NOTE: -Middlewares/rmw
    ${PROJ_PATH}/Middlewares/rmw/src/allocators.c
    ${PROJ_PATH}/Middlewares/rmw/src/convert_rcutils_ret_to_rmw_ret.c
    ${PROJ_PATH}/Middlewares/rmw/src/event.c
    ${PROJ_PATH}/Middlewares/rmw/src/init.c
    ${PROJ_PATH}/Middlewares/rmw/src/init_options.c
    ${PROJ_PATH}/Middlewares/rmw/src/message_sequence.c
    ${PROJ_PATH}/Middlewares/rmw/src/names_and_types.c
    ${PROJ_PATH}/Middlewares/rmw/src/network_flow_endpoint.c
    ${PROJ_PATH}/Middlewares/rmw/src/network_flow_endpoint_array.c
    ${PROJ_PATH}/Middlewares/rmw/src/publisher_options.c
    ${PROJ_PATH}/Middlewares/rmw/src/qos_string_conversions.c
    ${PROJ_PATH}/Middlewares/rmw/src/sanity_checks.c
    ${PROJ_PATH}/Middlewares/rmw/src/security_options.c
    ${PROJ_PATH}/Middlewares/rmw/src/subscription_content_filter_options.c
    ${PROJ_PATH}/Middlewares/rmw/src/subscription_options.c
    ${PROJ_PATH}/Middlewares/rmw/src/time.c
    ${PROJ_PATH}/Middlewares/rmw/src/topic_endpoint_info.c
    ${PROJ_PATH}/Middlewares/rmw/src/topic_endpoint_info_array.c
    ${PROJ_PATH}/Middlewares/rmw/src/types.c
    ${PROJ_PATH}/Middlewares/rmw/src/validate_full_topic_name.c
    ${PROJ_PATH}/Middlewares/rmw/src/validate_namespace.c
    ${PROJ_PATH}/Middlewares/rmw/src/validate_node_name.c 
# NOTE: -Middlewares/rmw_microxrcedds
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/callbacks.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/identifiers.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/memory.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_client.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_compare_gids_equal.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_count.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_event.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_event_callbacks.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_get_endpoint_network_flow.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_get_gid_for_publisher.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_get_implementation_identifier.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_get_serialization_format.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_get_topic_endpoint_info.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_guard_condition.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_init.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_logging.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_microxrcedds_topic.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_node.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_node_info_and_types.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_node_names.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_publish.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_publisher.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_qos_profile_check_compatible.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_request.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_response.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_serialize.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_service.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_service_names_and_types.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_service_server_is_available.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_subscription.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_take.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_topic_names_and_types.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_trigger_guard_condition.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_uxrce_transports.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_wait.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_wait_set.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/types.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/utils.c 
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_microros/continous_serialization.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_microros/custom_transport.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_microros/init_options.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_microros/ping.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_microros/time_sync.c
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src/rmw_microros/timing.c 
# NOTE: -Middlewares/Third_Party/FreeRTOS/Source
    ${PROJ_PATH}/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2/cmsis_os2.c 
    ${PROJ_PATH}/Middlewares/Third_Party/FreeRTOS/Source/croutine.c
    ${PROJ_PATH}/Middlewares/Third_Party/FreeRTOS/Source/event_groups.c
    ${PROJ_PATH}/Middlewares/Third_Party/FreeRTOS/Source/list.c
    ${PROJ_PATH}/Middlewares/Third_Party/FreeRTOS/Source/queue.c
    ${PROJ_PATH}/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.c
    ${PROJ_PATH}/Middlewares/Third_Party/FreeRTOS/Source/tasks.c
    ${PROJ_PATH}/Middlewares/Third_Party/FreeRTOS/Source/timers.c 
    ${PROJ_PATH}/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/port.c 
    ${PROJ_PATH}/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/heap_4.c 
)

#
# Include directories
#
set(include_path_DIRS
    ${PROJ_PATH}/Core/Inc
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/src
    ${PROJ_PATH}/Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/include/portable/empty_portable
    ${PROJ_PATH}/Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/include/portable
    ${PROJ_PATH}/Middlewares/others/include
    ${PROJ_PATH}/Middlewares/others/rcl_interfaces
    ${PROJ_PATH}/Middlewares/eProsima/Micro-CDR/inc
    ${PROJ_PATH}/Middlewares/eProsima/Micro-XRCE-DDS-Client/inc
    ${PROJ_PATH}/Middlewares/others/micro_ros_msgs/msg
    ${PROJ_PATH}/Middlewares/others/micro_ros_utilities/inc
    ${PROJ_PATH}/Middlewares/others/rcutils/inc
    ${PROJ_PATH}/Middlewares/others/rosidl_runtime_c/inc
    ${PROJ_PATH}/Middlewares/others/rosidl_typesupport/inc
    ${PROJ_PATH}/Middlewares/others/rosidl_typesupport_interface/inc
    ${PROJ_PATH}/Middlewares/others/rosidl_typesupport_microxrcedds/inc
    ${PROJ_PATH}/Middlewares/others/rosidl_typesupport_introspection_c/inc
    ${PROJ_PATH}/Middlewares/others/rcl_action/inc
    ${PROJ_PATH}/Middlewares/rcl/inc
    ${PROJ_PATH}/Middlewares/rclc/inc
    ${PROJ_PATH}/Middlewares/rmw/inc
    ${PROJ_PATH}/Middlewares/rmw_microxrcedds/inc

    ${PROJ_PATH}/Drivers/STM32F4xx_HAL_Driver/Inc
    ${PROJ_PATH}/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy
    ${PROJ_PATH}/Drivers/CMSIS/Device/ST/STM32F4xx/Include
    ${PROJ_PATH}/Drivers/CMSIS/Include
    ${PROJ_PATH}/Middlewares/Third_Party/FreeRTOS/Source/include
    ${PROJ_PATH}/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2
    ${PROJ_PATH}/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F
    ${PROJ_PATH}/Apps
)

#
# Symbols definition
#
set(symbols_SYMB
    # Put here your symbols (preprocessor defines), one in each line
    # Encapsulate them with double quotes for safety purpose
    "DEBUG"
    "USE_HAL_DRIVER"
    "STM32F446xx"
)

# Executable files
add_executable(${EXECUTABLE} ${sources_SRCS})

# Include paths
target_include_directories(${EXECUTABLE} PRIVATE ${include_path_DIRS})

# Project symbols
target_compile_definitions(${EXECUTABLE} PRIVATE ${symbols_SYMB})

# Compiler options
target_compile_options(${EXECUTABLE} PRIVATE
    ${CPU_PARAMETERS}
    -Wall
    -Wextra
    -Wpedantic
    -Wno-unused-parameter
    # Full debug configuration
    -Og -g3 -ggdb
)

# Linker options
target_link_options(${EXECUTABLE} PRIVATE
    -T${linker_script_SRC}
    ${CPU_PARAMETERS}
    -Wl,-Map=${CMAKE_PROJECT_NAME}.map
    --specs=nosys.specs
    -u _printf_float                # STDIO float formatting support
    -Wl,--start-group
    -lc
    -lm
    -lstdc++
    -lsupc++
    -Wl,--end-group
    -Wl,--print-memory-usage
)


# Execute post-build to print size
add_custom_command(TARGET ${EXECUTABLE} POST_BUILD
    COMMAND ${CMAKE_SIZE} $<TARGET_FILE:${EXECUTABLE}>
)

# Convert output to hex and binary
add_custom_command(TARGET ${EXECUTABLE} POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O ihex $<TARGET_FILE:${EXECUTABLE}> ${EXECUTABLE}.hex
)

# Convert to bin file -> add conditional check?
add_custom_command(TARGET ${EXECUTABLE} POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O binary $<TARGET_FILE:${EXECUTABLE}> ${EXECUTABLE}.bin
)