; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define <4 x i32> @arm_neon_sdot_16_i8i8(<4 x i32> %0, <16 x i8> %1, <16 x i8> %2) {
  %4 = call <4 x i32> @llvm.aarch64.neon.sdot.v4i32.v16i8(<4 x i32> %0, <16 x i8> %1, <16 x i8> %2)
  ret <4 x i32> %4
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x i32> @llvm.aarch64.neon.sdot.v4i32.v16i8(<4 x i32>, <16 x i8>, <16 x i8>) #0

attributes #0 = { nocallback nofree nosync nounwind willreturn memory(none) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

