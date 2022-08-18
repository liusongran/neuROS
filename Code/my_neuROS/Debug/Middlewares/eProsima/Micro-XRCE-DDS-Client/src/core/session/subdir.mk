################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: uROS_app
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/common_create_entities.c \
../Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/create_entities_bin.c \
../Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/create_entities_ref.c \
../Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/create_entities_xml.c \
../Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/object_id.c \
../Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/read_access.c \
../Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/session.c \
../Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/session_info.c \
../Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/submessage.c \
../Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/write_access.c 

OBJS += \
./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/common_create_entities.o \
./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/create_entities_bin.o \
./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/create_entities_ref.o \
./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/create_entities_xml.o \
./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/object_id.o \
./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/read_access.o \
./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/session.o \
./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/session_info.o \
./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/submessage.o \
./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/write_access.o 

C_DEPS += \
./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/common_create_entities.d \
./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/create_entities_bin.d \
./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/create_entities_ref.d \
./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/create_entities_xml.d \
./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/object_id.d \
./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/read_access.d \
./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/session.d \
./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/session_info.d \
./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/submessage.d \
./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/write_access.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/%.o Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/%.su: ../Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/%.c Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/micro_ros_msgs/msg" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/micro_ros_utilities/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/rcutils/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/rosidl_typesupport/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/rosidl_typesupport_microxrcedds/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/rcl/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/rclc/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/rmw/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/rmw_microxrcedds/inc/rmw_microros" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/rmw_microxrcedds/inc/rmw_microxrcedds_c" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-eProsima-2f-Micro-2d-XRCE-2d-DDS-2d-Client-2f-src-2f-core-2f-session

clean-Middlewares-2f-eProsima-2f-Micro-2d-XRCE-2d-DDS-2d-Client-2f-src-2f-core-2f-session:
	-$(RM) ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/common_create_entities.d ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/common_create_entities.o ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/common_create_entities.su ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/create_entities_bin.d ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/create_entities_bin.o ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/create_entities_bin.su ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/create_entities_ref.d ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/create_entities_ref.o ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/create_entities_ref.su ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/create_entities_xml.d ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/create_entities_xml.o ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/create_entities_xml.su ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/object_id.d ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/object_id.o ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/object_id.su ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/read_access.d ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/read_access.o ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/read_access.su ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/session.d ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/session.o ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/session.su ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/session_info.d ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/session_info.o ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/session_info.su ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/submessage.d ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/submessage.o ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/submessage.su ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/write_access.d ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/write_access.o ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/core/session/write_access.su

.PHONY: clean-Middlewares-2f-eProsima-2f-Micro-2d-XRCE-2d-DDS-2d-Client-2f-src-2f-core-2f-session

