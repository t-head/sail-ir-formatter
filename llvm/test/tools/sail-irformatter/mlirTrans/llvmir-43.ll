; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @streaming_compatible_func() #0 {
  ret void
}

attributes #0 = { "aarch64_pstate_sm_compatible" }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

