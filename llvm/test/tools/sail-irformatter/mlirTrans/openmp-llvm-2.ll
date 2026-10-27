; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 34, i32 0, i32 22, ptr @0 }, align 8

define void @test_omp_parallel_3() {
  br label %entry

entry:                                            ; preds = %0
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_push_proc_bind(ptr @1, i32 %omp_global_thread_num, i32 2)
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 0, ptr @test_omp_parallel_3..omp_par)
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit
  %omp_global_thread_num3 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_push_proc_bind(ptr @1, i32 %omp_global_thread_num3, i32 3)
  br label %omp_parallel35

omp_parallel35:                                   ; preds = %omp.par.exit.split
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 0, ptr @test_omp_parallel_3..omp_par.1)
  br label %omp.par.outlined.exit18

omp.par.outlined.exit18:                          ; preds = %omp_parallel35
  br label %omp.par.exit.split17

omp.par.exit.split17:                             ; preds = %omp.par.outlined.exit18
  %omp_global_thread_num19 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_push_proc_bind(ptr @1, i32 %omp_global_thread_num19, i32 4)
  br label %omp_parallel36

omp_parallel36:                                   ; preds = %omp.par.exit.split17
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 0, ptr @test_omp_parallel_3..omp_par.2)
  br label %omp.par.outlined.exit34

omp.par.outlined.exit34:                          ; preds = %omp_parallel36
  br label %omp.par.exit.split33

omp.par.exit.split33:                             ; preds = %omp.par.outlined.exit34
  ret void
}

; Function Attrs: nounwind
define internal void @test_omp_parallel_3..omp_par.2(ptr noalias %tid.addr20, ptr noalias %zero.addr21) #0 {
omp.par.entry22:
  %tid.addr.local25 = alloca i32, align 4
  %0 = load i32, ptr %tid.addr20, align 4
  store i32 %0, ptr %tid.addr.local25, align 4
  %tid26 = load i32, ptr %tid.addr.local25, align 4
  br label %omp.reduction.init29

omp.reduction.init29:                             ; preds = %omp.par.entry22
  br label %omp.par.region23

omp.par.region23:                                 ; preds = %omp.reduction.init29
  br label %omp.par.region31

omp.par.region31:                                 ; preds = %omp.par.region23
  %omp_global_thread_num32 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num32)
  br label %omp.region.cont30

omp.region.cont30:                                ; preds = %omp.par.region31
  br label %omp.par.pre_finalize24

omp.par.pre_finalize24:                           ; preds = %omp.region.cont30
  br label %omp.par.outlined.exit34.exitStub

omp.par.outlined.exit34.exitStub:                 ; preds = %omp.par.pre_finalize24
  ret void
}

; Function Attrs: nounwind
define internal void @test_omp_parallel_3..omp_par.1(ptr noalias %tid.addr4, ptr noalias %zero.addr5) #0 {
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
  %omp_global_thread_num16 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num16)
  br label %omp.region.cont14

omp.region.cont14:                                ; preds = %omp.par.region15
  br label %omp.par.pre_finalize8

omp.par.pre_finalize8:                            ; preds = %omp.region.cont14
  br label %omp.par.outlined.exit18.exitStub

omp.par.outlined.exit18.exitStub:                 ; preds = %omp.par.pre_finalize8
  ret void
}

; Function Attrs: nounwind
define internal void @test_omp_parallel_3..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr) #0 {
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
  %omp_global_thread_num2 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num2)
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.par.region1
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont
  br label %omp.par.outlined.exit.exitStub

omp.par.outlined.exit.exitStub:                   ; preds = %omp.par.pre_finalize
  ret void
}

define void @test_omp_parallel_4() {
  br label %entry

entry:                                            ; preds = %0
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 0, ptr @test_omp_parallel_4..omp_par.3)
  br label %omp.par.outlined.exit19

omp.par.outlined.exit19:                          ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit19
  ret void
}

