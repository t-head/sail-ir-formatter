; RUN: sail-irformatter -S --verify-pointers < %s -o %t
; RUN: FileCheck %s --implicit-check-not=" ptr" --implicit-check-not="fake.cast" < %t
; RUN: llvm-as -opaque-pointers=0 %t -o /dev/null
;
; Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
; See https://llvm.org/LICENSE.txt for license information.
; SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
;
; Canonical four-argument names prevent upgrades from masking bundle loss.
; Check three-argument calls, bundle order, and pointer/aggregate typing.

declare <4 x float> @llvm.masked.load.v4f32.p0(ptr, i32 immarg, <4 x i1>, <4 x float>)
declare void @llvm.masked.store.v4f32.p3(<4 x float>, ptr addrspace(3), i32 immarg, <4 x i1>)
declare <4 x float> @llvm.masked.gather.v4f32.v4p3(<4 x ptr addrspace(3)>, i32 immarg, <4 x i1>, <4 x float>)
declare void @llvm.masked.scatter.v4f32.v4p0(<4 x float>, <4 x ptr>, i32 immarg, <4 x i1>)

define <4 x float> @load4(ptr %p, <4 x i1> %mask, <4 x float> %pass, ptr %state, { ptr, i32 } %aggregate) {
; CHECK-LABEL: define <4 x float> @load4(
; CHECK: tail call <4 x float> @llvm.masked.load.v4f32.p0v4f32(<4 x float>* nonnull %{{.*}}, i32 8, <4 x i1> %{{.*}}, <4 x float> %{{.*}}) #[[ATTR:[0-9]+]] [ "deopt"(i32 11, i8* %{{.*}}, { i8*, i32 } %{{.*}}), "sail.test"(i64 101, i8* null) ], !sail.test ![[MD:[0-9]+]]
  %r = tail call <4 x float> @llvm.masked.load.v4f32.p0(ptr nonnull %p, i32 8, <4 x i1> %mask, <4 x float> %pass) #0 [ "deopt"(i32 11, ptr %state, { ptr, i32 } %aggregate), "sail.test"(i64 101, ptr null) ], !sail.test !0
  ret <4 x float> %r
}

define void @store4(ptr addrspace(3) %p, <4 x i1> %mask, <4 x float> %value, ptr addrspace(3) %state) {
; CHECK-LABEL: define void @store4(
; CHECK: call void @llvm.masked.store.v4f32.p3v4f32(<4 x float> %{{.*}}, <4 x float> addrspace(3)* nonnull %{{.*}}, i32 4, <4 x i1> %{{.*}}) #[[ATTR]] [ "deopt"(i32 22, i8 addrspace(3)* %{{.*}}), "sail.test"(i64 102) ], !sail.test ![[MD]]
  call void @llvm.masked.store.v4f32.p3(<4 x float> %value, ptr addrspace(3) nonnull %p, i32 4, <4 x i1> %mask) #0 [ "deopt"(i32 22, ptr addrspace(3) %state), "sail.test"(i64 102) ], !sail.test !0
  ret void
}

define <4 x float> @gather4(<4 x ptr addrspace(3)> %p, <4 x i1> %mask, <4 x float> %pass, <2 x ptr> %state) {
; CHECK-LABEL: define <4 x float> @gather4(
; CHECK: call <4 x float> @llvm.masked.gather.v4f32.v4p3f32(<4 x float addrspace(3)*> %{{.*}}, i32 2, <4 x i1> %{{.*}}, <4 x float> %{{.*}}) #[[ATTR]] [ "deopt"(i32 33, <2 x i8*> %{{.*}}), "sail.test"(i64 103) ], !sail.test ![[MD]]
  %r = call <4 x float> @llvm.masked.gather.v4f32.v4p3(<4 x ptr addrspace(3)> %p, i32 2, <4 x i1> %mask, <4 x float> %pass) #0 [ "deopt"(i32 33, <2 x ptr> %state), "sail.test"(i64 103) ], !sail.test !0
  ret <4 x float> %r
}

define void @scatter4(<4 x ptr> %p, <4 x i1> %mask, <4 x float> %value) {
; CHECK-LABEL: define void @scatter4(
; CHECK: call void @llvm.masked.scatter.v4f32.v4p0f32(<4 x float> %{{.*}}, <4 x float*> %{{.*}}, i32 1, <4 x i1> %{{.*}}) #[[ATTR]] [ "sail.test"(i64 104), "deopt"(i32 44, i8* null) ], !sail.test ![[MD]]
  call void @llvm.masked.scatter.v4f32.v4p0(<4 x float> %value, <4 x ptr> %p, i32 1, <4 x i1> %mask) #0 [ "sail.test"(i64 104), "deopt"(i32 44, ptr null) ], !sail.test !0
  ret void
}

declare <2 x float> @llvm.masked.load.v2f32.p3(ptr addrspace(3), <2 x i1>, <2 x float>)
declare void @llvm.masked.store.v2f32.p0(<2 x float>, ptr, <2 x i1>)
declare <2 x float> @llvm.masked.gather.v2f32.v2p0(<2 x ptr>, <2 x i1>, <2 x float>)
declare void @llvm.masked.scatter.v2f32.v2p3(<2 x float>, <2 x ptr addrspace(3)>, <2 x i1>)

define <2 x float> @load3(ptr addrspace(3) %p, <2 x i1> %mask, <2 x float> %pass) {
; CHECK-LABEL: define <2 x float> @load3(
; CHECK: call <2 x float> @llvm.masked.load.v2f32.p3v2f32(<2 x float> addrspace(3)* {{.*}}, i32 4, <2 x i1> %{{.*}}, <2 x float> %{{.*}}) [ "deopt"(i32 55, i8 addrspace(3)* null), "sail.test"(i64 105) ]
  %r = call <2 x float> @llvm.masked.load.v2f32.p3(ptr addrspace(3) align 4 %p, <2 x i1> %mask, <2 x float> %pass) [ "deopt"(i32 55, ptr addrspace(3) null), "sail.test"(i64 105) ]
  ret <2 x float> %r
}

define void @store3(ptr %p, <2 x i1> %mask, <2 x float> %value) {
; CHECK-LABEL: define void @store3(
; CHECK: call void @llvm.masked.store.v2f32.p0v2f32(<2 x float> %{{.*}}, <2 x float>* {{.*}}, i32 2, <2 x i1> %{{.*}}) [ "deopt"(i32 66, i8* null), "sail.test"(i64 106) ]
  call void @llvm.masked.store.v2f32.p0(<2 x float> %value, ptr align 2 %p, <2 x i1> %mask) [ "deopt"(i32 66, ptr null), "sail.test"(i64 106) ]
  ret void
}

define <2 x float> @gather3(<2 x ptr> %p, <2 x i1> %mask, <2 x float> %pass) {
; CHECK-LABEL: define <2 x float> @gather3(
; CHECK: call <2 x float> @llvm.masked.gather.v2f32.v2p0f32(<2 x float*> %{{.*}}, i32 1, <2 x i1> %{{.*}}, <2 x float> %{{.*}}) [ "deopt"(i32 77, i8* null), "sail.test"(i64 107) ]
  %r = call <2 x float> @llvm.masked.gather.v2f32.v2p0(<2 x ptr> %p, <2 x i1> %mask, <2 x float> %pass) [ "deopt"(i32 77, ptr null), "sail.test"(i64 107) ]
  ret <2 x float> %r
}

define void @scatter3(<2 x ptr addrspace(3)> %p, <2 x i1> %mask, <2 x float> %value) {
; CHECK-LABEL: define void @scatter3(
; CHECK: call void @llvm.masked.scatter.v2f32.v2p3f32(<2 x float> %{{.*}}, <2 x float addrspace(3)*> %{{.*}}, i32 1, <2 x i1> %{{.*}}) [ "deopt"(i32 88, i8* null), "sail.test"(i64 108) ]
  call void @llvm.masked.scatter.v2f32.v2p3(<2 x float> %value, <2 x ptr addrspace(3)> %p, <2 x i1> %mask) [ "deopt"(i32 88, ptr null), "sail.test"(i64 108) ]
  ret void
}

attributes #0 = { nounwind "sail.call"="preserved" }
; CHECK: attributes #[[ATTR]] = { nounwind "sail.call"="preserved" }
; CHECK: ![[MD]] = !{!"preserved"}
!0 = !{!"preserved"}
