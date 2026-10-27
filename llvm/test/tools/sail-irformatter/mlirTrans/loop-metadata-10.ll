; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @distributeOptions() {
  br label %1, !llvm.loop !1

1:                                                ; preds = %0
  ret void
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = distinct !{!1, !2, !3, !6, !7, !8}
!2 = !{!"llvm.loop.distribute.enable", i1 false}
!3 = !{!"llvm.loop.distribute.followup_coincident", !4}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.disable_nonforced"}
!6 = !{!"llvm.loop.distribute.followup_sequential", !4}
!7 = !{!"llvm.loop.distribute.followup_fallback", !4}
!8 = !{!"llvm.loop.distribute.followup_all", !4}

