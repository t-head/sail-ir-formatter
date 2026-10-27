; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define <vscale x 4 x float> @binary_fv(<vscale x 4 x float> %0, float %1, i64 %2) {
  %4 = call <vscale x 4 x float> @llvm.riscv.sf.vc.v.fv.se.nxv4f32.i64.nxv4f32.f32.i64(i64 1, <vscale x 4 x float> %0, float %1, i64 %2)
  ret <vscale x 4 x float> %4
}

define <vscale x 4 x float> @binary_xv(<vscale x 4 x float> %0, i64 %1, i64 %2) {
  %4 = call <vscale x 4 x float> @llvm.riscv.sf.vc.v.xv.se.nxv4f32.i64.nxv4f32.i64.i64(i64 3, <vscale x 4 x float> %0, i64 %1, i64 %2)
  ret <vscale x 4 x float> %4
}

define <vscale x 4 x float> @binary_vv(<vscale x 4 x float> %0, <vscale x 4 x float> %1, i64 %2) {
  %4 = call <vscale x 4 x float> @llvm.riscv.sf.vc.v.vv.se.nxv4f32.i64.nxv4f32.nxv4f32.i64(i64 3, <vscale x 4 x float> %0, <vscale x 4 x float> %1, i64 %2)
  ret <vscale x 4 x float> %4
}

define <vscale x 4 x float> @binary_iv(<vscale x 4 x float> %0, i64 %1) {
  %3 = call <vscale x 4 x float> @llvm.riscv.sf.vc.v.iv.se.nxv4f32.i64.nxv4f32.i64.i64(i64 3, <vscale x 4 x float> %0, i64 5, i64 %1)
  ret <vscale x 4 x float> %3
}

define <4 x float> @binary_fixed_fv(<4 x float> %0, float %1) {
  %3 = call <4 x float> @llvm.riscv.sf.vc.v.fv.se.v4f32.i64.v4f32.f32.i64(i64 1, <4 x float> %0, float %1, i64 4)
  ret <4 x float> %3
}

define <4 x float> @binary_fixed_xv(<4 x float> %0, i64 %1) {
  %3 = call <4 x float> @llvm.riscv.sf.vc.v.xv.se.v4f32.i64.v4f32.i64.i64(i64 3, <4 x float> %0, i64 %1, i64 4)
  ret <4 x float> %3
}

define <4 x float> @binary_fixed_vv(<4 x float> %0, <4 x float> %1) {
  %3 = call <4 x float> @llvm.riscv.sf.vc.v.vv.se.v4f32.i64.v4f32.v4f32.i64(i64 3, <4 x float> %0, <4 x float> %1, i64 4)
  ret <4 x float> %3
}

define <4 x float> @binary_fixed_iv(<4 x float> %0) {
  %2 = call <4 x float> @llvm.riscv.sf.vc.v.iv.se.v4f32.i64.v4f32.i64.i64(i64 3, <4 x float> %0, i64 5, i64 4)
  ret <4 x float> %2
}

define <vscale x 4 x i32> @binary_i_fv(<vscale x 4 x i32> %0, float %1, i64 %2) {
  %4 = call <vscale x 4 x i32> @llvm.riscv.sf.vc.v.fv.se.nxv4i32.i64.nxv4i32.f32.i64(i64 1, <vscale x 4 x i32> %0, float %1, i64 %2)
  ret <vscale x 4 x i32> %4
}

define <vscale x 4 x i32> @binary_i_xv(<vscale x 4 x i32> %0, i64 %1, i64 %2) {
  %4 = call <vscale x 4 x i32> @llvm.riscv.sf.vc.v.xv.se.nxv4i32.i64.nxv4i32.i64.i64(i64 3, <vscale x 4 x i32> %0, i64 %1, i64 %2)
  ret <vscale x 4 x i32> %4
}

define <vscale x 4 x i32> @binary_i_vv(<vscale x 4 x i32> %0, <vscale x 4 x i32> %1, i64 %2) {
  %4 = call <vscale x 4 x i32> @llvm.riscv.sf.vc.v.vv.se.nxv4i32.i64.nxv4i32.nxv4i32.i64(i64 3, <vscale x 4 x i32> %0, <vscale x 4 x i32> %1, i64 %2)
  ret <vscale x 4 x i32> %4
}

define <vscale x 4 x i32> @binary_i_iv(<vscale x 4 x i32> %0, i64 %1) {
  %3 = call <vscale x 4 x i32> @llvm.riscv.sf.vc.v.iv.se.nxv4i32.i64.nxv4i32.i64.i64(i64 3, <vscale x 4 x i32> %0, i64 5, i64 %1)
  ret <vscale x 4 x i32> %3
}

