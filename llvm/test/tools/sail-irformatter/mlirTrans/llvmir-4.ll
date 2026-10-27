; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare void @gc_decl() gc "statepoint-example"

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

