; FIXME: open -verify-pointers call void bitcast (void (i32)* @omp_task_if..omp_par to ptr)(i32 %2)
; RUN: sail-irformatter -S < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8

declare void @foo_before()

declare void @foo()

declare void @foo_after()

define void @omp_task_if(i1 %0) {
  call void @foo_before()
  br label %entry

entry:                                            ; preds = %1
  br label %codeRepl

codeRepl:                                         ; preds = %entry
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  %2 = call ptr @__kmpc_omp_task_alloc(ptr @1, i32 %omp_global_thread_num, i32 1, i64 40, i64 0, ptr @omp_task_if..omp_par)
  br i1 %0, label %3, label %5

3:                                                ; preds = %codeRepl
  %4 = call i32 @__kmpc_omp_task(ptr @1, i32 %omp_global_thread_num, ptr %2)
  br label %6

5:                                                ; preds = %codeRepl
  call void @__kmpc_omp_task_begin_if0(ptr @1, i32 %omp_global_thread_num, ptr %2)
  call void @omp_task_if..omp_par(i32 %omp_global_thread_num)
  call void @__kmpc_omp_task_complete_if0(ptr @1, i32 %omp_global_thread_num, ptr %2)
  br label %6

6:                                                ; preds = %5, %3
  br label %if.end

if.end:                                           ; preds = %6
  br label %task.exit

task.exit:                                        ; preds = %if.end
  call void @foo_after()
  ret void
}

define internal void @omp_task_if..omp_par(i32 %global.tid.val) {
task.alloca:
  br label %task.body

task.body:                                        ; preds = %task.alloca
  br label %omp.task.region

omp.task.region:                                  ; preds = %task.body
  call void @foo()
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
declare void @__kmpc_omp_task_begin_if0(ptr, i32, ptr) #0

; Function Attrs: nounwind
declare void @__kmpc_omp_task_complete_if0(ptr, i32, ptr) #0

; Function Attrs: nounwind
declare i32 @__kmpc_omp_task(ptr, i32, ptr) #0

attributes #0 = { nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

