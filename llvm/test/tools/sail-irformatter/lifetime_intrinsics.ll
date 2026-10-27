; RUN: sail-irformatter -S < %s | FileCheck %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-p3:32:32-p4:32:32-p5:32:32-p6:32:32-p7:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"

@.str = private unnamed_addr constant [11 x i8] c"__CUDA_FTZ\00", align 1
@__cudart_i2opi_f = internal unnamed_addr addrspace(1) constant [6 x i32] [i32 1011060801, i32 -614296167, i32 -181084736, i32 -64530479, i32 1313084713, i32 -1560706194], align 4


; CHECK: call void @llvm.lifetime.start.p0(i64 28, i8* {{.*}})
; CHECK: call void @llvm.lifetime.end.p0(i64 28, i8* {{.*}})
; Function Attrs: nounwind
define ptx_kernel void @kernel(ptr addrspace(1) %0, ptr addrspace(1) %1, ptr addrspace(1) readnone captures(none) %2, ptr addrspace(1) readnone captures(none) %3) local_unnamed_addr #0 !dbg !5 {
  %result.i.i.i.i = alloca [7 x i32], align 4
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !8
  %6 = and i32 %5, 127, !dbg !8
  %7 = zext nneg i32 %6 to i64, !dbg !9
  %8 = getelementptr float, ptr addrspace(1) %1, i64 %7, !dbg !9
  %9 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %8) #5, !dbg !10
  %10 = bitcast i32 %9 to float, !dbg !10
  call void @llvm.lifetime.start.p0(ptr nonnull %result.i.i.i.i), !dbg !11
  %11 = fmul float %10, 0x3FE45F3060000000, !dbg !11
  %12 = tail call i32 @__nvvm_reflect(ptr nonnull @.str) #5, !dbg !11
  %.not.i = icmp eq i32 %12, 0, !dbg !11
  %13 = tail call i32 @llvm.nvvm.f2i.rn.ftz(float %11) #5, !dbg !11
  %14 = tail call i32 @llvm.nvvm.f2i.rn(float %11) #5, !dbg !11
  %.01.i = select i1 %.not.i, i32 %14, i32 %13, !dbg !11
  %15 = sitofp i32 %.01.i to float, !dbg !11
  %16 = tail call i32 @__nvvm_reflect(ptr nonnull @.str) #5, !dbg !11
  %.not15.i = icmp eq i32 %16, 0, !dbg !11
  %17 = tail call float @llvm.nvvm.fma.rn.ftz.f(float %15, float 0xBFF921FB40000000, float %10) #5, !dbg !11
  %18 = tail call float @llvm.nvvm.fma.rn.f(float %15, float 0xBFF921FB40000000, float %10) #5, !dbg !11
  %.02.i = select i1 %.not15.i, float %18, float %17, !dbg !11
  %19 = tail call i32 @__nvvm_reflect(ptr nonnull @.str) #5, !dbg !11
  %.not16.i = icmp eq i32 %19, 0, !dbg !11
  %20 = tail call float @llvm.nvvm.fma.rn.ftz.f(float %15, float 0xBE74442D00000000, float %.02.i) #5, !dbg !11
  %21 = tail call float @llvm.nvvm.fma.rn.f(float %15, float 0xBE74442D00000000, float %.02.i) #5, !dbg !11
  %.03.i = select i1 %.not16.i, float %21, float %20, !dbg !11
  %22 = tail call i32 @__nvvm_reflect(ptr nonnull @.str) #5, !dbg !11
  %.not17.i = icmp eq i32 %22, 0, !dbg !11
  %23 = tail call float @llvm.nvvm.fma.rn.ftz.f(float %15, float 0xBCF84698A0000000, float %.03.i) #5, !dbg !11
  %24 = tail call float @llvm.nvvm.fma.rn.f(float %15, float 0xBCF84698A0000000, float %.03.i) #5, !dbg !11
  %.04.i = select i1 %.not17.i, float %24, float %23, !dbg !11
  %25 = tail call i32 @__nvvm_reflect(ptr nonnull @.str) #5, !dbg !11
  %.not18.i = icmp eq i32 %25, 0, !dbg !11
  %26 = tail call float @llvm.nvvm.fabs.ftz.f32(float %10), !dbg !11
  %27 = tail call float @llvm.nvvm.fabs.f32(float %10), !dbg !11
  %.06.i = select i1 %.not18.i, float %27, float %26, !dbg !11
  %28 = fcmp ult float %.06.i, 1.056150e+05, !dbg !11
  br i1 %28, label %__internal_trig_reduction_kernel.exit.i.i, label %__nv_isinff.exit.i.i.i, !dbg !11

