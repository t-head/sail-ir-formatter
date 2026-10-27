; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define <4 x float> @round_sse41() {
  %1 = call reassoc <4 x float> @llvm.x86.sse41.round.ss(<4 x float> <float 0x3FC99999A0000000, float 0x3FC99999A0000000, float 0x3FC99999A0000000, float 0x3FC99999A0000000>, <4 x float> <float 0x3FC99999A0000000, float 0x3FC99999A0000000, float 0x3FC99999A0000000, float 0x3FC99999A0000000>, i32 1)
  ret <4 x float> %1
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x float> @llvm.x86.sse41.round.ss(<4 x float>, <4 x float>, i32 immarg) #0

attributes #0 = { nocallback nofree nosync nounwind willreturn memory(none) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

