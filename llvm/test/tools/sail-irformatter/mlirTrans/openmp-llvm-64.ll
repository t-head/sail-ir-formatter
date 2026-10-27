; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8

define void @par_task_(ptr %0) {
  %structArg3 = alloca { ptr }, align 8
  br label %entry

entry:                                            ; preds = %1
  br label %codeRepl

codeRepl:                                         ; preds = %entry
  %gep_4 = getelementptr { ptr }, ptr %structArg3, i32 0, i32 0
  store ptr %0, ptr %gep_4, align 8
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  %2 = call ptr @__kmpc_omp_task_alloc(ptr @1, i32 %omp_global_thread_num, i32 1, i64 40, i64 8, ptr @par_task_..omp_par.1)
  %3 = load ptr, ptr %2, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %3, ptr align 1 %structArg3, i64 8, i1 false)
  %4 = call i32 @__kmpc_omp_task(ptr @1, i32 %omp_global_thread_num, ptr %2)
  br label %task.exit

task.exit:                                        ; preds = %codeRepl
  ret void
}

define internal void @par_task_..omp_par.1(i32 %global.tid.val, ptr %0) {
task.alloca:
  %1 = load ptr, ptr %0, align 8
  %gep_ = getelementptr { ptr }, ptr %1, i32 0, i32 0
  %loadgep_ = load ptr, ptr %gep_, align 8
  %structArg = alloca { ptr }, align 8
  br label %task.body

task.body:                                        ; preds = %task.alloca
  br label %omp.task.region

omp.task.region:                                  ; preds = %task.body
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  br label %omp_parallel

omp_parallel:                                     ; preds = %omp.task.region
  %gep_1 = getelementptr { ptr }, ptr %structArg, i32 0, i32 0
  store ptr %loadgep_, ptr %gep_1, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 1, ptr @par_task_..omp_par, ptr %structArg)
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.par.exit.split
  br label %task.exit.exitStub

task.exit.exitStub:                               ; preds = %omp.region.cont
  ret void
}

; Function Attrs: nounwind
define internal void @par_task_..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr, ptr %0) #0 {
omp.par.entry:
  %gep_ = getelementptr { ptr }, ptr %0, i32 0, i32 0
  %loadgep_ = load ptr, ptr %gep_, align 8
  %tid.addr.local = alloca i32, align 4
  %1 = load i32, ptr %tid.addr, align 4
  store i32 %1, ptr %tid.addr.local, align 4
  %tid = load i32, ptr %tid.addr.local, align 4
  br label %omp.reduction.init

omp.reduction.init:                               ; preds = %omp.par.entry
  br label %omp.par.region

omp.par.region:                                   ; preds = %omp.reduction.init
  br label %omp.par.region2

omp.par.region2:                                  ; preds = %omp.par.region
  store i32 1, ptr %loadgep_, align 4
  br label %omp.region.cont1

omp.region.cont1:                                 ; preds = %omp.par.region2
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont1
  br label %omp.par.outlined.exit.exitStub

omp.par.outlined.exit.exitStub:                   ; preds = %omp.par.pre_finalize
  ret void
}

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #0

; Function Attrs: nounwind
declare !callback !1 void @__kmpc_fork_call(ptr, i32, ptr, ...) #0

; Function Attrs: nounwind
declare noalias ptr @__kmpc_omp_task_alloc(ptr, i32, i32, i64, i64, ptr) #0

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: nounwind
declare i32 @__kmpc_omp_task(ptr, i32, ptr) #0

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!2}
!2 = !{i64 2, i64 -1, i64 -1, i1 true}

