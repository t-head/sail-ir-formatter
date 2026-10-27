; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = '_forward_dispatch_10'
source_filename = "_forward_dispatch_10"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-f16:16-f32:32-v16:16-v32:32-n16:32:64"

declare float @__ppumath_exp_f32(float)

define ptx_kernel void @_forward_dispatch_10_generic_262144(ptr noalias readonly align 16 %0, ptr noalias align 16 %1) #0 {
  %3 = call i32 @llvm.ppu.read.ptx.sreg.ctaid.x()
  %4 = sext i32 %3 to i64
  %5 = call i32 @llvm.ppu.read.ptx.sreg.tid.x()
  %6 = sext i32 %5 to i64
  %7 = mul nsw i64 %6, 4
  %8 = mul nsw i64 %4, 4096
  %9 = add i64 %7, %8
  %10 = getelementptr float, ptr %0, i64 %9
  %11 = load <4 x float>, ptr %10, align 4
  %12 = fadd <4 x float> %11, splat (float f0x3E4710D1)
  %13 = fneg <4 x float> %12
  %14 = extractelement <4 x float> %13, i64 0
  %15 = call float @__ppumath_exp_f32(float %14)
  %16 = insertelement <4 x float> zeroinitializer, float %15, i64 0
  %17 = extractelement <4 x float> %13, i64 1
  %18 = call float @__ppumath_exp_f32(float %17)
  %19 = insertelement <4 x float> %16, float %18, i64 1
  %20 = extractelement <4 x float> %13, i64 2
  %21 = call float @__ppumath_exp_f32(float %20)
  %22 = insertelement <4 x float> %19, float %21, i64 2
  %23 = extractelement <4 x float> %13, i64 3
  %24 = call float @__ppumath_exp_f32(float %23)
  %25 = insertelement <4 x float> %22, float %24, i64 3
  %26 = fadd <4 x float> %25, splat (float 1.000000e+00)
  %27 = fdiv <4 x float> splat (float 1.000000e+00), %26
  %28 = getelementptr float, ptr %1, i64 %9
  store <4 x float> %27, ptr %28, align 4
  ret void
}

; Function Attrs: nounwind memory(none)
declare i32 @llvm.ppu.read.ptx.sreg.ctaid.x() #1

; Function Attrs: nounwind memory(none)
declare i32 @llvm.ppu.read.ptx.sreg.tid.x() #1

attributes #0 = { "alippu-flat-work-group-size"="1, 1024" }
attributes #1 = { nounwind memory(none) }

!llvm.module.flags = !{!0}
!alippu.annotations = !{!1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @_forward_dispatch_10_generic_262144, !"kernel", i32 1}