__nv_isinff.exit.i.i.i:                           ; preds = %4
  %29 = tail call i32 @__nvvm_reflect(ptr nonnull @.str) #5, !dbg !11
  %.not19.i = icmp eq i32 %29, 0, !dbg !11
  %.07.i = select i1 %.not19.i, float %27, float %26, !dbg !11
  %30 = fcmp oeq float %.07.i, 0x7FF0000000000000, !dbg !11
  br i1 %30, label %__nv_fmul_rn.exit.i.i.i, label %34, !dbg !11

__nv_fmul_rn.exit.i.i.i:                          ; preds = %__nv_isinff.exit.i.i.i
  %31 = tail call i32 @__nvvm_reflect(ptr nonnull @.str) #5, !dbg !11
  %.not27.i = icmp eq i32 %31, 0, !dbg !11
  %32 = tail call float @llvm.nvvm.mul.rn.ftz.f(float %10, float 0.000000e+00) #5, !dbg !11
  %33 = tail call float @llvm.nvvm.mul.rn.f(float %10, float 0.000000e+00) #5, !dbg !11
  %.08.i = select i1 %.not27.i, float %33, float %32, !dbg !11
  br label %__internal_trig_reduction_kernel.exit.i.i, !dbg !11

34:                                               ; preds = %__nv_isinff.exit.i.i.i
  %35 = shl i32 %9, 8, !dbg !11
  %36 = or i32 %35, -2147483648, !dbg !11
  br label %37, !dbg !11

37:                                               ; preds = %34, %37
  %indvars.iv = phi i64 [ 0, %34 ], [ %indvars.iv.next, %37 ]
  %hi.i.i.i.0.i1 = phi i32 [ 0, %34 ], [ %42, %37 ]
  %38 = getelementptr inbounds nuw [6 x i32], ptr addrspace(1) @__cudart_i2opi_f, i64 0, i64 %indvars.iv, !dbg !11
  %39 = load i32, ptr addrspace(1) %38, align 4, !dbg !11
  %40 = tail call { i32, i32 } asm "{\0A\09mad.lo.cc.u32   $0, $2, $3, $4;\0A\09madc.hi.u32     $1, $2, $3,  0;\0A\09}", "=r,=r,r,r,r"(i32 %39, i32 %36, i32 %hi.i.i.i.0.i1) #6, !dbg !11, !srcloc !12
  %41 = extractvalue { i32, i32 } %40, 0, !dbg !11
  %42 = extractvalue { i32, i32 } %40, 1, !dbg !11
  %43 = getelementptr inbounds nuw [7 x i32], ptr %result.i.i.i.i, i64 0, i64 %indvars.iv, !dbg !11
  store i32 %41, ptr %43, align 4, !dbg !11
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !11
  %exitcond.not = icmp eq i64 %indvars.iv.next, 6, !dbg !11
  br i1 %exitcond.not, label %44, label %37, !dbg !11, !llvm.loop !13

44:                                               ; preds = %37
  %45 = lshr i32 %9, 23, !dbg !11
  %46 = and i32 %45, 224, !dbg !11
  %47 = add nsw i32 %46, -128, !dbg !11
  %48 = lshr exact i32 %47, 5, !dbg !11
  %49 = getelementptr inbounds nuw i8, ptr %result.i.i.i.i, i64 24, !dbg !11
  store i32 %42, ptr %49, align 4, !dbg !11
  %50 = sub nsw i32 6, %48, !dbg !11
  %51 = sext i32 %50 to i64, !dbg !11
  %52 = getelementptr inbounds [7 x i32], ptr %result.i.i.i.i, i64 0, i64 %51, !dbg !11
  %53 = load i32, ptr %52, align 4, !dbg !11
  %54 = sub nsw i32 5, %48, !dbg !11
  %55 = sext i32 %54 to i64, !dbg !11
  %56 = getelementptr inbounds [7 x i32], ptr %result.i.i.i.i, i64 0, i64 %55, !dbg !11
  %57 = load i32, ptr %56, align 4, !dbg !11
  %58 = freeze i32 %57, !dbg !11
  %59 = and i32 %9, 260046848, !dbg !11
  %.not20.i = icmp eq i32 %59, 0, !dbg !11
  br i1 %.not20.i, label %__internal_trig_reduction_slowpath.exit.i.i.i, label %60, !dbg !11

