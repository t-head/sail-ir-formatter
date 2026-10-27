; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @variadic() {
  %1 = alloca float, i8 1, align 4
  call void (...) @llvm.localescape(ptr %1, ptr %1)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.localescape(...) #0

attributes #0 = { nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}






