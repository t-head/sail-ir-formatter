; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8

define void @omp_ordered(i32 %0, i32 %1, i32 %2, i64 %3, i64 %4, i64 %5, i64 %6) {
  %.cnt.addr48 = alloca [2 x i64], align 8
  %.cnt.addr46 = alloca [2 x i64], align 8
  %.cnt.addr44 = alloca [2 x i64], align 8
  %.cnt.addr21 = alloca [1 x i64], align 8
  %.cnt.addr = alloca [1 x i64], align 8
  %p.lastiter = alloca i32, align 4
  %p.lowerbound = alloca i32, align 4
  %p.upperbound = alloca i32, align 4
  %p.stride = alloca i32, align 4
  %p.lastiter23 = alloca i32, align 4
  %p.lowerbound24 = alloca i32, align 4
  %p.upperbound25 = alloca i32, align 4
  %p.stride26 = alloca i32, align 4
  %p.lastiter50 = alloca i32, align 4
  %p.lowerbound51 = alloca i32, align 4
  %p.upperbound52 = alloca i32, align 4
  %p.stride53 = alloca i32, align 4
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_ordered(ptr @1, i32 %omp_global_thread_num)
  br label %omp.ordered.region

omp.ordered.region:                               ; preds = %7
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.ordered.region
  call void @__kmpc_end_ordered(ptr @1, i32 %omp_global_thread_num)
  %8 = icmp slt i32 %2, 0
  %9 = sub i32 0, %2
  %10 = select i1 %8, i32 %9, i32 %2
  %11 = select i1 %8, i32 %1, i32 %0
  %12 = select i1 %8, i32 %0, i32 %1
  %13 = sub nsw i32 %12, %11
  %14 = icmp sle i32 %12, %11
  %15 = sub i32 %13, 1
  %16 = udiv i32 %15, %10
  %17 = add i32 %16, 1
  %18 = icmp ule i32 %13, %10
  %19 = select i1 %18, i32 1, i32 %17
  %omp_loop.tripcount = select i1 %14, i32 0, i32 %19
  br label %omp_loop.preheader

omp_loop.preheader:                               ; preds = %omp.region.cont
  store i32 1, ptr %p.lowerbound, align 4
  store i32 %omp_loop.tripcount, ptr %p.upperbound, align 4
  store i32 1, ptr %p.stride, align 4
  %omp_global_thread_num5 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_dispatch_init_4u(ptr @1, i32 %omp_global_thread_num5, i32 66, i32 1, i32 %omp_loop.tripcount, i32 1, i32 1)
  br label %omp_loop.preheader.outer.cond

omp_loop.header:                                  ; preds = %omp_loop.preheader.outer.cond, %omp_loop.inc
  %omp_loop.iv = phi i32 [ %lb, %omp_loop.preheader.outer.cond ], [ %omp_loop.next, %omp_loop.inc ]
  br label %omp_loop.cond

omp_loop.cond:                                    ; preds = %omp_loop.header
  %ub = load i32, ptr %p.upperbound, align 4
  %omp_loop.cmp = icmp ult i32 %omp_loop.iv, %ub
  br i1 %omp_loop.cmp, label %omp_loop.body, label %omp_loop.preheader.outer.cond

omp_loop.body:                                    ; preds = %omp_loop.cond
  %20 = mul i32 %omp_loop.iv, %2
  %21 = add i32 %20, %0
  br label %omp.wsloop.region

omp.wsloop.region:                                ; preds = %omp_loop.body
  %omp_global_thread_num2 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_ordered(ptr @1, i32 %omp_global_thread_num2)
  br label %omp.ordered.region4

omp.ordered.region4:                              ; preds = %omp.wsloop.region
  br label %omp.region.cont3

omp.region.cont3:                                 ; preds = %omp.ordered.region4
  call void @__kmpc_end_ordered(ptr @1, i32 %omp_global_thread_num2)
  br label %omp.region.cont1

omp.region.cont1:                                 ; preds = %omp.region.cont3
  br label %omp_loop.inc

omp_loop.inc:                                     ; preds = %omp.region.cont1
  %omp_loop.next = add nuw i32 %omp_loop.iv, 1
  call void @__kmpc_dispatch_fini_4u(ptr @1, i32 %omp_global_thread_num5)
  br label %omp_loop.header

omp_loop.exit:                                    ; preds = %omp_loop.preheader.outer.cond
  %omp_global_thread_num6 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num6)
  br label %omp_loop.after

omp_loop.after:                                   ; preds = %omp_loop.exit
  %22 = icmp slt i32 %2, 0
  %23 = sub i32 0, %2
  %24 = select i1 %22, i32 %23, i32 %2
  %25 = select i1 %22, i32 %1, i32 %0
  %26 = select i1 %22, i32 %0, i32 %1
  %27 = sub nsw i32 %26, %25
  %28 = icmp sle i32 %26, %25
  %29 = sub i32 %27, 1
  %30 = udiv i32 %29, %24
  %31 = add i32 %30, 1
  %32 = icmp ule i32 %27, %24
  %33 = select i1 %32, i32 1, i32 %31
  %omp_loop.tripcount7 = select i1 %28, i32 0, i32 %33
  br label %omp_loop.preheader8

