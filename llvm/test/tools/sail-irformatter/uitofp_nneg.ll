; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

; CHECK-LABLE: kernel
define void @kernel(ptr addrspace(1) %0) local_unnamed_addr !dbg !7 {
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !10
  %3 = and i32 %2, 63, !dbg !11
  ; CHECK: %{{.+}} = uitofp i32 %{{.+}} to float
  %4 = uitofp nneg i32 %3 to float
  ; CHECK: %{{.+}} = zext i32 %{{.+}} to i64, !dbg !12
  %5 = zext nneg i32 %3 to i64, !dbg !12
  %6 = getelementptr float, ptr addrspace(1) %0, i64 %5, !dbg !12
  %7 = and i32 %2, 64, !dbg !13
  %8 = icmp eq i32 %7, 0, !dbg !13
  %9 = bitcast float %4 to <1 x i32>, !dbg !13
  %10 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$3 atom.global.gpu.acq_rel.min.s32 $0, [ $1 + 0 ], $2;", "=r,l,r,b"(ptr addrspace(1) %6, <1 x i32> %9, i1 %8) #1, !dbg !13
  %11 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$3 atom.global.gpu.acq_rel.max.u32 $0, [ $1 + 0 ], $2;", "=r,l,r,b"(ptr addrspace(1) %6, <1 x i32> %9, i1 false) #1, !dbg !13
  ret void, !dbg !14
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
!3 = !DIFile(filename: "test_core.py", directory: "/ppuswhome/xiao.han/develop/triton/python/test/unit/language")
!4 = !{ptr @kernel, !"kernel", i32 1}
!5 = !{ptr @kernel, !"maxntidx", i32 128}
!6 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!7 = distinct !DISubprogram(name: "kernel", linkageName: "kernel", scope: !3, file: !3, line: 1487, type: !8, scopeLine: 1487, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2)
!8 = !DISubroutineType(cc: DW_CC_normal, types: !9)
!9 = !{}
!10 = !DILocation(line: 1490, column: 16, scope: !7)
!11 = !DILocation(line: 1490, column: 36, scope: !7)
!12 = !DILocation(line: 1492, column: 12, scope: !7)
!13 = !DILocation(line: 1493, column: 21, scope: !7)
!14 = !DILocation(line: 1493, column: 4, scope: !7)
