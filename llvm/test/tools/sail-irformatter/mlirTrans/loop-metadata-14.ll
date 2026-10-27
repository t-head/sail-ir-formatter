; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare void @foo(i32)

define void @loopOptions(i32 %0, i32 %1) {
  %3 = alloca i32, i32 %0, align 4
  br label %4

4:                                                ; preds = %7, %2
  %5 = phi i32 [ %8, %7 ], [ 0, %2 ]
  %6 = icmp slt i32 %5, %0
  br i1 %6, label %7, label %12, !llvm.loop !1

7:                                                ; preds = %4
  %8 = add i32 %5, %1
  %9 = load i32, ptr %3, align 4, !llvm.access.group !10
  store i32 %9, ptr %3, align 4, !llvm.access.group !10
  %10 = atomicrmw add ptr %3, i32 %9 monotonic, align 4, !llvm.access.group !10
  %11 = cmpxchg ptr %3, i32 %9, i32 %10 acq_rel monotonic, align 4, !llvm.access.group !10
  call void @llvm.memcpy.p0.p0.i32(ptr %3, ptr %3, i32 0, i1 false), !llvm.access.group !10
  call void @llvm.memset.p0.i32(ptr %3, i8 42, i32 0, i1 false), !llvm.access.group !10
  call void @foo(i32 %0), !llvm.access.group !10
  br label %4, !llvm.loop !1

12:                                               ; preds = %4
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
!1 = distinct !{!1, !2, !3, !4, !5, !6, !7}
!2 = !{!"llvm.loop.interleave.count", i32 1}
!3 = !{!"llvm.loop.unroll.disable"}
!4 = !{!"llvm.licm.disable"}
!5 = !{!"llvm.loop.pipeline.disable", i1 true}
!6 = !{!"llvm.loop.pipeline.initiationinterval", i32 2}
!7 = !{!"llvm.loop.parallel_accesses", !8, !9}
!8 = distinct !{}
!9 = distinct !{}
!10 = !{!8, !9}

