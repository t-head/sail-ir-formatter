; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8

define void @omp_atomic_write(ptr %0, i32 %1) {
  store atomic i32 %1, ptr %0 monotonic, align 4
  store atomic i32 %1, ptr %0 seq_cst, align 4
  call void @__kmpc_flush(ptr @1)
  store atomic i32 %1, ptr %0 release, align 4
  call void @__kmpc_flush(ptr @1)
  store atomic i32 %1, ptr %0 monotonic, align 4
  ret void
}

; Function Attrs: convergent nounwind
declare void @__kmpc_flush(ptr) #0

attributes #0 = { convergent nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

