; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@partially_zeroinit_aggregate = linkonce global { i32, i64, [3 x i8] } { i32 0, i64 1, [3 x i8] zeroinitializer }

; CHECK-LABLE: zeroinit_complex_local_aggregate
define void @zeroinit_complex_local_aggregate() {
  ; CHECK: %{{.+}} = alloca [1000 x { i32, [3 x { double, <4 x i8*>, [2 x i8*] }], [6 x i8*] }], i64 1, align 32
  %1 = alloca [1000 x { i32, [3 x { double, <4 x ptr>, [2 x ptr] }], [6 x ptr] }], i64 1, align 32
  ; CHECK: store [1000 x { i32, [3 x { double, <4 x i8*>, [2 x i8*] }], [6 x i8*] }] zeroinitializer, [1000 x { i32, [3 x { double, <4 x i8*>, [2 x i8*] }], [6 x i8*] }]* %{{.+}}, align 32
  store [1000 x { i32, [3 x { double, <4 x ptr>, [2 x ptr] }], [6 x ptr] }] zeroinitializer, ptr %1, align 32
  ret void
}

!llvm.module.flags = !{!0}
!llvm.linker.options = !{!1, !2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!"/DEFAULTLIB:", !"libcmt"}
!2 = !{!"/DEFAULTLIB:", !"libcmtd"}

