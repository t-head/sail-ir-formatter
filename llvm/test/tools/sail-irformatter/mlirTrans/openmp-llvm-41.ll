; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8

define void @omp_atomic_read(ptr %0, ptr %1) {
  %omp.atomic.read = load atomic i32, ptr %0 monotonic, align 4
  store i32 %omp.atomic.read, ptr %1, align 4
  %omp.atomic.read1 = load atomic i32, ptr %0 seq_cst, align 4
  call void @__kmpc_flush(ptr @1)
  store i32 %omp.atomic.read1, ptr %1, align 4
  %omp.atomic.read2 = load atomic i32, ptr %0 acquire, align 4
  call void @__kmpc_flush(ptr @1)
  store i32 %omp.atomic.read2, ptr %1, align 4
  %omp.atomic.read3 = load atomic i32, ptr %0 monotonic, align 4
  store i32 %omp.atomic.read3, ptr %1, align 4
  ret void
}

; Function Attrs: convergent nounwind
declare void @__kmpc_flush(ptr) #0

attributes #0 = { convergent nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

