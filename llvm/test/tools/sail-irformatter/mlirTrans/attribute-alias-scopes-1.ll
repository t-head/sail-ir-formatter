; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @noalias_intr_only() {
  call void @llvm.experimental.noalias.scope.decl(metadata !1)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #0

attributes #0 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"The domain"}

