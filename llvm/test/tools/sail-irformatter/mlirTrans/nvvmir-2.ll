; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @kernel_func() {
  ret void
}

!llvm.module.flags = !{!0}
!nvvm.annotations = !{!1, !2, !3, !4}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @kernel_func, !"kernel", i32 1}
!2 = !{ptr @kernel_func, !"reqntidx", i32 1}
!3 = !{ptr @kernel_func, !"reqntidy", i32 23}
!4 = !{ptr @kernel_func, !"reqntidz", i32 32}

