; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define <vscale x 4 x float> @binary_fv(<vscale x 4 x float> %0, float %1, i32 %2) {
  %4 = call <vscale x 4 x float> @llvm.riscv.sf.vc.v.fv.se.nxv4f32.i32.nxv4f32.f32.i32(i32 1, <vscale x 4 x float> %0, float %1, i32 %2)
  ret <vscale x 4 x float> %4
}

; Function Attrs: nounwind
declare <vscale x 4 x float> @llvm.riscv.sf.vc.v.fv.se.nxv4f32.i32.nxv4f32.f32.i32(i32 immarg, <vscale x 4 x float>, float, i32) #0

attributes #0 = { nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

