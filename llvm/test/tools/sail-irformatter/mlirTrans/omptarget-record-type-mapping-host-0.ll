; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }
%struct.__tgt_offload_entry = type { ptr, ptr, i64, i32, i32 }
%struct.__tgt_kernel_arguments = type { i32, i32, ptr, ptr, ptr, ptr, ptr, ptr, i64, i64, [3 x i32], [3 x i32], i32 }

@0 = private unnamed_addr constant [125 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-record-type-mapping-host.mlir;unknown;18;10;;\00", align 1
@1 = private unnamed_addr constant [125 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-record-type-mapping-host.mlir;unknown;22;11;;\00", align 1
@2 = private unnamed_addr constant [125 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-record-type-mapping-host.mlir;unknown;23;11;;\00", align 1
@.__omp_offloading_47_1a802f9__QQmain_l24.region_id = weak constant i8 0
@.offload_sizes = private unnamed_addr constant [3 x i64] [i64 0, i64 4, i64 16]
@.offload_maptypes = private unnamed_addr constant [3 x i64] [i64 32, i64 281474976710659, i64 281474976710659]
@.offload_mapnames = private constant [3 x ptr] [ptr @2, ptr @0, ptr @1]
@3 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@4 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @3 }, align 8
@.offloading.entry_name = internal unnamed_addr constant [40 x i8] c"__omp_offloading_47_1a802f9__QQmain_l24\00"
@.offloading.entry.__omp_offloading_47_1a802f9__QQmain_l24 = weak constant %struct.__tgt_offload_entry { ptr @.__omp_offloading_47_1a802f9__QQmain_l24.region_id, ptr @.offloading.entry_name, i64 0, i32 0, i32 0 }, section "omp_offloading_entries", align 1

define void @_QQmain() {
  %.offload_baseptrs = alloca [3 x ptr], align 8
  %.offload_ptrs = alloca [3 x ptr], align 8
  %.offload_mappers = alloca [3 x ptr], align 8
  %.offload_sizes = alloca [3 x i64], align 4
  %kernel_args = alloca %struct.__tgt_kernel_arguments, align 8
  %1 = alloca { float, [10 x i32], i32 }, i64 1, align 8
  %2 = getelementptr { float, [10 x i32], i32 }, ptr %1, i32 0, i32 2
  %3 = getelementptr { float, [10 x i32], i32 }, ptr %1, i32 0, i32 1
  br label %entry

entry:                                            ; preds = %0
  %array_offset = getelementptr inbounds [10 x i32], ptr %3, i64 0, i64 1
  %4 = getelementptr i32, ptr %2, i64 1
  %5 = ptrtoint ptr %4 to i64
  %6 = ptrtoint ptr %array_offset to i64
  %7 = sub i64 %5, %6
  %8 = sdiv exact i64 %7, ptrtoint (ptr getelementptr (i8, ptr null, i32 1) to i64)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %.offload_sizes, ptr align 4 @.offload_sizes, i64 24, i1 false)
  %9 = getelementptr inbounds [3 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  store ptr %1, ptr %9, align 8
  %10 = getelementptr inbounds [3 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  store ptr %array_offset, ptr %10, align 8
  %11 = getelementptr inbounds [3 x i64], ptr %.offload_sizes, i32 0, i32 0
  store i64 %8, ptr %11, align 8
  %12 = getelementptr inbounds [3 x ptr], ptr %.offload_mappers, i64 0, i64 0
  store ptr null, ptr %12, align 8
  %13 = getelementptr inbounds [3 x ptr], ptr %.offload_baseptrs, i32 0, i32 1
  store ptr %1, ptr %13, align 8
  %14 = getelementptr inbounds [3 x ptr], ptr %.offload_ptrs, i32 0, i32 1
  store ptr %2, ptr %14, align 8
  %15 = getelementptr inbounds [3 x ptr], ptr %.offload_mappers, i64 0, i64 1
  store ptr null, ptr %15, align 8
  %16 = getelementptr inbounds [3 x ptr], ptr %.offload_baseptrs, i32 0, i32 2
  store ptr %1, ptr %16, align 8
  %17 = getelementptr inbounds [3 x ptr], ptr %.offload_ptrs, i32 0, i32 2
  store ptr %array_offset, ptr %17, align 8
  %18 = getelementptr inbounds [3 x ptr], ptr %.offload_mappers, i64 0, i64 2
  store ptr null, ptr %18, align 8
  %19 = getelementptr inbounds [3 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  %20 = getelementptr inbounds [3 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  %21 = getelementptr inbounds [3 x i64], ptr %.offload_sizes, i32 0, i32 0
  %22 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 0
  store i32 3, ptr %22, align 4
  %23 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 1
  store i32 3, ptr %23, align 4
  %24 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 2
  store ptr %19, ptr %24, align 8
  %25 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 3
  store ptr %20, ptr %25, align 8
  %26 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 4
  store ptr %21, ptr %26, align 8
  %27 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 5
  store ptr @.offload_maptypes, ptr %27, align 8
  %28 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 6
  store ptr @.offload_mapnames, ptr %28, align 8
  %29 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 7
  store ptr null, ptr %29, align 8
  %30 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 8
  store i64 0, ptr %30, align 8
  %31 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 9
  store i64 0, ptr %31, align 8
  %32 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 10
  store [3 x i32] [i32 -1, i32 0, i32 0], ptr %32, align 4
  %33 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 11
  store [3 x i32] zeroinitializer, ptr %33, align 4
  %34 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 12
  store i32 0, ptr %34, align 4
  %35 = call i32 @__tgt_target_kernel(ptr @4, i64 -1, i32 -1, i32 0, ptr @.__omp_offloading_47_1a802f9__QQmain_l24.region_id, ptr %kernel_args)
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %omp_offload.failed, label %omp_offload.cont

omp_offload.failed:                               ; preds = %entry
  call void @__omp_offloading_47_1a802f9__QQmain_l24(ptr %1)
  br label %omp_offload.cont

omp_offload.cont:                                 ; preds = %omp_offload.failed, %entry
  ret void
}

define internal void @__omp_offloading_47_1a802f9__QQmain_l24(ptr %0) {
entry:
  br label %omp.target

omp.target:                                       ; preds = %entry
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.target
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #0

; Function Attrs: nounwind
declare i32 @__tgt_target_kernel(ptr, i64, i32, i32, ptr, ptr) #1

attributes #0 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { nounwind }

!llvm.module.flags = !{!0}
!omp_offload.info = !{!1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 0, i32 71, i32 27788025, !"_QQmain", i32 24, i32 0, i32 0}
