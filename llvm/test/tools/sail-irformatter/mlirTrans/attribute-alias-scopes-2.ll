; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @self_reference() !dbg !3 {
  call void @llvm.experimental.noalias.scope.decl(metadata !6), !dbg !9
  ret void, !dbg !10
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #0

attributes #0 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }

!llvm.module.flags = !{!0}
!llvm.dbg.cu = !{!1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!2 = !DIFile(filename: "attribute-alias-scope.mlir", directory: "")
!3 = distinct !DISubprogram(scope: !2, file: !2, type: !4, spFlags: DISPFlagDefinition, unit: !1)
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8}
!9 = !DILocation(line: 24, column: 3, scope: !3)
!10 = !DILocation(line: 25, column: 3, scope: !3)
