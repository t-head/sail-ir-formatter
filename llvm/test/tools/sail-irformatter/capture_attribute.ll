; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"

; CHECK-LABLE: kernel
; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
; CHECK: define ptx_kernel void @kernel(i8 addrspace(1)* readnone %0, i8 addrspace(1)* readnone %1) local_unnamed_addr #0 !dbg !6 {
define ptx_kernel void @kernel(ptr addrspace(1) readnone captures(none) %0, ptr addrspace(1) readnone captures(none) %1) local_unnamed_addr #0 !dbg !6 {
  ret void, !dbg !9
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}
!nvvm.annotations = !{!4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 4, !"nvvm-reflect-ftz", i32 1}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "triton", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly)
!3 = !DIFile(filename: "test_core.py", directory: "/mnt/ssd/yjl/repo/triton/python/test/unit/language")
!4 = !{ptr @kernel, !"reqntidx", i32 128}
!5 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!6 = distinct !DISubprogram(name: "kernel", linkageName: "kernel", scope: !3, file: !3, line: 313, type: !7, scopeLine: 313, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2)
!7 = !DISubroutineType(cc: DW_CC_normal, types: !8)
!8 = !{}
!9 = !DILocation(line: 314, column: 4, scope: !6)
