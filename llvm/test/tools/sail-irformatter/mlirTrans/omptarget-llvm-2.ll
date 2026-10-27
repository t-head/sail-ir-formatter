; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [132 x i8] c";within split at /ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-llvm.mlir:86 offset ;unknown;21;11;;\00", align 1
@1 = private unnamed_addr constant [132 x i8] c";within split at /ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-llvm.mlir:86 offset ;unknown;27;11;;\00", align 1
@.offload_sizes = private unnamed_addr constant [2 x i64] [i64 4096, i64 2048]
@.offload_maptypes = private unnamed_addr constant [2 x i64] [i64 1, i64 0]
@.offload_mapnames = private constant [2 x ptr] [ptr @0, ptr @1]
@2 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@3 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @2 }, align 8
@4 = private unnamed_addr constant [132 x i8] c";within split at /ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-llvm.mlir:86 offset ;unknown;38;11;;\00", align 1
@5 = private unnamed_addr constant [132 x i8] c";within split at /ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-llvm.mlir:86 offset ;unknown;44;11;;\00", align 1
@.offload_sizes.1 = private unnamed_addr constant [2 x i64] [i64 4096, i64 2048]
@.offload_maptypes.2 = private unnamed_addr constant [2 x i64] [i64 2, i64 0]
@.offload_mapnames.3 = private constant [2 x ptr] [ptr @4, ptr @5]

define void @_QPomp_target_enter_exit(ptr %0, ptr %1) {
  %.offload_baseptrs5 = alloca [2 x ptr], align 8
  %.offload_ptrs6 = alloca [2 x ptr], align 8
  %.offload_mappers7 = alloca [2 x ptr], align 8
  %.offload_baseptrs = alloca [2 x ptr], align 8
  %.offload_ptrs = alloca [2 x ptr], align 8
  %.offload_mappers = alloca [2 x ptr], align 8
  %3 = alloca i32, i64 1, align 4
  %4 = alloca i32, i64 1, align 4
  store i32 5, ptr %4, align 4
  store i32 2, ptr %3, align 4
  %5 = load i32, ptr %4, align 4
  %6 = icmp slt i32 %5, 10
  %7 = load i32, ptr %3, align 4
  br label %entry

entry:                                            ; preds = %2
  br i1 %6, label %omp_if.then, label %omp_if.else

omp_if.then:                                      ; preds = %entry
  %array_offset = getelementptr inbounds [1024 x i32], ptr %0, i64 0, i64 0
  %array_offset1 = getelementptr inbounds [512 x i32], ptr %1, i64 0, i64 0
  %8 = getelementptr inbounds [2 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  store ptr %0, ptr %8, align 8
  %9 = getelementptr inbounds [2 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  store ptr %array_offset, ptr %9, align 8
  %10 = getelementptr inbounds [2 x ptr], ptr %.offload_mappers, i64 0, i64 0
  store ptr null, ptr %10, align 8
  %11 = getelementptr inbounds [2 x ptr], ptr %.offload_baseptrs, i32 0, i32 1
  store ptr %1, ptr %11, align 8
  %12 = getelementptr inbounds [2 x ptr], ptr %.offload_ptrs, i32 0, i32 1
  store ptr %array_offset1, ptr %12, align 8
  %13 = getelementptr inbounds [2 x ptr], ptr %.offload_mappers, i64 0, i64 1
  store ptr null, ptr %13, align 8
  %14 = getelementptr inbounds [2 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  %15 = getelementptr inbounds [2 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  call void @__tgt_target_data_begin_mapper(ptr @3, i64 -1, i32 2, ptr %14, ptr %15, ptr @.offload_sizes, ptr @.offload_maptypes, ptr @.offload_mapnames, ptr null)
  br label %omp_if.end

omp_if.else:                                      ; preds = %entry
  br label %omp_if.end

omp_if.end:                                       ; preds = %omp_if.else, %omp_if.then
  %16 = load i32, ptr %4, align 4
  %17 = icmp sgt i32 %16, 10
  %18 = load i32, ptr %3, align 4
  br i1 %17, label %omp_if.then2, label %omp_if.else8

omp_if.then2:                                     ; preds = %omp_if.end
  %array_offset3 = getelementptr inbounds [1024 x i32], ptr %0, i64 0, i64 0
  %array_offset4 = getelementptr inbounds [512 x i32], ptr %1, i64 0, i64 0
  %19 = getelementptr inbounds [2 x ptr], ptr %.offload_baseptrs5, i32 0, i32 0
  store ptr %0, ptr %19, align 8
  %20 = getelementptr inbounds [2 x ptr], ptr %.offload_ptrs6, i32 0, i32 0
  store ptr %array_offset3, ptr %20, align 8
  %21 = getelementptr inbounds [2 x ptr], ptr %.offload_mappers7, i64 0, i64 0
  store ptr null, ptr %21, align 8
  %22 = getelementptr inbounds [2 x ptr], ptr %.offload_baseptrs5, i32 0, i32 1
  store ptr %1, ptr %22, align 8
  %23 = getelementptr inbounds [2 x ptr], ptr %.offload_ptrs6, i32 0, i32 1
  store ptr %array_offset4, ptr %23, align 8
  %24 = getelementptr inbounds [2 x ptr], ptr %.offload_mappers7, i64 0, i64 1
  store ptr null, ptr %24, align 8
  %25 = getelementptr inbounds [2 x ptr], ptr %.offload_baseptrs5, i32 0, i32 0
  %26 = getelementptr inbounds [2 x ptr], ptr %.offload_ptrs6, i32 0, i32 0
  call void @__tgt_target_data_end_mapper(ptr @3, i64 -1, i32 2, ptr %25, ptr %26, ptr @.offload_sizes.1, ptr @.offload_maptypes.2, ptr @.offload_mapnames.3, ptr null)
  br label %omp_if.end9

omp_if.else8:                                     ; preds = %omp_if.end
  br label %omp_if.end9

omp_if.end9:                                      ; preds = %omp_if.else8, %omp_if.then2
  ret void
}

; Function Attrs: nounwind
declare void @__tgt_target_data_begin_mapper(ptr, i64, i32, ptr, ptr, ptr, ptr, ptr, ptr) #0

; Function Attrs: nounwind
declare void @__tgt_target_data_end_mapper(ptr, i64, i32, ptr, ptr, ptr, ptr, ptr, ptr) #0

attributes #0 = { nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

