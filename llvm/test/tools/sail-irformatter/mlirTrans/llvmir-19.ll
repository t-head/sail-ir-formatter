; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @cond_br_weights(i1 %0, i32 %1, i32 %2) {
  br i1 %0, label %4, label %5, !prof !1

4:                                                ; preds = %3
  ret i32 %1

5:                                                ; preds = %3
  ret i32 %2
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!"branch_weights", i32 5, i32 10}

