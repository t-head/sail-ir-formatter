; FIXME: open -verify-pointers call void bitcast (void (i32)* @omp_task_if..omp_par to ptr)(i32 %2)
; RUN: sail-irformatter -S  < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }
%struct.kmp_dep_info = type { i64, i64, i8 }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8

define void @foo_(ptr %0, ptr %1) {
  %structArg = alloca { ptr, ptr }, align 8
  %.dep.arr.addr = alloca [1 x %struct.kmp_dep_info], align 8
  %3 = getelementptr inbounds [1 x %struct.kmp_dep_info], ptr %.dep.arr.addr, i64 0, i64 0
  %4 = getelementptr inbounds %struct.kmp_dep_info, ptr %3, i32 0, i32 0
  %5 = ptrtoint ptr %0 to i64
  store i64 %5, ptr %4, align 4
  %6 = getelementptr inbounds %struct.kmp_dep_info, ptr %3, i32 0, i32 1
  store i64 8, ptr %6, align 4
  %7 = getelementptr inbounds %struct.kmp_dep_info, ptr %3, i32 0, i32 2
  store i8 1, ptr %7, align 1
  br label %entry

entry:                                            ; preds = %2
  br label %codeRepl

codeRepl:                                         ; preds = %entry
  %gep_ = getelementptr { ptr, ptr }, ptr %structArg, i32 0, i32 0
  store ptr %0, ptr %gep_, align 8
  %gep_1 = getelementptr { ptr, ptr }, ptr %structArg, i32 0, i32 1
  store ptr %1, ptr %gep_1, align 8
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  %8 = call ptr @__kmpc_omp_task_alloc(ptr @1, i32 %omp_global_thread_num, i32 1, i64 40, i64 16, ptr @foo_..omp_par)
  %9 = load ptr, ptr %8, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %9, ptr align 1 %structArg, i64 16, i1 false)
  br i1 false, label %10, label %12

10:                                               ; preds = %codeRepl
  %11 = call i32 @__kmpc_omp_task_with_deps(ptr @1, i32 %omp_global_thread_num, ptr %8, i32 1, ptr %.dep.arr.addr, i32 0, ptr null)
  br label %13

12:                                               ; preds = %codeRepl
  call void @__kmpc_omp_wait_deps(ptr @1, i32 %omp_global_thread_num, i32 1, ptr %.dep.arr.addr, i32 0, ptr null)
  call void @__kmpc_omp_task_begin_if0(ptr @1, i32 %omp_global_thread_num, ptr %8)
  call void @foo_..omp_par(i32 %omp_global_thread_num, ptr %8)
  call void @__kmpc_omp_task_complete_if0(ptr @1, i32 %omp_global_thread_num, ptr %8)
  br label %13

13:                                               ; preds = %12, %10
  br label %if.end

if.end:                                           ; preds = %13
  br label %task.exit

task.exit:                                        ; preds = %if.end
  ret void
}

define internal void @foo_..omp_par(i32 %global.tid.val, ptr %0) {
task.alloca:
  %1 = load ptr, ptr %0, align 8
  %gep_ = getelementptr { ptr, ptr }, ptr %1, i32 0, i32 0
  %loadgep_ = load ptr, ptr %gep_, align 8
  %gep_1 = getelementptr { ptr, ptr }, ptr %1, i32 0, i32 1
  %loadgep_2 = load ptr, ptr %gep_1, align 8
  br label %task.body

task.body:                                        ; preds = %task.alloca
  br label %omp.task.region

omp.task.region:                                  ; preds = %task.body
  %2 = load i32, ptr %loadgep_, align 4
  store i32 %2, ptr %loadgep_2, align 4
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

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: convergent nounwind
declare void @__kmpc_omp_wait_deps(ptr, i32, i32, ptr, i32, ptr) #2

; Function Attrs: nounwind
declare void @__kmpc_omp_task_begin_if0(ptr, i32, ptr) #0

; Function Attrs: nounwind
declare void @__kmpc_omp_task_complete_if0(ptr, i32, ptr) #0

; Function Attrs: nounwind
declare i32 @__kmpc_omp_task_with_deps(ptr, i32, ptr, i32, ptr, i32, ptr) #0

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { convergent nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
