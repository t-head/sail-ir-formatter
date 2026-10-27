; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8

declare void @body(i32)

define void @test_omp_wsloop_static_2(i32 %0, i32 %1, i32 %2) {
  %p.lastiter = alloca i32, align 4
  %p.lowerbound = alloca i32, align 4
  %p.upperbound = alloca i32, align 4
  %p.stride = alloca i32, align 4
  br label %entry

entry:                                            ; preds = %3
  %4 = icmp slt i32 %2, 0
  %5 = sub i32 0, %2
  %6 = select i1 %4, i32 %5, i32 %2
  %7 = select i1 %4, i32 %1, i32 %0
  %8 = select i1 %4, i32 %0, i32 %1
  %9 = sub nsw i32 %8, %7
  %10 = icmp sle i32 %8, %7
  %11 = sub i32 %9, 1
  %12 = udiv i32 %11, %6
  %13 = add i32 %12, 1
  %14 = icmp ule i32 %9, %6
  %15 = select i1 %14, i32 1, i32 %13
  %omp_loop.tripcount = select i1 %10, i32 0, i32 %15
  br label %omp_loop.preheader

omp_loop.preheader:                               ; preds = %entry
  store i32 0, ptr %p.lowerbound, align 4
  %16 = sub i32 %omp_loop.tripcount, 1
  store i32 %16, ptr %p.upperbound, align 4
  store i32 1, ptr %p.stride, align 4
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_4u(ptr @1, i32 %omp_global_thread_num, i32 33, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride, i32 1, i32 2)
  %omp_firstchunk.lb = load i32, ptr %p.lowerbound, align 4
  %omp_firstchunk.ub = load i32, ptr %p.upperbound, align 4
  %17 = add i32 %omp_firstchunk.ub, 1
  %omp_chunk.range = sub i32 %17, %omp_firstchunk.lb
  %omp_dispatch.stride = load i32, ptr %p.stride, align 4
  %18 = sub nuw i32 %omp_loop.tripcount, %omp_firstchunk.lb
  %19 = icmp ule i32 %omp_loop.tripcount, %omp_firstchunk.lb
  %20 = sub i32 %18, 1
  %21 = udiv i32 %20, %omp_dispatch.stride
  %22 = add i32 %21, 1
  %23 = icmp ule i32 %18, %omp_dispatch.stride
  %24 = select i1 %23, i32 1, i32 %22
  %omp_dispatch.tripcount = select i1 %19, i32 0, i32 %24
  br label %omp_dispatch.preheader

omp_dispatch.preheader:                           ; preds = %omp_loop.preheader
  br label %omp_dispatch.header

omp_dispatch.header:                              ; preds = %omp_dispatch.inc, %omp_dispatch.preheader
  %omp_dispatch.iv = phi i32 [ 0, %omp_dispatch.preheader ], [ %omp_dispatch.next, %omp_dispatch.inc ]
  br label %omp_dispatch.cond

omp_dispatch.cond:                                ; preds = %omp_dispatch.header
  %omp_dispatch.cmp = icmp ult i32 %omp_dispatch.iv, %omp_dispatch.tripcount
  br i1 %omp_dispatch.cmp, label %omp_dispatch.body, label %omp_dispatch.exit

omp_dispatch.body:                                ; preds = %omp_dispatch.cond
  %25 = mul i32 %omp_dispatch.iv, %omp_dispatch.stride
  %26 = add i32 %25, %omp_firstchunk.lb
  br label %omp_loop.preheader1

omp_dispatch.inc:                                 ; preds = %omp_loop.exit
  %omp_dispatch.next = add nuw i32 %omp_dispatch.iv, 1
  br label %omp_dispatch.header

omp_dispatch.exit:                                ; preds = %omp_dispatch.cond
  call void @__kmpc_for_static_fini(ptr @1, i32 %omp_global_thread_num)
  %omp_global_thread_num2 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num2)
  br label %omp_dispatch.after

omp_dispatch.after:                               ; preds = %omp_dispatch.exit
  br label %omp_loop.after

omp_loop.preheader1:                              ; preds = %omp_dispatch.body
  %27 = add i32 %26, %omp_chunk.range
  %omp_chunk.is_last = icmp uge i32 %27, %omp_loop.tripcount
  %28 = sub i32 %omp_loop.tripcount, %26
  %omp_chunk.tripcount = select i1 %omp_chunk.is_last, i32 %28, i32 %omp_chunk.range
  br label %omp_loop.header

omp_loop.header:                                  ; preds = %omp_loop.inc, %omp_loop.preheader1
  %omp_loop.iv = phi i32 [ 0, %omp_loop.preheader1 ], [ %omp_loop.next, %omp_loop.inc ]
  br label %omp_loop.cond

omp_loop.cond:                                    ; preds = %omp_loop.header
  %omp_loop.cmp = icmp ult i32 %omp_loop.iv, %omp_chunk.tripcount
  br i1 %omp_loop.cmp, label %omp_loop.body, label %omp_loop.exit

omp_loop.body:                                    ; preds = %omp_loop.cond
  %29 = add i32 %omp_loop.iv, %26
  %30 = mul i32 %29, %2
  %31 = add i32 %30, %0
  br label %omp.wsloop.region

omp.wsloop.region:                                ; preds = %omp_loop.body
  call void @body(i32 %31)
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.wsloop.region
  br label %omp_loop.inc

omp_loop.inc:                                     ; preds = %omp.region.cont
  %omp_loop.next = add nuw i32 %omp_loop.iv, 1
  br label %omp_loop.header

omp_loop.exit:                                    ; preds = %omp_loop.cond
  br label %omp_dispatch.inc

omp_loop.after:                                   ; preds = %omp_dispatch.after
  ret void
}

; Function Attrs: nounwind
declare void @__kmpc_for_static_init_4u(ptr, i32, i32, ptr, ptr, ptr, ptr, i32, i32) #0

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

