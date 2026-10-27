; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare void @f()

!llvm.module.flags = !{!0}
!nvvm.annotations = !{!1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @f, !"minctasm", i32 10}