60:                                               ; preds = %44
  %61 = sub nsw i32 4, %48, !dbg !11
  %62 = sext i32 %61 to i64, !dbg !11
  %63 = getelementptr inbounds [7 x i32], ptr %result.i.i.i.i, i64 0, i64 %62, !dbg !11
  %64 = load i32, ptr %63, align 4, !dbg !11
  %65 = tail call i32 @llvm.fshl.i32(i32 %58, i32 %64, i32 %45), !dbg !11
  br label %__internal_trig_reduction_slowpath.exit.i.i.i, !dbg !11

__internal_trig_reduction_slowpath.exit.i.i.i:    ; preds = %60, %44
  %lo.i.i.i.0.i = phi i32 [ %65, %60 ], [ %58, %44 ], !dbg !11
  %66 = tail call i32 @llvm.fshl.i32(i32 %53, i32 %58, i32 %45), !dbg !11
  %67 = lshr i32 %66, 30, !dbg !11
  %68 = tail call i32 @llvm.fshl.i32(i32 %66, i32 %lo.i.i.i.0.i, i32 2), !dbg !11
  %69 = shl i32 %lo.i.i.i.0.i, 2, !dbg !11
  %70 = lshr i32 %68, 31, !dbg !11
  %71 = add nuw nsw i32 %70, %67, !dbg !11
  %72 = sub nsw i32 0, %71, !dbg !11
  %.not2123.i = icmp slt i32 %9, 0, !dbg !11
  %spec.select.i = select i1 %.not2123.i, i32 %72, i32 %71, !dbg !11
  %73 = xor i32 %68, %9, !dbg !11
  %.lobit.i = ashr i32 %68, 31, !dbg !11
  %hi.i.i.i.2.i = xor i32 %.lobit.i, %68, !dbg !11
  %lo.i.i.i.1.i = xor i32 %.lobit.i, %69, !dbg !11
  %74 = zext i32 %hi.i.i.i.2.i to i64, !dbg !11
  %75 = shl nuw i64 %74, 32, !dbg !11
  %76 = zext i32 %lo.i.i.i.1.i to i64, !dbg !11
  %77 = or disjoint i64 %75, %76, !dbg !11
  %78 = sitofp i64 %77 to double, !dbg !11
  %79 = fmul double %78, 0x3BF921FB54442D19, !dbg !11
  %80 = fptrunc double %79 to float, !dbg !11
  %81 = fneg float %80, !dbg !11
  %.not2526.i = icmp slt i32 %73, 0, !dbg !11
  %r.i.i.i.0.i = select i1 %.not2526.i, float %81, float %80, !dbg !11
  br label %__internal_trig_reduction_kernel.exit.i.i, !dbg !11

