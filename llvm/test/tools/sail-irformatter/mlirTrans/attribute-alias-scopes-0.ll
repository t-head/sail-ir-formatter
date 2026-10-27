; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare void @foo(ptr)

define void @alias_scopes(ptr %0) {
  call void @llvm.experimental.noalias.scope.decl(metadata !1)
  store i32 0, ptr %0, align 4, !alias.scope !1, !noalias !4
  %2 = load i32, ptr %0, align 4, !alias.scope !7, !noalias !8
  %3 = atomicrmw add ptr %0, i32 0 monotonic, align 4, !alias.scope !9, !noalias !10
  %4 = cmpxchg ptr %0, i32 %2, i32 %3 acq_rel monotonic, align 4, !alias.scope !9
  call void @llvm.memcpy.p0.p0.i32(ptr %0, ptr %0, i32 0, i1 false), !alias.scope !9
  call void @llvm.memset.p0.i32(ptr %0, i8 42, i32 0, i1 false), !noalias !9
  call void @foo(ptr %0), !alias.scope !9
  call void @foo(ptr %0), !noalias !9
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #0

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i32, i1 immarg) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i32(ptr nocapture writeonly, i8, i32, i1 immarg) #2

attributes #0 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: write) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!2}
!2 = distinct !{!2, !3, !"The first scope"}
!3 = distinct !{!3, !"The domain"}
!4 = !{!5, !6}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !3}
!7 = !{!5}
!8 = !{!2, !6}
!9 = !{!6}
!10 = !{!2, !5}

