; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8

declare void @free(ptr)

define void @parallel_op_dealloc(ptr %0) {
  %structArg = alloca { ptr }, align 8
  br label %entry

entry:                                            ; preds = %1
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  %gep_ = getelementptr { ptr }, ptr %structArg, i32 0, i32 0
  store ptr %0, ptr %gep_, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 1, ptr @parallel_op_dealloc..omp_par, ptr %structArg)
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit
  ret void
}

; Function Attrs: nounwind
define internal void @parallel_op_dealloc..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr, ptr %0) #0 {
omp.par.entry:
  %gep_ = getelementptr { ptr }, ptr %0, i32 0, i32 0
  %loadgep_ = load ptr, ptr %gep_, align 8
  %tid.addr.local = alloca i32, align 4
  %1 = load i32, ptr %tid.addr, align 4
  store i32 %1, ptr %tid.addr.local, align 4
  %tid = load i32, ptr %tid.addr.local, align 4
  %2 = alloca float, align 4
  %3 = load float, ptr %loadgep_, align 4
  store float %3, ptr %2, align 4
  br label %omp.reduction.init

omp.reduction.init:                               ; preds = %omp.par.entry
  br label %omp.par.region

omp.par.region:                                   ; preds = %omp.reduction.init
  br label %omp.par.region1

omp.par.region1:                                  ; preds = %omp.par.region
  %4 = load float, ptr %2, align 4
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.par.region1
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont
  br label %omp.private.dealloc

omp.private.dealloc:                              ; preds = %omp.par.pre_finalize
  %5 = ptrtoint ptr %2 to i64
  %6 = icmp ne i64 %5, 0
  br i1 %6, label %omp.private.dealloc3, label %omp.private.dealloc4

omp.private.dealloc4:                             ; preds = %omp.private.dealloc3, %omp.private.dealloc
  br label %omp.region.cont2

omp.region.cont2:                                 ; preds = %omp.private.dealloc4
  br label %omp.par.outlined.exit.exitStub

omp.private.dealloc3:                             ; preds = %omp.private.dealloc
  call void @free(ptr %2)
  br label %omp.private.dealloc4

omp.par.outlined.exit.exitStub:                   ; preds = %omp.region.cont2
  ret void
}

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #0

; Function Attrs: nounwind
declare !callback !1 void @__kmpc_fork_call(ptr, i32, ptr, ...) #0

attributes #0 = { nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!2}
!2 = !{i64 2, i64 -1, i64 -1, i1 true}
