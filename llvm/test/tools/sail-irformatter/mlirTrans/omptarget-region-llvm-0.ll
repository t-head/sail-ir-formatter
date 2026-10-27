; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }
%struct.__tgt_offload_entry = type { ptr, ptr, i64, i32, i32 }
%struct.__tgt_kernel_arguments = type { i32, i32, ptr, ptr, ptr, ptr, ptr, ptr, i64, i64, [3 x i32], [3 x i32], i32 }

@0 = private unnamed_addr constant [112 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-region-llvm.mlir;unknown;15;13;;\00", align 1
@1 = private unnamed_addr constant [112 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-region-llvm.mlir;unknown;16;13;;\00", align 1
@2 = private unnamed_addr constant [112 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-region-llvm.mlir;unknown;17;13;;\00", align 1
@.__omp_offloading_47_69b576_omp_target_region__l18.region_id = weak constant i8 0
@.offload_sizes = private unnamed_addr constant [3 x i64] [i64 4, i64 4, i64 4]
@.offload_maptypes = private unnamed_addr constant [3 x i64] [i64 35, i64 35, i64 35]
@.offload_mapnames = private constant [3 x ptr] [ptr @0, ptr @1, ptr @2]
@3 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@4 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @3 }, align 8
@.__omp_offloading_47_69b576_omp_target_no_map_l30.region_id = weak constant i8 0
@.offloading.entry_name = internal unnamed_addr constant [50 x i8] c"__omp_offloading_47_69b576_omp_target_region__l18\00"
@.offloading.entry.__omp_offloading_47_69b576_omp_target_region__l18 = weak constant %struct.__tgt_offload_entry { ptr @.__omp_offloading_47_69b576_omp_target_region__l18.region_id, ptr @.offloading.entry_name, i64 0, i32 0, i32 0 }, section "omp_offloading_entries", align 1
@.offloading.entry_name.1 = internal unnamed_addr constant [49 x i8] c"__omp_offloading_47_69b576_omp_target_no_map_l30\00"
@.offloading.entry.__omp_offloading_47_69b576_omp_target_no_map_l30 = weak constant %struct.__tgt_offload_entry { ptr @.__omp_offloading_47_69b576_omp_target_no_map_l30.region_id, ptr @.offloading.entry_name.1, i64 0, i32 0, i32 0 }, section "omp_offloading_entries", align 1

define void @omp_target_region_() {
  %.offload_baseptrs = alloca [3 x ptr], align 8
  %.offload_ptrs = alloca [3 x ptr], align 8
  %.offload_mappers = alloca [3 x ptr], align 8
  %kernel_args = alloca %struct.__tgt_kernel_arguments, align 8
  %1 = alloca i32, i64 1, align 4
  %2 = alloca i32, i64 1, align 4
  %3 = alloca i32, i64 1, align 4
  store i32 10, ptr %1, align 4
  store i32 20, ptr %2, align 4
  br label %entry

entry:                                            ; preds = %0
  %4 = getelementptr inbounds [3 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  store ptr %1, ptr %4, align 8
  %5 = getelementptr inbounds [3 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  store ptr %1, ptr %5, align 8
  %6 = getelementptr inbounds [3 x ptr], ptr %.offload_mappers, i64 0, i64 0
  store ptr null, ptr %6, align 8
  %7 = getelementptr inbounds [3 x ptr], ptr %.offload_baseptrs, i32 0, i32 1
  store ptr %2, ptr %7, align 8
  %8 = getelementptr inbounds [3 x ptr], ptr %.offload_ptrs, i32 0, i32 1
  store ptr %2, ptr %8, align 8
  %9 = getelementptr inbounds [3 x ptr], ptr %.offload_mappers, i64 0, i64 1
  store ptr null, ptr %9, align 8
  %10 = getelementptr inbounds [3 x ptr], ptr %.offload_baseptrs, i32 0, i32 2
  store ptr %3, ptr %10, align 8
  %11 = getelementptr inbounds [3 x ptr], ptr %.offload_ptrs, i32 0, i32 2
  store ptr %3, ptr %11, align 8
  %12 = getelementptr inbounds [3 x ptr], ptr %.offload_mappers, i64 0, i64 2
  store ptr null, ptr %12, align 8
  %13 = getelementptr inbounds [3 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  %14 = getelementptr inbounds [3 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  %15 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 0
  store i32 3, ptr %15, align 4
  %16 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 1
  store i32 3, ptr %16, align 4
  %17 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 2
  store ptr %13, ptr %17, align 8
  %18 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 3
  store ptr %14, ptr %18, align 8
  %19 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 4
  store ptr @.offload_sizes, ptr %19, align 8
  %20 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 5
  store ptr @.offload_maptypes, ptr %20, align 8
  %21 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 6
  store ptr @.offload_mapnames, ptr %21, align 8
  %22 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 7
  store ptr null, ptr %22, align 8
  %23 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 8
  store i64 0, ptr %23, align 8
  %24 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 9
  store i64 0, ptr %24, align 8
  %25 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 10
  store [3 x i32] [i32 -1, i32 0, i32 0], ptr %25, align 4
  %26 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 11
  store [3 x i32] zeroinitializer, ptr %26, align 4
  %27 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 12
  store i32 0, ptr %27, align 4
  %28 = call i32 @__tgt_target_kernel(ptr @4, i64 -1, i32 -1, i32 0, ptr @.__omp_offloading_47_69b576_omp_target_region__l18.region_id, ptr %kernel_args)
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %omp_offload.failed, label %omp_offload.cont

omp_offload.failed:                               ; preds = %entry
  call void @__omp_offloading_47_69b576_omp_target_region__l18(ptr %1, ptr %2, ptr %3)
  br label %omp_offload.cont

omp_offload.cont:                                 ; preds = %omp_offload.failed, %entry
  ret void
}

define void @omp_target_no_map() {
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
  %14 = call i32 @__tgt_target_kernel(ptr @4, i64 -1, i32 -1, i32 0, ptr @.__omp_offloading_47_69b576_omp_target_no_map_l30.region_id, ptr %kernel_args)
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %omp_offload.failed, label %omp_offload.cont

omp_offload.failed:                               ; preds = %entry
  call void @__omp_offloading_47_69b576_omp_target_no_map_l30()
  br label %omp_offload.cont

omp_offload.cont:                                 ; preds = %omp_offload.failed, %entry
  ret void
}

define internal void @__omp_offloading_47_69b576_omp_target_region__l18(ptr %0, ptr %1, ptr %2) {
entry:
  br label %omp.target

omp.target:                                       ; preds = %entry
  %3 = load i32, ptr %0, align 4
  %4 = load i32, ptr %1, align 4
  %5 = add i32 %3, %4
  store i32 %5, ptr %2, align 4
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.target
  ret void
}

; Function Attrs: nounwind
declare i32 @__tgt_target_kernel(ptr, i64, i32, i32, ptr, ptr) #0

define internal void @__omp_offloading_47_69b576_omp_target_no_map_l30() {
entry:
  br label %omp.target

omp.target:                                       ; preds = %entry
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.target
  ret void
}

attributes #0 = { nounwind }

!llvm.module.flags = !{!0}
!omp_offload.info = !{!1, !2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 0, i32 71, i32 6927734, !"omp_target_no_map", i32 30, i32 0, i32 1}
!2 = !{i32 0, i32 71, i32 6927734, !"omp_target_region_", i32 18, i32 0, i32 0}
