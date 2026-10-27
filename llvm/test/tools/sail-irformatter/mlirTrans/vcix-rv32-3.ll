; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define <vscale x 4 x float> @binary_iv(<vscale x 4 x float> %0, i32 %1) {
  %3 = call <vscale x 4 x float> @llvm.riscv.sf.vc.v.iv.se.nxv4f32.i32.nxv4f32.i32.i32(i32 3, <vscale x 4 x float> %0, i32 5, i32 %1)
  ret <vscale x 4 x float> %3
}

; Function Attrs: nounwind
declare <vscale x 4 x float> @llvm.riscv.sf.vc.v.iv.se.nxv4f32.i32.nxv4f32.i32.i32(i32 immarg, <vscale x 4 x float>, i32 immarg, i32) #0

attributes #0 = { nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

