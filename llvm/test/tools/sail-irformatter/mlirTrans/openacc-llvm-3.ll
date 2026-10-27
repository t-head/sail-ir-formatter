; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [132 x i8] c";within split at /ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/openacc-llvm.mlir:131 offset ;testdataop;7;3;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 131, ptr @0 }, align 8
@2 = private unnamed_addr constant [130 x i8] c";within split at /ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/openacc-llvm.mlir:131 offset ;unknown;3;23;;\00", align 1
@3 = private unnamed_addr constant [130 x i8] c";within split at /ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/openacc-llvm.mlir:131 offset ;unknown;3;41;;\00", align 1
@.offload_maptypes = private unnamed_addr constant [2 x i64] [i64 8193, i64 8192]
@.offload_mapnames = private constant [2 x ptr] [ptr @2, ptr @3]

define void @testdataop(ptr %0, ptr %1, ptr %2) {
  %.offload_baseptrs = alloca [2 x ptr], align 8
  %.offload_ptrs = alloca [2 x ptr], align 8
  %.offload_sizes = alloca [2 x i64], align 8
  %4 = getelementptr inbounds [2 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  store ptr %0, ptr %4, align 8
  %5 = getelementptr inbounds [2 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  store ptr %0, ptr %5, align 8
  %6 = getelementptr inbounds [2 x i64], ptr %.offload_sizes, i32 0, i32 0
  store i64 ptrtoint (ptr getelementptr (ptr, ptr null, i32 1) to i64), ptr %6, align 4
  %7 = getelementptr inbounds [2 x ptr], ptr %.offload_baseptrs, i32 0, i32 1
  store ptr %1, ptr %7, align 8
  %8 = getelementptr inbounds [2 x ptr], ptr %.offload_ptrs, i32 0, i32 1
  store ptr %1, ptr %8, align 8
  %9 = getelementptr inbounds [2 x i64], ptr %.offload_sizes, i32 0, i32 1
  store i64 ptrtoint (ptr getelementptr (ptr, ptr null, i32 1) to i64), ptr %9, align 4
  %10 = getelementptr inbounds [2 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  %11 = getelementptr inbounds [2 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  %12 = getelementptr inbounds [2 x i64], ptr %.offload_sizes, i32 0, i32 0
  call void @__tgt_target_data_begin_mapper(ptr @1, i64 -1, i32 2, ptr %10, ptr %11, ptr %12, ptr @.offload_maptypes, ptr @.offload_mapnames, ptr null)
  br label %acc.data

acc.data:                                         ; preds = %3
  store i32 2, ptr %2, align 4
  br label %acc.end_data

acc.end_data:                                     ; preds = %acc.data
  %13 = getelementptr inbounds [2 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  %14 = getelementptr inbounds [2 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  %15 = getelementptr inbounds [2 x i64], ptr %.offload_sizes, i32 0, i32 0
  call void @__tgt_target_data_end_mapper(ptr @1, i64 -1, i32 2, ptr %13, ptr %14, ptr %15, ptr @.offload_maptypes, ptr @.offload_mapnames, ptr null)
  ret void
}

; Function Attrs: nounwind
declare void @__tgt_target_data_begin_mapper(ptr, i64, i32, ptr, ptr, ptr, ptr, ptr, ptr) #0

; Function Attrs: nounwind
declare void @__tgt_target_data_end_mapper(ptr, i64, i32, ptr, ptr, ptr, ptr, ptr, ptr) #0

attributes #0 = { nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
