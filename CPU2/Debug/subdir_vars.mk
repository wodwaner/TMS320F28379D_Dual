################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CMD_SRCS += \
../2837xD_RAM_CLA_lnk_cpu2.cmd \
/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/headers/cmd/F2837xD_Headers_nonBIOS_cpu2.cmd 

CLA_SRCS += \
../CLA_Tasks.cla 

LIB_SRCS += \
/Volumes/SSD/ti/C2000Ware_5_04_00_00/libraries/boot_rom/f2837xd/revB/rom_symbol_libs/c1_CLA_Data_ROM/F2837xRevB_c1bootROM_CLADataROMSymbols_fpu32.lib \
/Volumes/SSD/ti/C2000Ware_5_04_00_00/libraries/math/CLAmath/c28/lib/cla1_math_library_datarom_fpu32.lib 

ASM_SRCS += \
/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/source/F2837xD_CodeStartBranch.asm \
/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/source/F2837xD_usDelay.asm 

C_SRCS += \
../CLA_Config.c \
/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/source/F2837xD_Adc.c \
/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/source/F2837xD_CpuTimers.c \
/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/source/F2837xD_DefaultISR.c \
/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/headers/source/F2837xD_GlobalVariableDefs.c \
/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/source/F2837xD_Gpio.c \
/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/source/F2837xD_PieCtrl.c \
/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/source/F2837xD_PieVect.c \
/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/source/F2837xD_SysCtrl.c \
../Peripheral_Setup.c \
../main_cpu2.c 

CLA_DEPS += \
./CLA_Tasks.d 

C_DEPS += \
./CLA_Config.d \
./F2837xD_Adc.d \
./F2837xD_CpuTimers.d \
./F2837xD_DefaultISR.d \
./F2837xD_GlobalVariableDefs.d \
./F2837xD_Gpio.d \
./F2837xD_PieCtrl.d \
./F2837xD_PieVect.d \
./F2837xD_SysCtrl.d \
./Peripheral_Setup.d \
./main_cpu2.d 

OBJS += \
./CLA_Config.obj \
./CLA_Tasks.obj \
./F2837xD_Adc.obj \
./F2837xD_CodeStartBranch.obj \
./F2837xD_CpuTimers.obj \
./F2837xD_DefaultISR.obj \
./F2837xD_GlobalVariableDefs.obj \
./F2837xD_Gpio.obj \
./F2837xD_PieCtrl.obj \
./F2837xD_PieVect.obj \
./F2837xD_SysCtrl.obj \
./F2837xD_usDelay.obj \
./Peripheral_Setup.obj \
./main_cpu2.obj 

ASM_DEPS += \
./F2837xD_CodeStartBranch.d \
./F2837xD_usDelay.d 

OBJS__QUOTED += \
"CLA_Config.obj" \
"CLA_Tasks.obj" \
"F2837xD_Adc.obj" \
"F2837xD_CodeStartBranch.obj" \
"F2837xD_CpuTimers.obj" \
"F2837xD_DefaultISR.obj" \
"F2837xD_GlobalVariableDefs.obj" \
"F2837xD_Gpio.obj" \
"F2837xD_PieCtrl.obj" \
"F2837xD_PieVect.obj" \
"F2837xD_SysCtrl.obj" \
"F2837xD_usDelay.obj" \
"Peripheral_Setup.obj" \
"main_cpu2.obj" 

C_DEPS__QUOTED += \
"CLA_Config.d" \
"F2837xD_Adc.d" \
"F2837xD_CpuTimers.d" \
"F2837xD_DefaultISR.d" \
"F2837xD_GlobalVariableDefs.d" \
"F2837xD_Gpio.d" \
"F2837xD_PieCtrl.d" \
"F2837xD_PieVect.d" \
"F2837xD_SysCtrl.d" \
"Peripheral_Setup.d" \
"main_cpu2.d" 

CLA_DEPS__QUOTED += \
"CLA_Tasks.d" 

ASM_DEPS__QUOTED += \
"F2837xD_CodeStartBranch.d" \
"F2837xD_usDelay.d" 

C_SRCS__QUOTED += \
"../CLA_Config.c" \
"/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/source/F2837xD_Adc.c" \
"/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/source/F2837xD_CpuTimers.c" \
"/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/source/F2837xD_DefaultISR.c" \
"/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/headers/source/F2837xD_GlobalVariableDefs.c" \
"/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/source/F2837xD_Gpio.c" \
"/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/source/F2837xD_PieCtrl.c" \
"/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/source/F2837xD_PieVect.c" \
"/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/source/F2837xD_SysCtrl.c" \
"../Peripheral_Setup.c" \
"../main_cpu2.c" 

ASM_SRCS__QUOTED += \
"/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/source/F2837xD_CodeStartBranch.asm" \
"/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/source/F2837xD_usDelay.asm" 


