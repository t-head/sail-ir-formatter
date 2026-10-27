; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 34, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8

define void @test_stand_alone_directives() {
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @2)
  call void @__kmpc_barrier(ptr @1, i32 %omp_global_thread_num)
  %omp_global_thread_num1 = call i32 @__kmpc_global_thread_num(ptr @2)
  %1 = call i32 @__kmpc_omp_taskwait(ptr @2, i32 %omp_global_thread_num1)
  %omp_global_thread_num2 = call i32 @__kmpc_global_thread_num(ptr @2)
  %2 = call i32 @__kmpc_omp_taskyield(ptr @2, i32 %omp_global_thread_num2, i32 0)
  ret void
}

define void @test_flush_construct(ptr %0) {
  call void @__kmpc_flush(ptr @2)
  call void @__kmpc_flush(ptr @2)
  call void @__kmpc_flush(ptr @2)
  %2 = alloca i32, i64 1, align 4
  call void @__kmpc_flush(ptr @2)
  %3 = load i32, ptr %2, align 4
  ret void
}

define void @test_omp_parallel_1() {
  br label %entry

entry:                                            ; preds = %0
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @2)
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @2, i32 0, ptr @test_omp_parallel_1..omp_par)
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit
  ret void
}

; Function Attrs: nounwind
define internal void @test_omp_parallel_1..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr) #0 {
omp.par.entry:
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
  %omp_global_thread_num2 = call i32 @__kmpc_global_thread_num(ptr @2)
  call void @__kmpc_barrier(ptr @1, i32 %omp_global_thread_num2)
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.par.region1
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont
  br label %omp.par.outlined.exit.exitStub

omp.par.outlined.exit.exitStub:                   ; preds = %omp.par.pre_finalize
  ret void
}

declare void @body(i64)

define void @test_omp_parallel_2() {
  br label %entry

entry:                                            ; preds = %0
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @2)
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @2, i32 0, ptr @test_omp_parallel_2..omp_par)
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit
  ret void
}

; Function Attrs: nounwind
define internal void @test_omp_parallel_2..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr) #0 {
omp.par.entry:
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
  call void @body(i64 1)
  call void @body(i64 42)
  br label %omp.par.region2

omp.par.region2:                                  ; preds = %omp.par.region1
  call void @body(i64 43)
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.par.region2
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont
  br label %omp.par.outlined.exit.exitStub

omp.par.outlined.exit.exitStub:                   ; preds = %omp.par.pre_finalize
  ret void
}

define void @test_omp_parallel_num_threads_1(i32 %0) {
  br label %entry

entry:                                            ; preds = %1
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @2)
  call void @__kmpc_push_num_threads(ptr @2, i32 %omp_global_thread_num, i32 %0)
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @2, i32 0, ptr @test_omp_parallel_num_threads_1..omp_par)
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit
  ret void
}

; Function Attrs: nounwind
define internal void @test_omp_parallel_num_threads_1..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr) #0 {
omp.par.entry:
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
  %omp_global_thread_num2 = call i32 @__kmpc_global_thread_num(ptr @2)
  call void @__kmpc_barrier(ptr @1, i32 %omp_global_thread_num2)
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.par.region1
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont
  br label %omp.par.outlined.exit.exitStub

omp.par.outlined.exit.exitStub:                   ; preds = %omp.par.pre_finalize
  ret void
}

define void @test_omp_parallel_num_threads_2() {
  br label %entry

entry:                                            ; preds = %0
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @2)
  call void @__kmpc_push_num_threads(ptr @2, i32 %omp_global_thread_num, i32 4)
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @2, i32 0, ptr @test_omp_parallel_num_threads_2..omp_par)
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit
  ret void
}

; Function Attrs: nounwind
define internal void @test_omp_parallel_num_threads_2..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr) #0 {
omp.par.entry:
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
  %omp_global_thread_num2 = call i32 @__kmpc_global_thread_num(ptr @2)
  call void @__kmpc_barrier(ptr @1, i32 %omp_global_thread_num2)
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.par.region1
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont
  br label %omp.par.outlined.exit.exitStub

omp.par.outlined.exit.exitStub:                   ; preds = %omp.par.pre_finalize
  ret void
}

