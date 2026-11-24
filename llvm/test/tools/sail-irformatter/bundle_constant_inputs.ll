; RUN: llvm-as --disable-output %s
; RUN: sail-irformatter -S --verify-pointers %s -o %t
; RUN: FileCheck %s --implicit-check-not='{{(^|[[:space:]<])ptr([^[:alnum:]_]|$)}}' --implicit-check-not='fake.cast' < %t
; RUN: llvm-as -opaque-pointers=0 %t -o %t.bc
; RUN: sail-irformatter -S --verify-pointers %t.bc | FileCheck %s
;
; Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
; See https://llvm.org/LICENSE.txt for license information.
; SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
;
; i128 elements retain ConstantArray representation, unlike ConstantDataArray.
; Literal pointer vectors must be converted lane by lane in both bundle paths.
; Attached-call operands must remain Function values, not data-pointer casts.

declare <2 x float> @llvm.masked.load.v2f32.p0(ptr, i32, <2 x i1>, <2 x float>)
declare <2 x float> @llvm.masked.gather.v2f32.v2p3(<2 x ptr addrspace(3)>, <2 x i1>, <2 x float>)
declare ptr @producer()
declare ptr @llvm.objc.retainAutoreleasedReturnValue(ptr)

; CHECK-LABEL: define i8* @bundle_inputs(
; CHECK: call fast <2 x float> @llvm.masked.load.v2f32.p0v2f32({{.*}}i32 4,{{.*}}) [ "deopt"([2 x i128] [i128 1, i128 2], <2 x i8 addrspace(3)*> <i8 addrspace(3)* null, i8 addrspace(3)* inttoptr (i32 16 to i8 addrspace(3)*)>) ]
; CHECK: call fast <2 x float> @llvm.masked.gather.v2f32.v2p3f32(<2 x float addrspace(3)*> <float addrspace(3)* null, float addrspace(3)* inttoptr (i32 16 to float addrspace(3)*)>, i32 1,
; CHECK: %[[OBJ:[0-9]+]] = call i8* @producer() [ "clang.arc.attachedcall"(i8* (i8*)* @llvm.objc.retainAutoreleasedReturnValue), "deopt"([2 x i128] [i128 1, i128 2], [2 x i32] [i32 1, i32 2], <2 x i8 addrspace(3)*> <i8 addrspace(3)* null, i8 addrspace(3)* inttoptr (i32 16 to i8 addrspace(3)*)>) ]
; CHECK: ret i8* %[[OBJ]]
define ptr @bundle_inputs(ptr %p, <2 x i1> %mask) {
  %loaded = call fast <2 x float> @llvm.masked.load.v2f32.p0(ptr %p, i32 4, <2 x i1> %mask, <2 x float> zeroinitializer) [ "deopt"([2 x i128] [i128 1, i128 2], <2 x ptr addrspace(3)> <ptr addrspace(3) null, ptr addrspace(3) inttoptr (i32 16 to ptr addrspace(3))>) ]
  %gathered = call fast <2 x float> @llvm.masked.gather.v2f32.v2p3(<2 x ptr addrspace(3)> <ptr addrspace(3) null, ptr addrspace(3) inttoptr (i32 16 to ptr addrspace(3))>, <2 x i1> %mask, <2 x float> %loaded)
  %object = call ptr @producer() [ "clang.arc.attachedcall"(ptr @llvm.objc.retainAutoreleasedReturnValue), "deopt"([2 x i128] [i128 1, i128 2], [2 x i32] [i32 1, i32 2], <2 x ptr addrspace(3)> <ptr addrspace(3) null, ptr addrspace(3) inttoptr (i32 16 to ptr addrspace(3))>) ]
  ret ptr %object
}
