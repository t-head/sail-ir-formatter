; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@i = internal global i32 0
@j = internal global i32 0
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8
@.gomp_critical_user_.reduction.var = common global [8 x i32] zeroinitializer, align 8

define void @main() {
  %p.lastiter = alloca i32, align 4
  %p.lowerbound = alloca i32, align 4
  %p.upperbound = alloca i32, align 4
  %p.stride = alloca i32, align 4
  %red.array = alloca [2 x ptr], align 8
  br label %entry

entry:                                            ; preds = %0
  %1 = call ptr @malloc(i64 4)
  store i32 0, ptr %1, align 4
  %2 = alloca ptr, align 8
  store ptr %1, ptr %2, align 8
  %3 = call ptr @malloc(i64 4)
  store i32 0, ptr %3, align 4
  %4 = alloca ptr, align 8
  store ptr %3, ptr %4, align 8
  br label %omp_loop.preheader

omp_loop.preheader:                               ; preds = %entry
  store i32 0, ptr %p.lowerbound, align 4
  store i32 9, ptr %p.upperbound, align 4
  store i32 1, ptr %p.stride, align 4
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_4u(ptr @1, i32 %omp_global_thread_num, i32 34, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride, i32 1, i32 0)
  %5 = load i32, ptr %p.lowerbound, align 4
  %6 = load i32, ptr %p.upperbound, align 4
  %7 = sub i32 %6, %5
  %8 = add i32 %7, 1
  br label %omp_loop.header

omp_loop.header:                                  ; preds = %omp_loop.inc, %omp_loop.preheader
  %omp_loop.iv = phi i32 [ 0, %omp_loop.preheader ], [ %omp_loop.next, %omp_loop.inc ]
  br label %omp_loop.cond

omp_loop.cond:                                    ; preds = %omp_loop.header
  %omp_loop.cmp = icmp ult i32 %omp_loop.iv, %8
  br i1 %omp_loop.cmp, label %omp_loop.body, label %omp_loop.exit

omp_loop.body:                                    ; preds = %omp_loop.cond
  %9 = add i32 %omp_loop.iv, %5
  %10 = mul i32 %9, 1
  %11 = add i32 %10, 0
  br label %omp.wsloop.region

omp.wsloop.region:                                ; preds = %omp_loop.body
  store i32 -1, ptr %1, align 4
  store i32 -1, ptr %3, align 4
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.wsloop.region
  br label %omp_loop.inc

omp_loop.inc:                                     ; preds = %omp.region.cont
  %omp_loop.next = add nuw i32 %omp_loop.iv, 1
  br label %omp_loop.header

omp_loop.exit:                                    ; preds = %omp_loop.cond
  call void @__kmpc_for_static_fini(ptr @1, i32 %omp_global_thread_num)
  %omp_global_thread_num1 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num1)
  br label %omp_loop.after

omp_loop.after:                                   ; preds = %omp_loop.exit
  %red.array.elem.0 = getelementptr inbounds [2 x ptr], ptr %red.array, i64 0, i64 0
  store ptr %2, ptr %red.array.elem.0, align 8
  %red.array.elem.1 = getelementptr inbounds [2 x ptr], ptr %red.array, i64 0, i64 1
  store ptr %4, ptr %red.array.elem.1, align 8
  %omp_global_thread_num2 = call i32 @__kmpc_global_thread_num(ptr @1)
  %reduce = call i32 @__kmpc_reduce(ptr @1, i32 %omp_global_thread_num2, i32 2, i64 16, ptr %red.array, ptr @.omp.reduction.func, ptr @.gomp_critical_user_.reduction.var)
  switch i32 %reduce, label %reduce.finalize [
    i32 1, label %reduce.switch.nonatomic
    i32 2, label %reduce.switch.atomic
  ]

reduce.finalize:                                  ; preds = %reduce.switch.nonatomic, %omp_loop.after
  %omp_global_thread_num3 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num3)
  %12 = load ptr, ptr %2, align 8
  call void @free(ptr %12)
  %13 = load ptr, ptr %4, align 8
  call void @free(ptr %13)
  ret void

reduce.switch.nonatomic:                          ; preds = %omp_loop.after
  %red.private.value.0 = load ptr, ptr %2, align 8
  %14 = load i32, ptr @i, align 4
  %15 = load i32, ptr %red.private.value.0, align 4
  %16 = add i32 %14, %15
  store i32 %16, ptr @i, align 4
  %red.private.value.1 = load ptr, ptr %4, align 8
  %17 = load i32, ptr @j, align 4
  %18 = load i32, ptr %red.private.value.1, align 4
  %19 = add i32 %17, %18
  store i32 %19, ptr @j, align 4
  call void @__kmpc_end_reduce(ptr @1, i32 %omp_global_thread_num2, ptr @.gomp_critical_user_.reduction.var)
  br label %reduce.finalize

reduce.switch.atomic:                             ; preds = %omp_loop.after
  unreachable
}

declare ptr @malloc(i64)

declare void @free(ptr)

; Function Attrs: nounwind
declare void @__kmpc_for_static_init_4u(ptr, i32, i32, ptr, ptr, ptr, ptr, i32, i32) #0

; Function Attrs: nounwind
declare void @__kmpc_for_static_fini(ptr, i32) #0

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #0

; Function Attrs: convergent nounwind
declare void @__kmpc_barrier(ptr, i32) #1

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

attributes #0 = { nounwind }
attributes #1 = { convergent nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
