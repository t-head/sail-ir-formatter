; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @duplicate_block_in_switch(i32 %0, float %1, float %2) {
  switch i32 %0, label %4 [
    i32 105, label %6
    i32 108, label %7
    i32 106, label %6
  ]

4:                                                ; preds = %3
  %5 = phi float [ %1, %3 ]
  call void @bar(float %5)
  ret void

6:                                                ; preds = %3, %3
  call void @baz()
  ret void

7:                                                ; preds = %3
  %8 = phi float [ %2, %3 ]
  call void @qux(float %8)
  ret void
}

define void @duplicate_block_with_args_in_switch(i32 %0, float %1, float %2) {
  switch i32 %0, label %4 [
    i32 106, label %7
    i32 105, label %6
    i32 108, label %9
  ]

4:                                                ; preds = %3
  %5 = phi float [ %1, %3 ]
  call void @bar(float %5)
  ret void

6:                                                ; preds = %3
  call void @baz()
  ret void

7:                                                ; preds = %9, %3
  %8 = phi float [ %10, %9 ], [ %1, %3 ]
  call void @qux(float %8)
  ret void

9:                                                ; preds = %3
  %10 = phi float [ %2, %3 ]
  br label %7
}

declare void @bar(float)

declare void @baz()

declare void @qux(float)

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

