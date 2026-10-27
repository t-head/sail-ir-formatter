; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@.str = private unnamed_addr constant [11 x i8] c"__CUDA_FTZ\00", align 1

; CHECK-LABLE: merge_state_kernel
define void @merge_state_kernel(ptr addrspace(1) %0, ptr addrspace(1) %1, ptr addrspace(1) %2, ptr addrspace(1) %3, ptr addrspace(1) %4, ptr addrspace(1) %5, i32 %6, i32 %7) local_unnamed_addr !dbg !8 {
  %9 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #3, !dbg !11
  %10 = mul i32 %9, %6, !dbg !12
  %11 = sext i32 %10 to i64, !dbg !13
  %12 = getelementptr float, ptr addrspace(1) %1, i64 %11, !dbg !13
  %13 = getelementptr float, ptr addrspace(1) %3, i64 %11, !dbg !14
  ; CHECK:  %{{.+}} = icmp eq i8 addrspace(1)* %{{.+}}, null, !dbg !15
  %.not = icmp eq ptr addrspace(1) %5, null, !dbg !15
  %14 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %15 = icmp eq i32 %14, 0
  %16 = getelementptr float, ptr addrspace(1) %5, i64 %11
  br label %.preheader, !dbg !16

.preheader:                                       ; preds = %8, %119
  %17 = phi i32 [ 0, %8 ], [ %120, %119 ]
  br label %18, !dbg !17

18:                                               ; preds = %.preheader, %116
  %19 = phi i32 [ 0, %.preheader ], [ %117, %116 ]
  %20 = zext nneg i32 %19 to i64, !dbg !18
  %21 = getelementptr float, ptr addrspace(1) %12, i64 %20, !dbg !18
  %22 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %21, i1 true) #3, !dbg !19
  %23 = bitcast i32 %22 to float, !dbg !19
  %24 = getelementptr float, ptr addrspace(1) %13, i64 %20, !dbg !20
  %25 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %24, i1 true) #3, !dbg !21
  %26 = bitcast i32 %25 to float, !dbg !21
  %27 = add i32 %19, %10, !dbg !22
  %28 = mul i32 %27, %7, !dbg !23
  %29 = add i32 %28, %17, !dbg !24
  %30 = sext i32 %29 to i64, !dbg !25
  %31 = getelementptr half, ptr addrspace(1) %0, i64 %30, !dbg !25
  %32 = tail call i16 asm sideeffect "mov.u16 $0, 0x0;\0A\09@$2 ld.global.b16 { $0 }, [ $1 + 0 ];", "=c,l,b"(ptr addrspace(1) %31, i1 true) #3, !dbg !26
  %33 = getelementptr half, ptr addrspace(1) %2, i64 %30, !dbg !27
  %34 = tail call i16 asm sideeffect "mov.u16 $0, 0x0;\0A\09@$2 ld.global.b16 { $0 }, [ $1 + 0 ];", "=c,l,b"(ptr addrspace(1) %33, i1 true) #3, !dbg !28
  %35 = insertelement <2 x i16> poison, i16 %32, i64 0, !dbg !26
  %36 = insertelement <2 x i16> %35, i16 %34, i64 1, !dbg !26
  %37 = bitcast <2 x i16> %36 to <2 x half>, !dbg !26
  %38 = tail call float @llvm.maxnum.f32(float %23, float %26), !dbg !29
  %39 = fsub float %23, %38, !dbg !32
  %40 = tail call i32 @__nvvm_reflect(ptr nonnull @.str) #3, !dbg !33
  %.not.i = icmp eq i32 %40, 0, !dbg !33
  br i1 %.not.i, label %43, label %41, !dbg !33

41:                                               ; preds = %18
  %42 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %39) #3, !dbg !33
  br label %__nv_exp2f.exit, !dbg !33

43:                                               ; preds = %18
  %44 = tail call float @llvm.nvvm.ex2.approx.f(float %39) #3, !dbg !33
  br label %__nv_exp2f.exit, !dbg !33

