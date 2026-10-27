; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8

declare void @foo()

declare void @bar(i32, i32, ptr)

define void @omp_taskgroup_task(i32 %0, i32 %1, ptr %2) {
  %structArg = alloca { i32, i32, ptr }, align 8
  br label %entry

entry:                                            ; preds = %3
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_taskgroup(ptr @1, i32 %omp_global_thread_num)
  br label %omp.taskgroup.region

omp.taskgroup.region1:                            ; preds = %task.exit3
  call void @foo()
  br label %omp.region.cont

omp.taskgroup.region:                             ; preds = %entry
  %4 = alloca i8, align 1
  br label %codeRepl

codeRepl:                                         ; preds = %omp.taskgroup.region
  %omp_global_thread_num10 = call i32 @__kmpc_global_thread_num(ptr @1)
  %5 = call ptr @__kmpc_omp_task_alloc(ptr @1, i32 %omp_global_thread_num10, i32 1, i64 40, i64 0, ptr @omp_taskgroup_task..omp_par)
  %6 = call i32 @__kmpc_omp_task(ptr @1, i32 %omp_global_thread_num10, ptr %5)
  br label %task.exit

task.exit:                                        ; preds = %codeRepl
  br label %codeRepl11

codeRepl11:                                       ; preds = %task.exit
  %gep_ = getelementptr { i32, i32, ptr }, ptr %structArg, i32 0, i32 0
  store i32 %0, ptr %gep_, align 4
  %gep_12 = getelementptr { i32, i32, ptr }, ptr %structArg, i32 0, i32 1
  store i32 %1, ptr %gep_12, align 4
  %gep_13 = getelementptr { i32, i32, ptr }, ptr %structArg, i32 0, i32 2
  store ptr %2, ptr %gep_13, align 8
  %omp_global_thread_num14 = call i32 @__kmpc_global_thread_num(ptr @1)
  %7 = call ptr @__kmpc_omp_task_alloc(ptr @1, i32 %omp_global_thread_num14, i32 1, i64 40, i64 16, ptr @omp_taskgroup_task..omp_par.1)
  %8 = load ptr, ptr %7, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %8, ptr align 1 %structArg, i64 16, i1 false)
  %9 = call i32 @__kmpc_omp_task(ptr @1, i32 %omp_global_thread_num14, ptr %7)
  br label %task.exit3

task.exit3:                                       ; preds = %codeRepl11
  br label %omp.taskgroup.region1

omp.region.cont:                                  ; preds = %omp.taskgroup.region1
  br label %taskgroup.exit

taskgroup.exit:                                   ; preds = %omp.region.cont
  call void @__kmpc_end_taskgroup(ptr @1, i32 %omp_global_thread_num)
  ret void
}

define internal void @omp_taskgroup_task..omp_par.1(i32 %global.tid.val9, ptr %0) {
task.alloca5:
  %1 = load ptr, ptr %0, align 8
  %gep_ = getelementptr { i32, i32, ptr }, ptr %1, i32 0, i32 0
  %loadgep_ = load i32, ptr %gep_, align 4
  %gep_1 = getelementptr { i32, i32, ptr }, ptr %1, i32 0, i32 1
  %loadgep_2 = load i32, ptr %gep_1, align 4
  %gep_3 = getelementptr { i32, i32, ptr }, ptr %1, i32 0, i32 2
  %loadgep_4 = load ptr, ptr %gep_3, align 8
  br label %task.body4

task.body4:                                       ; preds = %task.alloca5
  br label %omp.task.region7

omp.task.region7:                                 ; preds = %task.body4
  call void @bar(i32 %loadgep_, i32 %loadgep_2, ptr %loadgep_4)
  br label %omp.region.cont6

omp.region.cont6:                                 ; preds = %omp.task.region7
  br label %task.exit3.exitStub

task.exit3.exitStub:                              ; preds = %omp.region.cont6
  ret void
}

define internal void @omp_taskgroup_task..omp_par(i32 %global.tid.val) {
task.alloca:
  br label %task.body

task.body:                                        ; preds = %task.alloca
  br label %omp.task.region

omp.task.region:                                  ; preds = %task.body
  call void @foo()
  br label %omp.region.cont2

omp.region.cont2:                                 ; preds = %omp.task.region
  br label %task.exit.exitStub

task.exit.exitStub:                               ; preds = %omp.region.cont2
  ret void
}

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #0

; Function Attrs: convergent nounwind
declare void @__kmpc_taskgroup(ptr, i32) #1

; Function Attrs: convergent nounwind
declare void @__kmpc_end_taskgroup(ptr, i32) #1

; Function Attrs: nounwind
declare noalias ptr @__kmpc_omp_task_alloc(ptr, i32, i32, i64, i64, ptr) #0

; Function Attrs: nounwind
declare i32 @__kmpc_omp_task(ptr, i32, ptr) #0

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { nounwind }
attributes #1 = { convergent nounwind }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

