; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8

define void @collapse_wsloop_dynamic(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, ptr %9) {
  %structArg = alloca { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, align 8
  %.reloaded = alloca i32, align 4
  %.reloaded27 = alloca i32, align 4
  %.reloaded28 = alloca i32, align 4
  %.reloaded29 = alloca i32, align 4
  %.reloaded30 = alloca i32, align 4
  %.reloaded31 = alloca i32, align 4
  %.reloaded32 = alloca i32, align 4
  %.reloaded33 = alloca i32, align 4
  %.reloaded34 = alloca i32, align 4
  br label %entry

entry:                                            ; preds = %10
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  store i32 %6, ptr %.reloaded, align 4
  store i32 %3, ptr %.reloaded27, align 4
  store i32 %0, ptr %.reloaded28, align 4
  store i32 %7, ptr %.reloaded29, align 4
  store i32 %4, ptr %.reloaded30, align 4
  store i32 %1, ptr %.reloaded31, align 4
  store i32 %8, ptr %.reloaded32, align 4
  store i32 %5, ptr %.reloaded33, align 4
  store i32 %2, ptr %.reloaded34, align 4
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  %gep_.reloaded = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 0
  store ptr %.reloaded, ptr %gep_.reloaded, align 8
  %gep_.reloaded27 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 1
  store ptr %.reloaded27, ptr %gep_.reloaded27, align 8
  %gep_.reloaded28 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 2
  store ptr %.reloaded28, ptr %gep_.reloaded28, align 8
  %gep_.reloaded29 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 3
  store ptr %.reloaded29, ptr %gep_.reloaded29, align 8
  %gep_.reloaded30 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 4
  store ptr %.reloaded30, ptr %gep_.reloaded30, align 8
  %gep_.reloaded31 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 5
  store ptr %.reloaded31, ptr %gep_.reloaded31, align 8
  %gep_.reloaded32 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 6
  store ptr %.reloaded32, ptr %gep_.reloaded32, align 8
  %gep_.reloaded33 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 7
  store ptr %.reloaded33, ptr %gep_.reloaded33, align 8
  %gep_.reloaded34 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 8
  store ptr %.reloaded34, ptr %gep_.reloaded34, align 8
  %gep_ = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 9
  store ptr %9, ptr %gep_, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 1, ptr @collapse_wsloop_dynamic..omp_par, ptr %structArg)
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit
  ret void
}

; Function Attrs: nounwind
define internal void @collapse_wsloop_dynamic..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr, ptr %0) #0 {
omp.par.entry:
  %gep_.reloaded = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 0
  %loadgep_.reloaded = load ptr, ptr %gep_.reloaded, align 8
  %gep_.reloaded27 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 1
  %loadgep_.reloaded27 = load ptr, ptr %gep_.reloaded27, align 8
  %gep_.reloaded28 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 2
  %loadgep_.reloaded28 = load ptr, ptr %gep_.reloaded28, align 8
  %gep_.reloaded29 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 3
  %loadgep_.reloaded29 = load ptr, ptr %gep_.reloaded29, align 8
  %gep_.reloaded30 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 4
  %loadgep_.reloaded30 = load ptr, ptr %gep_.reloaded30, align 8
  %gep_.reloaded31 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 5
  %loadgep_.reloaded31 = load ptr, ptr %gep_.reloaded31, align 8
  %gep_.reloaded32 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 6
  %loadgep_.reloaded32 = load ptr, ptr %gep_.reloaded32, align 8
  %gep_.reloaded33 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 7
  %loadgep_.reloaded33 = load ptr, ptr %gep_.reloaded33, align 8
  %gep_.reloaded34 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 8
  %loadgep_.reloaded34 = load ptr, ptr %gep_.reloaded34, align 8
  %gep_ = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 9
  %loadgep_ = load ptr, ptr %gep_, align 8
  %p.lastiter = alloca i32, align 4
  %p.lowerbound = alloca i32, align 4
  %p.upperbound = alloca i32, align 4
  %p.stride = alloca i32, align 4
  %tid.addr.local = alloca i32, align 4
  %1 = load i32, ptr %tid.addr, align 4
  store i32 %1, ptr %tid.addr.local, align 4
  %tid = load i32, ptr %tid.addr.local, align 4
  %2 = load i32, ptr %loadgep_.reloaded, align 4
  %3 = load i32, ptr %loadgep_.reloaded27, align 4
  %4 = load i32, ptr %loadgep_.reloaded28, align 4
  %5 = load i32, ptr %loadgep_.reloaded29, align 4
  %6 = load i32, ptr %loadgep_.reloaded30, align 4
  %7 = load i32, ptr %loadgep_.reloaded31, align 4
  %8 = load i32, ptr %loadgep_.reloaded32, align 4
  %9 = load i32, ptr %loadgep_.reloaded33, align 4
  %10 = load i32, ptr %loadgep_.reloaded34, align 4
  br label %omp.reduction.init