__nv_exp2f.exit:                                  ; preds = %41, %43
  %.0.i = phi float [ %42, %41 ], [ %44, %43 ], !dbg !33
  %45 = fsub float %26, %38, !dbg !34
  %46 = tail call i32 @__nvvm_reflect(ptr nonnull @.str) #3, !dbg !35
  %.not.i1 = icmp eq i32 %46, 0, !dbg !35
  br i1 %.not.i1, label %49, label %47, !dbg !35

47:                                               ; preds = %__nv_exp2f.exit
  %48 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %45) #3, !dbg !35
  br label %__nv_exp2f.exit3, !dbg !35

49:                                               ; preds = %__nv_exp2f.exit
  %50 = tail call float @llvm.nvvm.ex2.approx.f(float %45) #3, !dbg !35
  br label %__nv_exp2f.exit3, !dbg !35

__nv_exp2f.exit3:                                 ; preds = %47, %49
  %.0.i2 = phi float [ %48, %47 ], [ %50, %49 ], !dbg !35
  %51 = fadd float %.0.i, %.0.i2, !dbg !36
  %52 = fpext <2 x half> %37 to <2 x float>, !dbg !37
  %53 = insertelement <2 x float> poison, float %.0.i, i64 0, !dbg !37
  %54 = insertelement <2 x float> %53, float %.0.i2, i64 1, !dbg !37
  %55 = fmul <2 x float> %54, %52, !dbg !37
  %shift = shufflevector <2 x float> %55, <2 x float> poison, <2 x i32> <i32 1, i32 poison>, !dbg !38
  %56 = fadd <2 x float> %55, %shift, !dbg !38
  %57 = extractelement <2 x float> %56, i64 0, !dbg !38
  %58 = tail call float asm "div.full.f32 $0, $1, $2;", "=r,r,r"(float %57, float %51) #3, !dbg !39
  %59 = getelementptr half, ptr addrspace(1) %4, i64 %30, !dbg !41
  %60 = fptrunc float %58 to half, !dbg !42
  %61 = bitcast half %60 to i16, !dbg !42
  tail call void asm sideeffect "@$2 st.global.b16 [ $1 + 0 ], { $0 };", "c,l,b"(i16 %61, ptr addrspace(1) %59, i1 %15) #3, !dbg !42
  br i1 %.not, label %116, label %62, !dbg !15

