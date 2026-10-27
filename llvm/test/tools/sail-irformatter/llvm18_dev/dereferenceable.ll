; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = 'referenceable.ll'
source_filename = "kernel.ll"
target datalayout = "e-p6:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
; CHECK: define ptx_kernel void @kernel(i8* noalias readnone align 128 %0, i8* noalias readnone align 128 %1, i8* noalias readnone align 128 dereferenceable(8) %2, i8* noalias readnone align 128 dereferenceable(12) %3, i8* noalias readnone align 128 dereferenceable(24) %4) local_unnamed_addr #0 {
define ptx_kernel void @kernel(ptr noalias readnone align 128 captures(none) dereferenceable(0) %0, ptr noalias readnone align 128 captures(none) dereferenceable(0) %1, ptr noalias readnone align 128 captures(none) dereferenceable(8) %2, ptr noalias readnone align 128 captures(none) dereferenceable(12) %3, ptr noalias readnone align 128 captures(none) dereferenceable(24) %4) local_unnamed_addr #0{
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "nvvm.reqntid"="1,1,1" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!2 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
