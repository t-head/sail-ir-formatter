; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

; Function Attrs: vscale_range(2,8)
define void @vscale_func() #0 {
  ret void
}

attributes #0 = { vscale_range(2,8) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
