; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [132 x i8] c";within split at /ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-llvm.mlir:332 offset ;unknown;8;10;;\00", align 1
@1 = private unnamed_addr constant [131 x i8] c";within split at /ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-llvm.mlir:332 offset ;unknown;5;8;;\00", align 1
@.offload_sizes = private unnamed_addr constant [2 x i64] [i64 8, i64 0]
@.offload_maptypes = private unnamed_addr constant [2 x i64] [i64 2, i64 64]
@.offload_mapnames = private constant [2 x ptr] [ptr @0, ptr @1]
@2 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@3 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @2 }, align 8

define void @_QPopenmp_target_use_dev_addr_nomap() {
  %.offload_baseptrs = alloca [2 x ptr], align 8
  %.offload_ptrs = alloca [2 x ptr], align 8
  %.offload_mappers = alloca [2 x ptr], align 8
  %1 = alloca ptr, i64 1, align 8
  %2 = alloca ptr, i64 1, align 8
  br label %entry

entry:                                            ; preds = %0
  %3 = getelementptr inbounds [2 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  store ptr %2, ptr %3, align 8
  %4 = getelementptr inbounds [2 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  store ptr %2, ptr %4, align 8
  %5 = getelementptr inbounds [2 x ptr], ptr %.offload_mappers, i64 0, i64 0
  store ptr null, ptr %5, align 8
  %6 = getelementptr inbounds [2 x ptr], ptr %.offload_baseptrs, i32 0, i32 1
  store ptr %1, ptr %6, align 8
  %7 = getelementptr inbounds [2 x ptr], ptr %.offload_ptrs, i32 0, i32 1
  store ptr %1, ptr %7, align 8
  %8 = getelementptr inbounds [2 x ptr], ptr %.offload_mappers, i64 0, i64 1
  store ptr null, ptr %8, align 8
  %9 = getelementptr inbounds [2 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  %10 = getelementptr inbounds [2 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  call void @__tgt_target_data_begin_mapper(ptr @3, i64 -1, i32 2, ptr %9, ptr %10, ptr @.offload_sizes, ptr @.offload_maptypes, ptr @.offload_mapnames, ptr null)
  %11 = load ptr, ptr %6, align 8
  %12 = load ptr, ptr %11, align 8
  store i32 10, ptr %12, align 4
  %13 = load ptr, ptr %2, align 8
  store i32 20, ptr %13, align 4
  %14 = getelementptr inbounds [2 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  %15 = getelementptr inbounds [2 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  call void @__tgt_target_data_end_mapper(ptr @3, i64 -1, i32 2, ptr %14, ptr %15, ptr @.offload_sizes, ptr @.offload_maptypes, ptr @.offload_mapnames, ptr null)
  ret void
}

; Function Attrs: nounwind
declare void @__tgt_target_data_begin_mapper(ptr, i64, i32, ptr, ptr, ptr, ptr, ptr, ptr) #0

; Function Attrs: nounwind
declare void @__tgt_target_data_end_mapper(ptr, i64, i32, ptr, ptr, ptr, ptr, ptr, ptr) #0

attributes #0 = { nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