define void @test_omp_parallel_num_threads_3() {
  br label %entry

entry:                                            ; preds = %0
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @2)
  call void @__kmpc_push_num_threads(ptr @2, i32 %omp_global_thread_num, i32 4)
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @2, i32 0, ptr @test_omp_parallel_num_threads_3..omp_par)
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit
  %omp_global_thread_num3 = call i32 @__kmpc_global_thread_num(ptr @2)
  call void @__kmpc_push_num_threads(ptr @2, i32 %omp_global_thread_num3, i32 8)
  br label %omp_parallel19

omp_parallel19:                                   ; preds = %omp.par.exit.split
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @2, i32 0, ptr @test_omp_parallel_num_threads_3..omp_par.1)
  br label %omp.par.outlined.exit18

omp.par.outlined.exit18:                          ; preds = %omp_parallel19
  br label %omp.par.exit.split17

omp.par.exit.split17:                             ; preds = %omp.par.outlined.exit18
  ret void
}

; Function Attrs: nounwind
define internal void @test_omp_parallel_num_threads_3..omp_par.1(ptr noalias %tid.addr4, ptr noalias %zero.addr5) #0 {
omp.par.entry6:
  %tid.addr.local9 = alloca i32, align 4
  %0 = load i32, ptr %tid.addr4, align 4
  store i32 %0, ptr %tid.addr.local9, align 4
  %tid10 = load i32, ptr %tid.addr.local9, align 4
  br label %omp.reduction.init13

omp.reduction.init13:                             ; preds = %omp.par.entry6
  br label %omp.par.region7

omp.par.region7:                                  ; preds = %omp.reduction.init13
  br label %omp.par.region15

omp.par.region15:                                 ; preds = %omp.par.region7
  %omp_global_thread_num16 = call i32 @__kmpc_global_thread_num(ptr @2)
  call void @__kmpc_barrier(ptr @1, i32 %omp_global_thread_num16)
  br label %omp.region.cont14

omp.region.cont14:                                ; preds = %omp.par.region15
  br label %omp.par.pre_finalize8

omp.par.pre_finalize8:                            ; preds = %omp.region.cont14
  br label %omp.par.outlined.exit18.exitStub

omp.par.outlined.exit18.exitStub:                 ; preds = %omp.par.pre_finalize8
  ret void
}

; Function Attrs: nounwind
define internal void @test_omp_parallel_num_threads_3..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr) #0 {
omp.par.entry:
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
  %omp_global_thread_num2 = call i32 @__kmpc_global_thread_num(ptr @2)
  call void @__kmpc_barrier(ptr @1, i32 %omp_global_thread_num2)
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.par.region1
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont
  br label %omp.par.outlined.exit.exitStub

omp.par.outlined.exit.exitStub:                   ; preds = %omp.par.pre_finalize
  ret void
}

define void @test_omp_parallel_if_1(i32 %0) {
  %2 = icmp slt i32 %0, 0
  br label %entry

entry:                                            ; preds = %1
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @2)
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  %3 = sext i1 %2 to i32
  call void @__kmpc_fork_call_if(ptr @2, i32 0, ptr @test_omp_parallel_if_1..omp_par, i32 %3, ptr null)
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit
  ret void
}

; Function Attrs: nounwind
define internal void @test_omp_parallel_if_1..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr) #0 {
omp.par.entry:
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
  %omp_global_thread_num2 = call i32 @__kmpc_global_thread_num(ptr @2)
  call void @__kmpc_barrier(ptr @1, i32 %omp_global_thread_num2)
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.par.region1
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont
  br label %omp.par.outlined.exit.exitStub

omp.par.outlined.exit.exitStub:                   ; preds = %omp.par.pre_finalize
  ret void
}

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #0

; Function Attrs: convergent nounwind
declare void @__kmpc_barrier(ptr, i32) #1

; Function Attrs: convergent nounwind
declare i32 @__kmpc_omp_taskwait(ptr, i32) #1

; Function Attrs: nounwind
declare i32 @__kmpc_omp_taskyield(ptr, i32, i32) #0

; Function Attrs: convergent nounwind
declare void @__kmpc_flush(ptr) #1

; Function Attrs: nounwind
declare void @__kmpc_push_num_threads(ptr, i32, i32) #0

; Function Attrs: nounwind
declare !callback !1 void @__kmpc_fork_call(ptr, i32, ptr, ...) #0

declare !callback !1 void @__kmpc_fork_call_if(ptr, i32, ptr, i32, ptr)

attributes #0 = { nounwind }
attributes #1 = { convergent nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!2}
!2 = !{i64 2, i64 -1, i64 -1, i1 true}