omp.reduction.init:                               ; preds = %omp.par.entry
  br label %omp.par.region

omp.par.region:                                   ; preds = %omp.reduction.init
  br label %omp.par.region1

omp.par.region1:                                  ; preds = %omp.par.region
  %11 = icmp slt i32 %2, 0
  %12 = sub i32 0, %2
  %13 = select i1 %11, i32 %12, i32 %2
  %14 = select i1 %11, i32 %3, i32 %4
  %15 = select i1 %11, i32 %4, i32 %3
  %16 = sub nsw i32 %15, %14
  %17 = icmp sle i32 %15, %14
  %18 = sub i32 %16, 1
  %19 = udiv i32 %18, %13
  %20 = add i32 %19, 1
  %21 = icmp ule i32 %16, %13
  %22 = select i1 %21, i32 1, i32 %20
  %omp_loop.tripcount = select i1 %17, i32 0, i32 %22
  br label %omp_loop.preheader

omp_loop.preheader:                               ; preds = %omp.par.region1
  %23 = icmp slt i32 %5, 0
  %24 = sub i32 0, %5
  %25 = select i1 %23, i32 %24, i32 %5
  %26 = select i1 %23, i32 %6, i32 %7
  %27 = select i1 %23, i32 %7, i32 %6
  %28 = sub nsw i32 %27, %26
  %29 = icmp sle i32 %27, %26
  %30 = sub i32 %28, 1
  %31 = udiv i32 %30, %25
  %32 = add i32 %31, 1
  %33 = icmp ule i32 %28, %25
  %34 = select i1 %33, i32 1, i32 %32
  %omp_loop.tripcount2 = select i1 %29, i32 0, i32 %34
  %35 = icmp slt i32 %8, 0
  %36 = sub i32 0, %8
  %37 = select i1 %35, i32 %36, i32 %8
  %38 = select i1 %35, i32 %9, i32 %10
  %39 = select i1 %35, i32 %10, i32 %9
  %40 = sub nsw i32 %39, %38
  %41 = icmp sle i32 %39, %38
  %42 = sub i32 %40, 1
  %43 = udiv i32 %42, %37
  %44 = add i32 %43, 1
  %45 = icmp ule i32 %40, %37
  %46 = select i1 %45, i32 1, i32 %44
  %omp_loop.tripcount13 = select i1 %41, i32 0, i32 %46
  %47 = mul nuw i32 %omp_loop.tripcount, %omp_loop.tripcount2
  %48 = mul nuw i32 %47, %omp_loop.tripcount13
  br label %omp_collapsed.preheader

omp_collapsed.preheader:                          ; preds = %omp_loop.preheader
  store i32 1, ptr %p.lowerbound, align 4
  store i32 %48, ptr %p.upperbound, align 4
  store i32 1, ptr %p.stride, align 4
  %omp_global_thread_num25 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_dispatch_init_4u(ptr @1, i32 %omp_global_thread_num25, i32 1073741859, i32 1, i32 %48, i32 1, i32 1)
  br label %omp_collapsed.preheader.outer.cond

