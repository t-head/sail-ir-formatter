; RUN: not llvm-as --disable-output %s 2>&1 | FileCheck %s
;
; Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
; See https://llvm.org/LICENSE.txt for license information.
; SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
;
; A mismatched mask must be diagnosed rather than dereferencing a null callee.
; CHECK: assembly parsed, but does not verify as correct!

declare <2 x float> @llvm.masked.load.v2f32.p0(ptr, <2 x i1>, <2 x float>)

define <2 x float> @mismatched_mask(ptr %p, <4 x i1> %mask) {
  %r = call <2 x float> @llvm.masked.load.v2f32.p0(ptr %p, <4 x i1> %mask, <2 x float> zeroinitializer)
  ret <2 x float> %r
}
