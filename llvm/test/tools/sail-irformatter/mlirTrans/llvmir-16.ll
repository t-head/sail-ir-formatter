; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

;CHECK: @take_self_address = linkonce global { i32, i8* } { i32 0, i8* bitcast ({ i32, i8* }* @take_self_address to i8*) }
@take_self_address = linkonce global { i32, ptr } { i32 0, ptr @take_self_address }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

