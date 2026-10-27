; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

; Function Attrs: memory(readwrite, argmem: none)
declare void @arg_mem_none_func() #0

attributes #0 = { memory(readwrite, argmem: none) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

