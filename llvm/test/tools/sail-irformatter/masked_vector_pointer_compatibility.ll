; RUN: sail-irformatter -S --verify-pointers < %s | FileCheck %s --implicit-check-not=" ptr"
;
; Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
; See https://llvm.org/LICENSE.txt for license information.
; SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

; CHECK-LABEL: define <4 x float> @gather(
; CHECK: call <4 x float> @llvm.masked.gather.v4f32.v4p3f32(<4 x float addrspace(3)*> {{.*}}, i32 1, <4 x i1> %{{.*}}, <4 x float> %{{.*}})
; CHECK-LABEL: define void @scatter(
; CHECK: call void @llvm.masked.scatter.v4f32.v4p3f32(<4 x float> %{{.*}}, <4 x float addrspace(3)*> {{.*}}, i32 1, <4 x i1> %{{.*}})
; CHECK-DAG: declare <4 x float> @llvm.masked.gather.v4f32.v4p3f32(<4 x float addrspace(3)*>, i32 immarg, <4 x i1>, <4 x float>)
; CHECK-DAG: declare void @llvm.masked.scatter.v4f32.v4p3f32(<4 x float>, <4 x float addrspace(3)*>, i32 immarg, <4 x i1>)

declare <4 x float> @llvm.masked.gather.v4f32.v4p3(<4 x ptr addrspace(3)>, <4 x i1>, <4 x float>)
declare void @llvm.masked.scatter.v4f32.v4p3(<4 x float>, <4 x ptr addrspace(3)>, <4 x i1>)

define <4 x float> @gather(<4 x ptr addrspace(3)> %p, <4 x i1> %mask, <4 x float> %passthrough) {
  %value = call <4 x float> @llvm.masked.gather.v4f32.v4p3(<4 x ptr addrspace(3)> %p, <4 x i1> %mask, <4 x float> %passthrough)
  ret <4 x float> %value
}

define void @scatter(<4 x ptr addrspace(3)> %p, <4 x i1> %mask, <4 x float> %value) {
  call void @llvm.masked.scatter.v4f32.v4p3(<4 x float> %value, <4 x ptr addrspace(3)> %p, <4 x i1> %mask)
  ret void
}
