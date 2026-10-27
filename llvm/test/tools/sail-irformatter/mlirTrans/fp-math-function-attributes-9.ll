; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @no_signed_zeros_fp_math_func_false() #0 {
  ret void
}

attributes #0 = { "no-signed-zeros-fp-math"="false" }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

