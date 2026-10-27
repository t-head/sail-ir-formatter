; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @intflags_func(i64 %0, i64 %1) {
  %3 = add nsw i64 %0, %1
  %4 = sub nuw i64 %0, %1
  %5 = mul nuw nsw i64 %0, %1
  %6 = shl nuw nsw i64 %0, %1
  ret void
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
