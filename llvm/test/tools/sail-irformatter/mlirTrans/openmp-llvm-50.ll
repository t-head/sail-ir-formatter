; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8

define void @omp_atomic_capture_misc(ptr %0, ptr %1, i32 %2, ptr %3, ptr %4, float %5) {
  %x.new.val = alloca float, align 4
  br label %entry

entry:                                            ; preds = %6
  %7 = atomicrmw xchg ptr %0, i32 %2 monotonic, align 4
  store i32 %7, ptr %1, align 4
  %.atomic.load = load atomic i32, ptr %3 monotonic, align 4
  br label %.atomic.cont

.atomic.cont:                                     ; preds = %.atomic.cont, %entry
  %8 = phi i32 [ %.atomic.load, %entry ], [ %11, %.atomic.cont ]
  %.atomic.fltCast = bitcast i32 %8 to float
  store float %5, ptr %x.new.val, align 4
  %9 = load i32, ptr %x.new.val, align 4
  %10 = cmpxchg ptr %3, i32 %8, i32 %9 monotonic monotonic, align 4
  %11 = extractvalue { i32, i1 } %10, 0
  %12 = extractvalue { i32, i1 } %10, 1
  br i1 %12, label %.atomic.exit, label %.atomic.cont

.atomic.exit:                                     ; preds = %.atomic.cont
  store float %.atomic.fltCast, ptr %4, align 4
  %13 = atomicrmw add ptr %0, i32 %2 seq_cst, align 4
  %14 = add i32 %13, %2
  store i32 %13, ptr %1, align 4
  call void @__kmpc_flush(ptr @1)
  %15 = atomicrmw add ptr %0, i32 %2 acquire, align 4
  %16 = add i32 %15, %2
  store i32 %15, ptr %1, align 4
  call void @__kmpc_flush(ptr @1)
  %17 = atomicrmw add ptr %0, i32 %2 release, align 4
  %18 = add i32 %17, %2
  store i32 %17, ptr %1, align 4
  call void @__kmpc_flush(ptr @1)
  %19 = atomicrmw add ptr %0, i32 %2 monotonic, align 4
  %20 = add i32 %19, %2
  store i32 %19, ptr %1, align 4
  %21 = atomicrmw add ptr %0, i32 %2 acq_rel, align 4
  %22 = add i32 %21, %2
  store i32 %21, ptr %1, align 4
  call void @__kmpc_flush(ptr @1)
  ret void
}

; Function Attrs: convergent nounwind
declare void @__kmpc_flush(ptr) #0

attributes #0 = { convergent nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

