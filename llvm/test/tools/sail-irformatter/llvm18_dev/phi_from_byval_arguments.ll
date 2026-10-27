; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = './phi_from_arguments.ll'
source_filename = "./phi_from_arguments.ll"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.uint4 = type { i32, i32, i32, i32 }

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn readnone
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn readnone
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn
define float @copy_fusion_6(ptr byval(%struct.uint4) %arg0, ptr byval(%struct.uint4) %arg1, ptr byval(%struct.uint4) %arg2){
entry:
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !47
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !48
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or i32 %2, %1
  %3 = icmp ult i32 %linear_index, 131072
  %4 = load float, ptr %arg0, align 16, !invariant.load !49
  br i1 %3, label %if, label %then

if:                    ; preds = %slice6-true, %slice5-after
  br label %then

then:                      ; preds = %concatenate.pivot.393216.14, %concatenate.pivot.131072.13, %concatenate.pivot.65536.11, %concatenate.pivot.0.10
; CHECK: %{{.+}} = phi i8* [ %[[ARG0:.+]], %if ], [ %[[ARG1:.+]], %entry ]
  %arg3.sink = phi ptr [ %arg0, %if ], [ %arg1, %entry ]
; CHECK-NOT: %[[ARG0]] = bitcast %struct.uint4* %{{.+}} to i8*
; CHECK-NOT: %[[ARG1]] = bitcast %struct.uint4* %{{.+}} to i8*
  %5 = load float, ptr %arg3.sink, align 16, !invariant.load !49
  %6 = fmul float %4, %5
  ret float %6
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45}
!llvm.module.flags = !{!46}

!0 = distinct !{null, !"kernel", i32 1}
!1 = distinct !{null, !"reqntidx", i32 1}
!2 = distinct !{null, !"kernel", i32 1}
!3 = distinct !{null, !"reqntidx", i32 1}
!4 = distinct !{null, !"kernel", i32 1}
!5 = distinct !{null, !"reqntidx", i32 64}
!6 = distinct !{null, !"kernel", i32 1}
!7 = distinct !{null, !"reqntidx", i32 128}
!8 = distinct !{null, !"kernel", i32 1}
!9 = distinct !{null, !"reqntidx", i32 512}
!10 = distinct !{null, !"kernel", i32 1}
!11 = distinct !{null, !"reqntidx", i32 256}
!12 = distinct !{null, !"kernel", i32 1}
!13 = distinct !{null, !"reqntidx", i32 512}
!14 = distinct !{null, !"kernel", i32 1}
!15 = distinct !{null, !"reqntidx", i32 1024}
!16 = distinct !{null, !"kernel", i32 1}
!17 = distinct !{null, !"reqntidx", i32 1024}
!18 = distinct !{null, !"kernel", i32 1}
!19 = distinct !{null, !"reqntidx", i32 1024}
!20 = distinct !{null, !"kernel", i32 1}
!21 = distinct !{null, !"reqntidx", i32 1024}
!22 = distinct !{null, !"kernel", i32 1}
!23 = distinct !{null, !"reqntidx", i32 256}
!24 = distinct !{null, !"kernel", i32 1}
!25 = distinct !{null, !"reqntidx", i32 256}
!26 = distinct !{null, !"kernel", i32 1}
!27 = distinct !{null, !"reqntidx", i32 256}
!28 = distinct !{null, !"kernel", i32 1}
!29 = distinct !{null, !"reqntidx", i32 256}
!30 = distinct !{null, !"kernel", i32 1}
!31 = distinct !{null, !"reqntidx", i32 256}
!32 = distinct !{null, !"kernel", i32 1}
!33 = distinct !{null, !"reqntidx", i32 256}
!34 = !{ptr @copy_fusion_6, !"kernel", i32 1}
!35 = !{ptr @copy_fusion_6, !"reqntidx", i32 128}
!36 = distinct !{null, !"kernel", i32 1}
!37 = distinct !{null, !"reqntidx", i32 128}
!38 = distinct !{null, !"kernel", i32 1}
!39 = distinct !{null, !"reqntidx", i32 128}
!40 = distinct !{null, !"kernel", i32 1}
!41 = distinct !{null, !"reqntidx", i32 128}
!42 = distinct !{null, !"kernel", i32 1}
!43 = distinct !{null, !"reqntidx", i32 256}
!44 = distinct !{null, !"kernel", i32 1}
!45 = distinct !{null, !"reqntidx", i32 128}
!46 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!47 = !{i32 0, i32 5120}
!48 = !{i32 0, i32 128}
!49 = !{}