62:                                               ; preds = %__nv_exp2f.exit3
  %63 = getelementptr float, ptr addrspace(1) %16, i64 %20, !dbg !43
  %64 = fcmp olt float %51, 0x3810000000000000, !dbg !44
  %65 = fmul float %51, 0x4160000000000000, !dbg !44
  %.02.i = select i1 %64, float %65, float %51, !dbg !44
  %i.i.0.i = select i1 %64, float -2.300000e+01, float 0.000000e+00, !dbg !44
  %66 = bitcast float %.02.i to i32, !dbg !44
  %67 = add i32 %66, -1060439283, !dbg !44
  %68 = and i32 %67, -8388608, !dbg !44
  %69 = sub i32 %66, %68, !dbg !44
  %70 = bitcast i32 %69 to float, !dbg !44
  %71 = sitofp i32 %68 to float, !dbg !44
  %72 = tail call i32 @__nvvm_reflect(ptr nonnull @.str) #3, !dbg !44
  %.not.i4 = icmp eq i32 %72, 0, !dbg !44
  %73 = tail call float @llvm.nvvm.fma.rn.ftz.f(float %71, float 0x3E80000000000000, float %i.i.0.i) #3, !dbg !44
  %74 = tail call float @llvm.nvvm.fma.rn.f(float %71, float 0x3E80000000000000, float %i.i.0.i) #3, !dbg !44
  %.08.i = select i1 %.not.i4, float %74, float %73, !dbg !44
  %75 = fadd float %70, -1.000000e+00, !dbg !44
  %76 = tail call i32 @__nvvm_reflect(ptr nonnull @.str) #3, !dbg !44
  %.not1.i = icmp eq i32 %76, 0, !dbg !44
  %77 = tail call float @llvm.nvvm.fma.rn.ftz.f(float 0x3FB8D64FE0000000, float %75, float 0xBFC58FE600000000) #3, !dbg !44
  %78 = tail call float @llvm.nvvm.fma.rn.f(float 0x3FB8D64FE0000000, float %75, float 0xBFC58FE600000000) #3, !dbg !44
  %.010.i = select i1 %.not1.i, float %78, float %77, !dbg !44
  %79 = tail call i32 @__nvvm_reflect(ptr nonnull @.str) #3, !dbg !44
  %.not2.i = icmp eq i32 %79, 0, !dbg !44
  %80 = tail call float @llvm.nvvm.fma.rn.ftz.f(float %.010.i, float %75, float 0x3FC5F9E540000000) #3, !dbg !44
  %81 = tail call float @llvm.nvvm.fma.rn.f(float %.010.i, float %75, float 0x3FC5F9E540000000) #3, !dbg !44
  %.011.i = select i1 %.not2.i, float %81, float %80, !dbg !44
  %82 = tail call i32 @__nvvm_reflect(ptr nonnull @.str) #3, !dbg !44
  %.not3.i = icmp eq i32 %82, 0, !dbg !44
  %83 = tail call float @llvm.nvvm.fma.rn.ftz.f(float %.011.i, float %75, float 0xBFC6E9C860000000) #3, !dbg !44
  %84 = tail call float @llvm.nvvm.fma.rn.f(float %.011.i, float %75, float 0xBFC6E9C860000000) #3, !dbg !44
  %.012.i = select i1 %.not3.i, float %84, float %83, !dbg !44
  %85 = tail call i32 @__nvvm_reflect(ptr nonnull @.str) #3, !dbg !44
  %.not4.i = icmp eq i32 %85, 0, !dbg !44
  %86 = tail call float @llvm.nvvm.fma.rn.ftz.f(float %.012.i, float %75, float 0x3FCA417E80000000) #3, !dbg !44
  %87 = tail call float @llvm.nvvm.fma.rn.f(float %.012.i, float %75, float 0x3FCA417E80000000) #3, !dbg !44
  %.09.i = select i1 %.not4.i, float %87, float %86, !dbg !44
  %88 = tail call i32 @__nvvm_reflect(ptr nonnull @.str) #3, !dbg !44
  %.not5.i = icmp eq i32 %88, 0, !dbg !44
  %89 = tail call float @llvm.nvvm.fma.rn.ftz.f(float %.09.i, float %75, float 0xBFCEC79160000000) #3, !dbg !44
  %90 = tail call float @llvm.nvvm.fma.rn.f(float %.09.i, float %75, float 0xBFCEC79160000000) #3, !dbg !44
  %.05.i = select i1 %.not5.i, float %90, float %89, !dbg !44
  %91 = tail call i32 @__nvvm_reflect(ptr nonnull @.str) #3, !dbg !44
  %.not6.i = icmp eq i32 %91, 0, !dbg !44
  %92 = tail call float @llvm.nvvm.fma.rn.ftz.f(float %.05.i, float %75, float 0x3FD277F320000000) #3, !dbg !44
  %93 = tail call float @llvm.nvvm.fma.rn.f(float %.05.i, float %75, float 0x3FD277F320000000) #3, !dbg !44
  %.01.i = select i1 %.not6.i, float %93, float %92, !dbg !44
  %94 = tail call i32 @__nvvm_reflect(ptr nonnull @.str) #3, !dbg !44
  %.not7.i = icmp eq i32 %94, 0, !dbg !44
  %95 = tail call float @llvm.nvvm.fma.rn.ftz.f(float %.01.i, float %75, float 0xBFD7154920000000) #3, !dbg !44
  %96 = tail call float @llvm.nvvm.fma.rn.f(float %.01.i, float %75, float 0xBFD7154920000000) #3, !dbg !44
  %.0.i5 = select i1 %.not7.i, float %96, float %95, !dbg !44
  %97 = tail call i32 @__nvvm_reflect(ptr nonnull @.str) #3, !dbg !44
  %.not8.i = icmp eq i32 %97, 0, !dbg !44
  %98 = tail call float @llvm.nvvm.fma.rn.ftz.f(float %.0.i5, float %75, float 0x3FDEC70940000000) #3, !dbg !44
  %99 = tail call float @llvm.nvvm.fma.rn.f(float %.0.i5, float %75, float 0x3FDEC70940000000) #3, !dbg !44
  %.07.i = select i1 %.not8.i, float %99, float %98, !dbg !44
  %100 = tail call i32 @__nvvm_reflect(ptr nonnull @.str) #3, !dbg !44
  %.not9.i = icmp eq i32 %100, 0, !dbg !44
  %101 = tail call float @llvm.nvvm.fma.rn.ftz.f(float %.07.i, float %75, float 0xBFE7154760000000) #3, !dbg !44
  %102 = tail call float @llvm.nvvm.fma.rn.f(float %.07.i, float %75, float 0xBFE7154760000000) #3, !dbg !44
  %.06.i = select i1 %.not9.i, float %102, float %101, !dbg !44
  %103 = fmul float %75, %.06.i, !dbg !44
  %104 = fmul float %75, %103, !dbg !44
  %105 = tail call i32 @__nvvm_reflect(ptr nonnull @.str) #3, !dbg !44
  %.not10.i = icmp eq i32 %105, 0, !dbg !44
  %106 = tail call float @llvm.nvvm.fma.rn.ftz.f(float %75, float 0x3FF7154760000000, float %104) #3, !dbg !44
  %107 = tail call float @llvm.nvvm.fma.rn.f(float %75, float 0x3FF7154760000000, float %104) #3, !dbg !44
  %.04.i = select i1 %.not10.i, float %107, float %106, !dbg !44
  %108 = fadd float %.08.i, %.04.i, !dbg !44
  %109 = icmp ugt i32 %66, 2139095039, !dbg !44
  br i1 %109, label %__nv_fmaf_rn.exit.i.i, label %__nv_log2f.exit, !dbg !44

