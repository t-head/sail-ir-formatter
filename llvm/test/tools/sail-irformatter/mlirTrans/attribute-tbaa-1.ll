; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.agg2_t = type { float, float }
%struct.agg1_t = type { i32, i32 }

declare void @foo(ptr)

define void @tbaa2(ptr %0, ptr %1) {
  %3 = getelementptr inbounds %struct.agg2_t, ptr %1, i32 0, i32 0
  %4 = load float, ptr %3, align 4, !tbaa !1
  %5 = fptosi float %4 to i32
  %6 = getelementptr inbounds %struct.agg1_t, ptr %0, i32 0, i32 0
  store i32 %5, ptr %6, align 4, !tbaa !6
  %7 = atomicrmw add ptr %6, i32 %5 monotonic, align 4, !tbaa !6
  %8 = cmpxchg ptr %6, i32 %7, i32 %5 acq_rel monotonic, align 4, !tbaa !6
  call void @llvm.memcpy.p0.p0.i32(ptr %1, ptr %1, i32 0, i1 false), !tbaa !6
  call void @llvm.memset.p0.i32(ptr %1, i8 42, i32 0, i1 false), !tbaa !6
  call void @foo(ptr %1), !tbaa !6
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i32, i1 immarg) #0

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i32(ptr nocapture writeonly, i8, i32, i1 immarg) #1

attributes #0 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: write) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!2, !3, i64 0}
!2 = !{!"agg2_t", !3, i64 0, !3, i64 4}
!3 = !{!"float", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !8, i64 0}
!7 = !{!"agg1_t", !8, i64 0, !8, i64 4}
!8 = !{!"int", !4, i64 0}
