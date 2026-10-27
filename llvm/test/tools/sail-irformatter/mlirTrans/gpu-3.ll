; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@kernel_module_bin_cst = internal constant [4 x i8] c"BLOB", align 8

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

