; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare float @fastmathFlagsFunc(float)

define void @fastmathFlags(float %0, <2 x float> %1) {
  %3 = fadd nnan ninf float %0, %0
  %4 = fsub nnan ninf float %0, %0
  %5 = fmul nnan ninf float %0, %0
  %6 = fdiv nnan ninf float %0, %0
  %7 = frem nnan ninf float %0, %0
  %8 = fcmp nnan ninf oeq float %0, %0
  %9 = fneg nnan ninf float %0
  %10 = call float @fastmathFlagsFunc(float %0)
  %11 = call nnan float @fastmathFlagsFunc(float %0)
  %12 = call ninf float @fastmathFlagsFunc(float %0)
  %13 = call nsz float @fastmathFlagsFunc(float %0)
  %14 = call arcp float @fastmathFlagsFunc(float %0)
  %15 = call contract float @fastmathFlagsFunc(float %0)
  %16 = call afn float @fastmathFlagsFunc(float %0)
  %17 = call reassoc float @fastmathFlagsFunc(float %0)
  %18 = call fast float @fastmathFlagsFunc(float %0)
  %19 = call fast float @llvm.copysign.f32(float %0, float %0)
  %20 = call afn float @llvm.copysign.f32(float %0, float %0)
  %21 = call fast float @llvm.powi.f32.i32(float %0, i32 1)
  %22 = call afn float @llvm.powi.f32.i32(float %0, i32 1)
  %23 = call nnan float @llvm.vector.reduce.fmax.v2f32(<2 x float> %1)
  %24 = call nnan float @llvm.vector.reduce.fmin.v2f32(<2 x float> %1)
  %25 = call nnan float @llvm.vector.reduce.fmaximum.v2f32(<2 x float> %1)
  %26 = call nnan float @llvm.vector.reduce.fminimum.v2f32(<2 x float> %1)
  %27 = select contract i1 true, float %0, float %22
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.copysign.f32(float, float) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.powi.f32.i32(float, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.vector.reduce.fmax.v2f32(<2 x float>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.vector.reduce.fmin.v2f32(<2 x float>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.vector.reduce.fmaximum.v2f32(<2 x float>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.vector.reduce.fminimum.v2f32(<2 x float>) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

