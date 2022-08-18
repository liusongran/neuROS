################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/custom_memory_manager.c \
../Core/Src/dma_transport.c \
../Core/Src/freertos.c \
../Core/Src/main.c \
../Core/Src/microros_allocators.c \
../Core/Src/microros_time.c \
../Core/Src/microros_transports.c \
../Core/Src/stm32f4xx_hal_msp.c \
../Core/Src/stm32f4xx_it.c \
../Core/Src/syscalls.c \
../Core/Src/sysmem.c \
../Core/Src/system_stm32f4xx.c 

OBJS += \
./Core/Src/custom_memory_manager.o \
./Core/Src/dma_transport.o \
./Core/Src/freertos.o \
./Core/Src/main.o \
./Core/Src/microros_allocators.o \
./Core/Src/microros_time.o \
./Core/Src/microros_transports.o \
./Core/Src/stm32f4xx_hal_msp.o \
./Core/Src/stm32f4xx_it.o \
./Core/Src/syscalls.o \
./Core/Src/sysmem.o \
./Core/Src/system_stm32f4xx.o 

C_DEPS += \
./Core/Src/custom_memory_manager.d \
./Core/Src/dma_transport.d \
./Core/Src/freertos.d \
./Core/Src/main.d \
./Core/Src/microros_allocators.d \
./Core/Src/microros_time.d \
./Core/Src/microros_transports.d \
./Core/Src/stm32f4xx_hal_msp.d \
./Core/Src/stm32f4xx_it.d \
./Core/Src/syscalls.d \
./Core/Src/sysmem.d \
./Core/Src/system_stm32f4xx.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/%.o Core/Src/%.su: ../Core/Src/%.c Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/rmw_microxrcedds/src" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/include/portable/empty_portable" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/include/portable" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/Third_Party/FreeRTOS/lib/include/private" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/Third_Party/FreeRTOS/lib/include" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/include" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/Third_Party/FreeRTOS/lib/include/FreeRTOS_POSIX" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/include" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/eProsima/Micro-CDR/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/eProsima/Micro-XRCE-DDS-Client/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/micro_ros_msgs/msg" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/micro_ros_utilities/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/rcutils/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/rosidl_runtime_c/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/rosidl_typesupport/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/rosidl_typesupport_interface/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/rosidl_typesupport_microxrcedds/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/rosidl_typesupport_introspection_c/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/rcl_action/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/rcl/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/rclc/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/rmw/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/rmw_microxrcedds/inc" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Apps" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src

clean-Core-2f-Src:
	-$(RM) ./Core/Src/custom_memory_manager.d ./Core/Src/custom_memory_manager.o ./Core/Src/custom_memory_manager.su ./Core/Src/dma_transport.d ./Core/Src/dma_transport.o ./Core/Src/dma_transport.su ./Core/Src/freertos.d ./Core/Src/freertos.o ./Core/Src/freertos.su ./Core/Src/main.d ./Core/Src/main.o ./Core/Src/main.su ./Core/Src/microros_allocators.d ./Core/Src/microros_allocators.o ./Core/Src/microros_allocators.su ./Core/Src/microros_time.d ./Core/Src/microros_time.o ./Core/Src/microros_time.su ./Core/Src/microros_transports.d ./Core/Src/microros_transports.o ./Core/Src/microros_transports.su ./Core/Src/stm32f4xx_hal_msp.d ./Core/Src/stm32f4xx_hal_msp.o ./Core/Src/stm32f4xx_hal_msp.su ./Core/Src/stm32f4xx_it.d ./Core/Src/stm32f4xx_it.o ./Core/Src/stm32f4xx_it.su ./Core/Src/syscalls.d ./Core/Src/syscalls.o ./Core/Src/syscalls.su ./Core/Src/sysmem.d ./Core/Src/sysmem.o ./Core/Src/sysmem.su ./Core/Src/system_stm32f4xx.d ./Core/Src/system_stm32f4xx.o ./Core/Src/system_stm32f4xx.su

.PHONY: clean-Core-2f-Src

