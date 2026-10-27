; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@str0 = internal constant [29 x i8] c"WG size of kernel = %d X %d\0A\00"
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8

declare i32 @printf(ptr, ...)

define i32 @main(i32 %0, ptr %1) {
  br label %entry

entry:                                            ; preds = %2
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 0, ptr @main..omp_par.1)
  br label %omp.par.outlined.exit37

omp.par.outlined.exit37:                          ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit37
  ret i32 0
}

; Function Attrs: nounwind
define internal void @main..omp_par.1(ptr noalias %tid.addr, ptr noalias %zero.addr) #0 {
omp.par.entry:
  %structArg = alloca { ptr }, align 8
  %p.lastiter31 = alloca i32, align 4
  %p.lowerbound32 = alloca i64, align 8
  %p.upperbound33 = alloca i64, align 8
  %p.stride34 = alloca i64, align 8
  %tid.addr.local = alloca i32, align 4
  %0 = load i32, ptr %tid.addr, align 4
  store i32 %0, ptr %tid.addr.local, align 4
  %tid = load i32, ptr %tid.addr.local, align 4
  br label %omp.reduction.init

omp.reduction.init:                               ; preds = %omp.par.entry
  br label %omp.par.region

omp.par.region:                                   ; preds = %omp.reduction.init
  br label %omp.par.region1

omp.par.region1:                                  ; preds = %omp.par.region
  %1 = alloca i64, i64 1, align 8
  br label %omp_loop.preheader

omp_loop.preheader:                               ; preds = %omp.par.region1
  store i64 0, ptr %p.lowerbound32, align 4
  store i64 9, ptr %p.upperbound33, align 4
  store i64 1, ptr %p.stride34, align 4
  %omp_global_thread_num35 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_8u(ptr @1, i32 %omp_global_thread_num35, i32 34, ptr %p.lastiter31, ptr %p.lowerbound32, ptr %p.upperbound33, ptr %p.stride34, i64 1, i64 0)
  %2 = load i64, ptr %p.lowerbound32, align 4
  %3 = load i64, ptr %p.upperbound33, align 4
  %4 = sub i64 %3, %2
  %5 = add i64 %4, 1
  br label %omp_loop.header

omp_loop.header:                                  ; preds = %omp_loop.inc, %omp_loop.preheader
  %omp_loop.iv = phi i64 [ 0, %omp_loop.preheader ], [ %omp_loop.next, %omp_loop.inc ]
  br label %omp_loop.cond

omp_loop.cond:                                    ; preds = %omp_loop.header
  %omp_loop.cmp = icmp ult i64 %omp_loop.iv, %5
  br i1 %omp_loop.cmp, label %omp_loop.body, label %omp_loop.exit

omp_loop.exit:                                    ; preds = %omp_loop.cond
  call void @__kmpc_for_static_fini(ptr @1, i32 %omp_global_thread_num35)
  %omp_global_thread_num36 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num36)
  br label %omp_loop.after

omp_loop.after:                                   ; preds = %omp_loop.exit
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp_loop.after
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont
  br label %omp.par.outlined.exit37.exitStub

omp_loop.body:                                    ; preds = %omp_loop.cond
  %6 = add i64 %omp_loop.iv, %2
  %7 = mul i64 %6, 1
  %8 = add i64 %7, 0
  br label %omp.wsloop.region

omp.wsloop.region:                                ; preds = %omp_loop.body
  %omp_global_thread_num3 = call i32 @__kmpc_global_thread_num(ptr @1)
  br label %omp_parallel

omp_parallel:                                     ; preds = %omp.wsloop.region
  %gep_ = getelementptr { ptr }, ptr %structArg, i32 0, i32 0
  store ptr %1, ptr %gep_, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 1, ptr @main..omp_par, ptr %structArg)
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit9.split

omp.par.exit9.split:                              ; preds = %omp.par.outlined.exit
  %9 = load i64, ptr %1, align 4
  %10 = trunc i64 %9 to i32
  %11 = call i32 (ptr, ...) @printf(ptr @str0, i32 %10, i32 %10)
  br label %omp.region.cont2

omp.region.cont2:                                 ; preds = %omp.par.exit9.split
  br label %omp_loop.inc

