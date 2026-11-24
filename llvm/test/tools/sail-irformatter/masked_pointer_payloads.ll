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
; Payload pointers and memory addresses use distinct address spaces.
; Exercise all four masked families and bridge the loaded result into its uses.

declare <2 x ptr addrspace(3)> @llvm.masked.load.v2p3.p1(ptr addrspace(1), i32, <2 x i1>, <2 x ptr addrspace(3)>)
declare void @llvm.masked.store.v2p3.p1(<2 x ptr addrspace(3)>, ptr addrspace(1), i32, <2 x i1>)
declare <2 x ptr addrspace(3)> @llvm.masked.gather.v2p3.v2p1(<2 x ptr addrspace(1)>, <2 x i1>, <2 x ptr addrspace(3)>)
declare void @llvm.masked.scatter.v2p3.v2p1(<2 x ptr addrspace(3)>, <2 x ptr addrspace(1)>, <2 x i1>)

; CHECK-LABEL: define <2 x i8 addrspace(3)*> @pointer_payloads(
; CHECK: %[[LOAD:[0-9]+]] = call <2 x i8 addrspace(3)*> @llvm.masked.load.{{[^ (]+}}(<2 x i8 addrspace(3)*> addrspace(1)* {{.*}}, i32 8,
; CHECK: call void @llvm.masked.store.{{[^ (]+}}(<2 x i8 addrspace(3)*> %[[LOAD]], <2 x i8 addrspace(3)*> addrspace(1)* {{.*}}, i32 8,
; CHECK: %[[GATHER:[0-9]+]] = call <2 x i8 addrspace(3)*> @llvm.masked.gather.{{[^ (]+}}(<2 x i8 addrspace(3)* addrspace(1)*> {{.*}}, i32 1, <2 x i1> {{.*}}, <2 x i8 addrspace(3)*> %[[LOAD]])
; CHECK: call void @llvm.masked.scatter.{{[^ (]+}}(<2 x i8 addrspace(3)*> %[[GATHER]], <2 x i8 addrspace(3)* addrspace(1)*> {{.*}}, i32 1,
; CHECK: ret <2 x i8 addrspace(3)*> %[[GATHER]]
define <2 x ptr addrspace(3)> @pointer_payloads(ptr addrspace(1) %base, <2 x ptr addrspace(1)> %addresses, <2 x i1> %mask, <2 x ptr addrspace(3)> %pass) {
  %loaded = call <2 x ptr addrspace(3)> @llvm.masked.load.v2p3.p1(ptr addrspace(1) %base, i32 8, <2 x i1> %mask, <2 x ptr addrspace(3)> %pass)
  call void @llvm.masked.store.v2p3.p1(<2 x ptr addrspace(3)> %loaded, ptr addrspace(1) %base, i32 8, <2 x i1> %mask)
  %gathered = call <2 x ptr addrspace(3)> @llvm.masked.gather.v2p3.v2p1(<2 x ptr addrspace(1)> %addresses, <2 x i1> %mask, <2 x ptr addrspace(3)> %loaded)
  call void @llvm.masked.scatter.v2p3.v2p1(<2 x ptr addrspace(3)> %gathered, <2 x ptr addrspace(1)> %addresses, <2 x i1> %mask)
  ret <2 x ptr addrspace(3)> %gathered
}
