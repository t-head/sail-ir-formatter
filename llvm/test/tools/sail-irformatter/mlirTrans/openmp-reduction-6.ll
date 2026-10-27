; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8
@3 = private unnamed_addr constant %struct.ident_t { i32 0, i32 18, i32 0, i32 22, ptr @0 }, align 8
@.gomp_critical_user_.reduction.var = common global [8 x i32] zeroinitializer, align 8

define void @parallel_nested_workshare_reduction(i64 %0) {
  %structArg = alloca { ptr, ptr }, align 8
  %.reloaded = alloca i64, align 8
  %2 = alloca i32, align 4
  br label %entry

entry:                                            ; preds = %1
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  store i64 %0, ptr %.reloaded, align 4
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  %gep_.reloaded = getelementptr { ptr, ptr }, ptr %structArg, i32 0, i32 0
  store ptr %.reloaded, ptr %gep_.reloaded, align 8
  %gep_ = getelementptr { ptr, ptr }, ptr %structArg, i32 0, i32 1
  store ptr %2, ptr %gep_, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 1, ptr @parallel_nested_workshare_reduction..omp_par, ptr %structArg)
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit
  ret void
}

; Function Attrs: nounwind
define internal void @parallel_nested_workshare_reduction..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr, ptr %0) #0 {
omp.par.entry:
  %gep_.reloaded = getelementptr { ptr, ptr }, ptr %0, i32 0, i32 0
  %loadgep_.reloaded = load ptr, ptr %gep_.reloaded, align 8
  %gep_ = getelementptr { ptr, ptr }, ptr %0, i32 0, i32 1
  %loadgep_ = load ptr, ptr %gep_, align 8
  %p.lastiter = alloca i32, align 4
  %p.lowerbound = alloca i64, align 8
  %p.upperbound = alloca i64, align 8
  %p.stride = alloca i64, align 8
  %tid.addr.local = alloca i32, align 4
  %1 = load i32, ptr %tid.addr, align 4
  store i32 %1, ptr %tid.addr.local, align 4
  %tid = load i32, ptr %tid.addr.local, align 4
  %2 = load i64, ptr %loadgep_.reloaded, align 4
  %3 = alloca i32, align 4
  %red.array = alloca [1 x ptr], align 8
  br label %omp.reduction.init

omp.reduction.init:                               ; preds = %omp.par.entry
  store i32 0, ptr %3, align 4
  br label %omp.par.region

omp.par.region:                                   ; preds = %omp.reduction.init
  br label %omp.par.region1

omp.par.region1:                                  ; preds = %omp.par.region
  %4 = select i1 false, i64 %2, i64 1
  %5 = select i1 false, i64 1, i64 %2
  %6 = sub nsw i64 %5, %4
  %7 = icmp sle i64 %5, %4
  %8 = sub i64 %6, 1
  %9 = udiv i64 %8, 1
  %10 = add i64 %9, 1
  %11 = icmp ule i64 %6, 1
  %12 = select i1 %11, i64 1, i64 %10
  %omp_loop.tripcount = select i1 %7, i64 0, i64 %12
  br label %omp_loop.preheader

omp_loop.preheader:                               ; preds = %omp.par.region1
  store i64 0, ptr %p.lowerbound, align 4
  %13 = sub i64 %omp_loop.tripcount, 1
  store i64 %13, ptr %p.upperbound, align 4
  store i64 1, ptr %p.stride, align 4
  %omp_global_thread_num3 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_8u(ptr @1, i32 %omp_global_thread_num3, i32 34, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride, i64 1, i64 0)
  %14 = load i64, ptr %p.lowerbound, align 4
  %15 = load i64, ptr %p.upperbound, align 4
  %16 = sub i64 %15, %14
  %17 = add i64 %16, 1
  br label %omp_loop.header

omp_loop.header:                                  ; preds = %omp_loop.inc, %omp_loop.preheader
  %omp_loop.iv = phi i64 [ 0, %omp_loop.preheader ], [ %omp_loop.next, %omp_loop.inc ]
  br label %omp_loop.cond

