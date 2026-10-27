; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@.gomp_critical_user_.reduction.var = common global [8 x i32] zeroinitializer, align 8

define void @missordered_blocks_(ptr %0, ptr %1) #0 {
  %structArg = alloca { ptr, ptr }, align 8
  br label %entry

entry:                                            ; preds = %2
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  %gep_ = getelementptr { ptr, ptr }, ptr %structArg, i32 0, i32 0
  store ptr %0, ptr %gep_, align 8
  %gep_12 = getelementptr { ptr, ptr }, ptr %structArg, i32 0, i32 1
  store ptr %1, ptr %gep_12, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 1, ptr @missordered_blocks_..omp_par, ptr %structArg)
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit
  ret void
}

; Function Attrs: nounwind
define internal void @missordered_blocks_..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr, ptr %0) #1 {
omp.par.entry:
  %gep_ = getelementptr { ptr, ptr }, ptr %0, i32 0, i32 0
  %loadgep_ = load ptr, ptr %gep_, align 8
  %gep_1 = getelementptr { ptr, ptr }, ptr %0, i32 0, i32 1
  %loadgep_2 = load ptr, ptr %gep_1, align 8
  %tid.addr.local = alloca i32, align 4
  %1 = load i32, ptr %tid.addr, align 4
  store i32 %1, ptr %tid.addr.local, align 4
  %tid = load i32, ptr %tid.addr.local, align 4
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %red.array = alloca [2 x ptr], align 8
  br label %omp.reduction.init

omp.reduction.init:                               ; preds = %omp.par.entry
  br label %omp.reduction.neutral

omp.reduction.neutral:                            ; preds = %omp.reduction.init
  %4 = ptrtoint ptr %loadgep_ to i64
  %5 = icmp eq i64 %4, 0
  br i1 %5, label %omp.reduction.neutral1, label %omp.reduction.neutral2

omp.reduction.neutral2:                           ; preds = %omp.reduction.neutral
  br label %omp.reduction.neutral3

omp.reduction.neutral3:                           ; preds = %omp.reduction.neutral1, %omp.reduction.neutral2
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.reduction.neutral3
  %6 = phi ptr [ %loadgep_, %omp.reduction.neutral3 ]
  store ptr %6, ptr %2, align 8
  br label %omp.reduction.neutral5

omp.reduction.neutral5:                           ; preds = %omp.region.cont
  %7 = ptrtoint ptr %loadgep_2 to i64
  %8 = icmp eq i64 %7, 0
  br i1 %8, label %omp.reduction.neutral6, label %omp.reduction.neutral7

omp.reduction.neutral7:                           ; preds = %omp.reduction.neutral5
  br label %omp.reduction.neutral8

omp.reduction.neutral8:                           ; preds = %omp.reduction.neutral6, %omp.reduction.neutral7
  br label %omp.region.cont4

omp.region.cont4:                                 ; preds = %omp.reduction.neutral8
  %9 = phi ptr [ %loadgep_2, %omp.reduction.neutral8 ]
  store ptr %9, ptr %3, align 8
  br label %omp.par.region

omp.par.region:                                   ; preds = %omp.region.cont4
  br label %omp.par.region10

omp.par.region10:                                 ; preds = %omp.par.region
  br label %omp.region.cont9

omp.region.cont9:                                 ; preds = %omp.par.region10
  %red.array.elem.0 = getelementptr inbounds [2 x ptr], ptr %red.array, i64 0, i64 0
  store ptr %2, ptr %red.array.elem.0, align 8
  %red.array.elem.1 = getelementptr inbounds [2 x ptr], ptr %red.array, i64 0, i64 1
  store ptr %3, ptr %red.array.elem.1, align 8
  %omp_global_thread_num11 = call i32 @__kmpc_global_thread_num(ptr @1)
  %reduce = call i32 @__kmpc_reduce(ptr @1, i32 %omp_global_thread_num11, i32 2, i64 16, ptr %red.array, ptr @.omp.reduction.func, ptr @.gomp_critical_user_.reduction.var)
  switch i32 %reduce, label %reduce.finalize [
    i32 1, label %reduce.switch.nonatomic
    i32 2, label %reduce.switch.atomic
  ]

reduce.switch.atomic:                             ; preds = %omp.region.cont9
  unreachable

reduce.switch.nonatomic:                          ; preds = %omp.region.cont9
  %red.private.value.0 = load ptr, ptr %2, align 8
  %red.private.value.1 = load ptr, ptr %3, align 8
  call void @__kmpc_end_reduce(ptr @1, i32 %omp_global_thread_num11, ptr @.gomp_critical_user_.reduction.var)
  br label %reduce.finalize

reduce.finalize:                                  ; preds = %reduce.switch.nonatomic, %omp.region.cont9
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %reduce.finalize
  %10 = load ptr, ptr %2, align 8
  %11 = load ptr, ptr %3, align 8
  br label %omp.par.outlined.exit.exitStub

omp.reduction.neutral6:                           ; preds = %omp.reduction.neutral5
  br label %omp.reduction.neutral8

omp.reduction.neutral1:                           ; preds = %omp.reduction.neutral
  br label %omp.reduction.neutral3

omp.par.outlined.exit.exitStub:                   ; preds = %omp.par.pre_finalize
  ret void
}

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #2

define internal void @.omp.reduction.func(ptr %0, ptr %1) {
  %3 = getelementptr inbounds [2 x ptr], ptr %0, i64 0, i64 0
  %4 = load ptr, ptr %3, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds [2 x ptr], ptr %1, i64 0, i64 0
  %7 = load ptr, ptr %6, align 8
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr inbounds [2 x ptr], ptr %0, i64 0, i64 1
  %10 = load ptr, ptr %9, align 8
  %11 = load ptr, ptr %10, align 8
  %12 = getelementptr inbounds [2 x ptr], ptr %1, i64 0, i64 1
  %13 = load ptr, ptr %12, align 8
  %14 = load ptr, ptr %13, align 8
  ret void
}

; Function Attrs: convergent nounwind
declare i32 @__kmpc_reduce(ptr, i32, i32, i64, ptr, ptr, ptr) #3

; Function Attrs: convergent nounwind
declare void @__kmpc_end_reduce(ptr, i32, ptr) #3

; Function Attrs: nounwind
declare !callback !1 void @__kmpc_fork_call(ptr, i32, ptr, ...) #2

attributes #0 = { "frame-pointer"="non-leaf" "target-cpu"="generic" "target-features"="+outline-atomics,+v8a,+fp-armv8,+neon" }
attributes #1 = { nounwind "frame-pointer"="non-leaf" "target-cpu"="generic" "target-features"="+outline-atomics,+v8a,+fp-armv8,+neon" }
attributes #2 = { nounwind }
attributes #3 = { convergent nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!2}
!2 = !{i64 2, i64 -1, i64 -1, i1 true}