omp_loop.inc:                                     ; preds = %omp.region.cont2
  %omp_loop.next = add nuw i64 %omp_loop.iv, 1
  br label %omp_loop.header

omp.par.outlined.exit37.exitStub:                 ; preds = %omp.par.pre_finalize
  ret void
}

; Function Attrs: nounwind
define internal void @main..omp_par(ptr noalias %tid.addr4, ptr noalias %zero.addr5, ptr %0) #0 {
omp.par.entry6:
  %gep_ = getelementptr { ptr }, ptr %0, i32 0, i32 0
  %loadgep_ = load ptr, ptr %gep_, align 8
  %p.lastiter = alloca i32, align 4
  %p.lowerbound = alloca i64, align 8
  %p.upperbound = alloca i64, align 8
  %p.stride = alloca i64, align 8
  %tid.addr.local10 = alloca i32, align 4
  %1 = load i32, ptr %tid.addr4, align 4
  store i32 %1, ptr %tid.addr.local10, align 4
  %tid11 = load i32, ptr %tid.addr.local10, align 4
  br label %omp.reduction.init14

omp.reduction.init14:                             ; preds = %omp.par.entry6
  br label %omp.par.region7

omp.par.region7:                                  ; preds = %omp.reduction.init14
  br label %omp.par.region16

omp.par.region16:                                 ; preds = %omp.par.region7
  br label %omp_loop.preheader17

omp_loop.preheader17:                             ; preds = %omp.par.region16
  store i64 0, ptr %p.lowerbound, align 4
  store i64 0, ptr %p.upperbound, align 4
  store i64 1, ptr %p.stride, align 4
  %omp_global_thread_num29 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_8u(ptr @1, i32 %omp_global_thread_num29, i32 34, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride, i64 1, i64 0)
  %2 = load i64, ptr %p.lowerbound, align 4
  %3 = load i64, ptr %p.upperbound, align 4
  %4 = sub i64 %3, %2
  %5 = add i64 %4, 1
  br label %omp_loop.header18

omp_loop.header18:                                ; preds = %omp_loop.inc21, %omp_loop.preheader17
  %omp_loop.iv24 = phi i64 [ 0, %omp_loop.preheader17 ], [ %omp_loop.next26, %omp_loop.inc21 ]
  br label %omp_loop.cond19

omp_loop.cond19:                                  ; preds = %omp_loop.header18
  %omp_loop.cmp25 = icmp ult i64 %omp_loop.iv24, %5
  br i1 %omp_loop.cmp25, label %omp_loop.body20, label %omp_loop.exit22

omp_loop.exit22:                                  ; preds = %omp_loop.cond19
  call void @__kmpc_for_static_fini(ptr @1, i32 %omp_global_thread_num29)
  %omp_global_thread_num30 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num30)
  br label %omp_loop.after23

omp_loop.after23:                                 ; preds = %omp_loop.exit22
  br label %omp.region.cont15

omp.region.cont15:                                ; preds = %omp_loop.after23
  br label %omp.par.pre_finalize8

omp.par.pre_finalize8:                            ; preds = %omp.region.cont15
  br label %omp.par.outlined.exit.exitStub

omp_loop.body20:                                  ; preds = %omp_loop.cond19
  %6 = add i64 %omp_loop.iv24, %2
  %7 = mul i64 %6, 1
  %8 = add i64 %7, 0
  br label %omp.wsloop.region28

omp.wsloop.region28:                              ; preds = %omp_loop.body20
  store i64 0, ptr %loadgep_, align 4
  br label %omp.region.cont27

omp.region.cont27:                                ; preds = %omp.wsloop.region28
  br label %omp_loop.inc21

omp_loop.inc21:                                   ; preds = %omp.region.cont27
  %omp_loop.next26 = add nuw i64 %omp_loop.iv24, 1
  br label %omp_loop.header18

omp.par.outlined.exit.exitStub:                   ; preds = %omp.par.pre_finalize8
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

; Function Attrs: nounwind
declare !callback !1 void @__kmpc_fork_call(ptr, i32, ptr, ...) #0

attributes #0 = { nounwind }
attributes #1 = { convergent nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!2}
!2 = !{i64 2, i64 -1, i64 -1, i1 true}
