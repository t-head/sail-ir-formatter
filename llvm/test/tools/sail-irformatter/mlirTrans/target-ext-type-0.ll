; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@global = global target("spirv.DeviceEvent") zeroinitializer

define target("spirv.Event") @func2() {
  %1 = alloca target("spirv.Event"), align 8
  %2 = load target("spirv.Event"), ptr %1, align 8
  ret target("spirv.Event") poison
}

define void @func3() {
  %1 = freeze target("spirv.DeviceEvent") zeroinitializer
  ret void
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
