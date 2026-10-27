; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define <4 x float> @binary_fixed_iv(<4 x float> %0) {
  %2 = call <4 x float> @llvm.riscv.sf.vc.v.iv.se.v4f32.i32.v4f32.i32.i32(i32 3, <4 x float> %0, i32 5, i32 4)
  ret <4 x float> %2
}

; Function Attrs: nounwind
declare <4 x float> @llvm.riscv.sf.vc.v.iv.se.v4f32.i32.v4f32.i32.i32(i32 immarg, <4 x float>, i32 immarg, i32) #0

attributes #0 = { nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

