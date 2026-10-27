; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'forward_dispatch_10'
source_filename = "forward_dispatch_10"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-f16:16-f32:32-v16:16-v32:32-n16:32:64"

define ptx_kernel void @forward_dispatch_10_generic_16x9(ptr noalias readonly align 16 %0, ptr noalias align 16 %1) #0 {
  %3 = getelementptr i8, ptr %0, i32 16871424
  %4 = getelementptr i8, ptr %1, i32 16843648
  %5 = call i32 @llvm.ppu.read.ptx.sreg.ctaid.x()
  %6 = sext i32 %5 to i64
  %7 = call i32 @llvm.ppu.read.ptx.sreg.tid.x()
  %8 = sext i32 %7 to i64
  %9 = mul nsw i64 %8, -4
  %10 = add i64 %9, 9
  %11 = icmp slt i64 %10, 4
  %12 = select i1 %11, i64 %10, i64 4
  %13 = icmp sgt i64 %12, 0
  %14 = select i1 %13, i64 %12, i64 0
  %15 = mul nsw i64 %8, 4
  %16 = call i64 @llvm.smin.i64(i64 %14, i64 2147483647)
  %17 = trunc i64 %16 to i32
  %18 = insertelement <4 x i32> poison, i32 %17, i32 0
  %19 = shufflevector <4 x i32> %18, <4 x i32> poison, <4 x i32> zeroinitializer
  %20 = icmp sgt <4 x i32> %19, <i32 0, i32 1, i32 2, i32 3>
  br label %21

21:                                               ; preds = %34, %2
  %22 = phi i64 [ %36, %34 ], [ 0, %2 ]
  %23 = phi <4 x float> [ %35, %34 ], [ zeroinitializer, %2 ]
  %24 = icmp slt i64 %22, 4
  br i1 %24, label %25, label %37

25:                                               ; preds = %21
  %26 = add i64 %15, %22
  %27 = extractelement <4 x i1> %20, i64 %22
  br i1 %27, label %28, label %34

28:                                               ; preds = %25
  %29 = mul nuw nsw i64 %26, 16
  %30 = add nuw nsw i64 %29, %6
  %31 = getelementptr inbounds nuw float, ptr %3, i64 %30
  %32 = load float, ptr %31, align 4
  %33 = insertelement <4 x float> %23, float %32, i64 %22
  br label %34

34:                                               ; preds = %28, %25
  %35 = phi <4 x float> [ %33, %28 ], [ %23, %25 ]
  %36 = add i64 %22, 1
  br label %21

37:                                               ; preds = %21
  %38 = mul i64 %6, 9
  %39 = add i64 %38, %15
  %40 = getelementptr float, ptr %4, i64 %39
  call void @llvm.masked.store.v4f32.p0(<4 x float> %23, ptr align 4 %40, <4 x i1> %20)
  ret void
}

; Function Attrs: nounwind memory(none)
declare i32 @llvm.ppu.read.ptx.sreg.ctaid.x() #1

; Function Attrs: nounwind memory(none)
declare i32 @llvm.ppu.read.ptx.sreg.tid.x() #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smin.i64(i64, i64) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.masked.store.v4f32.p0(<4 x float>, ptr captures(none), <4 x i1>) #3

attributes #0 = { "alippu-flat-work-group-size"="1, 1024" }
attributes #1 = { nounwind memory(none) }
attributes #2 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(argmem: write) }

!llvm.module.flags = !{!0}
!alippu.annotations = !{!1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @forward_dispatch_10_generic_16x9, !"kernel", i32 1}
