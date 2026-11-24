; RUN: sail-irformatter -S --verify-pointers < %s | FileCheck %s --implicit-check-not='ptrtoint'
; Preserve bundle constants and offsets without reinterpreting alignment.
;
; Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
; See https://llvm.org/LICENSE.txt for license information.
; SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

declare void @llvm.assume(i1)
; Offset is displacement from an aligned base, not displacement towards one.
; CHECK-LABEL: define void @positive_offset_ok()
; CHECK: call void @llvm.assume(i1 true) [ "align"(i8* inttoptr (i64 19 to i8*), i32 16, i32 3) ]
define void @positive_offset_ok() {
  call void @llvm.assume(i1 true) [ "align"(ptr inttoptr (i64 19 to ptr), i32 16, i32 3) ]
  ret void
}
; CHECK-LABEL: define void @negative_offset_ok()
; CHECK: call void @llvm.assume(i1 true) [ "align"(i8* inttoptr (i64 13 to i8*), i32 16, i32 -3) ]
define void @negative_offset_ok() {
  call void @llvm.assume(i1 true) [ "align"(ptr inttoptr (i64 13 to ptr), i32 16, i32 -3) ]
  ret void
}
; CHECK-LABEL: define void @offset_bad()
; CHECK: call void @llvm.assume(i1 true) [ "align"(i8* inttoptr (i64 19 to i8*), i32 16, i32 1) ]
define void @offset_bad() {
  call void @llvm.assume(i1 true) [ "align"(ptr inttoptr (i64 19 to ptr), i32 16, i32 1) ]
  ret void
}
; CHECK-LABEL: define void @zero_alignment_null()
; CHECK: call void @llvm.assume(i1 true) [ "align"(i8* null, i32 0) ]
define void @zero_alignment_null() {
  call void @llvm.assume(i1 true) [ "align"(ptr null, i32 0) ]
  ret void
}
; CHECK-LABEL: define void @non_power_null()
; CHECK: call void @llvm.assume(i1 true) [ "align"(i8* null, i32 3) ]
define void @non_power_null() {
  call void @llvm.assume(i1 true) [ "align"(ptr null, i32 3) ]
  ret void
}
; CHECK-LABEL: define void @non_power_nonzero()
; CHECK: call void @llvm.assume(i1 true) [ "align"(i8* inttoptr (i64 12 to i8*), i32 3) ]
define void @non_power_nonzero() {
  call void @llvm.assume(i1 true) [ "align"(ptr inttoptr (i64 12 to ptr), i32 3) ]
  ret void
}
; CHECK-LABEL: define void @wide_alignment(
; CHECK: call void @llvm.assume(i1 true) [ "align"(i8* %{{[0-9]+}}, i128 1208925819614629174706176) ]
define void @wide_alignment(ptr %p) {
  call void @llvm.assume(i1 true) [ "align"(ptr %p, i128 1208925819614629174706176) ]
  ret void
}
