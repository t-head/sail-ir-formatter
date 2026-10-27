; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @switch_args(i32 %0) {
  switch i32 %0, label %2 [
    i32 -1, label %3
    i32 1, label %5
  ]

2:                                                ; preds = %1
  ret i32 %0

3:                                                ; preds = %1
  %4 = phi i32 [ 5, %1 ]
  ret i32 7

5:                                                ; preds = %1
  %6 = phi i32 [ 7, %1 ]
  %7 = phi i32 [ 11, %1 ]
  ret i32 %6
}

define i32 @switch_weights(i32 %0) {
  switch i32 %0, label %2 [
    i32 9, label %4
    i32 99, label %7
  ], !prof !1

2:                                                ; preds = %1
  %3 = phi i32 [ 19, %1 ]
  ret i32 %3

4:                                                ; preds = %1
  %5 = phi i32 [ 23, %1 ]
  %6 = phi i32 [ 29, %1 ]
  ret i32 %6

7:                                                ; preds = %1
  ret i32 %0
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!"branch_weights", i32 13, i32 17, i32 19}

