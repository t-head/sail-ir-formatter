; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@_QFsubEx = internal global i32 undef
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@_QFsubEx.cache = common global ptr null, align 8

define void @omp_threadprivate() {
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  %1 = call ptr @__kmpc_threadprivate_cached(ptr @1, i32 %omp_global_thread_num, ptr @_QFsubEx, i64 4, ptr @_QFsubEx.cache)
  store i32 1, ptr %1, align 4
  br label %entry

entry:                                            ; preds = %0
  %omp_global_thread_num1 = call i32 @__kmpc_global_thread_num(ptr @1)
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 0, ptr @omp_threadprivate..omp_par)
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit
  store i32 3, ptr %1, align 4
  ret void
}

; Function Attrs: nounwind
define internal void @omp_threadprivate..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr) #0 {
omp.par.entry:
  %tid.addr.local = alloca i32, align 4
  %0 = load i32, ptr %tid.addr, align 4
  store i32 %0, ptr %tid.addr.local, align 4
  %tid = load i32, ptr %tid.addr.local, align 4
  br label %omp.reduction.init

omp.reduction.init:                               ; preds = %omp.par.entry
  br label %omp.par.region

omp.par.region:                                   ; preds = %omp.reduction.init
  br label %omp.par.region2

omp.par.region2:                                  ; preds = %omp.par.region
  %omp_global_thread_num3 = call i32 @__kmpc_global_thread_num(ptr @1)
  %1 = call ptr @__kmpc_threadprivate_cached(ptr @1, i32 %omp_global_thread_num3, ptr @_QFsubEx, i64 4, ptr @_QFsubEx.cache)
  store i32 2, ptr %1, align 4
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.par.region2
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont
  br label %omp.par.outlined.exit.exitStub

omp.par.outlined.exit.exitStub:                   ; preds = %omp.par.pre_finalize
  ret void
}

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #0

; Function Attrs: nounwind
declare ptr @__kmpc_threadprivate_cached(ptr, i32, ptr, i64, ptr) #0

; Function Attrs: nounwind
declare !callback !1 void @__kmpc_fork_call(ptr, i32, ptr, ...) #0

attributes #0 = { nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!2}
!2 = !{i64 2, i64 -1, i64 -1, i1 true}

