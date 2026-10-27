; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 18, i32 0, i32 22, ptr @0 }, align 8
@.gomp_critical_user_.reduction.var = common global [8 x i32] zeroinitializer, align 8

define void @simple_reduction_parallel() {
  %structArg = alloca { ptr }, align 8
  %1 = alloca i32, align 4
  br label %entry

entry:                                            ; preds = %0
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  %gep_ = getelementptr { ptr }, ptr %structArg, i32 0, i32 0
  store ptr %1, ptr %gep_, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 1, ptr @simple_reduction_parallel..omp_par, ptr %structArg)
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit
  ret void
}

; Function Attrs: nounwind
define internal void @simple_reduction_parallel..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr, ptr %0) #0 {
omp.par.entry:
  %gep_ = getelementptr { ptr }, ptr %0, i32 0, i32 0
  %loadgep_ = load ptr, ptr %gep_, align 8
  %tid.addr.local = alloca i32, align 4
  %1 = load i32, ptr %tid.addr, align 4
  store i32 %1, ptr %tid.addr.local, align 4
  %tid = load i32, ptr %tid.addr.local, align 4
  %2 = alloca float, align 4
  %red.array = alloca [1 x ptr], align 8
  br label %omp.reduction.init

omp.reduction.init:                               ; preds = %omp.par.entry
  store float 0.000000e+00, ptr %2, align 4
  br label %omp.par.region

omp.par.region:                                   ; preds = %omp.reduction.init
  br label %omp.par.region1

omp.par.region1:                                  ; preds = %omp.par.region
  %3 = load float, ptr %2, align 4
  %4 = fadd float %3, 2.000000e+00
  store float %4, ptr %2, align 4
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.par.region1
  %red.array.elem.0 = getelementptr inbounds [1 x ptr], ptr %red.array, i64 0, i64 0
  store ptr %2, ptr %red.array.elem.0, align 8
  %omp_global_thread_num2 = call i32 @__kmpc_global_thread_num(ptr @2)
  %reduce = call i32 @__kmpc_reduce(ptr @2, i32 %omp_global_thread_num2, i32 1, i64 8, ptr %red.array, ptr @.omp.reduction.func, ptr @.gomp_critical_user_.reduction.var)
  switch i32 %reduce, label %reduce.finalize [
    i32 1, label %reduce.switch.nonatomic
    i32 2, label %reduce.switch.atomic
  ]

reduce.switch.atomic:                             ; preds = %omp.region.cont
  %5 = load float, ptr %2, align 4
  %6 = atomicrmw fadd ptr %loadgep_, float %5 monotonic, align 4
  br label %reduce.finalize

reduce.switch.nonatomic:                          ; preds = %omp.region.cont
  %red.value.0 = load float, ptr %loadgep_, align 4
  %red.private.value.0 = load float, ptr %2, align 4
  %7 = fadd float %red.value.0, %red.private.value.0
  store float %7, ptr %loadgep_, align 4
  call void @__kmpc_end_reduce(ptr @2, i32 %omp_global_thread_num2, ptr @.gomp_critical_user_.reduction.var)
  br label %reduce.finalize

reduce.finalize:                                  ; preds = %reduce.switch.atomic, %reduce.switch.nonatomic, %omp.region.cont
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %reduce.finalize
  br label %omp.par.outlined.exit.exitStub

omp.par.outlined.exit.exitStub:                   ; preds = %omp.par.pre_finalize
  ret void
}

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #0

define internal void @.omp.reduction.func(ptr %0, ptr %1) {
  %3 = getelementptr inbounds [1 x ptr], ptr %0, i64 0, i64 0
  %4 = load ptr, ptr %3, align 8
  %5 = load float, ptr %4, align 4
  %6 = getelementptr inbounds [1 x ptr], ptr %1, i64 0, i64 0
  %7 = load ptr, ptr %6, align 8
  %8 = load float, ptr %7, align 4
  %9 = fadd float %5, %8
  store float %9, ptr %4, align 4
  ret void
}

; Function Attrs: convergent nounwind
declare i32 @__kmpc_reduce(ptr, i32, i32, i64, ptr, ptr, ptr) #1

; Function Attrs: convergent nounwind
declare void @__kmpc_end_reduce(ptr, i32, ptr) #1

; Function Attrs: nounwind
declare !callback !1 void @__kmpc_fork_call(ptr, i32, ptr, ...) #0

attributes #0 = { nounwind }
attributes #1 = { convergent nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!2}
!2 = !{i64 2, i64 -1, i64 -1, i1 true}