; Function Attrs: nounwind
define internal void @test_omp_parallel_4..omp_par.3(ptr noalias %tid.addr, ptr noalias %zero.addr) #0 {
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
  %omp_global_thread_num2 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num2)
  %omp_global_thread_num3 = call i32 @__kmpc_global_thread_num(ptr @1)
  br label %omp_parallel

omp_parallel:                                     ; preds = %omp.par.region1
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 0, ptr @test_omp_parallel_4..omp_par)
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit9.split

omp.par.exit9.split:                              ; preds = %omp.par.outlined.exit
  %omp_global_thread_num18 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num18)
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.par.exit9.split
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont
  br label %omp.par.outlined.exit19.exitStub

omp.par.outlined.exit19.exitStub:                 ; preds = %omp.par.pre_finalize
  ret void
}

; Function Attrs: nounwind
define internal void @test_omp_parallel_4..omp_par(ptr noalias %tid.addr4, ptr noalias %zero.addr5) #0 {
omp.par.entry6:
  %tid.addr.local10 = alloca i32, align 4
  %0 = load i32, ptr %tid.addr4, align 4
  store i32 %0, ptr %tid.addr.local10, align 4
  %tid11 = load i32, ptr %tid.addr.local10, align 4
  br label %omp.reduction.init14

omp.reduction.init14:                             ; preds = %omp.par.entry6
  br label %omp.par.region7

omp.par.region7:                                  ; preds = %omp.reduction.init14
  br label %omp.par.region16

omp.par.region16:                                 ; preds = %omp.par.region7
  %omp_global_thread_num17 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num17)
  br label %omp.region.cont15

omp.region.cont15:                                ; preds = %omp.par.region16
  br label %omp.par.pre_finalize8

omp.par.pre_finalize8:                            ; preds = %omp.region.cont15
  br label %omp.par.outlined.exit.exitStub

omp.par.outlined.exit.exitStub:                   ; preds = %omp.par.pre_finalize8
  ret void
}

define void @test_omp_parallel_5() {
  br label %entry

entry:                                            ; preds = %0
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 0, ptr @test_omp_parallel_5..omp_par.5)
  br label %omp.par.outlined.exit34

omp.par.outlined.exit34:                          ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit34
  ret void
}

; Function Attrs: nounwind
define internal void @test_omp_parallel_5..omp_par.5(ptr noalias %tid.addr, ptr noalias %zero.addr) #0 {
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
  %omp_global_thread_num2 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num2)
  %omp_global_thread_num3 = call i32 @__kmpc_global_thread_num(ptr @1)
  br label %omp_parallel

omp_parallel:                                     ; preds = %omp.par.region1
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 0, ptr @test_omp_parallel_5..omp_par.4)
  br label %omp.par.outlined.exit32

omp.par.outlined.exit32:                          ; preds = %omp_parallel
  br label %omp.par.exit9.split

omp.par.exit9.split:                              ; preds = %omp.par.outlined.exit32
  %omp_global_thread_num33 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num33)
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.par.exit9.split
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont
  br label %omp.par.outlined.exit34.exitStub

omp.par.outlined.exit34.exitStub:                 ; preds = %omp.par.pre_finalize
  ret void
}

; Function Attrs: nounwind
define internal void @test_omp_parallel_5..omp_par.4(ptr noalias %tid.addr4, ptr noalias %zero.addr5) #0 {
omp.par.entry6:
  %tid.addr.local10 = alloca i32, align 4
  %0 = load i32, ptr %tid.addr4, align 4
  store i32 %0, ptr %tid.addr.local10, align 4
  %tid11 = load i32, ptr %tid.addr.local10, align 4
  br label %omp.reduction.init14

omp.reduction.init14:                             ; preds = %omp.par.entry6
  br label %omp.par.region7

omp.par.region7:                                  ; preds = %omp.reduction.init14
  br label %omp.par.region16

