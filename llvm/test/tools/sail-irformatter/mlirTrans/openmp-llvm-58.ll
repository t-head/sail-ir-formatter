; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8

declare void @copy_i32(ptr, ptr)

declare void @copy_f32(ptr, ptr)

define void @single_copyprivate(ptr %0, ptr %1) {
  %3 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  %4 = call i32 @__kmpc_single(ptr @1, i32 %omp_global_thread_num)
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %omp_region.body, label %omp_region.end

omp_region.body:                                  ; preds = %2
  br label %omp.single.region

omp.single.region:                                ; preds = %omp_region.body
  %6 = load i32, ptr %0, align 4
  %7 = add i32 %6, %6
  store i32 %7, ptr %0, align 4
  %8 = load float, ptr %1, align 4
  %9 = fadd float %8, %8
  store float %9, ptr %1, align 4
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.single.region
  store i32 1, ptr %3, align 4
  call void @__kmpc_end_single(ptr @1, i32 %omp_global_thread_num)
  br label %omp_region.end

omp_region.end:                                   ; preds = %2, %omp.region.cont
  %omp_global_thread_num1 = call i32 @__kmpc_global_thread_num(ptr @1)
  %10 = load i32, ptr %3, align 4
  call void @__kmpc_copyprivate(ptr @1, i32 %omp_global_thread_num1, i64 0, ptr %0, ptr @copy_i32, i32 %10)
  %omp_global_thread_num2 = call i32 @__kmpc_global_thread_num(ptr @1)
  %11 = load i32, ptr %3, align 4
  call void @__kmpc_copyprivate(ptr @1, i32 %omp_global_thread_num2, i64 0, ptr %1, ptr @copy_f32, i32 %11)
  ret void
}

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #0

; Function Attrs: convergent nounwind
declare i32 @__kmpc_single(ptr, i32) #1

; Function Attrs: convergent nounwind
declare void @__kmpc_end_single(ptr, i32) #1

; Function Attrs: nounwind
declare void @__kmpc_copyprivate(ptr, i32, i64, ptr, ptr, i32) #0

attributes #0 = { nounwind }
attributes #1 = { convergent nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

