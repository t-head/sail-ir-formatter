; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define <4 x i32> @binary_i_fixed_fv(<4 x i32> %0, float %1) {
  %3 = call <4 x i32> @llvm.riscv.sf.vc.v.fv.se.v4i32.i32.v4i32.f32.i32(i32 1, <4 x i32> %0, float %1, i32 4)
  ret <4 x i32> %3
}

; Function Attrs: nounwind
declare <4 x i32> @llvm.riscv.sf.vc.v.fv.se.v4i32.i32.v4i32.f32.i32(i32 immarg, <4 x i32>, float, i32) #0

attributes #0 = { nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

