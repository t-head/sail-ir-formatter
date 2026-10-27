; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }
%struct.__tgt_offload_entry = type { ptr, ptr, i64, i32, i32 }
%struct.__tgt_kernel_arguments = type { i32, i32, ptr, ptr, ptr, ptr, ptr, ptr, i64, i64, [3 x i32], [3 x i32], i32 }

@var_common_ = common global [8 x i8] zeroinitializer, align 4
@0 = private unnamed_addr constant [126 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-fortran-common-block-host.mlir;unknown;15;10;;\00", align 1
@1 = private unnamed_addr constant [126 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-fortran-common-block-host.mlir;unknown;16;10;;\00", align 1
@.__omp_offloading_47_1a802f2_omp_map_common_block_using_common_block_members_l17.region_id = weak constant i8 0
@.offload_sizes = private unnamed_addr constant [2 x i64] [i64 4, i64 4]
@.offload_maptypes = private unnamed_addr constant [2 x i64] [i64 35, i64 35]
@.offload_mapnames = private constant [2 x ptr] [ptr @0, ptr @1]
@2 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@3 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @2 }, align 8
@4 = private unnamed_addr constant [126 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-fortran-common-block-host.mlir;unknown;26;10;;\00", align 1
@.__omp_offloading_47_1a802f2_omp_map_common_block_using_common_block_symbol_l27.region_id = weak constant i8 0
@.offload_sizes.1 = private unnamed_addr constant [1 x i64] [i64 8]
@.offload_maptypes.2 = private unnamed_addr constant [1 x i64] [i64 35]
@.offload_mapnames.3 = private constant [1 x ptr] [ptr @4]
@.offloading.entry_name = internal unnamed_addr constant [80 x i8] c"__omp_offloading_47_1a802f2_omp_map_common_block_using_common_block_members_l17\00"
@.offloading.entry.__omp_offloading_47_1a802f2_omp_map_common_block_using_common_block_members_l17 = weak constant %struct.__tgt_offload_entry { ptr @.__omp_offloading_47_1a802f2_omp_map_common_block_using_common_block_members_l17.region_id, ptr @.offloading.entry_name, i64 0, i32 0, i32 0 }, section "omp_offloading_entries", align 1
@.offloading.entry_name.4 = internal unnamed_addr constant [79 x i8] c"__omp_offloading_47_1a802f2_omp_map_common_block_using_common_block_symbol_l27\00"
@.offloading.entry.__omp_offloading_47_1a802f2_omp_map_common_block_using_common_block_symbol_l27 = weak constant %struct.__tgt_offload_entry { ptr @.__omp_offloading_47_1a802f2_omp_map_common_block_using_common_block_symbol_l27.region_id, ptr @.offloading.entry_name.4, i64 0, i32 0, i32 0 }, section "omp_offloading_entries", align 1

define void @omp_map_common_block_using_common_block_members() {
  %.offload_baseptrs = alloca [2 x ptr], align 8
  %.offload_ptrs = alloca [2 x ptr], align 8
  %.offload_mappers = alloca [2 x ptr], align 8
  %kernel_args = alloca %struct.__tgt_kernel_arguments, align 8
  br label %entry

entry:                                            ; preds = %0
  %1 = getelementptr inbounds [2 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  store ptr @var_common_, ptr %1, align 8
  %2 = getelementptr inbounds [2 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  store ptr @var_common_, ptr %2, align 8
  %3 = getelementptr inbounds [2 x ptr], ptr %.offload_mappers, i64 0, i64 0
  store ptr null, ptr %3, align 8
  %4 = getelementptr inbounds [2 x ptr], ptr %.offload_baseptrs, i32 0, i32 1
  store ptr getelementptr (i8, ptr @var_common_, i64 4), ptr %4, align 8
  %5 = getelementptr inbounds [2 x ptr], ptr %.offload_ptrs, i32 0, i32 1
  store ptr getelementptr (i8, ptr @var_common_, i64 4), ptr %5, align 8
  %6 = getelementptr inbounds [2 x ptr], ptr %.offload_mappers, i64 0, i64 1
  store ptr null, ptr %6, align 8
  %7 = getelementptr inbounds [2 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  %8 = getelementptr inbounds [2 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  %9 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 0
  store i32 3, ptr %9, align 4
  %10 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 1
  store i32 2, ptr %10, align 4
  %11 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 2
  store ptr %7, ptr %11, align 8
  %12 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 3
  store ptr %8, ptr %12, align 8
  %13 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 4
  store ptr @.offload_sizes, ptr %13, align 8
  %14 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 5
  store ptr @.offload_maptypes, ptr %14, align 8
  %15 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 6
  store ptr @.offload_mapnames, ptr %15, align 8
  %16 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 7
  store ptr null, ptr %16, align 8
  %17 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 8
  store i64 0, ptr %17, align 8
  %18 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 9
  store i64 0, ptr %18, align 8
  %19 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 10
  store [3 x i32] [i32 -1, i32 0, i32 0], ptr %19, align 4
  %20 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 11
  store [3 x i32] zeroinitializer, ptr %20, align 4
  %21 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 12
  store i32 0, ptr %21, align 4
  %22 = call i32 @__tgt_target_kernel(ptr @3, i64 -1, i32 -1, i32 0, ptr @.__omp_offloading_47_1a802f2_omp_map_common_block_using_common_block_members_l17.region_id, ptr %kernel_args)
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %omp_offload.failed, label %omp_offload.cont

omp_offload.failed:                               ; preds = %entry
  call void @__omp_offloading_47_1a802f2_omp_map_common_block_using_common_block_members_l17(ptr @var_common_, ptr getelementptr (i8, ptr @var_common_, i64 4))
  br label %omp_offload.cont

omp_offload.cont:                                 ; preds = %omp_offload.failed, %entry
  ret void
}

define void @omp_map_common_block_using_common_block_symbol() {
  %.offload_baseptrs = alloca [1 x ptr], align 8
  %.offload_ptrs = alloca [1 x ptr], align 8
  %.offload_mappers = alloca [1 x ptr], align 8
  %kernel_args = alloca %struct.__tgt_kernel_arguments, align 8
  br label %entry

entry:                                            ; preds = %0
  %1 = getelementptr inbounds [1 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  store ptr @var_common_, ptr %1, align 8
  %2 = getelementptr inbounds [1 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  store ptr @var_common_, ptr %2, align 8
  %3 = getelementptr inbounds [1 x ptr], ptr %.offload_mappers, i64 0, i64 0
  store ptr null, ptr %3, align 8
  %4 = getelementptr inbounds [1 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  %5 = getelementptr inbounds [1 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  %6 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 0
  store i32 3, ptr %6, align 4
  %7 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 1
  store i32 1, ptr %7, align 4
  %8 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 2
  store ptr %4, ptr %8, align 8
  %9 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 3
  store ptr %5, ptr %9, align 8
  %10 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 4
  store ptr @.offload_sizes.1, ptr %10, align 8
  %11 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 5
  store ptr @.offload_maptypes.2, ptr %11, align 8
  %12 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 6
  store ptr @.offload_mapnames.3, ptr %12, align 8
  %13 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 7
  store ptr null, ptr %13, align 8
  %14 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 8
  store i64 0, ptr %14, align 8
  %15 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 9
  store i64 0, ptr %15, align 8
  %16 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 10
  store [3 x i32] [i32 -1, i32 0, i32 0], ptr %16, align 4
  %17 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 11
  store [3 x i32] zeroinitializer, ptr %17, align 4
  %18 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 12
  store i32 0, ptr %18, align 4
  %19 = call i32 @__tgt_target_kernel(ptr @3, i64 -1, i32 -1, i32 0, ptr @.__omp_offloading_47_1a802f2_omp_map_common_block_using_common_block_symbol_l27.region_id, ptr %kernel_args)
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %omp_offload.failed, label %omp_offload.cont

omp_offload.failed:                               ; preds = %entry
  call void @__omp_offloading_47_1a802f2_omp_map_common_block_using_common_block_symbol_l27(ptr @var_common_)
  br label %omp_offload.cont

omp_offload.cont:                                 ; preds = %omp_offload.failed, %entry
  ret void
}

define internal void @__omp_offloading_47_1a802f2_omp_map_common_block_using_common_block_members_l17(ptr %0, ptr %1) {
entry:
  br label %omp.target

omp.target:                                       ; preds = %entry
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.target
  ret void
}

; Function Attrs: nounwind
declare i32 @__tgt_target_kernel(ptr, i64, i32, i32, ptr, ptr) #0

define internal void @__omp_offloading_47_1a802f2_omp_map_common_block_using_common_block_symbol_l27(ptr %0) {
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
!1 = !{i32 0, i32 71, i32 27788018, !"omp_map_common_block_using_common_block_members", i32 17, i32 0, i32 0}
!2 = !{i32 0, i32 71, i32 27788018, !"omp_map_common_block_using_common_block_symbol", i32 27, i32 0, i32 1}
