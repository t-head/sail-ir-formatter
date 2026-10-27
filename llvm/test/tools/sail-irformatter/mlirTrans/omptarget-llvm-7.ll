; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [132 x i8] c";within split at /ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-llvm.mlir:388 offset ;unknown;8;10;;\00", align 1
@1 = private unnamed_addr constant [132 x i8] c";within split at /ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-llvm.mlir:388 offset ;unknown;9;11;;\00", align 1
@.offload_sizes = private unnamed_addr constant [2 x i64] [i64 8, i64 8]
@.offload_maptypes = private unnamed_addr constant [2 x i64] [i64 67, i64 67]
@.offload_mapnames = private constant [2 x ptr] [ptr @0, ptr @1]
@2 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@3 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @2 }, align 8

define void @_QPopenmp_target_use_dev_both() {
  %.offload_baseptrs = alloca [2 x ptr], align 8
  %.offload_ptrs = alloca [2 x ptr], align 8
  %.offload_mappers = alloca [2 x ptr], align 8
  %1 = alloca ptr, align 8
  %2 = alloca ptr, i64 1, align 8
  %3 = alloca ptr, i64 1, align 8
  br label %entry

entry:                                            ; preds = %0
  %4 = getelementptr inbounds [2 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  store ptr %2, ptr %4, align 8
  %5 = getelementptr inbounds [2 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  store ptr %2, ptr %5, align 8
  %6 = getelementptr inbounds [2 x ptr], ptr %.offload_mappers, i64 0, i64 0
  store ptr null, ptr %6, align 8
  %7 = getelementptr inbounds [2 x ptr], ptr %.offload_baseptrs, i32 0, i32 1
  store ptr %3, ptr %7, align 8
  %8 = getelementptr inbounds [2 x ptr], ptr %.offload_ptrs, i32 0, i32 1
  store ptr %3, ptr %8, align 8
  %9 = getelementptr inbounds [2 x ptr], ptr %.offload_mappers, i64 0, i64 1
  store ptr null, ptr %9, align 8
  %10 = getelementptr inbounds [2 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  %11 = getelementptr inbounds [2 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  call void @__tgt_target_data_begin_mapper(ptr @3, i64 -1, i32 2, ptr %10, ptr %11, ptr @.offload_sizes, ptr @.offload_maptypes, ptr @.offload_mapnames, ptr null)
  %12 = load ptr, ptr %4, align 8
  store ptr %12, ptr %1, align 8
  %13 = load ptr, ptr %7, align 8
  %14 = load ptr, ptr %1, align 8
  store i32 10, ptr %14, align 4
  %15 = load ptr, ptr %13, align 8
  store i32 20, ptr %15, align 4
  %16 = getelementptr inbounds [2 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  %17 = getelementptr inbounds [2 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  call void @__tgt_target_data_end_mapper(ptr @3, i64 -1, i32 2, ptr %16, ptr %17, ptr @.offload_sizes, ptr @.offload_maptypes, ptr @.offload_mapnames, ptr null)
  ret void
}

; Function Attrs: nounwind
declare void @__tgt_target_data_begin_mapper(ptr, i64, i32, ptr, ptr, ptr, ptr, ptr, ptr) #0

; Function Attrs: nounwind
declare void @__tgt_target_data_end_mapper(ptr, i64, i32, ptr, ptr, ptr, ptr, ptr, ptr) #0

attributes #0 = { nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