__nv_fmaf_rn.exit.i.i:                            ; preds = %62
  %110 = tail call i32 @__nvvm_reflect(ptr nonnull @.str) #3, !dbg !44
  %.not11.i = icmp eq i32 %110, 0, !dbg !44
  %111 = tail call float @llvm.nvvm.fma.rn.ftz.f(float %.02.i, float 0x7FF0000000000000, float 0x7FF0000000000000) #3, !dbg !44
  %112 = tail call float @llvm.nvvm.fma.rn.f(float %.02.i, float 0x7FF0000000000000, float 0x7FF0000000000000) #3, !dbg !44
  %.03.i = select i1 %.not11.i, float %112, float %111, !dbg !44
  br label %__nv_log2f.exit, !dbg !44

__nv_log2f.exit:                                  ; preds = %62, %__nv_fmaf_rn.exit.i.i
  %r.i.0.i = phi float [ %.03.i, %__nv_fmaf_rn.exit.i.i ], [ %108, %62 ], !dbg !44
  %113 = fcmp oeq float %.02.i, 0.000000e+00, !dbg !44
  %r.i.1.i = select i1 %113, float 0xFFF0000000000000, float %r.i.0.i, !dbg !44
  %114 = fadd float %38, %r.i.1.i, !dbg !45
  %115 = bitcast float %114 to i32, !dbg !46
  tail call void asm sideeffect "@$2 st.global.b32 [ $1 + 0 ], { $0 };", "r,l,b"(i32 %115, ptr addrspace(1) %63, i1 %15) #3, !dbg !46
  br label %116, !dbg !15

116:                                              ; preds = %__nv_log2f.exit, %__nv_exp2f.exit3
  %117 = add nuw nsw i32 %19, 1, !dbg !17
  %118 = icmp ult i32 %19, 31, !dbg !17
  br i1 %118, label %18, label %119, !dbg !17

119:                                              ; preds = %116
  %120 = add nuw nsw i32 %17, 1, !dbg !16
  %121 = icmp ult i32 %17, 127, !dbg !16
  br i1 %121, label %.preheader, label %122, !dbg !16

