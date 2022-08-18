################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: uROS_app
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/eProsima/Micro-CDR/src/types/array.c \
../Middlewares/eProsima/Micro-CDR/src/types/basic.c \
../Middlewares/eProsima/Micro-CDR/src/types/sequence.c \
../Middlewares/eProsima/Micro-CDR/src/types/string.c 

OBJS += \
./Middlewares/eProsima/Micro-CDR/src/types/array.o \
./Middlewares/eProsima/Micro-CDR/src/types/basic.o \
./Middlewares/eProsima/Micro-CDR/src/types/sequence.o \
./Middlewares/eProsima/Micro-CDR/src/types/string.o 

C_DEPS += \
./Middlewares/eProsima/Micro-CDR/src/types/array.d \
./Middlewares/eProsima/Micro-CDR/src/types/basic.d \
./Middlewares/eProsima/Micro-CDR/src/types/sequence.d \
./Middlewares/eProsima/Micro-CDR/src/types/string.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/eProsima/Micro-CDR/src/types/%.o Middlewares/eProsima/Micro-CDR/src/types/%.su: ../Middlewares/eProsima/Micro-CDR/src/types/%.c Middlewares/eProsima/Micro-CDR/src/types/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/micro_ros_msgs/msg" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/micro_ros_utilities/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/rcutils/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/rosidl_typesupport/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/others/rosidl_typesupport_microxrcedds/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/rcl/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/rclc/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/rmw/inc" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/rmw_microxrcedds/inc/rmw_microros" -I"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/Middlewares/rmw_microxrcedds/inc/rmw_microxrcedds_c" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-eProsima-2f-Micro-2d-CDR-2f-src-2f-types

clean-Middlewares-2f-eProsima-2f-Micro-2d-CDR-2f-src-2f-types:
	-$(RM) ./Middlewares/eProsima/Micro-CDR/src/types/array.d ./Middlewares/eProsima/Micro-CDR/src/types/array.o ./Middlewares/eProsima/Micro-CDR/src/types/array.su ./Middlewares/eProsima/Micro-CDR/src/types/basic.d ./Middlewares/eProsima/Micro-CDR/src/types/basic.o ./Middlewares/eProsima/Micro-CDR/src/types/basic.su ./Middlewares/eProsima/Micro-CDR/src/types/sequence.d ./Middlewares/eProsima/Micro-CDR/src/types/sequence.o ./Middlewares/eProsima/Micro-CDR/src/types/sequence.su ./Middlewares/eProsima/Micro-CDR/src/types/string.d ./Middlewares/eProsima/Micro-CDR/src/types/string.o ./Middlewares/eProsima/Micro-CDR/src/types/string.su

.PHONY: clean-Middlewares-2f-eProsima-2f-Micro-2d-CDR-2f-src-2f-types

