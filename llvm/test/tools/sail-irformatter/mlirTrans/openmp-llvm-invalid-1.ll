; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8

define void @omp_atomic_update_multiple_step_update(ptr %0, ptr %1, i32 %2) {
  %x.new.val = alloca i32, align 4
  br label %entry

entry:                                            ; preds = %3
  %.atomic.load = load atomic i32, ptr %0 seq_cst, align 4
  br label %.atomic.cont

.atomic.cont:                                     ; preds = %.atomic.cont, %entry
  %4 = phi i32 [ %.atomic.load, %entry ], [ %10, %.atomic.cont ]
  %5 = mul i32 %4, %2
  %6 = sdiv i32 %5, %2
  %7 = add i32 %4, %6
  store i32 %7, ptr %x.new.val, align 4
  %8 = load i32, ptr %x.new.val, align 4
  %9 = cmpxchg ptr %0, i32 %4, i32 %8 seq_cst seq_cst, align 4
  %10 = extractvalue { i32, i1 } %9, 0
  %11 = extractvalue { i32, i1 } %9, 1
  br i1 %11, label %.atomic.exit, label %.atomic.cont

.atomic.exit:                                     ; preds = %.atomic.cont
  store i32 %4, ptr %1, align 4
  call void @__kmpc_flush(ptr @1)
  ret void
}

; Function Attrs: convergent nounwind
declare void @__kmpc_flush(ptr) #0

attributes #0 = { convergent nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

