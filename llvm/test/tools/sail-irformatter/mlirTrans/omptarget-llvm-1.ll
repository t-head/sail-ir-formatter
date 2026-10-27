; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [130 x i8] c";within split at /ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-llvm.mlir:39 offset ;unknown;9;8;;\00", align 1
@.offload_sizes = private unnamed_addr constant [1 x i64] [i64 4096]
@.offload_maptypes = private unnamed_addr constant [1 x i64] [i64 2]
@.offload_mapnames = private constant [1 x ptr] [ptr @0]
@1 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @1 }, align 8

define void @_QPopenmp_target_data_region(ptr %0) {
  %.offload_baseptrs = alloca [1 x ptr], align 8
  %.offload_ptrs = alloca [1 x ptr], align 8
  %.offload_mappers = alloca [1 x ptr], align 8
  br label %entry

entry:                                            ; preds = %1
  %array_offset = getelementptr inbounds [1024 x i32], ptr %0, i64 0, i64 0
  %2 = getelementptr inbounds [1 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  store ptr %0, ptr %2, align 8
  %3 = getelementptr inbounds [1 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  store ptr %array_offset, ptr %3, align 8
  %4 = getelementptr inbounds [1 x ptr], ptr %.offload_mappers, i64 0, i64 0
  store ptr null, ptr %4, align 8
  %5 = getelementptr inbounds [1 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  %6 = getelementptr inbounds [1 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  call void @__tgt_target_data_begin_mapper(ptr @2, i64 -1, i32 1, ptr %5, ptr %6, ptr @.offload_sizes, ptr @.offload_maptypes, ptr @.offload_mapnames, ptr null)
  %7 = getelementptr [1024 x i32], ptr %0, i32 0, i64 0
  store i32 99, ptr %7, align 4
  %8 = getelementptr inbounds [1 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  %9 = getelementptr inbounds [1 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  call void @__tgt_target_data_end_mapper(ptr @2, i64 -1, i32 1, ptr %8, ptr %9, ptr @.offload_sizes, ptr @.offload_maptypes, ptr @.offload_mapnames, ptr null)
  ret void
}

; Function Attrs: nounwind
declare void @__tgt_target_data_begin_mapper(ptr, i64, i32, ptr, ptr, ptr, ptr, ptr, ptr) #0

; Function Attrs: nounwind
declare void @__tgt_target_data_end_mapper(ptr, i64, i32, ptr, ptr, ptr, ptr, ptr, ptr) #0

attributes #0 = { nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

