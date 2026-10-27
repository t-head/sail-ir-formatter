; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8

define void @single_nowait(i32 %0, i32 %1, ptr %2) {
  %4 = sub i32 %0, %1
  store i32 %4, ptr %2, align 4
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  %5 = call i32 @__kmpc_single(ptr @1, i32 %omp_global_thread_num)
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %omp_region.body, label %omp_region.end

omp_region.body:                                  ; preds = %3
  br label %omp.single.region

omp.single.region:                                ; preds = %omp_region.body
  %7 = add i32 %0, %1
  store i32 %7, ptr %2, align 4
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.single.region
  call void @__kmpc_end_single(ptr @1, i32 %omp_global_thread_num)
  br label %omp_region.end

omp_region.end:                                   ; preds = %3, %omp.region.cont
  %8 = mul i32 %0, %1
  store i32 %8, ptr %2, align 4
  ret void
}

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #0

; Function Attrs: convergent nounwind
declare i32 @__kmpc_single(ptr, i32) #1

; Function Attrs: convergent nounwind
declare void @__kmpc_end_single(ptr, i32) #1

attributes #0 = { nounwind }
attributes #1 = { convergent nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

