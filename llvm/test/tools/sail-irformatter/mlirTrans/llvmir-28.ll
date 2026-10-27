; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "E"

declare void @module_big_endian()

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

