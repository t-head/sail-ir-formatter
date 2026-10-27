; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @useInlineAsm(i32 %0) {
  call void asm "foo", "r"(i32 %0)
  %2 = call i8 asm "foo", "=r,r"(i32 %0)
  %3 = call i8 asm "foo", "=r,r,r"(i32 %0, i32 %0)
  %4 = call i8 asm sideeffect "foo", "=r,r,r"(i32 %0, i32 %0)
  %5 = call i8 asm alignstack "foo", "=r,r,r"(i32 %0, i32 %0)
  %6 = call i8 asm inteldialect "foo", "=r,r,r"(i32 %0, i32 %0)
  %7 = call { i8, i8 } asm "foo", "=r,=r,r"(i32 %0)
  ret void
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