omp.par.region16:                                 ; preds = %omp.par.region7
  %omp_global_thread_num17 = call i32 @__kmpc_global_thread_num(ptr @1)
  br label %omp_parallel

omp_parallel:                                     ; preds = %omp.par.region16
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 0, ptr @test_omp_parallel_5..omp_par)
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit23.split

omp.par.exit23.split:                             ; preds = %omp.par.outlined.exit
  br label %omp.region.cont15

omp.region.cont15:                                ; preds = %omp.par.exit23.split
  br label %omp.par.pre_finalize8

omp.par.pre_finalize8:                            ; preds = %omp.region.cont15
  br label %omp.par.outlined.exit32.exitStub

omp.par.outlined.exit32.exitStub:                 ; preds = %omp.par.pre_finalize8
  ret void
}

; Function Attrs: nounwind
define internal void @test_omp_parallel_5..omp_par(ptr noalias %tid.addr18, ptr noalias %zero.addr19) #0 {
omp.par.entry20:
  %tid.addr.local24 = alloca i32, align 4
  %0 = load i32, ptr %tid.addr18, align 4
  store i32 %0, ptr %tid.addr.local24, align 4
  %tid25 = load i32, ptr %tid.addr.local24, align 4
  br label %omp.reduction.init28

omp.reduction.init28:                             ; preds = %omp.par.entry20
  br label %omp.par.region21

omp.par.region21:                                 ; preds = %omp.reduction.init28
  br label %omp.par.region30

omp.par.region30:                                 ; preds = %omp.par.region21
  %omp_global_thread_num31 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num31)
  br label %omp.region.cont29

omp.region.cont29:                                ; preds = %omp.par.region30
  br label %omp.par.pre_finalize22

omp.par.pre_finalize22:                           ; preds = %omp.region.cont29
  br label %omp.par.outlined.exit.exitStub

omp.par.outlined.exit.exitStub:                   ; preds = %omp.par.pre_finalize22
  ret void
}

define void @test_omp_master() {
  br label %entry

entry:                                            ; preds = %0
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 0, ptr @test_omp_master..omp_par)
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit
  %omp_global_thread_num4 = call i32 @__kmpc_global_thread_num(ptr @1)
  br label %omp_parallel40

omp_parallel40:                                   ; preds = %omp.par.exit.split
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 0, ptr @test_omp_master..omp_par.7)
  br label %omp.par.outlined.exit38

omp.par.outlined.exit38:                          ; preds = %omp_parallel40
  br label %omp.par.exit.split37

omp.par.exit.split37:                             ; preds = %omp.par.outlined.exit38
  ret void
}

; Function Attrs: nounwind
define internal void @test_omp_master..omp_par.7(ptr noalias %tid.addr5, ptr noalias %zero.addr6) #0 {
omp.par.entry7:
  %tid.addr.local10 = alloca i32, align 4
  %0 = load i32, ptr %tid.addr5, align 4
  store i32 %0, ptr %tid.addr.local10, align 4
  %tid11 = load i32, ptr %tid.addr.local10, align 4
  br label %omp.reduction.init14

omp.reduction.init14:                             ; preds = %omp.par.entry7
  br label %omp.par.region8

omp.par.region8:                                  ; preds = %omp.reduction.init14
  br label %omp.par.region16

omp.par.region16:                                 ; preds = %omp.par.region8
  %omp_global_thread_num17 = call i32 @__kmpc_global_thread_num(ptr @1)
  br label %omp_parallel39

omp_parallel39:                                   ; preds = %omp.par.region16
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 0, ptr @test_omp_master..omp_par.6)
  br label %omp.par.outlined.exit36

omp.par.outlined.exit36:                          ; preds = %omp_parallel39
  br label %omp.par.exit23.split

omp.par.exit23.split:                             ; preds = %omp.par.outlined.exit36
  br label %omp.region.cont15

omp.region.cont15:                                ; preds = %omp.par.exit23.split
  br label %omp.par.pre_finalize9

