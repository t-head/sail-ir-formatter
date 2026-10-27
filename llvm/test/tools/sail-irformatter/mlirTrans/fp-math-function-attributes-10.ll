; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @denormal_fp_math_func_ieee() #0 {
  ret void
}

attributes #0 = { "denormal-fp-math"="ieee" }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

