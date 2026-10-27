; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = './a.cu'
source_filename = "./a.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-f16:16-f32:32-v16:16-v32:32-n16:32:64"
target triple = "ppu"

define void @_Z14nvshmemi_quietIL13threadgroup_t0EEvv() {
  call void asm sideeffect "trap;", ""()
  call void asm sideeffect "trap;", ""()
  ret void
}

;CHECK-NOT: uselistorder
uselistorder ptr asm sideeffect "trap;", "", { 1, 0 }