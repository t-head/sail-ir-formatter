; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@global_smem = external addrspace(3) global [0 x i8], align 16

; CHECK-LABLE: kernel
define void @kernel(ptr addrspace(1) %0, ptr addrspace(1) %1) local_unnamed_addr !dbg !7 {
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !10
  %4 = and i32 %3, 31, !dbg !10
  %5 = lshr i32 %3, 5, !dbg !10
  %6 = shl i32 %3, 2, !dbg !10
  %7 = and i32 %6, 508, !dbg !10
  %8 = zext nneg i32 %7 to i64, !dbg !11
  %9 = getelementptr half, ptr addrspace(1) %0, i64 %8, !dbg !11
  %10 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09@$3 ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l,b"(ptr addrspace(1) %9, i1 true) #4, !dbg !12
  %11 = extractvalue { i32, i32 } %10, 0, !dbg !12
  %12 = extractvalue { i32, i32 } %10, 1, !dbg !12
  %13 = trunc i32 %11 to i16, !dbg !12
  %14 = bitcast i16 %13 to half, !dbg !12
  %extelt.offset = lshr i32 %11, 16, !dbg !12
  ; CHECK: %{{.+}} = trunc i32 %extelt.offset1 to i16, !dbg !12
  %15 = trunc nuw i32 %extelt.offset to i16, !dbg !12
  %16 = bitcast i16 %15 to half, !dbg !12
  %17 = trunc i32 %12 to i16, !dbg !12
  %18 = bitcast i16 %17 to half, !dbg !12
  %extelt.offset1 = lshr i32 %12, 16, !dbg !12
  %19 = trunc nuw i32 %extelt.offset1 to i16, !dbg !12
  %20 = bitcast i16 %19 to half, !dbg !12
  %21 = tail call half @llvm.minnum.f16(half %14, half %16), !dbg !13
  %22 = tail call half @llvm.minnum.f16(half %21, half %18), !dbg !13
  %23 = tail call half @llvm.minnum.f16(half %22, half %20), !dbg !13
  %24 = fpext half %23 to float, !dbg !13
  %25 = bitcast float %24 to i32, !dbg !18
  %26 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %25, i32 16, i32 31), !dbg !18
  %27 = bitcast i32 %26 to float, !dbg !18
  %28 = tail call float @llvm.minnum.f32(float %24, float %27), !dbg !13
  %29 = bitcast float %28 to i32, !dbg !18
  %30 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %29, i32 8, i32 31), !dbg !18
  %31 = bitcast i32 %30 to float, !dbg !18
  %32 = tail call float @llvm.minnum.f32(float %28, float %31), !dbg !13
  %33 = bitcast float %32 to i32, !dbg !18
  %34 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %33, i32 4, i32 31), !dbg !18
  %35 = bitcast i32 %34 to float, !dbg !18
  %36 = tail call float @llvm.minnum.f32(float %32, float %35), !dbg !13
  %37 = bitcast float %36 to i32, !dbg !18
  %38 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %37, i32 2, i32 31), !dbg !18
  %39 = bitcast i32 %38 to float, !dbg !18
  %40 = tail call float @llvm.minnum.f32(float %36, float %39), !dbg !13
  %41 = bitcast float %40 to i32, !dbg !18
  %42 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %41, i32 1, i32 31), !dbg !18
  %43 = bitcast i32 %42 to float, !dbg !18
  %44 = tail call float @llvm.minnum.f32(float %40, float %43), !dbg !13
  %45 = icmp eq i32 %4, 0, !dbg !18
  %46 = and i32 %5, 3, !dbg !18
  %47 = zext nneg i32 %46 to i64, !dbg !18
  %48 = getelementptr float, ptr addrspace(3) @global_smem, i64 %47, !dbg !18
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %48, float %44, i1 %45) #4, !dbg !18
  tail call void @llvm.nvvm.barrier0(), !dbg !18
  %49 = icmp slt i32 %3, 4, !dbg !18
  %50 = sext i32 %3 to i64, !dbg !18
  %51 = getelementptr float, ptr addrspace(3) @global_smem, i64 %50, !dbg !18
  %52 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %51, i1 %49) #4, !dbg !18
  %53 = bitcast i32 %52 to float, !dbg !18
  %54 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %52, i32 2, i32 31), !dbg !18
  %55 = bitcast i32 %54 to float, !dbg !18
  %56 = tail call float @llvm.minnum.f32(float %53, float %55), !dbg !13
  %57 = bitcast float %56 to i32, !dbg !18
  %58 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %57, i32 1, i32 31), !dbg !18
  %59 = bitcast i32 %58 to float, !dbg !18
  %60 = tail call float @llvm.minnum.f32(float %56, float %59), !dbg !13
  %61 = and i32 %3, 3, !dbg !18
  %62 = icmp eq i32 %61, 0, !dbg !18
  %63 = and i1 %49, %62, !dbg !18
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %51, float %60, i1 %63) #4, !dbg !18
  tail call void @llvm.nvvm.barrier0(), !dbg !18
  %64 = load float, ptr addrspace(3) @global_smem, align 16, !dbg !18
  %65 = fptrunc float %64 to half, !dbg !19
  %66 = icmp eq i32 %3, 0, !dbg !19
  %67 = bitcast half %65 to i16, !dbg !19
  tail call void asm sideeffect "@$2 st.global.b16 [ $1 + 0 ], { $0 };", "c,l,b"(i16 %67, ptr addrspace(1) %1, i1 %66) #4, !dbg !19
  ret void, !dbg !20
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.minnum.f32(float, float) #0

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #1

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare half @llvm.minnum.f16(half, half) #3

attributes #0 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #2 = { convergent nocallback nounwind }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}
!nvvm.annotations = !{!4, !5}
!llvm.ident = !{!6}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 4, !"nvvm-reflect-ftz", i32 1}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "triton", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly)
!3 = !DIFile(filename: "test_core.py", directory: "/ppuswhome/xiao.han/develop/triton/python/test/unit/language")
!4 = !{ptr @kernel, !"kernel", i32 1}
!5 = !{ptr @kernel, !"maxntidx", i32 128}
!6 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!7 = distinct !DISubprogram(name: "kernel", linkageName: "kernel", scope: !3, file: !3, line: 2034, type: !8, scopeLine: 2034, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2)
!8 = !DISubroutineType(cc: DW_CC_normal, types: !9)
!9 = !{}
!10 = !DILocation(line: 2035, column: 33, scope: !7)
!11 = !DILocation(line: 2035, column: 20, scope: !7)
!12 = !DILocation(line: 2035, column: 16, scope: !7)
!13 = !DILocation(line: 222, column: 27, scope: !14, inlinedAt: !17)
!14 = distinct !DILexicalBlockFile(scope: !16, file: !15, discriminator: 0)
!15 = !DIFile(filename: "standard.py", directory: "/usr/local/lib/python3.10/site-packages/triton/language")
!16 = distinct !DILexicalBlockFile(scope: !7, file: !15, discriminator: 0)
!17 = !DILocation(line: 2036, column: 15, scope: !7)
!18 = !DILocation(line: 243, column: 40, scope: !16, inlinedAt: !17)
!19 = !DILocation(line: 2037, column: 16, scope: !7)
!20 = !DILocation(line: 2037, column: 4, scope: !7)
