; RUN: sail-irformatter -S --verify-pointers < %s | FileCheck %s --implicit-check-not=" ptr"
;
; Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
; See https://llvm.org/LICENSE.txt for license information.
; SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

; CHECK-LABEL: define ptx_kernel void @a(
; CHECK: call <4 x float> @llvm.masked.load.v4f32.p0v4f32(<4 x float>* {{.*}}, i32 4, <4 x i1> <i1 true, i1 false, i1 true, i1 false>, <4 x float> zeroinitializer)
; CHECK-LABEL: define ptx_kernel void @b(
; CHECK: call <4 x float> @llvm.masked.load.v4f32.p0v4f32(<4 x float>* {{.*}}, i32 1,
; CHECK-LABEL: define ptx_kernel void @shared(
; CHECK: call <4 x float> @llvm.masked.load.v4f32.p3v4f32(<4 x float> addrspace(3)* {{.*}}, i32 8,
; CHECK: call void @llvm.masked.store.v4f32.p3v4f32(<4 x float> {{.*}}, <4 x float> addrspace(3)* {{.*}}, i32 4,
; CHECK-LABEL: define ptx_kernel void @old_shape(
; CHECK: call <4 x i32> @llvm.masked.load.v4i32.p0v4i32(<4 x i32>* {{.*}}, i32 2,
; CHECK: call void @llvm.masked.store.v4i32.p0v4i32(<4 x i32> {{.*}}, <4 x i32>* {{.*}}, i32 2,
; CHECK-DAG: declare <4 x float> @llvm.masked.load.v4f32.p0v4f32(<4 x float>* {{.*}}, i32 immarg,
; CHECK-DAG: declare <4 x float> @llvm.masked.load.v4f32.p3v4f32(<4 x float> addrspace(3)* {{.*}}, i32 immarg,
; CHECK-DAG: declare void @llvm.masked.store.v4f32.p3v4f32(<4 x float>, <4 x float> addrspace(3)* {{.*}}, i32 immarg,

declare <4 x float> @llvm.masked.load.v4f32.p0(ptr, <4 x i1>, <4 x float>)
declare <4 x float> @llvm.masked.load.v4f32.p3(ptr addrspace(3), <4 x i1>, <4 x float>)
declare void @llvm.masked.store.v4f32.p3(<4 x float>, ptr addrspace(3), <4 x i1>)
declare <4 x i32> @llvm.masked.load.v4i32.p0(ptr, i32 immarg, <4 x i1>, <4 x i32>)
declare void @llvm.masked.store.v4i32.p0(<4 x i32>, ptr, i32 immarg, <4 x i1>)

define ptx_kernel void @a(ptr %in, ptr %out) {
  %g = getelementptr float, ptr %out, i64 0
  %v = call <4 x float> @llvm.masked.load.v4f32.p0(ptr align 4 %in, <4 x i1> <i1 true, i1 false, i1 true, i1 false>, <4 x float> zeroinitializer)
  %element = extractelement <4 x float> %v, i32 0
  store float %element, ptr %g, align 4
  ret void
}

define ptx_kernel void @b(ptr %in, ptr %out) {
  %g = getelementptr float, ptr %out, i64 0
  %v = call <4 x float> @llvm.masked.load.v4f32.p0(ptr align 1 %in, <4 x i1> <i1 false, i1 true, i1 false, i1 true>, <4 x float> zeroinitializer)
  %element = extractelement <4 x float> %v, i32 1
  store float %element, ptr %g, align 4
  ret void
}

define ptx_kernel void @shared(ptr addrspace(3) %in, ptr addrspace(3) %out) {
  %v = call <4 x float> @llvm.masked.load.v4f32.p3(ptr addrspace(3) align 8 %in, <4 x i1> <i1 true, i1 false, i1 true, i1 false>, <4 x float> zeroinitializer)
  call void @llvm.masked.store.v4f32.p3(<4 x float> %v, ptr addrspace(3) align 4 %out, <4 x i1> <i1 false, i1 true, i1 false, i1 true>)
  ret void
}

define ptx_kernel void @old_shape(ptr %in, ptr %out) {
  %v = call <4 x i32> @llvm.masked.load.v4i32.p0(ptr %in, i32 2, <4 x i1> <i1 true, i1 true, i1 false, i1 false>, <4 x i32> zeroinitializer)
  call void @llvm.masked.store.v4i32.p0(<4 x i32> %v, ptr %out, i32 2, <4 x i1> <i1 true, i1 false, i1 true, i1 false>)
  ret void
}
