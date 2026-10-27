; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @atomic_store_and_load(ptr %0) {
  %2 = load atomic float, ptr %0 acquire, align 4
  %3 = load atomic float, ptr %0 syncscope("singlethread") acquire, align 4
  store atomic float %2, ptr %0 release, align 4
  store atomic float %3, ptr %0 syncscope("singlethread") release, align 4
  ret void
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

