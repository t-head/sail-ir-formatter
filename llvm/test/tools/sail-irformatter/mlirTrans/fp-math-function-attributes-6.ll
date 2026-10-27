; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @approx_func_fp_math_func_true() #0 {
  ret void
}

attributes #0 = { "approx-func-fp-math"="true" }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

