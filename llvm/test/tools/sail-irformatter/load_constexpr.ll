; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@global_smem = external addrspace(3) global [0 x i8], align 16

; CHECK-LABLE: kernel
define void @kernel(ptr addrspace(1) %0, ptr addrspace(1) %1) local_unnamed_addr !dbg !7 {
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !10
  %4 = and i32 %3, 31, !dbg !10
  %5 = lshr i32 %3, 5, !dbg !10
  %6 = and i32 %3, 63, !dbg !10
  %7 = zext nneg i32 %6 to i64, !dbg !11
  %8 = getelementptr i8, ptr addrspace(1) %0, i64 %7, !dbg !11
  %9 = tail call i8 asm sideeffect "mov.u16 $0, 0x0;\0A\09@$2 ld.global.b8 { $0 }, [ $1 + 0 ];", "=c,l,b"(ptr addrspace(1) %8, i1 true) #3, !dbg !12
  %10 = zext i8 %9 to i32, !dbg !13
  %11 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %10, i32 16, i32 31), !dbg !13
  %12 = trunc i32 %11 to i8, !dbg !13
  %13 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %6, i32 16, i32 31), !dbg !13
  %14 = icmp eq i8 %9, %12, !dbg !17
  %15 = icmp slt i32 %6, %13, !dbg !20
  %16 = and i1 %14, %15, !dbg !21
  %17 = icmp slt i8 %9, %12, !dbg !22
  %18 = or i1 %17, %16, !dbg !23
  %19 = select i1 %18, i8 %9, i8 %12, !dbg !24
  %20 = select i1 %18, i32 %6, i32 %13, !dbg !25
  %21 = zext i8 %19 to i32, !dbg !13
  %22 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %21, i32 8, i32 31), !dbg !13
  %23 = trunc i32 %22 to i8, !dbg !13
  %24 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %20, i32 8, i32 31), !dbg !13
  %25 = icmp eq i8 %19, %23, !dbg !17
  %26 = icmp slt i32 %20, %24, !dbg !20
  %27 = and i1 %25, %26, !dbg !21
  %28 = icmp slt i8 %19, %23, !dbg !22
  %29 = or i1 %28, %27, !dbg !23
  %30 = select i1 %29, i8 %19, i8 %23, !dbg !24
  %31 = select i1 %29, i32 %20, i32 %24, !dbg !25
  %32 = zext i8 %30 to i32, !dbg !13
  %33 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %32, i32 4, i32 31), !dbg !13
  %34 = trunc i32 %33 to i8, !dbg !13
  %35 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %31, i32 4, i32 31), !dbg !13
  %36 = icmp eq i8 %30, %34, !dbg !17
  %37 = icmp slt i32 %31, %35, !dbg !20
  %38 = and i1 %36, %37, !dbg !21
  %39 = icmp slt i8 %30, %34, !dbg !22
  %40 = or i1 %39, %38, !dbg !23
  %41 = select i1 %40, i8 %30, i8 %34, !dbg !24
  %42 = select i1 %40, i32 %31, i32 %35, !dbg !25
  %43 = zext i8 %41 to i32, !dbg !13
  %44 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %43, i32 2, i32 31), !dbg !13
  %45 = trunc i32 %44 to i8, !dbg !13
  %46 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %42, i32 2, i32 31), !dbg !13
  %47 = icmp eq i8 %41, %45, !dbg !17
  %48 = icmp slt i32 %42, %46, !dbg !20
  %49 = and i1 %47, %48, !dbg !21
  %50 = icmp slt i8 %41, %45, !dbg !22
  %51 = or i1 %50, %49, !dbg !23
  %52 = select i1 %51, i8 %41, i8 %45, !dbg !24
  %53 = select i1 %51, i32 %42, i32 %46, !dbg !25
  %54 = zext i8 %52 to i32, !dbg !13
  %55 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %54, i32 1, i32 31), !dbg !13
  %56 = trunc i32 %55 to i8, !dbg !13
  %57 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %53, i32 1, i32 31), !dbg !13
  %58 = icmp eq i8 %52, %56, !dbg !17
  %59 = icmp slt i32 %53, %57, !dbg !20
  %60 = and i1 %58, %59, !dbg !21
  %61 = icmp slt i8 %52, %56, !dbg !22
  %62 = or i1 %61, %60, !dbg !23
  %63 = select i1 %62, i8 %52, i8 %56, !dbg !24
  %64 = select i1 %62, i32 %53, i32 %57, !dbg !25
  %65 = icmp eq i32 %4, 0, !dbg !13
  %66 = and i32 %5, 1, !dbg !13
  %67 = zext nneg i32 %66 to i64, !dbg !13
  %68 = getelementptr i8, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 8), i64 %67, !dbg !13
  tail call void asm sideeffect "@$2 st.shared.b8 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %68, i8 %63, i1 %65) #3, !dbg !13
  %69 = getelementptr i32, ptr addrspace(3) @global_smem, i64 %67, !dbg !13
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %69, i32 %64, i1 %65) #3, !dbg !13
  tail call void @llvm.nvvm.barrier0(), !dbg !13
  %70 = icmp slt i32 %3, 2, !dbg !13
  %71 = sext i32 %3 to i64, !dbg !13
  %72 = getelementptr i8, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 8), i64 %71, !dbg !13
  %73 = tail call i8 asm sideeffect "@$2 ld.shared.b8 $0, [ $1 + 0 ];", "=h,r,b"(ptr addrspace(3) %72, i1 %70) #3, !dbg !13
  %74 = getelementptr i32, ptr addrspace(3) @global_smem, i64 %71, !dbg !13
  %75 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %74, i1 %70) #3, !dbg !13
  %76 = zext i8 %73 to i32, !dbg !13
  %77 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %76, i32 1, i32 31), !dbg !13
  %78 = trunc i32 %77 to i8, !dbg !13
  %79 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %75, i32 1, i32 31), !dbg !13
  %80 = icmp eq i8 %73, %78, !dbg !17
  %81 = icmp slt i32 %75, %79, !dbg !20
  %82 = and i1 %80, %81, !dbg !21
  %83 = icmp slt i8 %73, %78, !dbg !22
  %84 = or i1 %83, %82, !dbg !23
  %85 = select i1 %84, i8 %73, i8 %78, !dbg !24
  %86 = select i1 %84, i32 %75, i32 %79, !dbg !25
  %87 = and i32 %3, 1, !dbg !13
  %88 = icmp eq i32 %87, 0, !dbg !13
  %89 = and i1 %70, %88, !dbg !13
  tail call void asm sideeffect "@$2 st.shared.b8 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %72, i8 %85, i1 %89) #3, !dbg !13
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %74, i32 %86, i1 %89) #3, !dbg !13
  tail call void @llvm.nvvm.barrier0(), !dbg !13
  ; CHECK: [[GEP:%9.*]] = getelementptr i8, i8 addrspace(3)* getelementptr inbounds ([0 x i8], [0 x i8] addrspace(3)* @global_smem, i32 0, i32 0), i64 8
  ; CHECK: %{{[0-9]+}} = load i8, i8 addrspace(3)* [[GEP]], align 8
  %90 = load i8, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 8), align 8, !dbg !13
  %91 = icmp eq i32 %3, 0, !dbg !26
  tail call void asm sideeffect "@$2 st.global.b8 [ $1 + 0 ], { $0 };", "c,l,b"(i8 %90, ptr addrspace(1) %1, i1 %91) #3, !dbg !26
  ret void, !dbg !27
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #1

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #2

