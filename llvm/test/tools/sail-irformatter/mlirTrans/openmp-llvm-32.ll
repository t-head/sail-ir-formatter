; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8

declare void @body(i64)

define void @test_omp_wsloop_auto_ordered(i64 %0, i64 %1, i64 %2) {
  %p.lastiter = alloca i32, align 4
  %p.lowerbound = alloca i64, align 8
  %p.upperbound = alloca i64, align 8
  %p.stride = alloca i64, align 8
  br label %entry

entry:                                            ; preds = %3
  %4 = icmp slt i64 %2, 0
  %5 = sub i64 0, %2
  %6 = select i1 %4, i64 %5, i64 %2
  %7 = select i1 %4, i64 %1, i64 %0
  %8 = select i1 %4, i64 %0, i64 %1
  %9 = sub nsw i64 %8, %7
  %10 = icmp sle i64 %8, %7
  %11 = sub i64 %9, 1
  %12 = udiv i64 %11, %6
  %13 = add i64 %12, 1
  %14 = icmp ule i64 %9, %6
  %15 = select i1 %14, i64 1, i64 %13
  %omp_loop.tripcount = select i1 %10, i64 0, i64 %15
  br label %omp_loop.preheader

omp_loop.preheader:                               ; preds = %entry
  store i64 1, ptr %p.lowerbound, align 4
  store i64 %omp_loop.tripcount, ptr %p.upperbound, align 4
  store i64 1, ptr %p.stride, align 4
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_dispatch_init_8u(ptr @1, i32 %omp_global_thread_num, i32 70, i64 1, i64 %omp_loop.tripcount, i64 1, i64 1)
  br label %omp_loop.preheader.outer.cond

omp_loop.header:                                  ; preds = %omp_loop.preheader.outer.cond, %omp_loop.inc
  %omp_loop.iv = phi i64 [ %lb, %omp_loop.preheader.outer.cond ], [ %omp_loop.next, %omp_loop.inc ]
  br label %omp_loop.cond

omp_loop.cond:                                    ; preds = %omp_loop.header
  %ub = load i64, ptr %p.upperbound, align 4
  %omp_loop.cmp = icmp ult i64 %omp_loop.iv, %ub
  br i1 %omp_loop.cmp, label %omp_loop.body, label %omp_loop.preheader.outer.cond

omp_loop.body:                                    ; preds = %omp_loop.cond
  %16 = mul i64 %omp_loop.iv, %2
  %17 = add i64 %16, %0
  br label %omp.wsloop.region

omp.wsloop.region:                                ; preds = %omp_loop.body
  call void @body(i64 %17)
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.wsloop.region
  br label %omp_loop.inc

omp_loop.inc:                                     ; preds = %omp.region.cont
  %omp_loop.next = add nuw i64 %omp_loop.iv, 1
  call void @__kmpc_dispatch_fini_8u(ptr @1, i32 %omp_global_thread_num)
  br label %omp_loop.header

omp_loop.exit:                                    ; preds = %omp_loop.preheader.outer.cond
  %omp_global_thread_num1 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num1)
  br label %omp_loop.after

omp_loop.after:                                   ; preds = %omp_loop.exit
  ret void

omp_loop.preheader.outer.cond:                    ; preds = %omp_loop.cond, %omp_loop.preheader
  %18 = call i32 @__kmpc_dispatch_next_8u(ptr @1, i32 %omp_global_thread_num, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride)
  %19 = icmp ne i32 %18, 0
  %20 = load i64, ptr %p.lowerbound, align 4
  %lb = sub i64 %20, 1
  br i1 %19, label %omp_loop.header, label %omp_loop.exit
}

; Function Attrs: nounwind
declare void @__kmpc_dispatch_init_8u(ptr, i32, i32, i64, i64, i64, i64) #0

; Function Attrs: nounwind
declare i32 @__kmpc_dispatch_next_8u(ptr, i32, ptr, ptr, ptr, ptr) #0

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #0

; Function Attrs: nounwind
declare void @__kmpc_dispatch_fini_8u(ptr, i32) #0

; Function Attrs: convergent nounwind
declare void @__kmpc_barrier(ptr, i32) #1

attributes #0 = { nounwind }
attributes #1 = { convergent nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

