################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
%.obj: ../%.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccs1281/ccs/tools/compiler/ti-cgt-c2000_22.6.1.LTS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -O0 --fp_mode=relaxed --include_path="/Volumes/SSD/ti/workspace_v12/F28379D_Dual_Cpu2" --include_path="/Applications/ti/ccs1281/ccs/tools/compiler/ti-cgt-c2000_22.6.1.LTS/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/headers/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/libraries/math/CLAmath/c28/include" --advice:performance=all --define=CPU2 --define=_LAUNCHXL_F28379D --define=CLA_MATH_TABLES_IN_ROM=1 -g --diag_warning=225 --diag_wrap=off --display_error_number --abi=coffabi --preproc_with_compile --preproc_dependency="$(basename $(<F)).d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

%.obj: ../%.cla $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccs1281/ccs/tools/compiler/ti-cgt-c2000_22.6.1.LTS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -O0 --fp_mode=relaxed --include_path="/Volumes/SSD/ti/workspace_v12/F28379D_Dual_Cpu2" --include_path="/Applications/ti/ccs1281/ccs/tools/compiler/ti-cgt-c2000_22.6.1.LTS/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/headers/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/libraries/math/CLAmath/c28/include" --advice:performance=all --define=CPU2 --define=_LAUNCHXL_F28379D --define=CLA_MATH_TABLES_IN_ROM=1 -g --diag_warning=225 --diag_wrap=off --display_error_number --abi=coffabi --preproc_with_compile --preproc_dependency="$(basename $(<F)).d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

F2837xD_Adc.obj: /Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/source/F2837xD_Adc.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccs1281/ccs/tools/compiler/ti-cgt-c2000_22.6.1.LTS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -O0 --fp_mode=relaxed --include_path="/Volumes/SSD/ti/workspace_v12/F28379D_Dual_Cpu2" --include_path="/Applications/ti/ccs1281/ccs/tools/compiler/ti-cgt-c2000_22.6.1.LTS/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/headers/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/libraries/math/CLAmath/c28/include" --advice:performance=all --define=CPU2 --define=_LAUNCHXL_F28379D --define=CLA_MATH_TABLES_IN_ROM=1 -g --diag_warning=225 --diag_wrap=off --display_error_number --abi=coffabi --preproc_with_compile --preproc_dependency="$(basename $(<F)).d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

F2837xD_CodeStartBranch.obj: /Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/source/F2837xD_CodeStartBranch.asm $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccs1281/ccs/tools/compiler/ti-cgt-c2000_22.6.1.LTS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -O0 --fp_mode=relaxed --include_path="/Volumes/SSD/ti/workspace_v12/F28379D_Dual_Cpu2" --include_path="/Applications/ti/ccs1281/ccs/tools/compiler/ti-cgt-c2000_22.6.1.LTS/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/headers/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/libraries/math/CLAmath/c28/include" --advice:performance=all --define=CPU2 --define=_LAUNCHXL_F28379D --define=CLA_MATH_TABLES_IN_ROM=1 -g --diag_warning=225 --diag_wrap=off --display_error_number --abi=coffabi --preproc_with_compile --preproc_dependency="$(basename $(<F)).d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

F2837xD_CpuTimers.obj: /Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/source/F2837xD_CpuTimers.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccs1281/ccs/tools/compiler/ti-cgt-c2000_22.6.1.LTS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -O0 --fp_mode=relaxed --include_path="/Volumes/SSD/ti/workspace_v12/F28379D_Dual_Cpu2" --include_path="/Applications/ti/ccs1281/ccs/tools/compiler/ti-cgt-c2000_22.6.1.LTS/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/headers/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/libraries/math/CLAmath/c28/include" --advice:performance=all --define=CPU2 --define=_LAUNCHXL_F28379D --define=CLA_MATH_TABLES_IN_ROM=1 -g --diag_warning=225 --diag_wrap=off --display_error_number --abi=coffabi --preproc_with_compile --preproc_dependency="$(basename $(<F)).d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

F2837xD_DefaultISR.obj: /Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/source/F2837xD_DefaultISR.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccs1281/ccs/tools/compiler/ti-cgt-c2000_22.6.1.LTS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -O0 --fp_mode=relaxed --include_path="/Volumes/SSD/ti/workspace_v12/F28379D_Dual_Cpu2" --include_path="/Applications/ti/ccs1281/ccs/tools/compiler/ti-cgt-c2000_22.6.1.LTS/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/headers/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/libraries/math/CLAmath/c28/include" --advice:performance=all --define=CPU2 --define=_LAUNCHXL_F28379D --define=CLA_MATH_TABLES_IN_ROM=1 -g --diag_warning=225 --diag_wrap=off --display_error_number --abi=coffabi --preproc_with_compile --preproc_dependency="$(basename $(<F)).d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