omp.par.pre_finalize9:                            ; preds = %omp.region.cont15
  br label %omp.par.outlined.exit38.exitStub

omp.par.outlined.exit38.exitStub:                 ; preds = %omp.par.pre_finalize9
  ret void
}

; Function Attrs: nounwind
define internal void @test_omp_master..omp_par.6(ptr noalias %tid.addr18, ptr noalias %zero.addr19) #0 {
omp.par.entry20:
  %tid.addr.local24 = alloca i32, align 4
  %0 = load i32, ptr %tid.addr18, align 4
  store i32 %0, ptr %tid.addr.local24, align 4
  %tid25 = load i32, ptr %tid.addr.local24, align 4
  br label %omp.reduction.init28

omp.reduction.init28:                             ; preds = %omp.par.entry20
  br label %omp.par.region21

omp.par.region21:                                 ; preds = %omp.reduction.init28
  br label %omp.par.region30

omp.par.region30:                                 ; preds = %omp.par.region21
  %omp_global_thread_num31 = call i32 @__kmpc_global_thread_num(ptr @1)
  %1 = call i32 @__kmpc_master(ptr @1, i32 %omp_global_thread_num31)
  %2 = icmp ne i32 %1, 0
  br i1 %2, label %omp_region.body33, label %omp_region.end32

omp_region.end32:                                 ; preds = %omp.par.region30, %omp.region.cont34
  br label %omp.region.cont29

omp.region.cont29:                                ; preds = %omp_region.end32
  br label %omp.par.pre_finalize22

omp.par.pre_finalize22:                           ; preds = %omp.region.cont29
  br label %omp.par.outlined.exit36.exitStub

omp_region.body33:                                ; preds = %omp.par.region30
  br label %omp.master.region35

omp.master.region35:                              ; preds = %omp_region.body33
  br label %omp.region.cont34

omp.region.cont34:                                ; preds = %omp.master.region35
  call void @__kmpc_end_master(ptr @1, i32 %omp_global_thread_num31)
  br label %omp_region.end32

omp.par.outlined.exit36.exitStub:                 ; preds = %omp.par.pre_finalize22
  ret void
}

; Function Attrs: nounwind
define internal void @test_omp_master..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr) #0 {
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
  %omp_global_thread_num2 = call i32 @__kmpc_global_thread_num(ptr @1)
  %1 = call i32 @__kmpc_master(ptr @1, i32 %omp_global_thread_num2)
  %2 = icmp ne i32 %1, 0
  br i1 %2, label %omp_region.body, label %omp_region.end

omp_region.end:                                   ; preds = %omp.par.region1, %omp.region.cont3
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp_region.end
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont
  br label %omp.par.outlined.exit.exitStub

omp_region.body:                                  ; preds = %omp.par.region1
  br label %omp.master.region

omp.master.region:                                ; preds = %omp_region.body
  br label %omp.region.cont3

omp.region.cont3:                                 ; preds = %omp.master.region
  call void @__kmpc_end_master(ptr @1, i32 %omp_global_thread_num2)
  br label %omp_region.end

omp.par.outlined.exit.exitStub:                   ; preds = %omp.par.pre_finalize
  ret void
}

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #0

; Function Attrs: nounwind
declare void @__kmpc_push_proc_bind(ptr, i32, i32) #0

; Function Attrs: convergent nounwind
declare void @__kmpc_barrier(ptr, i32) #1

; Function Attrs: nounwind
declare i32 @__kmpc_master(ptr, i32) #0

; Function Attrs: nounwind
declare void @__kmpc_end_master(ptr, i32) #0

; Function Attrs: nounwind
declare !callback !1 void @__kmpc_fork_call(ptr, i32, ptr, ...) #0

attributes #0 = { nounwind }
attributes #1 = { convergent nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!2}
!2 = !{i64 2, i64 -1, i64 -1, i1 true}

