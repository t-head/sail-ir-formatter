; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @pipelineOptions() {
  br label %1, !llvm.loop !1

1:                                                ; preds = %0
  ret void
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.pipeline.disable", i1 false}
!3 = !{!"llvm.loop.pipeline.initiationinterval", i32 1}

