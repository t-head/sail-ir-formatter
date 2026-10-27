; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @kernel_func(ptr byval(i32) %0) {
  ret void
}

!llvm.module.flags = !{!0}
!nvvm.annotations = !{!1, !3}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @kernel_func, !"grid_constant", !2}
!2 = !{i32 1}
!3 = !{ptr @kernel_func, !"kernel", i32 1}

