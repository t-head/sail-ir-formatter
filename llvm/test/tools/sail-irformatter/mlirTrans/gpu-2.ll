; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@kernel_module_bin_cst = internal constant [6 x i8] c"AMDGPU", align 8

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

