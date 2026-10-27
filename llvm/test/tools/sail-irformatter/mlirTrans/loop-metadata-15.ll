; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @loop_annotation_with_locs() {
  br label %1, !llvm.loop !3

1:                                                ; preds = %0
  ret void
}

!llvm.module.flags = !{!0}
!llvm.dbg.cu = !{!1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = distinct !DICompileUnit(language: DW_LANG_C, file: !2, isOptimized: false, runtimeVersion: 0, emissionKind: NoDebug)
!2 = !DIFile(filename: "metadata-loop.ll", directory: "/")
!3 = distinct !{!3, !4, !6}
!4 = !DILocation(line: 42, column: 4, scope: !5)
!5 = distinct !DISubprogram(name: "loop_locs", scope: !2, file: !2, spFlags: DISPFlagDefinition, unit: !1)
!6 = !DILocation(line: 52, column: 4, scope: !5)
