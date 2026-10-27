; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @omp_atomic_update_ordering(ptr %0, i32 %1) {
  %x.new.val = alloca i32, align 4
  br label %entry

entry:                                            ; preds = %2
  %.atomic.load = load atomic i32, ptr %0 monotonic, align 4
  br label %.atomic.cont

.atomic.cont:                                     ; preds = %.atomic.cont, %entry
  %3 = phi i32 [ %.atomic.load, %entry ], [ %7, %.atomic.cont ]
  %4 = shl i32 %1, %3
  store i32 %4, ptr %x.new.val, align 4
  %5 = load i32, ptr %x.new.val, align 4
  %6 = cmpxchg ptr %0, i32 %3, i32 %5 monotonic monotonic, align 4
  %7 = extractvalue { i32, i1 } %6, 0
  %8 = extractvalue { i32, i1 } %6, 1
  br i1 %8, label %.atomic.exit, label %.atomic.cont

.atomic.exit:                                     ; preds = %.atomic.cont
  ret void
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

