; RUN: sail-irformatter -S --verify-pointers < %s -o %t
; RUN: FileCheck %s --implicit-check-not='{{(^|[[:space:]<])ptr([^[:alnum:]_]|$)}}' < %t
; RUN: llvm-as -opaque-pointers=0 %t -o /dev/null
;
; Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
; See https://llvm.org/LICENSE.txt for license information.
; SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

declare void @sink(ptr)
declare void @llvm.assume(i1)

; CHECK-LABEL: define void @call_bundle(
; CHECK: tail call void @sink(i8* {{.*}}) [ "deopt"(i8* {{.*}}, i32 7) ], !nosanitize
define void @call_bundle(ptr %p) {
  tail call void @sink(ptr %p) [ "deopt"(ptr %p, i32 7) ], !nosanitize !0
  ret void
}

; CHECK-LABEL: define void @mixed_assume(
; CHECK-SAME: i8* %[[P:[0-9]+]], i1 %[[C:[0-9]+]])
; CHECK: call void @llvm.assume(i1 %[[C]]) [ "align"(i8* %[[P]], i64 16), "nonnull"(i8* %[[P]]), "dereferenceable"(i8* %[[P]], i64 16) ]
define void @mixed_assume(ptr %p, i1 %condition) {
  call void @llvm.assume(i1 %condition) [ "align"(ptr %p, i64 16), "nonnull"(ptr %p), "dereferenceable"(ptr %p, i64 16) ]
  ret void
}

; CHECK-LABEL: define void @false_condition(
; CHECK: call void @llvm.assume(i1 false) [ "align"(i8* %{{[0-9]+}}, i32 1) ]
define void @false_condition(ptr %p) {
  call void @llvm.assume(i1 false) [ "align"(ptr %p, i32 1) ]
  ret void
}

!0 = !{}
