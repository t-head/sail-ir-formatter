; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @vectorizeOptions() {
  br label %1, !llvm.loop !1

1:                                                ; preds = %0
  ret void
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = distinct !{!1, !2, !3, !4, !5, !6, !9, !10}
!2 = !{!"llvm.loop.vectorize.enable", i1 true}
!3 = !{!"llvm.loop.vectorize.predicate.enable", i1 true}
!4 = !{!"llvm.loop.vectorize.scalable.enable", i1 false}
!5 = !{!"llvm.loop.vectorize.width", i32 16}
!6 = !{!"llvm.loop.vectorize.followup_vectorized", !7}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.disable_nonforced"}
!9 = !{!"llvm.loop.vectorize.followup_epilogue", !7}
!10 = !{!"llvm.loop.vectorize.followup_all", !7}

