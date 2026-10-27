; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @unrollOptions() {
  br label %1, !llvm.loop !1

1:                                                ; preds = %0
  ret void
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = distinct !{!1, !2, !3, !4, !5, !8, !9}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!"llvm.loop.unroll.count", i32 64}
!4 = !{!"llvm.loop.unroll.runtime.disable", i1 false}
!5 = !{!"llvm.loop.unroll.followup_unrolled", !6}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.disable_nonforced"}
!8 = !{!"llvm.loop.unroll.followup_remainder", !6}
!9 = !{!"llvm.loop.unroll.followup_all", !6}