omp_loop.cond:                                    ; preds = %omp_loop.header
  %omp_loop.cmp = icmp ult i64 %omp_loop.iv, %17
  br i1 %omp_loop.cmp, label %omp_loop.body, label %omp_loop.exit

omp_loop.exit:                                    ; preds = %omp_loop.cond
  call void @__kmpc_for_static_fini(ptr @1, i32 %omp_global_thread_num3)
  %omp_global_thread_num4 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num4)
  br label %omp_loop.after

omp_loop.after:                                   ; preds = %omp_loop.exit
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp_loop.after
  %red.array.elem.0 = getelementptr inbounds [1 x ptr], ptr %red.array, i64 0, i64 0
  store ptr %3, ptr %red.array.elem.0, align 8
  %omp_global_thread_num5 = call i32 @__kmpc_global_thread_num(ptr @3)
  %reduce = call i32 @__kmpc_reduce(ptr @3, i32 %omp_global_thread_num5, i32 1, i64 8, ptr %red.array, ptr @.omp.reduction.func, ptr @.gomp_critical_user_.reduction.var)
  switch i32 %reduce, label %reduce.finalize [
    i32 1, label %reduce.switch.nonatomic
    i32 2, label %reduce.switch.atomic
  ]

reduce.switch.atomic:                             ; preds = %omp.region.cont
  %18 = load i32, ptr %3, align 4
  %19 = atomicrmw add ptr %loadgep_, i32 %18 monotonic, align 4
  br label %reduce.finalize

reduce.switch.nonatomic:                          ; preds = %omp.region.cont
  %red.value.0 = load i32, ptr %loadgep_, align 4
  %red.private.value.0 = load i32, ptr %3, align 4
  %20 = add i32 %red.value.0, %red.private.value.0
  store i32 %20, ptr %loadgep_, align 4
  call void @__kmpc_end_reduce(ptr @3, i32 %omp_global_thread_num5, ptr @.gomp_critical_user_.reduction.var)
  br label %reduce.finalize

reduce.finalize:                                  ; preds = %reduce.switch.atomic, %reduce.switch.nonatomic, %omp.region.cont
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %reduce.finalize
  br label %omp.par.outlined.exit.exitStub

omp_loop.body:                                    ; preds = %omp_loop.cond
  %21 = add i64 %omp_loop.iv, %14
  %22 = mul i64 %21, 1
  %23 = add i64 %22, 1
  br label %omp.wsloop.region

omp.wsloop.region:                                ; preds = %omp_loop.body
  %24 = trunc i64 %23 to i32
  %25 = load i32, ptr %3, align 4
  %26 = add i32 %25, %24
  store i32 %26, ptr %3, align 4
  br label %omp.region.cont2

omp.region.cont2:                                 ; preds = %omp.wsloop.region
  br label %omp_loop.inc

omp_loop.inc:                                     ; preds = %omp.region.cont2
  %omp_loop.next = add nuw i64 %omp_loop.iv, 1
  br label %omp_loop.header

omp.par.outlined.exit.exitStub:                   ; preds = %omp.par.pre_finalize
  ret void
}

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #0

; Function Attrs: nounwind
declare void @__kmpc_for_static_init_8u(ptr, i32, i32, ptr, ptr, ptr, ptr, i64, i64) #0

; Function Attrs: nounwind
declare void @__kmpc_for_static_fini(ptr, i32) #0

; Function Attrs: convergent nounwind
declare void @__kmpc_barrier(ptr, i32) #1

define internal void @.omp.reduction.func(ptr %0, ptr %1) {
  %3 = getelementptr inbounds [1 x ptr], ptr %0, i64 0, i64 0
  %4 = load ptr, ptr %3, align 8
  %5 = load i32, ptr %4, align 4
  %6 = getelementptr inbounds [1 x ptr], ptr %1, i64 0, i64 0
  %7 = load ptr, ptr %6, align 8
  %8 = load i32, ptr %7, align 4
  %9 = add i32 %5, %8
  store i32 %9, ptr %4, align 4
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
