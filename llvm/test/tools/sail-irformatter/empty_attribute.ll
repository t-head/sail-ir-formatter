; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; CHECK-LABLE: kernel
; CHECK: define ptx_kernel void @kernel() local_unnamed_addr #0 {
define ptx_kernel void @kernel() local_unnamed_addr #0 {
  ret void
}

; CHECK-LABLE: kernel1
; CHECK: define ptx_kernel void @kernel1() local_unnamed_addr {
define ptx_kernel void @kernel1() local_unnamed_addr #1 {
  ret void
}

attributes #0 = { mustprogress }
attributes #1 = { }
