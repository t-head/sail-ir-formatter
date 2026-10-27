; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @volatile_store_and_load() {
  %1 = alloca i32, i64 1, align 4
  store volatile i32 5, ptr %1, align 4
  %2 = load volatile i32, ptr %1, align 4
  ret void
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

