; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define <8 x i1> @genbool_1d() {
  ret <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 false, i1 false, i1 false, i1 false>
}

define [4 x <4 x i1>] @genbool_2d() {
  ret [4 x <4 x i1>] [<4 x i1> <i1 true, i1 true, i1 false, i1 false>, <4 x i1> <i1 true, i1 true, i1 false, i1 false>, <4 x i1> zeroinitializer, <4 x i1> zeroinitializer]
}

define [2 x [3 x <4 x i1>]] @genbool_3d() {
  ret [2 x [3 x <4 x i1>]] [[3 x <4 x i1>] [<4 x i1> <i1 true, i1 true, i1 true, i1 false>, <4 x i1> zeroinitializer, <4 x i1> zeroinitializer], [3 x <4 x i1>] zeroinitializer]
}

define <8 x i1> @genbool_1d_var_but_constant() {
  ret <8 x i1> zeroinitializer
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
