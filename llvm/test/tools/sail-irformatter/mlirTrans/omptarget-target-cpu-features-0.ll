; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }
%struct.__tgt_offload_entry = type { ptr, ptr, i64, i32, i32 }
%struct.__tgt_kernel_arguments = type { i32, i32, ptr, ptr, ptr, ptr, ptr, ptr, i64, i64, [3 x i32], [3 x i32], i32 }

@.__omp_offloading_47_69b585_omp_target_region_l11.region_id = weak constant i8 0
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@.offloading.entry_name = internal unnamed_addr constant [49 x i8] c"__omp_offloading_47_69b585_omp_target_region_l11\00"
@.offloading.entry.__omp_offloading_47_69b585_omp_target_region_l11 = weak constant %struct.__tgt_offload_entry { ptr @.__omp_offloading_47_69b585_omp_target_region_l11.region_id, ptr @.offloading.entry_name, i64 0, i32 0, i32 0 }, section "omp_offloading_entries", align 1

define void @omp_target_region() #0 {
  %kernel_args = alloca %struct.__tgt_kernel_arguments, align 8
  br label %entry

entry:                                            ; preds = %0
  %1 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 0
  store i32 3, ptr %1, align 4
  %2 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 1
  store i32 0, ptr %2, align 4
  %3 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 2
  store ptr null, ptr %3, align 8
  %4 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 3
  store ptr null, ptr %4, align 8
  %5 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 4
  store ptr null, ptr %5, align 8
  %6 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 5
  store ptr null, ptr %6, align 8
  %7 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 6
  store ptr null, ptr %7, align 8
  %8 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 7
  store ptr null, ptr %8, align 8
  %9 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 8
  store i64 0, ptr %9, align 8
  %10 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 9
  store i64 0, ptr %10, align 8
  %11 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 10
  store [3 x i32] [i32 -1, i32 0, i32 0], ptr %11, align 4
  %12 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 11
  store [3 x i32] zeroinitializer, ptr %12, align 4
  %13 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 12
  store i32 0, ptr %13, align 4
  %14 = call i32 @__tgt_target_kernel(ptr @1, i64 -1, i32 -1, i32 0, ptr @.__omp_offloading_47_69b585_omp_target_region_l11.region_id, ptr %kernel_args)
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %omp_offload.failed, label %omp_offload.cont

omp_offload.failed:                               ; preds = %entry
  call void @__omp_offloading_47_69b585_omp_target_region_l11()
  br label %omp_offload.cont

omp_offload.cont:                                 ; preds = %omp_offload.failed, %entry
  ret void
}

define internal void @__omp_offloading_47_69b585_omp_target_region_l11() #0 {
entry:
  br label %omp.target

omp.target:                                       ; preds = %entry
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.target
  ret void
}

; Function Attrs: nounwind
declare i32 @__tgt_target_kernel(ptr, i64, i32, i32, ptr, ptr) #1

attributes #0 = { "target-cpu"="x86-64" "target-features"="+mmx,+sse" }
attributes #1 = { nounwind }

!llvm.module.flags = !{!0}
!omp_offload.info = !{!1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 0, i32 71, i32 6927749, !"omp_target_region", i32 11, i32 0, i32 0}
