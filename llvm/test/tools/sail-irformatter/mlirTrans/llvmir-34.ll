; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @switch_empty(i32 %0) {
  switch i32 %0, label %2 [
  ]

2:                                                ; preds = %1
  ret i32 %0
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

