; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"

; CHECK-LABLE: abs_kernel
define void @abs_kernel(ptr addrspace(1) %0, ptr addrspace(1) %1) local_unnamed_addr !dbg !7 {
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !10
  %4 = shl i32 %3, 1, !dbg !10
  %5 = and i32 %4, 254, !dbg !10
  %6 = zext nneg i32 %5 to i64, !dbg !11
  %7 = getelementptr i8, ptr addrspace(1) %0, i64 %6, !dbg !11
  %8 = tail call i16 asm sideeffect "mov.u16 $0, 0x0;\0A\09@$2 ld.global.b16 { $0 }, [ $1 + 0 ];", "=c,l,b"(ptr addrspace(1) %7, i1 true) #1, !dbg !12
  %9 = bitcast i16 %8 to <2 x i8>, !dbg !12
; CHECK: %{{.+}} = and <2 x i8> %{{.+}}, <i8 127, i8 127>, !dbg !13
  %10 = and <2 x i8> %9, splat (i8 127), !dbg !13
  %11 = getelementptr i8, ptr addrspace(1) %1, i64 %6, !dbg !14
  %12 = bitcast <2 x i8> %10 to i16, !dbg !15
  tail call void asm sideeffect "@$2 st.global.b16 [ $1 + 0 ], { $0 };", "c,l,b"(i16 %12, ptr addrspace(1) %11, i1 true) #1, !dbg !15
  ret void, !dbg !16
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

attributes #0 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}
!nvvm.annotations = !{!4, !5}
!llvm.ident = !{!6}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 4, !"nvvm-reflect-ftz", i32 1}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "triton", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly)
!3 = !DIFile(filename: "test_core.py", directory: "/mnt/ssd/jiali.yu/workspace/triton/python/test/unit/language")
!4 = !{ptr @abs_kernel, !"kernel", i32 1}
!5 = !{ptr @abs_kernel, !"reqntidx", i32 128}
!6 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!7 = distinct !DISubprogram(name: "abs_kernel", linkageName: "abs_kernel", scope: !3, file: !3, line: 1074, type: !8, scopeLine: 1074, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2)
!8 = !DISubroutineType(cc: DW_CC_normal, types: !9)
!9 = !{}
!10 = !DILocation(line: 1075, column: 23, scope: !7)
!11 = !DILocation(line: 1076, column: 20, scope: !7)
!12 = !DILocation(line: 1076, column: 16, scope: !7)
!13 = !DILocation(line: 1077, column: 15, scope: !7)
!14 = !DILocation(line: 1078, column: 17, scope: !7)
!15 = !DILocation(line: 1078, column: 22, scope: !7)
!16 = !DILocation(line: 1078, column: 4, scope: !7)
