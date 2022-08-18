################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_clock.c \
../Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_mqueue.c \
../Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread.c \
../Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_barrier.c \
../Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_cond.c \
../Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_mutex.c \
../Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_sched.c \
../Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_semaphore.c \
../Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_timer.c \
../Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_unistd.c \
../Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_utils.c 

OBJS += \
./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_clock.o \
./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_mqueue.o \
./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread.o \
./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_barrier.o \
./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_cond.o \
./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_mutex.o \
./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_sched.o \
./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_semaphore.o \
./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_timer.o \
./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_unistd.o \
./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_utils.o 

C_DEPS += \
./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_clock.d \
./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_mqueue.d \
./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread.d \
./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_barrier.d \
./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_cond.d \
./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_mutex.d \
./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_sched.d \
./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_semaphore.d \
./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_timer.d \
./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_unistd.d \
./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_utils.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/%.o Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/%.su: ../Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/%.c Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/rmw_microxrcedds/src" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/include/portable/empty_portable" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/include/portable" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/Third_Party/FreeRTOS/lib/include/private" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/Third_Party/FreeRTOS/lib/include" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/include" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/Third_Party/FreeRTOS/lib/include/FreeRTOS_POSIX" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/include" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/eProsima/Micro-CDR/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/eProsima/Micro-XRCE-DDS-Client/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/micro_ros_msgs/msg" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/micro_ros_utilities/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/rcutils/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/rosidl_runtime_c/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/rosidl_typesupport/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/rosidl_typesupport_interface/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/rosidl_typesupport_microxrcedds/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/rosidl_typesupport_introspection_c/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/rcl_action/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/rcl/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/rclc/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/rmw/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/rmw_microxrcedds/inc" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-lib-2f-FreeRTOS-2d-Plus-2d-POSIX-2f-source

clean-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-lib-2f-FreeRTOS-2d-Plus-2d-POSIX-2f-source:
	-$(RM) ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_clock.d ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_clock.o ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_clock.su ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_mqueue.d ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_mqueue.o ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_mqueue.su ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread.d ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread.o ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread.su ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_barrier.d ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_barrier.o ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_barrier.su ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_cond.d ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_cond.o ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_cond.su ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_mutex.d ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_mutex.o ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread_mutex.su ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_sched.d ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_sched.o ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_sched.su ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_semaphore.d ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_semaphore.o ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_semaphore.su ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_timer.d ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_timer.o ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_timer.su ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_unistd.d ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_unistd.o ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_unistd.su ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_utils.d ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_utils.o ./Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_utils.su

.PHONY: clean-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-lib-2f-FreeRTOS-2d-Plus-2d-POSIX-2f-source

