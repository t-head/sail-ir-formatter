; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8

define void @repeated_successor(i64 %0, i64 %1, i64 %2, i1 %3) {
  %p.lastiter = alloca i32, align 4
  %p.lowerbound = alloca i64, align 8
  %p.upperbound = alloca i64, align 8
  %p.stride = alloca i64, align 8
  br label %entry

entry:                                            ; preds = %4
  %5 = icmp slt i64 %2, 0
  %6 = sub i64 0, %2
  %7 = select i1 %5, i64 %6, i64 %2
  %8 = select i1 %5, i64 %1, i64 %0
  %9 = select i1 %5, i64 %0, i64 %1
  %10 = sub nsw i64 %9, %8
  %11 = icmp sle i64 %9, %8
  %12 = sub i64 %10, 1
  %13 = udiv i64 %12, %7
  %14 = add i64 %13, 1
  %15 = icmp ule i64 %10, %7
  %16 = select i1 %15, i64 1, i64 %14
  %omp_loop.tripcount = select i1 %11, i64 0, i64 %16
  br label %omp_loop.preheader

omp_loop.preheader:                               ; preds = %entry
  store i64 0, ptr %p.lowerbound, align 4
  %17 = sub i64 %omp_loop.tripcount, 1
  store i64 %17, ptr %p.upperbound, align 4
  store i64 1, ptr %p.stride, align 4
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_8u(ptr @1, i32 %omp_global_thread_num, i32 34, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride, i64 1, i64 0)
  %18 = load i64, ptr %p.lowerbound, align 4
  %19 = load i64, ptr %p.upperbound, align 4
  %20 = sub i64 %19, %18
  %21 = add i64 %20, 1
  br label %omp_loop.header

omp_loop.header:                                  ; preds = %omp_loop.inc, %omp_loop.preheader
  %omp_loop.iv = phi i64 [ 0, %omp_loop.preheader ], [ %omp_loop.next, %omp_loop.inc ]
  br label %omp_loop.cond

omp_loop.cond:                                    ; preds = %omp_loop.header
  %omp_loop.cmp = icmp ult i64 %omp_loop.iv, %21
  br i1 %omp_loop.cmp, label %omp_loop.body, label %omp_loop.exit

omp_loop.body:                                    ; preds = %omp_loop.cond
  %22 = add i64 %omp_loop.iv, %18
  %23 = mul i64 %22, %2
  %24 = add i64 %23, %0
  br label %omp.wsloop.region

omp.wsloop.region2:                               ; preds = %omp.wsloop.region
  %25 = phi i64 [ %1, %omp.wsloop.region ]
  br label %omp.wsloop.region1

omp.wsloop.region1:                               ; preds = %omp.wsloop.region2, %omp.wsloop.region
  %26 = phi i64 [ %25, %omp.wsloop.region2 ], [ %0, %omp.wsloop.region ]
  br label %omp.region.cont

omp.wsloop.region:                                ; preds = %omp_loop.body
  br i1 %3, label %omp.wsloop.region1, label %omp.wsloop.region2

omp.region.cont:                                  ; preds = %omp.wsloop.region1
  br label %omp_loop.inc

omp_loop.inc:                                     ; preds = %omp.region.cont
  %omp_loop.next = add nuw i64 %omp_loop.iv, 1
  br label %omp_loop.header

omp_loop.exit:                                    ; preds = %omp_loop.cond
  call void @__kmpc_for_static_fini(ptr @1, i32 %omp_global_thread_num)
  %omp_global_thread_num3 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num3)
  br label %omp_loop.after

omp_loop.after:                                   ; preds = %omp_loop.exit
  ret void
}

; Function Attrs: nounwind
declare void @__kmpc_for_static_init_8u(ptr, i32, i32, ptr, ptr, ptr, ptr, i64, i64) #0

; Function Attrs: nounwind
declare void @__kmpc_for_static_fini(ptr, i32) #0

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #0

; Function Attrs: convergent nounwind
declare void @__kmpc_barrier(ptr, i32) #1

attributes #0 = { nounwind }
attributes #1 = { convergent nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

