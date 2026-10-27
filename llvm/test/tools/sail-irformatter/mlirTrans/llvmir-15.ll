; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

;CHECK: @forward_use_of_address = linkonce global i8* bitcast (float* @address_declared_after_use to i8*)
@forward_use_of_address = linkonce global ptr @address_declared_after_use
@address_declared_after_use = linkonce global float undef

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

