; RUN: sail-irformatter -S --verify-pointers < %s -o %t
; RUN: FileCheck %s --implicit-check-not='ptrtoint' --implicit-check-not='{{(^|[[:space:]<])ptr([^[:alnum:]_]|$)}}' < %t
; RUN: llvm-as -opaque-pointers=0 %t -o %t.bc
;
; Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
; See https://llvm.org/LICENSE.txt for license information.
; SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

target datalayout = "e-p:64:64-p3:32:32-p4:128:128"
declare void @llvm.assume(i1 noundef)

; CHECK-LABEL: define void @constant_align(
; CHECK-SAME: i8* %[[P:[0-9]+]], i1 %[[COND:[0-9]+]])
; CHECK: call void @llvm.assume(i1 %[[COND]]) [ "align"(i8* %[[P]], i64 128), "nonnull"(i8* %[[P]]) ]
define void @constant_align(ptr %p, i1 %condition) {
  call void @llvm.assume(i1 %condition) [ "align"(ptr %p, i64 128), "nonnull"(ptr %p) ]
  ret void
}

; CHECK-LABEL: define void @unit_align(
; CHECK-SAME: i8* %[[UNIT_P:[0-9]+]], i1 %[[UNIT_C:[0-9]+]])
; CHECK: call void @llvm.assume(i1 %[[UNIT_C]]) [ "align"(i8* %[[UNIT_P]], i64 1) ]
define void @unit_align(ptr %p, i1 %condition) {
  call void @llvm.assume(i1 %condition) [ "align"(ptr %p, i64 1) ]
  ret void
}

; CHECK-LABEL: define void @offset_align(
; CHECK-SAME: i8 addrspace(3)* %[[SHARED:[0-9]+]])
; CHECK: call void @llvm.assume(i1 true) [ "align"(i8 addrspace(3)* %[[SHARED]], i32 16, i32 3) ]
define void @offset_align(ptr addrspace(3) %p) {
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(3) %p, i32 16, i32 3) ]
  ret void
}

; CHECK-LABEL: define void @dynamic_align(
; CHECK-SAME: i8* %[[DP:[0-9]+]], i32 %[[ALIGN:[0-9]+]], i32 %[[OFFSET:[0-9]+]], i1 %[[DC:[0-9]+]])
; CHECK: call void @llvm.assume(i1 %[[DC]]) [ "align"(i8* %[[DP]], i32 %[[ALIGN]], i32 %[[OFFSET]]) ]
define void @dynamic_align(ptr %p, i32 %alignment, i32 %offset, i1 %condition) {
  call void @llvm.assume(i1 %condition) [ "align"(ptr %p, i32 %alignment, i32 %offset) ]
  ret void
}

; CHECK-LABEL: define void @zero_alignment(
; CHECK: call void @llvm.assume(i1 true) [ "align"(i8* %{{[0-9]+}}, i32 0) ]
; CHECK-LABEL: define void @non_power_alignment(
; CHECK: call void @llvm.assume(i1 true) [ "align"(i8* %{{[0-9]+}}, i32 3) ]
define void @zero_alignment(ptr %p) {
  call void @llvm.assume(i1 true) [ "align"(ptr %p, i32 0) ]
  ret void
}
define void @non_power_alignment(ptr %p) {
  call void @llvm.assume(i1 true) [ "align"(ptr %p, i32 3) ]
  ret void
}

; CHECK-LABEL: define void @wide_pointer(
; CHECK: call void @llvm.assume(i1 true) [ "align"(i8 addrspace(4)* %{{[0-9]+}}, i128 16) ]
define void @wide_pointer(ptr addrspace(4) %p) {
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(4) %p, i128 16) ]
  ret void
}
