; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare i32 @foo()

define i32 @test_none() {
  %1 = call i32 @foo()
  ret i32 %1
}

define i32 @test_default() {
  %1 = call i32 @foo()
  ret i32 %1
}

define i32 @test_musttail() {
  %1 = musttail call i32 @foo()
  ret i32 %1
}

define i32 @test_tail() {
  %1 = tail call i32 @foo()
  ret i32 %1
}

define i32 @test_notail() {
  %1 = notail call i32 @foo()
  ret i32 %1
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
