; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@.gomp_critical_user_.var = common global [8 x i32] zeroinitializer, align 8
@.gomp_critical_user_mutex_none.var = common global [8 x i32] zeroinitializer, align 8
@.gomp_critical_user_mutex_uncontended.var = common global [8 x i32] zeroinitializer, align 8
@.gomp_critical_user_mutex_contended.var = common global [8 x i32] zeroinitializer, align 8
@.gomp_critical_user_mutex_nonspeculative.var = common global [8 x i32] zeroinitializer, align 8
@.gomp_critical_user_mutex_nonspeculative_uncontended.var = common global [8 x i32] zeroinitializer, align 8
@.gomp_critical_user_mutex_nonspeculative_contended.var = common global [8 x i32] zeroinitializer, align 8
@.gomp_critical_user_mutex_speculative.var = common global [8 x i32] zeroinitializer, align 8
@.gomp_critical_user_mutex_speculative_uncontended.var = common global [8 x i32] zeroinitializer, align 8
@.gomp_critical_user_mutex_speculative_contended.var = common global [8 x i32] zeroinitializer, align 8

define void @omp_critical(ptr %0, i32 %1) {
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_critical(ptr @1, i32 %omp_global_thread_num, ptr @.gomp_critical_user_.var)
  br label %omp.critical.region

omp.critical.region:                              ; preds = %2
  store i32 %1, ptr %0, align 4
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.critical.region
  call void @__kmpc_end_critical(ptr @1, i32 %omp_global_thread_num, ptr @.gomp_critical_user_.var)
  %omp_global_thread_num1 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_critical_with_hint(ptr @1, i32 %omp_global_thread_num1, ptr @.gomp_critical_user_mutex_none.var, i32 0)
  br label %omp.critical.region3

omp.critical.region3:                             ; preds = %omp.region.cont
  store i32 %1, ptr %0, align 4
  br label %omp.region.cont2

omp.region.cont2:                                 ; preds = %omp.critical.region3
  call void @__kmpc_end_critical(ptr @1, i32 %omp_global_thread_num1, ptr @.gomp_critical_user_mutex_none.var)
  %omp_global_thread_num4 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_critical_with_hint(ptr @1, i32 %omp_global_thread_num4, ptr @.gomp_critical_user_mutex_uncontended.var, i32 1)
  br label %omp.critical.region6

omp.critical.region6:                             ; preds = %omp.region.cont2
  store i32 %1, ptr %0, align 4
  br label %omp.region.cont5

omp.region.cont5:                                 ; preds = %omp.critical.region6
  call void @__kmpc_end_critical(ptr @1, i32 %omp_global_thread_num4, ptr @.gomp_critical_user_mutex_uncontended.var)
  %omp_global_thread_num7 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_critical_with_hint(ptr @1, i32 %omp_global_thread_num7, ptr @.gomp_critical_user_mutex_contended.var, i32 2)
  br label %omp.critical.region9

omp.critical.region9:                             ; preds = %omp.region.cont5
  store i32 %1, ptr %0, align 4
  br label %omp.region.cont8

omp.region.cont8:                                 ; preds = %omp.critical.region9
  call void @__kmpc_end_critical(ptr @1, i32 %omp_global_thread_num7, ptr @.gomp_critical_user_mutex_contended.var)
  %omp_global_thread_num10 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_critical_with_hint(ptr @1, i32 %omp_global_thread_num10, ptr @.gomp_critical_user_mutex_nonspeculative.var, i32 4)
  br label %omp.critical.region12

omp.critical.region12:                            ; preds = %omp.region.cont8
  store i32 %1, ptr %0, align 4
  br label %omp.region.cont11

omp.region.cont11:                                ; preds = %omp.critical.region12
  call void @__kmpc_end_critical(ptr @1, i32 %omp_global_thread_num10, ptr @.gomp_critical_user_mutex_nonspeculative.var)
  %omp_global_thread_num13 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_critical_with_hint(ptr @1, i32 %omp_global_thread_num13, ptr @.gomp_critical_user_mutex_nonspeculative_uncontended.var, i32 5)
  br label %omp.critical.region15

omp.critical.region15:                            ; preds = %omp.region.cont11
  store i32 %1, ptr %0, align 4
  br label %omp.region.cont14

omp.region.cont14:                                ; preds = %omp.critical.region15
  call void @__kmpc_end_critical(ptr @1, i32 %omp_global_thread_num13, ptr @.gomp_critical_user_mutex_nonspeculative_uncontended.var)
  %omp_global_thread_num16 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_critical_with_hint(ptr @1, i32 %omp_global_thread_num16, ptr @.gomp_critical_user_mutex_nonspeculative_contended.var, i32 6)
  br label %omp.critical.region18

omp.critical.region18:                            ; preds = %omp.region.cont14
  store i32 %1, ptr %0, align 4
  br label %omp.region.cont17

omp.region.cont17:                                ; preds = %omp.critical.region18
  call void @__kmpc_end_critical(ptr @1, i32 %omp_global_thread_num16, ptr @.gomp_critical_user_mutex_nonspeculative_contended.var)
  %omp_global_thread_num19 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_critical_with_hint(ptr @1, i32 %omp_global_thread_num19, ptr @.gomp_critical_user_mutex_speculative.var, i32 8)
  br label %omp.critical.region21

omp.critical.region21:                            ; preds = %omp.region.cont17
  store i32 %1, ptr %0, align 4
  br label %omp.region.cont20

omp.region.cont20:                                ; preds = %omp.critical.region21
  call void @__kmpc_end_critical(ptr @1, i32 %omp_global_thread_num19, ptr @.gomp_critical_user_mutex_speculative.var)
  %omp_global_thread_num22 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_critical_with_hint(ptr @1, i32 %omp_global_thread_num22, ptr @.gomp_critical_user_mutex_speculative_uncontended.var, i32 9)
  br label %omp.critical.region24

omp.critical.region24:                            ; preds = %omp.region.cont20
  store i32 %1, ptr %0, align 4
  br label %omp.region.cont23

omp.region.cont23:                                ; preds = %omp.critical.region24
  call void @__kmpc_end_critical(ptr @1, i32 %omp_global_thread_num22, ptr @.gomp_critical_user_mutex_speculative_uncontended.var)
  %omp_global_thread_num25 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_critical_with_hint(ptr @1, i32 %omp_global_thread_num25, ptr @.gomp_critical_user_mutex_speculative_contended.var, i32 10)
  br label %omp.critical.region27

omp.critical.region27:                            ; preds = %omp.region.cont23
  store i32 %1, ptr %0, align 4
  br label %omp.region.cont26

omp.region.cont26:                                ; preds = %omp.critical.region27
  call void @__kmpc_end_critical(ptr @1, i32 %omp_global_thread_num25, ptr @.gomp_critical_user_mutex_speculative_contended.var)
  ret void
}

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #0

; Function Attrs: convergent nounwind
declare void @__kmpc_critical(ptr, i32, ptr) #1

; Function Attrs: convergent nounwind
declare void @__kmpc_end_critical(ptr, i32, ptr) #1

; Function Attrs: convergent nounwind
declare void @__kmpc_critical_with_hint(ptr, i32, ptr, i32) #1

attributes #0 = { nounwind }
attributes #1 = { convergent nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

