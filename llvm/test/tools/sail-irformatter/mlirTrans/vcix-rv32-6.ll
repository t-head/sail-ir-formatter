; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define <4 x float> @binary_fixed_vv(<4 x float> %0, <4 x float> %1) {
  %3 = call <4 x float> @llvm.riscv.sf.vc.v.vv.se.v4f32.i32.v4f32.v4f32.i32(i32 3, <4 x float> %0, <4 x float> %1, i32 4)
  ret <4 x float> %3
}

; Function Attrs: nounwind
declare <4 x float> @llvm.riscv.sf.vc.v.vv.se.v4f32.i32.v4f32.v4f32.i32(i32 immarg, <4 x float>, <4 x float>, i32) #0

attributes #0 = { nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

