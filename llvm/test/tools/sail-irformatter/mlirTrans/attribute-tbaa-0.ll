; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.agg2_t = type { i64, i64 }
%struct.agg1_t = type { i32, i32 }

define void @tbaa2(ptr %0, ptr %1) {
  %3 = getelementptr inbounds %struct.agg2_t, ptr %1, i32 0, i32 1
  %4 = load i64, ptr %3, align 4, !tbaa !1
  %5 = trunc i64 %4 to i32
  %6 = getelementptr inbounds %struct.agg1_t, ptr %0, i32 0, i32 0
  store i32 %5, ptr %6, align 4, !tbaa !6
  ret void
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!2, !3, i64 8}
!2 = !{!"agg2_t", !3, i64 0, !3, i64 8}
!3 = !{!"long long", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !8, i64 0, i64 1}
!7 = !{!"agg1_t", !8, i64 0, !8, i64 4}
!8 = !{!"int", !4, i64 0}

