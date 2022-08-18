################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: uROS_app
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/eProsima/Micro-XRCE-DDS-Client/src/profile/transport/serial/serial_transport.c \
../Middlewares/eProsima/Micro-XRCE-DDS-Client/src/profile/transport/serial/serial_transport_posix.c \
../Middlewares/eProsima/Micro-XRCE-DDS-Client/src/profile/transport/serial/serial_transport_rtems_bsd_net.c 

OBJS += \
./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/profile/transport/serial/serial_transport.o \
./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/profile/transport/serial/serial_transport_posix.o \
./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/profile/transport/serial/serial_transport_rtems_bsd_net.o 

C_DEPS += \
./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/profile/transport/serial/serial_transport.d \
./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/profile/transport/serial/serial_transport_posix.d \
./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/profile/transport/serial/serial_transport_rtems_bsd_net.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/eProsima/Micro-XRCE-DDS-Client/src/profile/transport/serial/%.o Middlewares/eProsima/Micro-XRCE-DDS-Client/src/profile/transport/serial/%.su: ../Middlewares/eProsima/Micro-XRCE-DDS-Client/src/profile/transport/serial/%.c Middlewares/eProsima/Micro-XRCE-DDS-Client/src/profile/transport/serial/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/micro_ros_msgs/msg" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/micro_ros_utilities/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/rcutils/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/rosidl_typesupport/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/rosidl_typesupport_microxrcedds/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/rcl/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/rclc/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/rmw/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/rmw_microxrcedds/inc/rmw_microros" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/rmw_microxrcedds/inc/rmw_microxrcedds_c" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-eProsima-2f-Micro-2d-XRCE-2d-DDS-2d-Client-2f-src-2f-profile-2f-transport-2f-serial

clean-Middlewares-2f-eProsima-2f-Micro-2d-XRCE-2d-DDS-2d-Client-2f-src-2f-profile-2f-transport-2f-serial:
	-$(RM) ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/profile/transport/serial/serial_transport.d ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/profile/transport/serial/serial_transport.o ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/profile/transport/serial/serial_transport.su ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/profile/transport/serial/serial_transport_posix.d ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/profile/transport/serial/serial_transport_posix.o ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/profile/transport/serial/serial_transport_posix.su ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/profile/transport/serial/serial_transport_rtems_bsd_net.d ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/profile/transport/serial/serial_transport_rtems_bsd_net.o ./Middlewares/eProsima/Micro-XRCE-DDS-Client/src/profile/transport/serial/serial_transport_rtems_bsd_net.su

.PHONY: clean-Middlewares-2f-eProsima-2f-Micro-2d-XRCE-2d-DDS-2d-Client-2f-src-2f-profile-2f-transport-2f-serial

