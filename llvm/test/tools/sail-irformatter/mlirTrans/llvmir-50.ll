; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@big_ = common global [4294967296 x i8] zeroinitializer

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

