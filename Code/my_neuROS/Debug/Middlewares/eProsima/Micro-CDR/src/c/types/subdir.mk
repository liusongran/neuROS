################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/eProsima/Micro-CDR/src/c/types/array.c \
../Middlewares/eProsima/Micro-CDR/src/c/types/basic.c \
../Middlewares/eProsima/Micro-CDR/src/c/types/sequence.c \
../Middlewares/eProsima/Micro-CDR/src/c/types/string.c 

OBJS += \
./Middlewares/eProsima/Micro-CDR/src/c/types/array.o \
./Middlewares/eProsima/Micro-CDR/src/c/types/basic.o \
./Middlewares/eProsima/Micro-CDR/src/c/types/sequence.o \
./Middlewares/eProsima/Micro-CDR/src/c/types/string.o 

C_DEPS += \
./Middlewares/eProsima/Micro-CDR/src/c/types/array.d \
./Middlewares/eProsima/Micro-CDR/src/c/types/basic.d \
./Middlewares/eProsima/Micro-CDR/src/c/types/sequence.d \
./Middlewares/eProsima/Micro-CDR/src/c/types/string.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/eProsima/Micro-CDR/src/c/types/%.o Middlewares/eProsima/Micro-CDR/src/c/types/%.su: ../Middlewares/eProsima/Micro-CDR/src/c/types/%.c Middlewares/eProsima/Micro-CDR/src/c/types/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/rmw_microxrcedds/src" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/include/portable/empty_portable" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/include/portable" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/Third_Party/FreeRTOS/lib/include/private" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/Third_Party/FreeRTOS/lib/include" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/Third_Party/FreeRTOS/lib/FreeRTOS-Plus-POSIX/include" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/Third_Party/FreeRTOS/lib/include/FreeRTOS_POSIX" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/include" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/eProsima/Micro-CDR/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/eProsima/Micro-XRCE-DDS-Client/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/micro_ros_msgs/msg" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/micro_ros_utilities/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/rcutils/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/rosidl_runtime_c/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/rosidl_typesupport/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/rosidl_typesupport_interface/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/rosidl_typesupport_microxrcedds/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/rosidl_typesupport_introspection_c/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/rcl_action/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/rcl/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/rclc/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/rmw/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/rmw_microxrcedds/inc" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Apps" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-eProsima-2f-Micro-2d-CDR-2f-src-2f-c-2f-types

clean-Middlewares-2f-eProsima-2f-Micro-2d-CDR-2f-src-2f-c-2f-types:
	-$(RM) ./Middlewares/eProsima/Micro-CDR/src/c/types/array.d ./Middlewares/eProsima/Micro-CDR/src/c/types/array.o ./Middlewares/eProsima/Micro-CDR/src/c/types/array.su ./Middlewares/eProsima/Micro-CDR/src/c/types/basic.d ./Middlewares/eProsima/Micro-CDR/src/c/types/basic.o ./Middlewares/eProsima/Micro-CDR/src/c/types/basic.su ./Middlewares/eProsima/Micro-CDR/src/c/types/sequence.d ./Middlewares/eProsima/Micro-CDR/src/c/types/sequence.o ./Middlewares/eProsima/Micro-CDR/src/c/types/sequence.su ./Middlewares/eProsima/Micro-CDR/src/c/types/string.d ./Middlewares/eProsima/Micro-CDR/src/c/types/string.o ./Middlewares/eProsima/Micro-CDR/src/c/types/string.su

.PHONY: clean-Middlewares-2f-eProsima-2f-Micro-2d-CDR-2f-src-2f-c-2f-types

