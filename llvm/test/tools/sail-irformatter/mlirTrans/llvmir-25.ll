; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @nontemporal_store_and_load(ptr %0) {
  %2 = load i32, ptr %0, align 4, !invariant.load !1
  ret i32 %2
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{}

