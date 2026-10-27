; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

; Function Attrs: noinline optnone
define void @optimize_none() #0 {
  ret void
}

attributes #0 = { noinline optnone }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