omp_collapsed.preheader.outer.cond:               ; preds = %omp_collapsed.cond, %omp_collapsed.preheader
  %49 = call i32 @__kmpc_dispatch_next_4u(ptr @1, i32 %omp_global_thread_num25, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride)
  %50 = icmp ne i32 %49, 0
  %51 = load i32, ptr %p.lowerbound, align 4
  %lb = sub i32 %51, 1
  br i1 %50, label %omp_collapsed.header, label %omp_collapsed.exit

omp_collapsed.exit:                               ; preds = %omp_collapsed.preheader.outer.cond
  %omp_global_thread_num26 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num26)
  br label %omp_collapsed.after

omp_collapsed.after:                              ; preds = %omp_collapsed.exit
  br label %omp_loop.after

omp_loop.after:                                   ; preds = %omp_collapsed.after
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp_loop.after
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont
  br label %omp.par.outlined.exit.exitStub

omp_collapsed.header:                             ; preds = %omp_collapsed.preheader.outer.cond, %omp_collapsed.inc
  %omp_collapsed.iv = phi i32 [ %lb, %omp_collapsed.preheader.outer.cond ], [ %omp_collapsed.next, %omp_collapsed.inc ]
  br label %omp_collapsed.cond

omp_collapsed.cond:                               ; preds = %omp_collapsed.header
  %ub = load i32, ptr %p.upperbound, align 4
  %omp_collapsed.cmp = icmp ult i32 %omp_collapsed.iv, %ub
  br i1 %omp_collapsed.cmp, label %omp_collapsed.body, label %omp_collapsed.preheader.outer.cond

omp_collapsed.body:                               ; preds = %omp_collapsed.cond
  %52 = urem i32 %omp_collapsed.iv, %omp_loop.tripcount13
  %53 = udiv i32 %omp_collapsed.iv, %omp_loop.tripcount13
  %54 = urem i32 %53, %omp_loop.tripcount2
  %55 = udiv i32 %53, %omp_loop.tripcount2
  br label %omp_loop.body

omp_loop.body:                                    ; preds = %omp_collapsed.body
  %56 = mul i32 %55, %2
  %57 = add i32 %56, %4
  br label %omp_loop.preheader3

omp_loop.preheader3:                              ; preds = %omp_loop.body
  br label %omp_loop.body6

omp_loop.body6:                                   ; preds = %omp_loop.preheader3
  %58 = mul i32 %54, %5
  %59 = add i32 %58, %7
  br label %omp_loop.preheader14

omp_loop.preheader14:                             ; preds = %omp_loop.body6
  br label %omp_loop.body17

omp_loop.body17:                                  ; preds = %omp_loop.preheader14
  %60 = mul i32 %52, %8
  %61 = add i32 %60, %10
  br label %omp.wsloop.region

omp.wsloop.region:                                ; preds = %omp_loop.body17
  %62 = load i32, ptr %loadgep_, align 4
  %63 = add i32 %62, %57
  %64 = add i32 %63, %59
  %65 = add i32 %64, %61
  store i32 %65, ptr %loadgep_, align 4
  br label %omp.region.cont24

omp.region.cont24:                                ; preds = %omp.wsloop.region
  br label %omp_loop.after20

omp_loop.after20:                                 ; preds = %omp.region.cont24
  br label %omp_loop.after9

omp_loop.after9:                                  ; preds = %omp_loop.after20
  br label %omp_collapsed.inc

omp_collapsed.inc:                                ; preds = %omp_loop.after9
  %omp_collapsed.next = add nuw i32 %omp_collapsed.iv, 1
  br label %omp_collapsed.header

omp.par.outlined.exit.exitStub:                   ; preds = %omp.par.pre_finalize
  ret void
}

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #0

; Function Attrs: nounwind
declare void @__kmpc_dispatch_init_4u(ptr, i32, i32, i32, i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @__kmpc_dispatch_next_4u(ptr, i32, ptr, ptr, ptr, ptr) #0

; Function Attrs: convergent nounwind
declare void @__kmpc_barrier(ptr, i32) #1

; Function Attrs: nounwind
declare !callback !1 void @__kmpc_fork_call(ptr, i32, ptr, ...) #0

attributes #0 = { nounwind }
attributes #1 = { convergent nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!2}
!2 = !{i64 2, i64 -1, i64 -1, i1 true}

