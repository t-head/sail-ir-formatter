; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @denormal_fp_math_f32_func_preserve_sign() #0 {
  ret void
}

attributes #0 = { "denormal-fp-math-f32"="preserve-sign" }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