F2837xD_GlobalVariableDefs.obj: /Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/headers/source/F2837xD_GlobalVariableDefs.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccs1281/ccs/tools/compiler/ti-cgt-c2000_22.6.1.LTS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -O0 --fp_mode=relaxed --include_path="/Volumes/SSD/ti/workspace_v12/F28379D_Dual_Cpu2" --include_path="/Applications/ti/ccs1281/ccs/tools/compiler/ti-cgt-c2000_22.6.1.LTS/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/headers/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/libraries/math/CLAmath/c28/include" --advice:performance=all --define=CPU2 --define=_LAUNCHXL_F28379D --define=CLA_MATH_TABLES_IN_ROM=1 -g --diag_warning=225 --diag_wrap=off --display_error_number --abi=coffabi --preproc_with_compile --preproc_dependency="$(basename $(<F)).d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

F2837xD_Gpio.obj: /Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/source/F2837xD_Gpio.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccs1281/ccs/tools/compiler/ti-cgt-c2000_22.6.1.LTS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -O0 --fp_mode=relaxed --include_path="/Volumes/SSD/ti/workspace_v12/F28379D_Dual_Cpu2" --include_path="/Applications/ti/ccs1281/ccs/tools/compiler/ti-cgt-c2000_22.6.1.LTS/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/headers/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/libraries/math/CLAmath/c28/include" --advice:performance=all --define=CPU2 --define=_LAUNCHXL_F28379D --define=CLA_MATH_TABLES_IN_ROM=1 -g --diag_warning=225 --diag_wrap=off --display_error_number --abi=coffabi --preproc_with_compile --preproc_dependency="$(basename $(<F)).d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

F2837xD_PieCtrl.obj: /Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/source/F2837xD_PieCtrl.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccs1281/ccs/tools/compiler/ti-cgt-c2000_22.6.1.LTS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -O0 --fp_mode=relaxed --include_path="/Volumes/SSD/ti/workspace_v12/F28379D_Dual_Cpu2" --include_path="/Applications/ti/ccs1281/ccs/tools/compiler/ti-cgt-c2000_22.6.1.LTS/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/headers/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/libraries/math/CLAmath/c28/include" --advice:performance=all --define=CPU2 --define=_LAUNCHXL_F28379D --define=CLA_MATH_TABLES_IN_ROM=1 -g --diag_warning=225 --diag_wrap=off --display_error_number --abi=coffabi --preproc_with_compile --preproc_dependency="$(basename $(<F)).d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

F2837xD_PieVect.obj: /Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/source/F2837xD_PieVect.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccs1281/ccs/tools/compiler/ti-cgt-c2000_22.6.1.LTS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -O0 --fp_mode=relaxed --include_path="/Volumes/SSD/ti/workspace_v12/F28379D_Dual_Cpu2" --include_path="/Applications/ti/ccs1281/ccs/tools/compiler/ti-cgt-c2000_22.6.1.LTS/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/headers/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/libraries/math/CLAmath/c28/include" --advice:performance=all --define=CPU2 --define=_LAUNCHXL_F28379D --define=CLA_MATH_TABLES_IN_ROM=1 -g --diag_warning=225 --diag_wrap=off --display_error_number --abi=coffabi --preproc_with_compile --preproc_dependency="$(basename $(<F)).d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

F2837xD_SysCtrl.obj: /Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/source/F2837xD_SysCtrl.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccs1281/ccs/tools/compiler/ti-cgt-c2000_22.6.1.LTS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -O0 --fp_mode=relaxed --include_path="/Volumes/SSD/ti/workspace_v12/F28379D_Dual_Cpu2" --include_path="/Applications/ti/ccs1281/ccs/tools/compiler/ti-cgt-c2000_22.6.1.LTS/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/headers/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/libraries/math/CLAmath/c28/include" --advice:performance=all --define=CPU2 --define=_LAUNCHXL_F28379D --define=CLA_MATH_TABLES_IN_ROM=1 -g --diag_warning=225 --diag_wrap=off --display_error_number --abi=coffabi --preproc_with_compile --preproc_dependency="$(basename $(<F)).d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

F2837xD_usDelay.obj: /Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/source/F2837xD_usDelay.asm $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccs1281/ccs/tools/compiler/ti-cgt-c2000_22.6.1.LTS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -O0 --fp_mode=relaxed --include_path="/Volumes/SSD/ti/workspace_v12/F28379D_Dual_Cpu2" --include_path="/Applications/ti/ccs1281/ccs/tools/compiler/ti-cgt-c2000_22.6.1.LTS/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/headers/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/device_support/f2837xd/common/include" --include_path="/Volumes/SSD/ti/C2000Ware_5_04_00_00/libraries/math/CLAmath/c28/include" --advice:performance=all --define=CPU2 --define=_LAUNCHXL_F28379D --define=CLA_MATH_TABLES_IN_ROM=1 -g --diag_warning=225 --diag_wrap=off --display_error_number --abi=coffabi --preproc_with_compile --preproc_dependency="$(basename $(<F)).d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