__internal_trig_reduction_kernel.exit.i.i:        ; preds = %__internal_trig_reduction_slowpath.exit.i.i.i, %__nv_fmul_rn.exit.i.i.i, %4
  %i.i.1.i = phi i32 [ %.01.i, %4 ], [ 0, %__nv_fmul_rn.exit.i.i.i ], [ %spec.select.i, %__internal_trig_reduction_slowpath.exit.i.i.i ], !dbg !11
  %t.i.i.1.i = phi float [ %.04.i, %4 ], [ %.08.i, %__nv_fmul_rn.exit.i.i.i ], [ %r.i.i.i.0.i, %__internal_trig_reduction_slowpath.exit.i.i.i ], !dbg !11
  %82 = add i32 %i.i.1.i, 1, !dbg !11
  %83 = tail call i32 @__nvvm_reflect(ptr nonnull @.str) #5, !dbg !11
  %.not28.i = icmp eq i32 %83, 0, !dbg !11
  %84 = tail call float @llvm.nvvm.mul.rn.ftz.f(float %t.i.i.1.i, float %t.i.i.1.i) #5, !dbg !11
  %85 = tail call float @llvm.nvvm.mul.rn.f(float %t.i.i.1.i, float %t.i.i.1.i) #5, !dbg !11
  %.011.i = select i1 %.not28.i, float %85, float %84, !dbg !11
  %86 = and i32 %i.i.1.i, 1, !dbg !11
  %.not29.not.i = icmp eq i32 %86, 0, !dbg !11
  %87 = select i1 %.not29.not.i, float 1.000000e+00, float %t.i.i.1.i, !dbg !11
  %88 = tail call i32 @__nvvm_reflect(ptr nonnull @.str) #5, !dbg !11
  %.not30.i = icmp eq i32 %88, 0, !dbg !11
  %89 = tail call float @llvm.nvvm.fma.rn.ftz.f(float %.011.i, float %87, float 0.000000e+00) #5, !dbg !11
  %90 = tail call float @llvm.nvvm.fma.rn.f(float %.011.i, float %87, float 0.000000e+00) #5, !dbg !11
  %.012.i = select i1 %.not30.i, float %90, float %89, !dbg !11
  br i1 %.not29.not.i, label %__internal_fmad.exit1.i.i.i, label %__internal_fmad.exit2.i.i.i, !dbg !11

__internal_fmad.exit1.i.i.i:                      ; preds = %__internal_trig_reduction_kernel.exit.i.i
  %91 = tail call i32 @__nvvm_reflect(ptr nonnull @.str) #5, !dbg !11
  %.not31.i = icmp eq i32 %91, 0, !dbg !11
  %92 = tail call float @llvm.nvvm.fma.rn.ftz.f(float 0x3EF9758000000000, float %.011.i, float 0xBF56C0FDA0000000) #5, !dbg !11
  %93 = tail call float @llvm.nvvm.fma.rn.f(float 0x3EF9758000000000, float %.011.i, float 0xBF56C0FDA0000000) #5, !dbg !11
  %.013.i = select i1 %.not31.i, float %93, float %92, !dbg !11
  br label %__internal_fmad.exit2.i.i.i, !dbg !11

__internal_fmad.exit2.i.i.i:                      ; preds = %__internal_fmad.exit1.i.i.i, %__internal_trig_reduction_kernel.exit.i.i
  %94 = phi float [ 0xBFDFFFFFE0000000, %__internal_fmad.exit1.i.i.i ], [ 0xBFC5555500000000, %__internal_trig_reduction_kernel.exit.i.i ], !dbg !11
  %95 = phi float [ 0x3FA5555760000000, %__internal_fmad.exit1.i.i.i ], [ 0x3F8110BC80000000, %__internal_trig_reduction_kernel.exit.i.i ], !dbg !11
  %96 = phi float [ %.013.i, %__internal_fmad.exit1.i.i.i ], [ 0xBF29A82A60000000, %__internal_trig_reduction_kernel.exit.i.i ], !dbg !11
  %97 = tail call i32 @__nvvm_reflect(ptr nonnull @.str) #5, !dbg !11
  %.not32.i = icmp eq i32 %97, 0, !dbg !11
  %98 = tail call float @llvm.nvvm.fma.rn.ftz.f(float %96, float %.011.i, float %95) #5, !dbg !11
  %99 = tail call float @llvm.nvvm.fma.rn.f(float %96, float %.011.i, float %95) #5, !dbg !11
  %.010.i = select i1 %.not32.i, float %99, float %98, !dbg !11
  %100 = tail call i32 @__nvvm_reflect(ptr nonnull @.str) #5, !dbg !11
  %.not33.i = icmp eq i32 %100, 0, !dbg !11
  %101 = tail call float @llvm.nvvm.fma.rn.ftz.f(float %.010.i, float %.011.i, float %94) #5, !dbg !11
  %102 = tail call float @llvm.nvvm.fma.rn.f(float %.010.i, float %.011.i, float %94) #5, !dbg !11
  %.09.i = select i1 %.not33.i, float %102, float %101, !dbg !11
  %103 = tail call i32 @__nvvm_reflect(ptr nonnull @.str) #5, !dbg !11
  %.not34.i = icmp eq i32 %103, 0, !dbg !11
  %104 = tail call float @llvm.nvvm.fma.rn.ftz.f(float %.09.i, float %.012.i, float %87) #5, !dbg !11
  %105 = tail call float @llvm.nvvm.fma.rn.f(float %.09.i, float %.012.i, float %87) #5, !dbg !11
  %.05.i = select i1 %.not34.i, float %105, float %104, !dbg !11
  %106 = and i32 %82, 2, !dbg !11
  %.not35.i = icmp eq i32 %106, 0, !dbg !11
  br i1 %.not35.i, label %__nv_cosf.exit, label %__internal_fmad.exit5.i.i.i, !dbg !11

