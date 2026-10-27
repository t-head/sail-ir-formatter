; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @omp_atomic_update(ptr %0, i32 %1, ptr %2, i1 %3) {
  %x.new.val = alloca i32, align 4
  br label %entry

entry:                                            ; preds = %4
  %.atomic.load = load atomic i32, ptr %0 monotonic, align 4
  br label %.atomic.cont

.atomic.cont:                                     ; preds = %.atomic.cont, %entry
  %5 = phi i32 [ %.atomic.load, %entry ], [ %9, %.atomic.cont ]
  %6 = mul i32 %5, %1
  store i32 %6, ptr %x.new.val, align 4
  %7 = load i32, ptr %x.new.val, align 4
  %8 = cmpxchg ptr %0, i32 %5, i32 %7 monotonic monotonic, align 4
  %9 = extractvalue { i32, i1 } %8, 0
  %10 = extractvalue { i32, i1 } %8, 1
  br i1 %10, label %.atomic.exit, label %.atomic.cont

.atomic.exit:                                     ; preds = %.atomic.cont
  %11 = atomicrmw add ptr %0, i32 %1 monotonic, align 4
  %12 = add i32 %11, %1
  ret void
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

