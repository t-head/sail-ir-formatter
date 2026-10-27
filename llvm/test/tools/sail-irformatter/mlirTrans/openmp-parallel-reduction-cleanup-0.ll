; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@i = internal global i32 0
@j = internal global i32 0
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@.gomp_critical_user_.reduction.var = common global [8 x i32] zeroinitializer, align 8

define void @main() {
  br label %entry

entry:                                            ; preds = %0
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 0, ptr @main..omp_par)
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit
  ret void
}

; Function Attrs: nounwind
define internal void @main..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr) #0 {
omp.par.entry:
  %tid.addr.local = alloca i32, align 4
  %0 = load i32, ptr %tid.addr, align 4
  store i32 %0, ptr %tid.addr.local, align 4
  %tid = load i32, ptr %tid.addr.local, align 4
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %red.array = alloca [2 x ptr], align 8
  br label %omp.reduction.init

omp.reduction.init:                               ; preds = %omp.par.entry
  %3 = call ptr @malloc(i64 4)
  store i32 0, ptr %3, align 4
  store ptr %3, ptr %1, align 8
  %4 = call ptr @malloc(i64 4)
  store i32 0, ptr %4, align 4
  store ptr %4, ptr %2, align 8
  br label %omp.par.region

omp.par.region:                                   ; preds = %omp.reduction.init
  br label %omp.par.region1

omp.par.region1:                                  ; preds = %omp.par.region
  store i32 -1, ptr %3, align 4
  store i32 -1, ptr %4, align 4
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.par.region1
  %red.array.elem.0 = getelementptr inbounds [2 x ptr], ptr %red.array, i64 0, i64 0
  store ptr %1, ptr %red.array.elem.0, align 8
  %red.array.elem.1 = getelementptr inbounds [2 x ptr], ptr %red.array, i64 0, i64 1
  store ptr %2, ptr %red.array.elem.1, align 8
  %omp_global_thread_num2 = call i32 @__kmpc_global_thread_num(ptr @1)
  %reduce = call i32 @__kmpc_reduce(ptr @1, i32 %omp_global_thread_num2, i32 2, i64 16, ptr %red.array, ptr @.omp.reduction.func, ptr @.gomp_critical_user_.reduction.var)
  switch i32 %reduce, label %reduce.finalize [
    i32 1, label %reduce.switch.nonatomic
    i32 2, label %reduce.switch.atomic
  ]

reduce.switch.atomic:                             ; preds = %omp.region.cont
  unreachable

reduce.switch.nonatomic:                          ; preds = %omp.region.cont
  %red.private.value.0 = load ptr, ptr %1, align 8
  %5 = load i32, ptr @i, align 4
  %6 = load i32, ptr %red.private.value.0, align 4
  %7 = add i32 %5, %6
  store i32 %7, ptr @i, align 4
  %red.private.value.1 = load ptr, ptr %2, align 8
  %8 = load i32, ptr @j, align 4
  %9 = load i32, ptr %red.private.value.1, align 4
  %10 = add i32 %8, %9
  store i32 %10, ptr @j, align 4
  call void @__kmpc_end_reduce(ptr @1, i32 %omp_global_thread_num2, ptr @.gomp_critical_user_.reduction.var)
  br label %reduce.finalize

reduce.finalize:                                  ; preds = %reduce.switch.nonatomic, %omp.region.cont
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %reduce.finalize
  %11 = load ptr, ptr %1, align 8
  call void @free(ptr %11)
  %12 = load ptr, ptr %2, align 8
  call void @free(ptr %12)
  br label %omp.par.outlined.exit.exitStub

omp.par.outlined.exit.exitStub:                   ; preds = %omp.par.pre_finalize
  ret void
}

declare ptr @malloc(i64)

declare void @free(ptr)

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #0

define internal void @.omp.reduction.func(ptr %0, ptr %1) {
  %3 = getelementptr inbounds [2 x ptr], ptr %0, i64 0, i64 0
  %4 = load ptr, ptr %3, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds [2 x ptr], ptr %1, i64 0, i64 0
  %7 = load ptr, ptr %6, align 8
  %8 = load ptr, ptr %7, align 8
  %9 = load i32, ptr %5, align 4
  %10 = load i32, ptr %8, align 4
  %11 = add i32 %9, %10
  store i32 %11, ptr %5, align 4
  %12 = getelementptr inbounds [2 x ptr], ptr %0, i64 0, i64 1
  %13 = load ptr, ptr %12, align 8
  %14 = load ptr, ptr %13, align 8
  %15 = getelementptr inbounds [2 x ptr], ptr %1, i64 0, i64 1
  %16 = load ptr, ptr %15, align 8
  %17 = load ptr, ptr %16, align 8
  %18 = load i32, ptr %14, align 4
  %19 = load i32, ptr %17, align 4
  %20 = add i32 %18, %19
  store i32 %20, ptr %14, align 4
  ret void
}

; Function Attrs: convergent nounwind
declare i32 @__kmpc_reduce(ptr, i32, i32, i64, ptr, ptr, ptr) #1

; Function Attrs: convergent nounwind
declare void @__kmpc_end_reduce(ptr, i32, ptr) #1

; Function Attrs: nounwind
declare !callback !1 void @__kmpc_fork_call(ptr, i32, ptr, ...) #0

attributes #0 = { nounwind }
attributes #1 = { convergent nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!2}
!2 = !{i64 2, i64 -1, i64 -1, i1 true}
