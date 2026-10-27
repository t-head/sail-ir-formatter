; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8

define void @wsloop_inclusive_1(ptr %0) {
  %p.lastiter = alloca i32, align 4
  %p.lowerbound = alloca i64, align 8
  %p.upperbound = alloca i64, align 8
  %p.stride = alloca i64, align 8
  br label %entry

entry:                                            ; preds = %1
  br label %omp_loop.preheader

omp_loop.preheader:                               ; preds = %entry
  store i64 0, ptr %p.lowerbound, align 4
  store i64 31, ptr %p.upperbound, align 4
  store i64 1, ptr %p.stride, align 4
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_8u(ptr @1, i32 %omp_global_thread_num, i32 34, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride, i64 1, i64 0)
  %2 = load i64, ptr %p.lowerbound, align 4
  %3 = load i64, ptr %p.upperbound, align 4
  %4 = sub i64 %3, %2
  %5 = add i64 %4, 1
  br label %omp_loop.header

omp_loop.header:                                  ; preds = %omp_loop.inc, %omp_loop.preheader
  %omp_loop.iv = phi i64 [ 0, %omp_loop.preheader ], [ %omp_loop.next, %omp_loop.inc ]
  br label %omp_loop.cond

omp_loop.cond:                                    ; preds = %omp_loop.header
  %omp_loop.cmp = icmp ult i64 %omp_loop.iv, %5
  br i1 %omp_loop.cmp, label %omp_loop.body, label %omp_loop.exit

omp_loop.body:                                    ; preds = %omp_loop.cond
  %6 = add i64 %omp_loop.iv, %2
  %7 = mul i64 %6, 1
  %8 = add i64 %7, 10
  br label %omp.wsloop.region

omp.wsloop.region:                                ; preds = %omp_loop.body
  %9 = getelementptr float, ptr %0, i64 %8
  store float 2.000000e+00, ptr %9, align 4
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.wsloop.region
  br label %omp_loop.inc

omp_loop.inc:                                     ; preds = %omp.region.cont
  %omp_loop.next = add nuw i64 %omp_loop.iv, 1
  br label %omp_loop.header

omp_loop.exit:                                    ; preds = %omp_loop.cond
  call void @__kmpc_for_static_fini(ptr @1, i32 %omp_global_thread_num)
  %omp_global_thread_num1 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num1)
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