omp_loop.preheader8:                              ; preds = %omp_loop.after
  store i32 1, ptr %p.lowerbound24, align 4
  store i32 %omp_loop.tripcount7, ptr %p.upperbound25, align 4
  store i32 1, ptr %p.stride26, align 4
  %omp_global_thread_num27 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_dispatch_init_4u(ptr @1, i32 %omp_global_thread_num27, i32 66, i32 1, i32 %omp_loop.tripcount7, i32 1, i32 1)
  br label %omp_loop.preheader8.outer.cond

omp_loop.header9:                                 ; preds = %omp_loop.preheader8.outer.cond, %omp_loop.inc12
  %omp_loop.iv15 = phi i32 [ %lb28, %omp_loop.preheader8.outer.cond ], [ %omp_loop.next17, %omp_loop.inc12 ]
  br label %omp_loop.cond10

omp_loop.cond10:                                  ; preds = %omp_loop.header9
  %ub29 = load i32, ptr %p.upperbound25, align 4
  %omp_loop.cmp16 = icmp ult i32 %omp_loop.iv15, %ub29
  br i1 %omp_loop.cmp16, label %omp_loop.body11, label %omp_loop.preheader8.outer.cond

omp_loop.body11:                                  ; preds = %omp_loop.cond10
  %34 = mul i32 %omp_loop.iv15, %2
  %35 = add i32 %34, %0
  br label %omp.wsloop.region19

omp.wsloop.region19:                              ; preds = %omp_loop.body11
  %36 = getelementptr inbounds [1 x i64], ptr %.cnt.addr, i64 0, i64 0
  store i64 %3, ptr %36, align 8
  %37 = getelementptr inbounds [1 x i64], ptr %.cnt.addr, i64 0, i64 0
  %omp_global_thread_num20 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_doacross_wait(ptr @1, i32 %omp_global_thread_num20, ptr %37)
  %38 = getelementptr inbounds [1 x i64], ptr %.cnt.addr21, i64 0, i64 0
  store i64 %3, ptr %38, align 8
  %39 = getelementptr inbounds [1 x i64], ptr %.cnt.addr21, i64 0, i64 0
  %omp_global_thread_num22 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_doacross_post(ptr @1, i32 %omp_global_thread_num22, ptr %39)
  br label %omp.region.cont18

omp.region.cont18:                                ; preds = %omp.wsloop.region19
  br label %omp_loop.inc12

omp_loop.inc12:                                   ; preds = %omp.region.cont18
  %omp_loop.next17 = add nuw i32 %omp_loop.iv15, 1
  call void @__kmpc_dispatch_fini_4u(ptr @1, i32 %omp_global_thread_num27)
  br label %omp_loop.header9

omp_loop.exit13:                                  ; preds = %omp_loop.preheader8.outer.cond
  %omp_global_thread_num30 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num30)
  br label %omp_loop.after14

omp_loop.after14:                                 ; preds = %omp_loop.exit13
  %40 = icmp slt i32 %2, 0
  %41 = sub i32 0, %2
  %42 = select i1 %40, i32 %41, i32 %2
  %43 = select i1 %40, i32 %1, i32 %0
  %44 = select i1 %40, i32 %0, i32 %1
  %45 = sub nsw i32 %44, %43
  %46 = icmp sle i32 %44, %43
  %47 = sub i32 %45, 1
  %48 = udiv i32 %47, %42
  %49 = add i32 %48, 1
  %50 = icmp ule i32 %45, %42
  %51 = select i1 %50, i32 1, i32 %49
  %omp_loop.tripcount31 = select i1 %46, i32 0, i32 %51
  br label %omp_loop.preheader32

omp_loop.preheader32:                             ; preds = %omp_loop.after14
  store i32 1, ptr %p.lowerbound51, align 4
  store i32 %omp_loop.tripcount31, ptr %p.upperbound52, align 4
  store i32 1, ptr %p.stride53, align 4
  %omp_global_thread_num54 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_dispatch_init_4u(ptr @1, i32 %omp_global_thread_num54, i32 66, i32 1, i32 %omp_loop.tripcount31, i32 1, i32 1)
  br label %omp_loop.preheader32.outer.cond

omp_loop.header33:                                ; preds = %omp_loop.preheader32.outer.cond, %omp_loop.inc36
  %omp_loop.iv39 = phi i32 [ %lb55, %omp_loop.preheader32.outer.cond ], [ %omp_loop.next41, %omp_loop.inc36 ]
  br label %omp_loop.cond34

omp_loop.cond34:                                  ; preds = %omp_loop.header33
  %ub56 = load i32, ptr %p.upperbound52, align 4
  %omp_loop.cmp40 = icmp ult i32 %omp_loop.iv39, %ub56
  br i1 %omp_loop.cmp40, label %omp_loop.body35, label %omp_loop.preheader32.outer.cond

omp_loop.body35:                                  ; preds = %omp_loop.cond34
  %52 = mul i32 %omp_loop.iv39, %2
  %53 = add i32 %52, %0
  br label %omp.wsloop.region43

