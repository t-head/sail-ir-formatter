; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @kernel_func() {
  ret void
}

!llvm.module.flags = !{!0}
!nvvm.annotations = !{!1, !2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @kernel_func, !"kernel", i32 1}
!2 = !{ptr @kernel_func, !"maxnreg", i32 16}

