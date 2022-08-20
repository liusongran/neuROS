################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Middlewares/rmw_microxrcedds/src/rmw_microros/subdir.mk
-include Middlewares/rmw_microxrcedds/src/subdir.mk
-include Middlewares/rmw/src/subdir.mk
-include Middlewares/rclc/src/subdir.mk
-include Middlewares/rcl/src/subdir.mk
-include Middlewares/others/rosidl_typesupport_microxrcedds/src/subdir.mk
-include Middlewares/others/rosidl_typesupport_introspection_c/src/subdir.mk
-include Middlewares/others/rosidl_typesupport/src/subdir.mk
-include Middlewares/others/rosidl_runtime_c/src/subdir.mk
-include Middlewares/others/rcutils/src/testing/subdir.mk
-include Middlewares/others/rcutils/src/subdir.mk
-include Middlewares/others/rcl_action/src/subdir.mk
-include Middlewares/others/micro_ros_utilities/src/subdir.mk
-include Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/util/subdir.mk
-include Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/profile/transport/stream_framing/subdir.mk
-include Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/profile/transport/custom/subdir.mk
-include Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/profile/discovery/subdir.mk
-include Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/core/session/stream/subdir.mk
-include Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/core/session/subdir.mk
-include Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/core/serialization/subdir.mk
-include Middlewares/eProsima/Micro-XRCE-DDS-Client/src/c/core/log/subdir.mk
-include Middlewares/eProsima/Micro-CDR/src/c/types/subdir.mk
-include Middlewares/eProsima/Micro-CDR/src/c/subdir.mk
-include Middlewares/comm/itam/subdir.mk
-include Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/subdir.mk
-include Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/subdir.mk
-include Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2/subdir.mk
-include Middlewares/Third_Party/FreeRTOS/Source/subdir.mk
-include Drivers/STM32F4xx_HAL_Driver/Src/subdir.mk
-include Core/Startup/subdir.mk
-include Core/Src/subdir.mk
-include Apps/ping_pong/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := my_neuROS
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
my_neuROS.elf \

MAP_FILES += \
my_neuROS.map \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
my_neuROS.list \


# All Target
all: main-build

# Main-build Target
main-build: my_neuROS.elf secondary-outputs

# Tool invocations
my_neuROS.elf my_neuROS.map: $(OBJS) $(USER_OBJS) /Users/liusongran/MyProject/neuROS/Code/my_neuROS/STM32F446ZETX_FLASH.ld makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-gcc -o "my_neuROS.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m4 -T"/Users/liusongran/MyProject/neuROS/Code/my_neuROS/STM32F446ZETX_FLASH.ld" --specs=nosys.specs -Wl,-Map="my_neuROS.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

my_neuROS.list: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "my_neuROS.list"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) default.size.stdout my_neuROS.elf my_neuROS.list my_neuROS.map
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST)

fail-specified-linker-script-missing:
	@echo 'Error: Cannot find the specified linker script. Check the linker settings in the build configuration.'
	@exit 2

warn-no-linker-script-specified:
	@echo 'Warning: No linker script specified. Check the linker settings in the build configuration.'

.PHONY: all clean dependents main-build fail-specified-linker-script-missing warn-no-linker-script-specified

-include ../makefile.targets
