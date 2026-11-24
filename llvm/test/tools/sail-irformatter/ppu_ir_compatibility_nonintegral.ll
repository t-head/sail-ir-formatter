; RUN: sail-irformatter -S --verify-pointers < %s -o %t
; RUN: FileCheck %s --implicit-check-not='ptrtoint' --implicit-check-not='{{(^|[[:space:]<])ptr([^[:alnum:]_]|$)}}' < %t
; RUN: llvm-as -opaque-pointers=0 %t -o %t.bc
;
; Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
; See https://llvm.org/LICENSE.txt for license information.
; SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

; Preserve alignment on non-integral pointers without integer lowering.
; CHECK-LABEL: define void @unsupported(
; CHECK-SAME: i8 addrspace(1)* %[[P:[0-9]+]])
; CHECK: call void @llvm.assume(i1 true) [ "align"(i8 addrspace(1)* %[[P]], i64 16) ]
target datalayout = "e-p:64:64-p1:64:64-ni:1"
declare void @llvm.assume(i1)
define void @unsupported(ptr addrspace(1) %p) {
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %p, i64 16) ]
  ret void
}