122:                                              ; preds = %119
  ret void, !dbg !47
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.maxnum.f32(float, float) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

declare i32 @__nvvm_reflect(ptr) local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.ex2.approx.ftz.f(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.ex2.approx.f(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.fma.rn.ftz.f(float, float, float) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.fma.rn.f(float, float, float) #0

attributes #0 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}
!nvvm.annotations = !{!4, !5, !6}
!llvm.ident = !{!7}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 4, !"nvvm-reflect-ftz", i32 1}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "triton", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly)
!3 = !DIFile(filename: "cascade.py", directory: "/ppuswhome/xiao.han/test/flashinfor-ptg/flashinfer/python/flashinfer/triton/kernels")
!4 = !{ptr @merge_state_kernel, !"kernel", i32 1}
!5 = !{ptr @merge_state_kernel, !"maxntidx", i32 128}
!6 = !{ptr @merge_state_kernel, !"smemsize", i32 0}
!7 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!8 = distinct !DISubprogram(name: "merge_state_kernel", linkageName: "merge_state_kernel", scope: !3, file: !3, line: 25, type: !9, scopeLine: 25, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2)
!9 = !DISubroutineType(cc: DW_CC_normal, types: !10)
!10 = !{}
!11 = !DILocation(line: 37, column: 24, scope: !8)
!12 = !DILocation(line: 40, column: 46, scope: !8)
!13 = !DILocation(line: 40, column: 40, scope: !8)
!14 = !DILocation(line: 41, column: 40, scope: !8)
!15 = !DILocation(line: 55, column: 15, scope: !8)
!16 = !DILocation(line: 38, column: 23, scope: !8)
!17 = !DILocation(line: 39, column: 33, scope: !8)
!18 = !DILocation(line: 40, column: 58, scope: !8)
!19 = !DILocation(line: 40, column: 30, scope: !8)
!20 = !DILocation(line: 41, column: 58, scope: !8)
!21 = !DILocation(line: 41, column: 30, scope: !8)
!22 = !DILocation(line: 43, column: 41, scope: !8)
!23 = !DILocation(line: 43, column: 53, scope: !8)
!24 = !DILocation(line: 43, column: 64, scope: !8)
!25 = !DILocation(line: 44, column: 36, scope: !8)
!26 = !DILocation(line: 44, column: 26, scope: !8)
!27 = !DILocation(line: 45, column: 36, scope: !8)
!28 = !DILocation(line: 45, column: 26, scope: !8)
!29 = !DILocation(line: 7, column: 26, scope: !30, inlinedAt: !31)
!30 = distinct !DILexicalBlockFile(scope: !8, file: !3, discriminator: 0)
!31 = !DILocation(line: 48, column: 69, scope: !8)
!32 = !DILocation(line: 8, column: 24, scope: !30, inlinedAt: !31)
!33 = !DILocation(line: 8, column: 20, scope: !30, inlinedAt: !31)
!34 = !DILocation(line: 8, column: 61, scope: !30, inlinedAt: !31)
!35 = !DILocation(line: 8, column: 51, scope: !30, inlinedAt: !31)
!36 = !DILocation(line: 8, column: 33, scope: !30, inlinedAt: !31)
!37 = !DILocation(line: 9, column: 12, scope: !30, inlinedAt: !31)
!38 = !DILocation(line: 9, column: 33, scope: !30, inlinedAt: !31)
!39 = !DILocation(line: 15, column: 12, scope: !30, inlinedAt: !40)
!40 = !DILocation(line: 51, column: 66, scope: !8)
!41 = !DILocation(line: 53, column: 36, scope: !8)
!42 = !DILocation(line: 53, column: 53, scope: !8)
!43 = !DILocation(line: 57, column: 53, scope: !8)
!44 = !DILocation(line: 58, column: 28, scope: !8)
!45 = !DILocation(line: 58, column: 33, scope: !8)
!46 = !DILocation(line: 58, column: 20, scope: !8)
!47 = !DILocation(line: 38, column: 4, scope: !8)