define <4 x i32> @binary_i_fixed_fv(<4 x i32> %0, float %1) {
  %3 = call <4 x i32> @llvm.riscv.sf.vc.v.fv.se.v4i32.i64.v4i32.f32.i64(i64 1, <4 x i32> %0, float %1, i64 4)
  ret <4 x i32> %3
}

define <4 x i32> @binary_i_fixed_xv(<4 x i32> %0, i64 %1) {
  %3 = call <4 x i32> @llvm.riscv.sf.vc.v.xv.se.v4i32.i64.v4i32.i64.i64(i64 3, <4 x i32> %0, i64 %1, i64 4)
  ret <4 x i32> %3
}

define <4 x i32> @binary_i_fixed_vv(<4 x i32> %0, <4 x i32> %1) {
  %3 = call <4 x i32> @llvm.riscv.sf.vc.v.vv.se.v4i32.i64.v4i32.v4i32.i64(i64 3, <4 x i32> %0, <4 x i32> %1, i64 4)
  ret <4 x i32> %3
}

define <4 x i32> @binary_i_fixed_iv(<4 x i32> %0) {
  %2 = call <4 x i32> @llvm.riscv.sf.vc.v.iv.se.v4i32.i64.v4i32.i64.i64(i64 3, <4 x i32> %0, i64 5, i64 4)
  ret <4 x i32> %2
}

; Function Attrs: nounwind
declare <vscale x 4 x float> @llvm.riscv.sf.vc.v.fv.se.nxv4f32.i64.nxv4f32.f32.i64(i64 immarg, <vscale x 4 x float>, float, i64) #0

; Function Attrs: nounwind
declare <vscale x 4 x float> @llvm.riscv.sf.vc.v.xv.se.nxv4f32.i64.nxv4f32.i64.i64(i64 immarg, <vscale x 4 x float>, i64, i64) #0

; Function Attrs: nounwind
declare <vscale x 4 x float> @llvm.riscv.sf.vc.v.vv.se.nxv4f32.i64.nxv4f32.nxv4f32.i64(i64 immarg, <vscale x 4 x float>, <vscale x 4 x float>, i64) #0

; Function Attrs: nounwind
declare <vscale x 4 x float> @llvm.riscv.sf.vc.v.iv.se.nxv4f32.i64.nxv4f32.i64.i64(i64 immarg, <vscale x 4 x float>, i64 immarg, i64) #0

; Function Attrs: nounwind
declare <4 x float> @llvm.riscv.sf.vc.v.fv.se.v4f32.i64.v4f32.f32.i64(i64 immarg, <4 x float>, float, i64) #0

; Function Attrs: nounwind
declare <4 x float> @llvm.riscv.sf.vc.v.xv.se.v4f32.i64.v4f32.i64.i64(i64 immarg, <4 x float>, i64, i64) #0

; Function Attrs: nounwind
declare <4 x float> @llvm.riscv.sf.vc.v.vv.se.v4f32.i64.v4f32.v4f32.i64(i64 immarg, <4 x float>, <4 x float>, i64) #0

; Function Attrs: nounwind
declare <4 x float> @llvm.riscv.sf.vc.v.iv.se.v4f32.i64.v4f32.i64.i64(i64 immarg, <4 x float>, i64 immarg, i64) #0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @llvm.riscv.sf.vc.v.fv.se.nxv4i32.i64.nxv4i32.f32.i64(i64 immarg, <vscale x 4 x i32>, float, i64) #0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @llvm.riscv.sf.vc.v.xv.se.nxv4i32.i64.nxv4i32.i64.i64(i64 immarg, <vscale x 4 x i32>, i64, i64) #0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @llvm.riscv.sf.vc.v.vv.se.nxv4i32.i64.nxv4i32.nxv4i32.i64(i64 immarg, <vscale x 4 x i32>, <vscale x 4 x i32>, i64) #0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @llvm.riscv.sf.vc.v.iv.se.nxv4i32.i64.nxv4i32.i64.i64(i64 immarg, <vscale x 4 x i32>, i64 immarg, i64) #0

; Function Attrs: nounwind
declare <4 x i32> @llvm.riscv.sf.vc.v.fv.se.v4i32.i64.v4i32.f32.i64(i64 immarg, <4 x i32>, float, i64) #0

; Function Attrs: nounwind
declare <4 x i32> @llvm.riscv.sf.vc.v.xv.se.v4i32.i64.v4i32.i64.i64(i64 immarg, <4 x i32>, i64, i64) #0

; Function Attrs: nounwind
declare <4 x i32> @llvm.riscv.sf.vc.v.vv.se.v4i32.i64.v4i32.v4i32.i64(i64 immarg, <4 x i32>, <4 x i32>, i64) #0

; Function Attrs: nounwind
declare <4 x i32> @llvm.riscv.sf.vc.v.iv.se.v4i32.i64.v4i32.i64.i64(i64 immarg, <4 x i32>, i64 immarg, i64) #0

attributes #0 = { nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
