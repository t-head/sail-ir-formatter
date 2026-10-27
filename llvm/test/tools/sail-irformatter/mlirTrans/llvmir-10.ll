; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @callFreezeOp(i32 %0) {
  %2 = freeze i32 %0
  %3 = freeze i32 undef
  %4 = freeze i32 poison
  ret void
}

define i64 @freezeUsed(i32 %0) {
  %2 = freeze i32 %0
  %3 = sext i32 %2 to i64
  ret i64 %3
}

define i1 @boolConstArg() {
  ret i1 false
}

define void @callFenceInst() {
  fence syncscope("agent") release
  fence release
  fence release
  ret void
}

; Function Attrs: null_pointer_is_valid alignstack(4)
define void @passthrough() #0 {
  ret void
}

attributes #0 = { null_pointer_is_valid alignstack=4 "foo"="bar" }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

