; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8

define void @omp_task_attrs() #0 {
  br label %entry

entry:                                            ; preds = %0
  br label %codeRepl

codeRepl:                                         ; preds = %entry
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  %1 = call ptr @__kmpc_omp_task_alloc(ptr @1, i32 %omp_global_thread_num, i32 1, i64 40, i64 0, ptr @omp_task_attrs..omp_par)
  %2 = call i32 @__kmpc_omp_task(ptr @1, i32 %omp_global_thread_num, ptr %1)
  br label %task.exit

task.exit:                                        ; preds = %codeRepl
  ret void
}

define internal void @omp_task_attrs..omp_par(i32 %global.tid.val) #0 {
task.alloca:
  br label %task.body

task.body:                                        ; preds = %task.alloca
  br label %omp.task.region

omp.task.region:                                  ; preds = %task.body
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.task.region
  br label %task.exit.exitStub

task.exit.exitStub:                               ; preds = %omp.region.cont
  ret void
}

; Function Attrs: nounwind
declare noalias ptr @__kmpc_omp_task_alloc(ptr, i32, i32, i64, i64, ptr) #1

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #1

; Function Attrs: nounwind
declare i32 @__kmpc_omp_task(ptr, i32, ptr) #1

attributes #0 = { "target-cpu"="x86-64" "target-features"="+mmx,+sse" }
attributes #1 = { nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

