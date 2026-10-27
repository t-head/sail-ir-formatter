; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define <4 x i32> @binary_i_fixed_iv(<4 x i32> %0) {
  %2 = call <4 x i32> @llvm.riscv.sf.vc.v.iv.se.v4i32.i32.v4i32.i32.i32(i32 3, <4 x i32> %0, i32 5, i32 4)
  ret <4 x i32> %2
}

; Function Attrs: nounwind
declare <4 x i32> @llvm.riscv.sf.vc.v.iv.se.v4i32.i32.v4i32.i32.i32(i32 immarg, <4 x i32>, i32 immarg, i32) #0

attributes #0 = { nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
