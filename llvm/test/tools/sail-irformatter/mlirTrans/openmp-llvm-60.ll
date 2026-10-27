; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8

define void @omp_task(i32 %0, i32 %1, ptr %2) {
  br label %entry

entry:                                            ; preds = %3
  br label %codeRepl

codeRepl:                                         ; preds = %entry
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  %4 = call ptr @__kmpc_omp_task_alloc(ptr @1, i32 %omp_global_thread_num, i32 1, i64 40, i64 0, ptr @omp_task..omp_par)
  %5 = call i32 @__kmpc_omp_task(ptr @1, i32 %omp_global_thread_num, ptr %4)
  br label %task.exit

task.exit:                                        ; preds = %codeRepl
  ret void
}

define internal void @omp_task..omp_par(i32 %global.tid.val) {
task.alloca:
  br label %task.body

task.body:                                        ; preds = %task.alloca
  br label %omp.task.region

omp.task.region:                                  ; preds = %task.body
  %0 = alloca i32, i64 1, align 4
  %1 = load i32, ptr %0, align 4
  %2 = add i32 %1, %1
  store i32 %2, ptr %0, align 4
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.task.region
  br label %task.exit.exitStub

task.exit.exitStub:                               ; preds = %omp.region.cont
  ret void
}

; Function Attrs: nounwind
declare noalias ptr @__kmpc_omp_task_alloc(ptr, i32, i32, i64, i64, ptr) #0

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #0

; Function Attrs: nounwind
declare i32 @__kmpc_omp_task(ptr, i32, ptr) #0

attributes #0 = { nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

