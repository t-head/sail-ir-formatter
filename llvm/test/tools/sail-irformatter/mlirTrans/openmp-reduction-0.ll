; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8
@3 = private unnamed_addr constant %struct.ident_t { i32 0, i32 18, i32 0, i32 22, ptr @0 }, align 8
@.gomp_critical_user_.reduction.var = common global [8 x i32] zeroinitializer, align 8

define void @simple_reduction(i64 %0, i64 %1, i64 %2) {
  %structArg = alloca { ptr, ptr, ptr, ptr }, align 8
  %.reloaded = alloca i64, align 8
  %.reloaded7 = alloca i64, align 8
  %.reloaded8 = alloca i64, align 8
  %4 = alloca i32, align 4
  br label %entry

entry:                                            ; preds = %3
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  store i64 %2, ptr %.reloaded, align 4
  store i64 %1, ptr %.reloaded7, align 4
  store i64 %0, ptr %.reloaded8, align 4
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  %gep_.reloaded = getelementptr { ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 0
  store ptr %.reloaded, ptr %gep_.reloaded, align 8
  %gep_.reloaded7 = getelementptr { ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 1
  store ptr %.reloaded7, ptr %gep_.reloaded7, align 8
  %gep_.reloaded8 = getelementptr { ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 2
  store ptr %.reloaded8, ptr %gep_.reloaded8, align 8
  %gep_ = getelementptr { ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 3
  store ptr %4, ptr %gep_, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 1, ptr @simple_reduction..omp_par, ptr %structArg)
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit
  ret void
}

; Function Attrs: nounwind
define internal void @simple_reduction..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr, ptr %0) #0 {
omp.par.entry:
  %gep_.reloaded = getelementptr { ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 0
  %loadgep_.reloaded = load ptr, ptr %gep_.reloaded, align 8
  %gep_.reloaded7 = getelementptr { ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 1
  %loadgep_.reloaded7 = load ptr, ptr %gep_.reloaded7, align 8
  %gep_.reloaded8 = getelementptr { ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 2
  %loadgep_.reloaded8 = load ptr, ptr %gep_.reloaded8, align 8
  %gep_ = getelementptr { ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 3
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
  %3 = alloca float, align 4
  %red.array = alloca [1 x ptr], align 8
  %4 = load i64, ptr %loadgep_.reloaded7, align 4
  %5 = load i64, ptr %loadgep_.reloaded8, align 4
  br label %omp.reduction.init

omp.reduction.init:                               ; preds = %omp.par.entry
  br label %omp.par.region

omp.par.region:                                   ; preds = %omp.reduction.init
  br label %omp.par.region1

omp.par.region1:                                  ; preds = %omp.par.region
  store float 0.000000e+00, ptr %3, align 4
  %6 = icmp slt i64 %2, 0
  %7 = sub i64 0, %2
  %8 = select i1 %6, i64 %7, i64 %2
  %9 = select i1 %6, i64 %4, i64 %5
  %10 = select i1 %6, i64 %5, i64 %4
  %11 = sub nsw i64 %10, %9
  %12 = icmp sle i64 %10, %9
  %13 = sub i64 %11, 1
  %14 = udiv i64 %13, %8
  %15 = add i64 %14, 1
  %16 = icmp ule i64 %11, %8
  %17 = select i1 %16, i64 1, i64 %15
  %omp_loop.tripcount = select i1 %12, i64 0, i64 %17
  br label %omp_loop.preheader

omp_loop.preheader:                               ; preds = %omp.par.region1
  store i64 0, ptr %p.lowerbound, align 4
  %18 = sub i64 %omp_loop.tripcount, 1
  store i64 %18, ptr %p.upperbound, align 4
  store i64 1, ptr %p.stride, align 4
  %omp_global_thread_num3 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_8u(ptr @1, i32 %omp_global_thread_num3, i32 34, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride, i64 1, i64 0)
  %19 = load i64, ptr %p.lowerbound, align 4
  %20 = load i64, ptr %p.upperbound, align 4
  %21 = sub i64 %20, %19
  %22 = add i64 %21, 1
  br label %omp_loop.header

omp_loop.header:                                  ; preds = %omp_loop.inc, %omp_loop.preheader
  %omp_loop.iv = phi i64 [ 0, %omp_loop.preheader ], [ %omp_loop.next, %omp_loop.inc ]
  br label %omp_loop.cond

omp_loop.cond:                                    ; preds = %omp_loop.header
  %omp_loop.cmp = icmp ult i64 %omp_loop.iv, %22
  br i1 %omp_loop.cmp, label %omp_loop.body, label %omp_loop.exit

omp_loop.exit:                                    ; preds = %omp_loop.cond
  call void @__kmpc_for_static_fini(ptr @1, i32 %omp_global_thread_num3)
  %omp_global_thread_num4 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num4)
  br label %omp_loop.after

omp_loop.after:                                   ; preds = %omp_loop.exit
  %red.array.elem.0 = getelementptr inbounds [1 x ptr], ptr %red.array, i64 0, i64 0
  store ptr %3, ptr %red.array.elem.0, align 8
  %omp_global_thread_num5 = call i32 @__kmpc_global_thread_num(ptr @3)
  %reduce = call i32 @__kmpc_reduce(ptr @3, i32 %omp_global_thread_num5, i32 1, i64 8, ptr %red.array, ptr @.omp.reduction.func, ptr @.gomp_critical_user_.reduction.var)
  switch i32 %reduce, label %reduce.finalize [
    i32 1, label %reduce.switch.nonatomic
    i32 2, label %reduce.switch.atomic
  ]

reduce.switch.atomic:                             ; preds = %omp_loop.after
  %23 = load float, ptr %3, align 4
  %24 = atomicrmw fadd ptr %loadgep_, float %23 monotonic, align 4
  br label %reduce.finalize

reduce.switch.nonatomic:                          ; preds = %omp_loop.after
  %red.value.0 = load float, ptr %loadgep_, align 4
  %red.private.value.0 = load float, ptr %3, align 4
  %25 = fadd float %red.value.0, %red.private.value.0
  store float %25, ptr %loadgep_, align 4
  call void @__kmpc_end_reduce(ptr @3, i32 %omp_global_thread_num5, ptr @.gomp_critical_user_.reduction.var)
  br label %reduce.finalize

reduce.finalize:                                  ; preds = %reduce.switch.atomic, %reduce.switch.nonatomic, %omp_loop.after
  %omp_global_thread_num6 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num6)
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %reduce.finalize
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont
  br label %omp.par.outlined.exit.exitStub

omp_loop.body:                                    ; preds = %omp_loop.cond
  %26 = add i64 %omp_loop.iv, %19
  %27 = mul i64 %26, %2
  %28 = add i64 %27, %5
  br label %omp.wsloop.region

omp.wsloop.region:                                ; preds = %omp_loop.body
  %29 = load float, ptr %3, align 4
  %30 = fadd float 2.000000e+00, %29
  store float %30, ptr %3, align 4
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
  %5 = load float, ptr %4, align 4
  %6 = getelementptr inbounds [1 x ptr], ptr %1, i64 0, i64 0
  %7 = load ptr, ptr %6, align 8
  %8 = load float, ptr %7, align 4
  %9 = fadd float %5, %8
  store float %9, ptr %4, align 4
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

