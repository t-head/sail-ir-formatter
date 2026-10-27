; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define <16 x float> @LLVM_x86_avx512_mask_ps_512(<16 x float> %0, i16 %1) {
  %3 = call <16 x float> @llvm.x86.avx512.mask.rndscale.ps.512(<16 x float> %0, i32 42, <16 x float> %0, i16 %1, i32 42)
  %4 = call <16 x float> @llvm.x86.avx512.mask.scalef.ps.512(<16 x float> %0, <16 x float> %0, <16 x float> %0, i16 %1, i32 42)
  ret <16 x float> %4
}

define <8 x double> @LLVM_x86_avx512_mask_pd_512(<8 x double> %0, i8 %1) {
  %3 = call <8 x double> @llvm.x86.avx512.mask.rndscale.pd.512(<8 x double> %0, i32 42, <8 x double> %0, i8 %1, i32 42)
  %4 = call <8 x double> @llvm.x86.avx512.mask.scalef.pd.512(<8 x double> %0, <8 x double> %0, <8 x double> %0, i8 %1, i32 42)
  ret <8 x double> %4
}

define <16 x float> @LLVM_x86_mask_compress(<16 x i1> %0, <16 x float> %1) {
  %3 = call <16 x float> @llvm.x86.avx512.mask.compress.v16f32(<16 x float> %1, <16 x float> %1, <16 x i1> %0)
  ret <16 x float> %3
}

define { <16 x i1>, <16 x i1> } @LLVM_x86_vp2intersect_d_512(<16 x i32> %0, <16 x i32> %1) {
  %3 = call { <16 x i1>, <16 x i1> } @llvm.x86.avx512.vp2intersect.d.512(<16 x i32> %0, <16 x i32> %1)
  ret { <16 x i1>, <16 x i1> } %3
}

define { <8 x i1>, <8 x i1> } @LLVM_x86_vp2intersect_q_512(<8 x i64> %0, <8 x i64> %1) {
  %3 = call { <8 x i1>, <8 x i1> } @llvm.x86.avx512.vp2intersect.q.512(<8 x i64> %0, <8 x i64> %1)
  ret { <8 x i1>, <8 x i1> } %3
}

define <8 x float> @LLVM_x86_avx_rsqrt_ps_256(<8 x float> %0) {
  %2 = call <8 x float> @llvm.x86.avx.rsqrt.ps.256(<8 x float> %0)
  ret <8 x float> %2
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <16 x float> @llvm.x86.avx512.mask.rndscale.ps.512(<16 x float>, i32 immarg, <16 x float>, i16, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <16 x float> @llvm.x86.avx512.mask.scalef.ps.512(<16 x float>, <16 x float>, <16 x float>, i16, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <8 x double> @llvm.x86.avx512.mask.rndscale.pd.512(<8 x double>, i32 immarg, <8 x double>, i8, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <8 x double> @llvm.x86.avx512.mask.scalef.pd.512(<8 x double>, <8 x double>, <8 x double>, i8, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <16 x float> @llvm.x86.avx512.mask.compress.v16f32(<16 x float>, <16 x float>, <16 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare { <16 x i1>, <16 x i1> } @llvm.x86.avx512.vp2intersect.d.512(<16 x i32>, <16 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare { <8 x i1>, <8 x i1> } @llvm.x86.avx512.vp2intersect.q.512(<8 x i64>, <8 x i64>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <8 x float> @llvm.x86.avx.rsqrt.ps.256(<8 x float>) #0

attributes #0 = { nocallback nofree nosync nounwind willreturn memory(none) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
