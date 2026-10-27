; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }
%struct.kmp_dep_info = type { i64, i64, i8 }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8

define void @omp_task_with_deps(ptr %0) {
  %.dep.arr.addr = alloca [1 x %struct.kmp_dep_info], align 8
  %2 = getelementptr inbounds [1 x %struct.kmp_dep_info], ptr %.dep.arr.addr, i64 0, i64 0
  %3 = getelementptr inbounds %struct.kmp_dep_info, ptr %2, i32 0, i32 0
  %4 = ptrtoint ptr %0 to i64
  store i64 %4, ptr %3, align 4
  %5 = getelementptr inbounds %struct.kmp_dep_info, ptr %2, i32 0, i32 1
  store i64 8, ptr %5, align 4
  %6 = getelementptr inbounds %struct.kmp_dep_info, ptr %2, i32 0, i32 2
  store i8 1, ptr %6, align 1
  br label %entry

entry:                                            ; preds = %1
  br label %codeRepl

codeRepl:                                         ; preds = %entry
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  %7 = call ptr @__kmpc_omp_task_alloc(ptr @1, i32 %omp_global_thread_num, i32 1, i64 40, i64 0, ptr @omp_task_with_deps..omp_par)
  %8 = call i32 @__kmpc_omp_task_with_deps(ptr @1, i32 %omp_global_thread_num, ptr %7, i32 1, ptr %.dep.arr.addr, i32 0, ptr null)
  br label %task.exit

task.exit:                                        ; preds = %codeRepl
  ret void
}

define internal void @omp_task_with_deps..omp_par(i32 %global.tid.val) {
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
declare i32 @__kmpc_omp_task_with_deps(ptr, i32, ptr, i32, ptr, i32, ptr) #0

attributes #0 = { nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

