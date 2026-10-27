; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @atomic_update_cmpxchg(ptr %0, ptr %1) {
  %x.new.val = alloca i32, align 4
  %3 = load float, ptr %1, align 4
  br label %entry

entry:                                            ; preds = %2
  %.atomic.load = load atomic i32, ptr %0 monotonic, align 4
  br label %.atomic.cont

.atomic.cont:                                     ; preds = %.atomic.cont, %entry
  %4 = phi i32 [ %.atomic.load, %entry ], [ %10, %.atomic.cont ]
  %5 = sitofp i32 %4 to float
  %6 = fadd float %5, %3
  %7 = fptosi float %6 to i32
  store i32 %7, ptr %x.new.val, align 4
  %8 = load i32, ptr %x.new.val, align 4
  %9 = cmpxchg ptr %0, i32 %4, i32 %8 monotonic monotonic, align 4
  %10 = extractvalue { i32, i1 } %9, 0
  %11 = extractvalue { i32, i1 } %9, 1
  br i1 %11, label %.atomic.exit, label %.atomic.cont

.atomic.exit:                                     ; preds = %.atomic.cont
  ret void
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

