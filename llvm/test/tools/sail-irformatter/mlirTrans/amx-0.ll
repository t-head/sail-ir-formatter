; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @target(ptr %0) {
  %2 = call x86_amx @llvm.x86.tilezero.internal(i16 16, i16 16)
  call void @llvm.x86.tilestored64.internal(i16 16, i16 16, ptr %0, i64 32, x86_amx %2)
  ret void
}

; Function Attrs: nounwind
declare x86_amx @llvm.x86.tilezero.internal(i16, i16) #0

; Function Attrs: nounwind
declare void @llvm.x86.tilestored64.internal(i16, i16, ptr, i64, x86_amx) #0

attributes #0 = { nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
