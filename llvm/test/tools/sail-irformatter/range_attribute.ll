; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@global_smem = external local_unnamed_addr addrspace(3) global [0 x i8], align 16

; CHECK-LABLE: kernel
define void @kernel(ptr addrspace(1) %0, ptr addrspace(1) %1) local_unnamed_addr !dbg !7 {
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !10
  %4 = and i32 %3, 3, !dbg !10
  %5 = lshr i32 %3, 5, !dbg !11
  %6 = shl i32 %5, 7, !dbg !12
  %7 = and i32 %6, 384, !dbg !12
  %8 = zext nneg i32 %7 to i64, !dbg !13
  %9 = getelementptr i1, ptr addrspace(1) %0, i64 %8, !dbg !13
  %10 = shl i32 %3, 2, !dbg !14
  %11 = and i32 %10, 124, !dbg !14
  %12 = zext nneg i32 %11 to i64, !dbg !15
  %13 = getelementptr i1, ptr addrspace(1) %9, i64 %12, !dbg !15
  %14 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %13, i1 true) #4, !dbg !16
  %15 = bitcast i32 %14 to <4 x i8>, !dbg !16
  %16 = trunc i32 %14 to i8, !dbg !16
  %17 = insertelement <4 x i8> %15, i8 %16, i64 0, !dbg !17
  %18 = icmp ne <4 x i8> %17, zeroinitializer, !dbg !17
  %19 = bitcast <4 x i1> %18 to i4, !dbg !18
  ; CHECK: %{{.+}} = call i4 @llvm.ctpop.i4(i4 %{{.+}}), !dbg !{{[0-9]+}}, !range ![[RANGE:[0-9]+]]
  %20 = tail call range(i4 0, 5) i4 @llvm.ctpop.i4(i4 %19), !dbg !18
  %.mask = and i4 %20, 1, !dbg !21
  %21 = zext nneg i4 %.mask to i32, !dbg !21
  %22 = tail call i32 @llvm.nvvm.redux.sync.xor(i32 %21, i32 -1), !dbg !21
  %23 = zext nneg i32 %4 to i64, !dbg !22
  %24 = getelementptr i8, ptr addrspace(1) %1, i64 %23, !dbg !22
  %25 = and i32 %5, 3, !dbg !23
  %26 = zext nneg i32 %25 to i64, !dbg !23
  %27 = getelementptr i8, ptr addrspace(3) @global_smem, i64 %26, !dbg !23
  %28 = trunc i32 %22 to i8, !dbg !23
  %29 = and i8 %28, 1, !dbg !23
  %30 = insertelement <1 x i8> poison, i8 %29, i64 0, !dbg !23
  store <1 x i8> %30, ptr addrspace(3) %27, align 1, !dbg !23
  tail call void @llvm.nvvm.barrier0(), !dbg !23
  %31 = getelementptr i8, ptr addrspace(3) @global_smem, i64 %23, !dbg !23
  %32 = load i8, ptr addrspace(3) %31, align 1, !dbg !23
  %33 = icmp ne i8 %32, 0, !dbg !23
  %34 = zext i1 %33 to i8, !dbg !23
  %urem = and i32 %3, 124, !dbg !23
  %35 = icmp eq i32 %urem, 0, !dbg !23
  tail call void asm sideeffect "@$2 st.global.b8 [ $1 + 0 ], { $0 };", "c,l,b"(i8 %34, ptr addrspace(1) %24, i1 %35) #4, !dbg !23
  ret void, !dbg !24
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.redux.sync.xor(i32, i32) #1

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i4 @llvm.ctpop.i4(i4) #3

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
!7 = distinct !DISubprogram(name: "kernel", linkageName: "kernel", scope: !3, file: !3, line: 2137, type: !8, scopeLine: 2137, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2)
!8 = !DISubroutineType(cc: DW_CC_normal, types: !9)
!9 = !{}
!10 = !DILocation(line: 2139, column: 27, scope: !7)
!11 = !DILocation(line: 2146, column: 32, scope: !7)
!12 = !DILocation(line: 2146, column: 43, scope: !7)
!13 = !DILocation(line: 2146, column: 24, scope: !7)
!14 = !DILocation(line: 2146, column: 61, scope: !7)
!15 = !DILocation(line: 2146, column: 53, scope: !7)
!16 = !DILocation(line: 2146, column: 20, scope: !7)
!17 = !DILocation(line: 2148, column: 23, scope: !7)
!18 = !DILocation(line: 272, column: 15, scope: !19, inlinedAt: !21)
!19 = distinct !DILexicalBlockFile(scope: !7, file: !20, discriminator: 0)
!20 = !DIFile(filename: "standard.py", directory: "/usr/local/lib/python3.10/site-packages/triton/language")
!21 = !DILocation(line: 2149, column: 19, scope: !7)
!22 = !DILocation(line: 2167, column: 24, scope: !7)
!23 = !DILocation(line: 2170, column: 20, scope: !7)
!24 = !DILocation(line: 2170, column: 4, scope: !7)

; CHECK: ![[RANGE]] = !{i4 0, i4 5}
