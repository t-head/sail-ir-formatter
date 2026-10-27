; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define { <8 x i16>, <4 x i32>, <2 x i64> } @arm_neon_smull(<8 x i8> %0, <8 x i8> %1) {
  %3 = call <8 x i16> @llvm.aarch64.neon.smull.v8i16(<8 x i8> %0, <8 x i8> %1)
  %4 = shufflevector <8 x i16> %3, <8 x i16> %3, <4 x i32> <i32 3, i32 4, i32 5, i32 6>
  %5 = call <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %4, <4 x i16> %4)
  %6 = shufflevector <4 x i32> %5, <4 x i32> %5, <2 x i32> <i32 1, i32 2>
  %7 = call <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %6, <2 x i32> %6)
  %8 = insertvalue { <8 x i16>, <4 x i32>, <2 x i64> } undef, <8 x i16> %3, 0
  %9 = insertvalue { <8 x i16>, <4 x i32>, <2 x i64> } %8, <4 x i32> %5, 1
  %10 = insertvalue { <8 x i16>, <4 x i32>, <2 x i64> } %9, <2 x i64> %7, 2
  ret { <8 x i16>, <4 x i32>, <2 x i64> } %10
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <8 x i16> @llvm.aarch64.neon.smull.v8i16(<8 x i8>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32>, <2 x i32>) #0

attributes #0 = { nocallback nofree nosync nounwind willreturn memory(none) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

