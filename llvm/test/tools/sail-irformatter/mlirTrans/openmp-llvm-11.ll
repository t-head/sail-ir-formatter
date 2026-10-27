; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8

declare void @body(i32)

define void @test_omp_wsloop_dynamic_chunk_var(i32 %0, i32 %1, i32 %2) {
  %4 = alloca i16, i64 1, align 2
  %p.lastiter = alloca i32, align 4
  %p.lowerbound = alloca i32, align 4
  %p.upperbound = alloca i32, align 4
  %p.stride = alloca i32, align 4
  %5 = load i16, ptr %4, align 2
  %6 = sext i16 %5 to i32
  br label %entry

entry:                                            ; preds = %3
  %7 = icmp slt i32 %2, 0
  %8 = sub i32 0, %2
  %9 = select i1 %7, i32 %8, i32 %2
  %10 = select i1 %7, i32 %1, i32 %0
  %11 = select i1 %7, i32 %0, i32 %1
  %12 = sub nsw i32 %11, %10
  %13 = icmp sle i32 %11, %10
  %14 = sub i32 %12, 1
  %15 = udiv i32 %14, %9
  %16 = add i32 %15, 1
  %17 = icmp ule i32 %12, %9
  %18 = select i1 %17, i32 1, i32 %16
  %omp_loop.tripcount = select i1 %13, i32 0, i32 %18
  br label %omp_loop.preheader

omp_loop.preheader:                               ; preds = %entry
  store i32 1, ptr %p.lowerbound, align 4
  store i32 %omp_loop.tripcount, ptr %p.upperbound, align 4
  store i32 1, ptr %p.stride, align 4
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_dispatch_init_4u(ptr @1, i32 %omp_global_thread_num, i32 1073741859, i32 1, i32 %omp_loop.tripcount, i32 1, i32 %6)
  br label %omp_loop.preheader.outer.cond

omp_loop.header:                                  ; preds = %omp_loop.preheader.outer.cond, %omp_loop.inc
  %omp_loop.iv = phi i32 [ %lb, %omp_loop.preheader.outer.cond ], [ %omp_loop.next, %omp_loop.inc ]
  br label %omp_loop.cond

omp_loop.cond:                                    ; preds = %omp_loop.header
  %ub = load i32, ptr %p.upperbound, align 4
  %omp_loop.cmp = icmp ult i32 %omp_loop.iv, %ub
  br i1 %omp_loop.cmp, label %omp_loop.body, label %omp_loop.preheader.outer.cond

omp_loop.body:                                    ; preds = %omp_loop.cond
  %19 = mul i32 %omp_loop.iv, %2
  %20 = add i32 %19, %0
  br label %omp.wsloop.region

omp.wsloop.region:                                ; preds = %omp_loop.body
  call void @body(i32 %20)
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.wsloop.region
  br label %omp_loop.inc

omp_loop.inc:                                     ; preds = %omp.region.cont
  %omp_loop.next = add nuw i32 %omp_loop.iv, 1
  br label %omp_loop.header

omp_loop.exit:                                    ; preds = %omp_loop.preheader.outer.cond
  %omp_global_thread_num1 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num1)
  br label %omp_loop.after

omp_loop.after:                                   ; preds = %omp_loop.exit
  ret void

omp_loop.preheader.outer.cond:                    ; preds = %omp_loop.cond, %omp_loop.preheader
  %21 = call i32 @__kmpc_dispatch_next_4u(ptr @1, i32 %omp_global_thread_num, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride)
  %22 = icmp ne i32 %21, 0
  %23 = load i32, ptr %p.lowerbound, align 4
  %lb = sub i32 %23, 1
  br i1 %22, label %omp_loop.header, label %omp_loop.exit
}

; Function Attrs: nounwind
declare void @__kmpc_dispatch_init_4u(ptr, i32, i32, i32, i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @__kmpc_dispatch_next_4u(ptr, i32, ptr, ptr, ptr, ptr) #0

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #0

; Function Attrs: convergent nounwind
declare void @__kmpc_barrier(ptr, i32) #1

attributes #0 = { nounwind }
attributes #1 = { convergent nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

