; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8

declare void @foo()

define void @omp_taskgroup(i32 %0, i32 %1, ptr %2) {
  br label %entry

entry:                                            ; preds = %3
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_taskgroup(ptr @1, i32 %omp_global_thread_num)
  br label %omp.taskgroup.region

omp.taskgroup.region:                             ; preds = %entry
  call void @foo()
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.taskgroup.region
  br label %taskgroup.exit

taskgroup.exit:                                   ; preds = %omp.region.cont
  call void @__kmpc_end_taskgroup(ptr @1, i32 %omp_global_thread_num)
  ret void
}

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #0

; Function Attrs: convergent nounwind
declare void @__kmpc_taskgroup(ptr, i32) #1

; Function Attrs: convergent nounwind
declare void @__kmpc_end_taskgroup(ptr, i32) #1

attributes #0 = { nounwind }
attributes #1 = { convergent nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