attributes #0 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #2 = { convergent nocallback nounwind }
attributes #3 = { nounwind }

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
!13 = !DILocation(line: 233, column: 58, scope: !14, inlinedAt: !16)
!14 = distinct !DILexicalBlockFile(scope: !7, file: !15, discriminator: 0)
!15 = !DIFile(filename: "standard.py", directory: "/usr/local/lib/python3.10/site-packages/triton/language")
!16 = !DILocation(line: 2036, column: 18, scope: !7)
!17 = !DILocation(line: 201, column: 24, scope: !18, inlinedAt: !16)
!18 = distinct !DILexicalBlockFile(scope: !19, file: !15, discriminator: 0)
!19 = distinct !DILexicalBlockFile(scope: !14, file: !15, discriminator: 0)
!20 = !DILocation(line: 201, column: 44, scope: !18, inlinedAt: !16)
!21 = !DILocation(line: 201, column: 35, scope: !18, inlinedAt: !16)
!22 = !DILocation(line: 204, column: 18, scope: !18, inlinedAt: !16)
!23 = !DILocation(line: 204, column: 28, scope: !18, inlinedAt: !16)
!24 = !DILocation(line: 205, column: 39, scope: !18, inlinedAt: !16)
!25 = !DILocation(line: 206, column: 39, scope: !18, inlinedAt: !16)
!26 = !DILocation(line: 2037, column: 16, scope: !7)
!27 = !DILocation(line: 2037, column: 4, scope: !7)
