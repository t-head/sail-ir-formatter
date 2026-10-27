; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define <2 x i32> @arm_neon_sdot_8_i8i8(<2 x i32> %0, <8 x i8> %1, <8 x i8> %2) {
  %4 = call <2 x i32> @llvm.aarch64.neon.sdot.v2i32.v8i8(<2 x i32> %0, <8 x i8> %1, <8 x i8> %2)
  ret <2 x i32> %4
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <2 x i32> @llvm.aarch64.neon.sdot.v2i32.v8i8(<2 x i32>, <8 x i8>, <8 x i8>) #0

attributes #0 = { nocallback nofree nosync nounwind willreturn memory(none) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

