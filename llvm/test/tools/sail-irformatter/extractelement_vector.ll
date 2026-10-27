; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

; CHECK-LABLE: scatter_2d_inner_kernel
; CHECK: select
define void @scatter_2d_inner_kernel(ptr addrspace(1) %0, ptr addrspace(1) %1, ptr addrspace(1) %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12) local_unnamed_addr !dbg !8 {
  %14 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #1, !dbg !11
  %15 = sext i32 %14 to i64, !dbg !15
  %16 = tail call i32 asm "mov.u32 $0, %ctaid.y;", "=r"() #1, !dbg !16
  %17 = sext i32 %16 to i64, !dbg !18
  %18 = shl nsw i64 %17, 9, !dbg !19
  %19 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !20
  %20 = and i32 %19, 127, !dbg !20
  %21 = or disjoint i32 %20, 128, !dbg !20
  %22 = or disjoint i32 %20, 256, !dbg !20
  %23 = or disjoint i32 %20, 384, !dbg !20
  %24 = insertelement <4 x i32> poison, i32 %20, i64 0
  %25 = insertelement <4 x i32> %24, i32 %21, i64 1
  %26 = insertelement <4 x i32> %25, i32 %22, i64 2
  %27 = insertelement <4 x i32> %26, i32 %23, i64 3
  %28 = zext nneg <4 x i32> %27 to <4 x i64>
  %29 = insertelement <4 x i64> poison, i64 %18, i64 0, !dbg !21
  %30 = shufflevector <4 x i64> %29, <4 x i64> poison, <4 x i32> zeroinitializer, !dbg !21
  %31 = or disjoint <4 x i64> %30, %28, !dbg !21
  %32 = sext i32 %6 to i64, !dbg !22
  %33 = mul nsw i64 %15, %32, !dbg !22
  %34 = getelementptr half, ptr addrspace(1) %0, i64 %33, !dbg !23
  %35 = sext i32 %7 to i64, !dbg !24
  %36 = extractelement <4 x i64> %31, i64 0, !dbg !24
  %37 = mul i64 %36, %35, !dbg !24
  %38 = extractelement <4 x i64> %31, i64 1, !dbg !24
  %39 = mul i64 %38, %35, !dbg !24
  %40 = extractelement <4 x i64> %31, i64 2, !dbg !24
  %41 = mul i64 %40, %35, !dbg !24
  %42 = extractelement <4 x i64> %31, i64 3, !dbg !24
  %43 = mul i64 %42, %35, !dbg !24
  %44 = getelementptr half, ptr addrspace(1) %34, i64 %37, !dbg !25
  %45 = getelementptr half, ptr addrspace(1) %34, i64 %39, !dbg !25
  %46 = getelementptr half, ptr addrspace(1) %34, i64 %41, !dbg !25
  %47 = getelementptr half, ptr addrspace(1) %34, i64 %43, !dbg !25
  %48 = add nsw i64 %18, 512, !dbg !26
  %49 = sext i32 %10 to i64, !dbg !27
  %50 = icmp slt i64 %48, %49, !dbg !27
  %51 = sext i32 %11 to i64, !dbg !28
  %52 = icmp sge i64 %18, %51, !dbg !28
  %53 = or i1 %52, %50, !dbg !29
  %54 = insertelement <4 x ptr addrspace(1)> poison, ptr addrspace(1) %44, i64 0
  %55 = insertelement <4 x ptr addrspace(1)> %54, ptr addrspace(1) %45, i64 1
  %56 = insertelement <4 x ptr addrspace(1)> %55, ptr addrspace(1) %46, i64 2
  %57 = insertelement <4 x ptr addrspace(1)> %56, ptr addrspace(1) %47, i64 3
  br i1 %53, label %105, label %58, !dbg !30

58:                                               ; preds = %13
  %59 = sext i32 %8 to i64, !dbg !31
  %60 = mul nsw i64 %15, %59, !dbg !31
  %61 = getelementptr half, ptr addrspace(1) %1, i64 %60, !dbg !32
  %62 = insertelement <4 x i64> poison, i64 %49, i64 0, !dbg !33
  %63 = shufflevector <4 x i64> %62, <4 x i64> poison, <4 x i32> zeroinitializer, !dbg !33
  %64 = sub nsw <4 x i64> %31, %63, !dbg !33
  %65 = sext i32 %9 to i64, !dbg !34
  %66 = extractelement <4 x i64> %64, i64 0, !dbg !34
  %67 = mul i64 %66, %65, !dbg !34
  %68 = extractelement <4 x i64> %64, i64 1, !dbg !34
  %69 = mul i64 %68, %65, !dbg !34
  %70 = extractelement <4 x i64> %64, i64 2, !dbg !34
  %71 = mul i64 %70, %65, !dbg !34
  %72 = extractelement <4 x i64> %64, i64 3, !dbg !34
  %73 = mul i64 %72, %65, !dbg !34
  %74 = sext i32 %12 to i64, !dbg !35
  %75 = sdiv i64 %67, %74, !dbg !35
  %76 = sdiv i64 %69, %74, !dbg !35
  %77 = sdiv i64 %71, %74, !dbg !35
  %78 = sdiv i64 %73, %74, !dbg !35
  %79 = getelementptr half, ptr addrspace(1) %61, i64 %75, !dbg !36
  %80 = getelementptr half, ptr addrspace(1) %61, i64 %76, !dbg !36
  %81 = getelementptr half, ptr addrspace(1) %61, i64 %77, !dbg !36
  %82 = getelementptr half, ptr addrspace(1) %61, i64 %78, !dbg !36
  %83 = shl <4 x i64> %63, <i64 32, i64 32, i64 32, i64 32>, !dbg !37
  %84 = ashr exact <4 x i64> %83, <i64 32, i64 32, i64 32, i64 32>, !dbg !37
  %85 = icmp sge <4 x i64> %31, %84, !dbg !37
  %86 = insertelement <4 x i32> poison, i32 %11, i64 0, !dbg !38
  %87 = shufflevector <4 x i32> %86, <4 x i32> poison, <4 x i32> zeroinitializer, !dbg !38
  %88 = sext <4 x i32> %87 to <4 x i64>, !dbg !38
  %89 = icmp slt <4 x i64> %31, %88, !dbg !38
  %90 = icmp slt i32 %14, %3, !dbg !39
  %91 = and <4 x i1> %85, %89, !dbg !40
  %92 = insertelement <4 x i64> poison, i64 %74, i64 0, !dbg !41
  %93 = shufflevector <4 x i64> %92, <4 x i64> poison, <4 x i32> zeroinitializer, !dbg !41
  %94 = srem <4 x i64> %64, %93, !dbg !41
  %95 = icmp eq <4 x i64> %94, zeroinitializer, !dbg !42
  %96 = and <4 x i1> %91, %95, !dbg !43
  %97 = insertelement <4 x i1> poison, i1 %90, i64 0, !dbg !44
  %98 = shufflevector <4 x i1> %97, <4 x i1> poison, <4 x i32> zeroinitializer, !dbg !44
  %99 = and <4 x i1> %98, %96, !dbg !44
  %100 = insertelement <4 x ptr addrspace(1)> poison, ptr addrspace(1) %79, i64 0, !dbg !45
  %101 = insertelement <4 x ptr addrspace(1)> %100, ptr addrspace(1) %80, i64 1, !dbg !45
  %102 = insertelement <4 x ptr addrspace(1)> %101, ptr addrspace(1) %81, i64 2, !dbg !45
  %103 = insertelement <4 x ptr addrspace(1)> %102, ptr addrspace(1) %82, i64 3, !dbg !45
  %104 = select <4 x i1> %99, <4 x ptr addrspace(1)> %103, <4 x ptr addrspace(1)> %57, !dbg !45
  br label %105, !dbg !30

105:                                              ; preds = %58, %13
  %106 = phi <4 x ptr addrspace(1)> [ %104, %58 ], [ %57, %13 ]
  %107 = icmp slt i32 %14, %3, !dbg !46
  %108 = insertelement <4 x i32> poison, i32 %4, i64 0, !dbg !47
  %109 = shufflevector <4 x i32> %108, <4 x i32> poison, <4 x i32> zeroinitializer, !dbg !47
  %110 = sext <4 x i32> %109 to <4 x i64>, !dbg !47
  %111 = icmp slt <4 x i64> %31, %110, !dbg !47
  %112 = extractelement <4 x i1> %111, i64 0, !dbg !48
  %113 = and i1 %107, %112, !dbg !48
  %114 = extractelement <4 x i1> %111, i64 1, !dbg !48
  %115 = and i1 %107, %114, !dbg !48
  %116 = extractelement <4 x i1> %111, i64 2, !dbg !48
  %117 = and i1 %107, %116, !dbg !48
  %118 = extractelement <4 x i1> %111, i64 3, !dbg !48
  %119 = and i1 %107, %118, !dbg !48
  %120 = extractelement <4 x ptr addrspace(1)> %106, i64 0, !dbg !49
  %121 = tail call i16 asm sideeffect "mov.u16 $0, 0x0;\0A\09@$2 ld.global.b16 { $0 }, [ $1 + 0 ];", "=c,l,b"(ptr addrspace(1) %120, i1 %113) #1, !dbg !49
  %122 = extractelement <4 x ptr addrspace(1)> %106, i64 1, !dbg !49
  %123 = tail call i16 asm sideeffect "mov.u16 $0, 0x0;\0A\09@$2 ld.global.b16 { $0 }, [ $1 + 0 ];", "=c,l,b"(ptr addrspace(1) %122, i1 %115) #1, !dbg !49
  %124 = extractelement <4 x ptr addrspace(1)> %106, i64 2, !dbg !49
  %125 = tail call i16 asm sideeffect "mov.u16 $0, 0x0;\0A\09@$2 ld.global.b16 { $0 }, [ $1 + 0 ];", "=c,l,b"(ptr addrspace(1) %124, i1 %117) #1, !dbg !49
  %126 = extractelement <4 x ptr addrspace(1)> %106, i64 3, !dbg !49
  %127 = tail call i16 asm sideeffect "mov.u16 $0, 0x0;\0A\09@$2 ld.global.b16 { $0 }, [ $1 + 0 ];", "=c,l,b"(ptr addrspace(1) %126, i1 %119) #1, !dbg !49
  %128 = getelementptr half, ptr addrspace(1) %2, i64 %33, !dbg !50
  %129 = getelementptr half, ptr addrspace(1) %128, i64 %37, !dbg !51
  %130 = getelementptr half, ptr addrspace(1) %128, i64 %39, !dbg !51
  %131 = getelementptr half, ptr addrspace(1) %128, i64 %41, !dbg !51
  %132 = getelementptr half, ptr addrspace(1) %128, i64 %43, !dbg !51
  tail call void asm sideeffect "@$2 st.global.b16 [ $1 + 0 ], { $0 };", "c,l,b"(i16 %121, ptr addrspace(1) %129, i1 %113) #1, !dbg !52
  tail call void asm sideeffect "@$2 st.global.b16 [ $1 + 0 ], { $0 };", "c,l,b"(i16 %123, ptr addrspace(1) %130, i1 %115) #1, !dbg !52
  tail call void asm sideeffect "@$2 st.global.b16 [ $1 + 0 ], { $0 };", "c,l,b"(i16 %125, ptr addrspace(1) %131, i1 %117) #1, !dbg !52
  tail call void asm sideeffect "@$2 st.global.b16 [ $1 + 0 ], { $0 };", "c,l,b"(i16 %127, ptr addrspace(1) %132, i1 %119) #1, !dbg !52
  ret void, !dbg !53
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

attributes #0 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}
!nvvm.annotations = !{!4, !5, !6}
!llvm.ident = !{!7}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 4, !"nvvm-reflect-ftz", i32 1}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "triton", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly)
!3 = !DIFile(filename: "slice_scatter.py", directory: "/home/image/triton-perf/tests/FlagGems/src/flag_gems/ops")
!4 = !{ptr @scatter_2d_inner_kernel, !"kernel", i32 1}
!5 = !{ptr @scatter_2d_inner_kernel, !"maxntidx", i32 128}
!6 = !{ptr @scatter_2d_inner_kernel, !"smemsize", i32 0}
!7 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!8 = distinct !DISubprogram(name: "scatter_2d_inner_kernel", linkageName: "scatter_2d_inner_kernel", scope: !3, file: !3, line: 333, type: !9, scopeLine: 333, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2)
!9 = !DISubroutineType(cc: DW_CC_normal, types: !10)
!10 = !{}
!11 = !DILocation(line: 21, column: 25, scope: !12, inlinedAt: !14)
!12 = distinct !DILexicalBlockFile(scope: !8, file: !13, discriminator: 0)
!13 = !DIFile(filename: "triton_lang_extension.py", directory: "/home/image/triton-perf/tests/FlagGems/src/flag_gems/utils")
!14 = !DILocation(line: 356, column: 24, scope: !8)
!15 = !DILocation(line: 21, column: 34, scope: !12, inlinedAt: !14)
!16 = !DILocation(line: 21, column: 25, scope: !12, inlinedAt: !17)
!17 = !DILocation(line: 357, column: 24, scope: !8)
!18 = !DILocation(line: 21, column: 34, scope: !12, inlinedAt: !17)
!19 = !DILocation(line: 357, column: 29, scope: !8)
!20 = !DILocation(line: 359, column: 30, scope: !8)
!21 = !DILocation(line: 359, column: 14, scope: !8)
!22 = !DILocation(line: 363, column: 22, scope: !8)
!23 = !DILocation(line: 363, column: 17, scope: !8)
!24 = !DILocation(line: 363, column: 34, scope: !8)
!25 = !DILocation(line: 363, column: 29, scope: !8)
!26 = !DILocation(line: 364, column: 17, scope: !8)
!27 = !DILocation(line: 364, column: 21, scope: !8)
!28 = !DILocation(line: 364, column: 37, scope: !8)
!29 = !DILocation(line: 364, column: 31, scope: !8)
!30 = !DILocation(line: 364, column: 11, scope: !8)
!31 = !DILocation(line: 367, column: 26, scope: !8)
!32 = !DILocation(line: 367, column: 21, scope: !8)
!33 = !DILocation(line: 367, column: 39, scope: !8)
!34 = !DILocation(line: 367, column: 48, scope: !8)
!35 = !DILocation(line: 367, column: 56, scope: !8)
!36 = !DILocation(line: 367, column: 33, scope: !8)
!37 = !DILocation(line: 368, column: 29, scope: !8)
!38 = !DILocation(line: 368, column: 41, scope: !8)
!39 = !DILocation(line: 369, column: 31, scope: !8)
!40 = !DILocation(line: 368, column: 36, scope: !8)
!41 = !DILocation(line: 368, column: 64, scope: !8)
!42 = !DILocation(line: 368, column: 72, scope: !8)
!43 = !DILocation(line: 368, column: 49, scope: !8)
!44 = !DILocation(line: 369, column: 39, scope: !8)
!45 = !DILocation(line: 369, column: 49, scope: !8)
!46 = !DILocation(line: 370, column: 36, scope: !8)
!47 = !DILocation(line: 370, column: 50, scope: !8)
!48 = !DILocation(line: 370, column: 45, scope: !8)
!49 = !DILocation(line: 370, column: 22, scope: !8)
!50 = !DILocation(line: 371, column: 25, scope: !8)
!51 = !DILocation(line: 371, column: 37, scope: !8)
!52 = !DILocation(line: 371, column: 48, scope: !8)
!53 = !DILocation(line: 361, column: 4, scope: !8)
