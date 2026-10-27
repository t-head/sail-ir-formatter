; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [133 x i8] c";within split at /ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/openacc-llvm.mlir:95 offset ;testupdateop;5;3;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 132, ptr @0 }, align 8
@2 = private unnamed_addr constant [129 x i8] c";within split at /ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/openacc-llvm.mlir:95 offset ;unknown;3;25;;\00", align 1
@.offload_maptypes = private unnamed_addr constant [1 x i64] [i64 1]
@.offload_mapnames = private constant [1 x ptr] [ptr @2]

define void @testupdateop(ptr %0) {
  %.offload_baseptrs = alloca [1 x ptr], align 8
  %.offload_ptrs = alloca [1 x ptr], align 8
  %.offload_sizes = alloca [1 x i64], align 8
  %2 = getelementptr inbounds [1 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  store ptr %0, ptr %2, align 8
  %3 = getelementptr inbounds [1 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  store ptr %0, ptr %3, align 8
  %4 = getelementptr inbounds [1 x i64], ptr %.offload_sizes, i32 0, i32 0
  store i64 ptrtoint (ptr getelementptr (ptr, ptr null, i32 1) to i64), ptr %4, align 4
  %5 = getelementptr inbounds [1 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  %6 = getelementptr inbounds [1 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  %7 = getelementptr inbounds [1 x i64], ptr %.offload_sizes, i32 0, i32 0
  call void @__tgt_target_data_update_mapper(ptr @1, i64 -1, i32 1, ptr %5, ptr %6, ptr %7, ptr @.offload_maptypes, ptr @.offload_mapnames, ptr null)
  ret void
}

; Function Attrs: nounwind
declare void @__tgt_target_data_update_mapper(ptr, i64, i32, ptr, ptr, ptr, ptr, ptr, ptr) #0

attributes #0 = { nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

