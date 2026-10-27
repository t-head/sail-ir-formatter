; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@__omp_rtl_debug_kind = weak_odr hidden constant i32 0
@__omp_rtl_assume_teams_oversubscription = weak_odr hidden constant i32 1
@__omp_rtl_assume_threads_oversubscription = weak_odr hidden constant i32 0
@__omp_rtl_assume_no_thread_state = weak_odr hidden constant i32 1
@__omp_rtl_assume_no_nested_parallelism = weak_odr hidden constant i32 0

!llvm.module.flags = !{!0, !1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 7, !"openmp-device", i32 50}