__internal_fmad.exit5.i.i.i:                      ; preds = %__internal_fmad.exit2.i.i.i
  %107 = tail call i32 @__nvvm_reflect(ptr nonnull @.str) #5, !dbg !11
  %.not36.i = icmp eq i32 %107, 0, !dbg !11
  %108 = tail call float @llvm.nvvm.fma.rn.ftz.f(float %.05.i, float -1.000000e+00, float 0.000000e+00) #5, !dbg !11
  %109 = tail call float @llvm.nvvm.fma.rn.f(float %.05.i, float -1.000000e+00, float 0.000000e+00) #5, !dbg !11
  %.0.i = select i1 %.not36.i, float %109, float %108, !dbg !11
  br label %__nv_cosf.exit, !dbg !11

__nv_cosf.exit:                                   ; preds = %__internal_fmad.exit2.i.i.i, %__internal_fmad.exit5.i.i.i
  %z.i.i.0.i = phi float [ %.0.i, %__internal_fmad.exit5.i.i.i ], [ %.05.i, %__internal_fmad.exit2.i.i.i ], !dbg !11
  call void @llvm.lifetime.end.p0(ptr nonnull %result.i.i.i.i), !dbg !11
  %110 = getelementptr float, ptr addrspace(1) %0, i64 %7, !dbg !15
  %111 = bitcast float %z.i.i.0.i to i32, !dbg !16
  tail call void asm sideeffect "st.global.b32 [ $1 + 0 ], { $0 };", "r,l"(i32 %111, ptr addrspace(1) %110) #5, !dbg !16
  ret void, !dbg !17
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

declare i32 @__nvvm_reflect(ptr) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.f2i.rn.ftz(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.f2i.rn(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.fma.rn.ftz.f(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.fma.rn.f(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.fabs.ftz.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.mul.rn.ftz.f(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.mul.rn.f(float, float) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fshl.i32(i32, i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #4

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #4

attributes #0 = { nounwind "nvvm.reqntid"="128" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { nounwind }
attributes #6 = { nounwind memory(none) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}
!llvm.ident = !{!4}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "triton", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly)
!1 = !DIFile(filename: "test_core_super_simple.py", directory: "/mnt/ssd/qingxiao.lty/work/triton-3-5/python/test/unit/language")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 4, !"nvvm-reflect-ftz", i32 1}
!4 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!5 = distinct !DISubprogram(name: "kernel", linkageName: "kernel", scope: !1, file: !1, line: 453, type: !6, scopeLine: 453, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!6 = !DISubroutineType(cc: DW_CC_normal, types: !7)
!7 = !{}
!8 = !DILocation(line: 454, column: 23, scope: !5)
!9 = !DILocation(line: 455, column: 20, scope: !5)
!10 = !DILocation(line: 455, column: 16, scope: !5)
!11 = !DILocation(line: 456, column: 15, scope: !5)
!12 = !{i32 30999, i32 31003, i32 31048, i32 31093}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.count", i32 1}
!15 = !DILocation(line: 457, column: 17, scope: !5)
!16 = !DILocation(line: 457, column: 22, scope: !5)
!17 = !DILocation(line: 457, column: 4, scope: !5)
