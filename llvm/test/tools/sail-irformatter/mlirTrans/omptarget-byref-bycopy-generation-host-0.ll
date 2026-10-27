; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }
%struct.__tgt_offload_entry = type { ptr, ptr, i64, i32, i32 }
%struct.__tgt_kernel_arguments = type { i32, i32, ptr, ptr, ptr, ptr, ptr, ptr, i64, i64, [3 x i32], [3 x i32], i32 }

@_QFEi = internal global i32 1
@_QFEsp = internal global i32 0
@0 = private unnamed_addr constant [128 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-byref-bycopy-generation-host.mlir;unknown;7;10;;\00", align 1
@1 = private unnamed_addr constant [128 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-byref-bycopy-generation-host.mlir;unknown;8;10;;\00", align 1
@.__omp_offloading_47_69b556__QQmain_l9.region_id = weak constant i8 0
@.offload_sizes = private unnamed_addr constant [2 x i64] [i64 4, i64 4]
@.offload_maptypes = private unnamed_addr constant [2 x i64] [i64 35, i64 289]
@.offload_mapnames = private constant [2 x ptr] [ptr @0, ptr @1]
@2 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@3 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @2 }, align 8
@.offloading.entry_name = internal unnamed_addr constant [38 x i8] c"__omp_offloading_47_69b556__QQmain_l9\00"
@.offloading.entry.__omp_offloading_47_69b556__QQmain_l9 = weak constant %struct.__tgt_offload_entry { ptr @.__omp_offloading_47_69b556__QQmain_l9.region_id, ptr @.offloading.entry_name, i64 0, i32 0, i32 0 }, section "omp_offloading_entries", align 1

define void @_QQmain() {
  %.casted = alloca ptr, align 8
  %.offload_baseptrs = alloca [2 x ptr], align 8
  %.offload_ptrs = alloca [2 x ptr], align 8
  %.offload_mappers = alloca [2 x ptr], align 8
  %kernel_args = alloca %struct.__tgt_kernel_arguments, align 8
  br label %entry

entry:                                            ; preds = %0
  %1 = load i32, ptr @_QFEi, align 4
  store i32 %1, ptr %.casted, align 4
  %2 = load ptr, ptr %.casted, align 8
  %3 = getelementptr inbounds [2 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  store ptr @_QFEsp, ptr %3, align 8
  %4 = getelementptr inbounds [2 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  store ptr @_QFEsp, ptr %4, align 8
  %5 = getelementptr inbounds [2 x ptr], ptr %.offload_mappers, i64 0, i64 0
  store ptr null, ptr %5, align 8
  %6 = getelementptr inbounds [2 x ptr], ptr %.offload_baseptrs, i32 0, i32 1
  store ptr %2, ptr %6, align 8
  %7 = getelementptr inbounds [2 x ptr], ptr %.offload_ptrs, i32 0, i32 1
  store ptr %2, ptr %7, align 8
  %8 = getelementptr inbounds [2 x ptr], ptr %.offload_mappers, i64 0, i64 1
  store ptr null, ptr %8, align 8
  %9 = getelementptr inbounds [2 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  %10 = getelementptr inbounds [2 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  %11 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 0
  store i32 3, ptr %11, align 4
  %12 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 1
  store i32 2, ptr %12, align 4
  %13 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 2
  store ptr %9, ptr %13, align 8
  %14 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 3
  store ptr %10, ptr %14, align 8
  %15 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 4
  store ptr @.offload_sizes, ptr %15, align 8
  %16 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 5
  store ptr @.offload_maptypes, ptr %16, align 8
  %17 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 6
  store ptr @.offload_mapnames, ptr %17, align 8
  %18 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 7
  store ptr null, ptr %18, align 8
  %19 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 8
  store i64 0, ptr %19, align 8
  %20 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 9
  store i64 0, ptr %20, align 8
  %21 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 10
  store [3 x i32] [i32 -1, i32 0, i32 0], ptr %21, align 4
  %22 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 11
  store [3 x i32] zeroinitializer, ptr %22, align 4
  %23 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 12
  store i32 0, ptr %23, align 4
  %24 = call i32 @__tgt_target_kernel(ptr @3, i64 -1, i32 -1, i32 0, ptr @.__omp_offloading_47_69b556__QQmain_l9.region_id, ptr %kernel_args)
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %omp_offload.failed, label %omp_offload.cont

omp_offload.failed:                               ; preds = %entry
  call void @__omp_offloading_47_69b556__QQmain_l9(ptr @_QFEsp, ptr @_QFEi)
  br label %omp_offload.cont

omp_offload.cont:                                 ; preds = %omp_offload.failed, %entry
  ret void
}

define internal void @__omp_offloading_47_69b556__QQmain_l9(ptr %0, ptr %1) {
entry:
  br label %omp.target

omp.target:                                       ; preds = %entry
  %2 = load i32, ptr %1, align 4
  store i32 %2, ptr %0, align 4
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.target
  ret void
}

; Function Attrs: nounwind
declare i32 @__tgt_target_kernel(ptr, i64, i32, i32, ptr, ptr) #0

attributes #0 = { nounwind }

!llvm.module.flags = !{!0}
!omp_offload.info = !{!1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 0, i32 71, i32 6927702, !"_QQmain", i32 9, i32 0, i32 0}
