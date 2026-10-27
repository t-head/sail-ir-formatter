; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare void @module_default_layout()

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