omp.wsloop.region43:                              ; preds = %omp_loop.body35
  %54 = getelementptr inbounds [2 x i64], ptr %.cnt.addr44, i64 0, i64 0
  store i64 %3, ptr %54, align 8
  %55 = getelementptr inbounds [2 x i64], ptr %.cnt.addr44, i64 0, i64 1
  store i64 %4, ptr %55, align 8
  %56 = getelementptr inbounds [2 x i64], ptr %.cnt.addr44, i64 0, i64 0
  %omp_global_thread_num45 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_doacross_wait(ptr @1, i32 %omp_global_thread_num45, ptr %56)
  %57 = getelementptr inbounds [2 x i64], ptr %.cnt.addr46, i64 0, i64 0
  store i64 %5, ptr %57, align 8
  %58 = getelementptr inbounds [2 x i64], ptr %.cnt.addr46, i64 0, i64 1
  store i64 %6, ptr %58, align 8
  %59 = getelementptr inbounds [2 x i64], ptr %.cnt.addr46, i64 0, i64 0
  %omp_global_thread_num47 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_doacross_wait(ptr @1, i32 %omp_global_thread_num47, ptr %59)
  %60 = getelementptr inbounds [2 x i64], ptr %.cnt.addr48, i64 0, i64 0
  store i64 %3, ptr %60, align 8
  %61 = getelementptr inbounds [2 x i64], ptr %.cnt.addr48, i64 0, i64 1
  store i64 %4, ptr %61, align 8
  %62 = getelementptr inbounds [2 x i64], ptr %.cnt.addr48, i64 0, i64 0
  %omp_global_thread_num49 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_doacross_post(ptr @1, i32 %omp_global_thread_num49, ptr %62)
  br label %omp.region.cont42

omp.region.cont42:                                ; preds = %omp.wsloop.region43
  br label %omp_loop.inc36

omp_loop.inc36:                                   ; preds = %omp.region.cont42
  %omp_loop.next41 = add nuw i32 %omp_loop.iv39, 1
  call void @__kmpc_dispatch_fini_4u(ptr @1, i32 %omp_global_thread_num54)
  br label %omp_loop.header33

omp_loop.exit37:                                  ; preds = %omp_loop.preheader32.outer.cond
  %omp_global_thread_num57 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num57)
  br label %omp_loop.after38

omp_loop.after38:                                 ; preds = %omp_loop.exit37
  ret void

omp_loop.preheader.outer.cond:                    ; preds = %omp_loop.cond, %omp_loop.preheader
  %63 = call i32 @__kmpc_dispatch_next_4u(ptr @1, i32 %omp_global_thread_num5, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride)
  %64 = icmp ne i32 %63, 0
  %65 = load i32, ptr %p.lowerbound, align 4
  %lb = sub i32 %65, 1
  br i1 %64, label %omp_loop.header, label %omp_loop.exit

omp_loop.preheader8.outer.cond:                   ; preds = %omp_loop.cond10, %omp_loop.preheader8
  %66 = call i32 @__kmpc_dispatch_next_4u(ptr @1, i32 %omp_global_thread_num27, ptr %p.lastiter23, ptr %p.lowerbound24, ptr %p.upperbound25, ptr %p.stride26)
  %67 = icmp ne i32 %66, 0
  %68 = load i32, ptr %p.lowerbound24, align 4
  %lb28 = sub i32 %68, 1
  br i1 %67, label %omp_loop.header9, label %omp_loop.exit13

omp_loop.preheader32.outer.cond:                  ; preds = %omp_loop.cond34, %omp_loop.preheader32
  %69 = call i32 @__kmpc_dispatch_next_4u(ptr @1, i32 %omp_global_thread_num54, ptr %p.lastiter50, ptr %p.lowerbound51, ptr %p.upperbound52, ptr %p.stride53)
  %70 = icmp ne i32 %69, 0
  %71 = load i32, ptr %p.lowerbound51, align 4
  %lb55 = sub i32 %71, 1
  br i1 %70, label %omp_loop.header33, label %omp_loop.exit37
}

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #0

; Function Attrs: convergent nounwind
declare void @__kmpc_ordered(ptr, i32) #1

; Function Attrs: convergent nounwind
declare void @__kmpc_end_ordered(ptr, i32) #1

; Function Attrs: nounwind
declare void @__kmpc_dispatch_init_4u(ptr, i32, i32, i32, i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @__kmpc_dispatch_next_4u(ptr, i32, ptr, ptr, ptr, ptr) #0

; Function Attrs: nounwind
declare void @__kmpc_dispatch_fini_4u(ptr, i32) #0

; Function Attrs: convergent nounwind
declare void @__kmpc_barrier(ptr, i32) #1

; Function Attrs: convergent nounwind
declare void @__kmpc_doacross_wait(ptr, i32, ptr) #1

; Function Attrs: convergent nounwind
declare void @__kmpc_doacross_post(ptr, i32, ptr) #1

attributes #0 = { nounwind }
attributes #1 = { convergent nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

