; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8

define void @omp_task(i32 %0, i32 %1, ptr %2) {
  %structArg = alloca { i32, i32, ptr }, align 8
  %4 = sub i32 %0, %1
  store i32 %4, ptr %2, align 4
  br label %entry

entry:                                            ; preds = %3
  br label %codeRepl

codeRepl:                                         ; preds = %entry
  %gep_ = getelementptr { i32, i32, ptr }, ptr %structArg, i32 0, i32 0
  store i32 %0, ptr %gep_, align 4
  %gep_1 = getelementptr { i32, i32, ptr }, ptr %structArg, i32 0, i32 1
  store i32 %1, ptr %gep_1, align 4
  %gep_2 = getelementptr { i32, i32, ptr }, ptr %structArg, i32 0, i32 2
  store ptr %2, ptr %gep_2, align 8
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  %5 = call ptr @__kmpc_omp_task_alloc(ptr @1, i32 %omp_global_thread_num, i32 1, i64 40, i64 16, ptr @omp_task..omp_par)
  %6 = load ptr, ptr %5, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %6, ptr align 1 %structArg, i64 16, i1 false)
  %7 = call i32 @__kmpc_omp_task(ptr @1, i32 %omp_global_thread_num, ptr %5)
  br label %task.exit

task.exit:                                        ; preds = %codeRepl
  %8 = mul i32 %0, %1
  store i32 %8, ptr %2, align 4
  ret void
}

define internal void @omp_task..omp_par(i32 %global.tid.val, ptr %0) {
task.alloca:
  %1 = load ptr, ptr %0, align 8
  %gep_ = getelementptr { i32, i32, ptr }, ptr %1, i32 0, i32 0
  %loadgep_ = load i32, ptr %gep_, align 4
  %gep_1 = getelementptr { i32, i32, ptr }, ptr %1, i32 0, i32 1
  %loadgep_2 = load i32, ptr %gep_1, align 4
  %gep_3 = getelementptr { i32, i32, ptr }, ptr %1, i32 0, i32 2
  %loadgep_4 = load ptr, ptr %gep_3, align 8
  br label %task.body

task.body:                                        ; preds = %task.alloca
  br label %omp.task.region

omp.task.region:                                  ; preds = %task.body
  %2 = add i32 %loadgep_, %loadgep_2
  store i32 %2, ptr %loadgep_4, align 4
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

; Function Attrs: nounwind
declare i32 @__kmpc_omp_task(ptr, i32, ptr) #0

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

