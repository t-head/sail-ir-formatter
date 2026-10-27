; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @unrollAndJamOptions() {
  br label %1, !llvm.loop !1

1:                                                ; preds = %0
  ret void
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = distinct !{!1, !2, !3, !4, !7, !8, !9, !10}
!2 = !{!"llvm.loop.unroll_and_jam.enable"}
!3 = !{!"llvm.loop.unroll_and_jam.count", i32 8}
!4 = !{!"llvm.loop.unroll_and_jam.followup_outer", !5}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.disable_nonforced"}
!7 = !{!"llvm.loop.unroll_and_jam.followup_inner", !5}
!8 = !{!"llvm.loop.unroll_and_jam.followup_remainder_outer", !5}
!9 = !{!"llvm.loop.unroll_and_jam.followup_remainder_inner", !5}
!10 = !{!"llvm.loop.unroll_and_jam.followup_all", !5}

