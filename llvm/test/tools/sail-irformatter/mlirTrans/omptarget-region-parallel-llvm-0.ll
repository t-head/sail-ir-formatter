; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }
%struct.__tgt_offload_entry = type { ptr, ptr, i64, i32, i32 }
%struct.__tgt_kernel_arguments = type { i32, i32, ptr, ptr, ptr, ptr, ptr, ptr, i64, i64, [3 x i32], [3 x i32], i32 }

@0 = private unnamed_addr constant [121 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-region-parallel-llvm.mlir;unknown;15;13;;\00", align 1
@1 = private unnamed_addr constant [121 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-region-parallel-llvm.mlir;unknown;16;13;;\00", align 1
@2 = private unnamed_addr constant [121 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-region-parallel-llvm.mlir;unknown;17;13;;\00", align 1
@3 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@4 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @3 }, align 8
@.__omp_offloading_47_69b57d_omp_target_region__l18.region_id = weak constant i8 0
@.offload_sizes = private unnamed_addr constant [3 x i64] [i64 4, i64 4, i64 4]
@.offload_maptypes = private unnamed_addr constant [3 x i64] [i64 35, i64 35, i64 35]
@.offload_mapnames = private constant [3 x ptr] [ptr @0, ptr @1, ptr @2]
@.offloading.entry_name = internal unnamed_addr constant [50 x i8] c"__omp_offloading_47_69b57d_omp_target_region__l18\00"
@.offloading.entry.__omp_offloading_47_69b57d_omp_target_region__l18 = weak constant %struct.__tgt_offload_entry { ptr @.__omp_offloading_47_69b57d_omp_target_region__l18.region_id, ptr @.offloading.entry_name, i64 0, i32 0, i32 0 }, section "omp_offloading_entries", align 1

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
  %28 = call i32 @__tgt_target_kernel(ptr @4, i64 -1, i32 -1, i32 0, ptr @.__omp_offloading_47_69b57d_omp_target_region__l18.region_id, ptr %kernel_args)
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %omp_offload.failed, label %omp_offload.cont

omp_offload.failed:                               ; preds = %entry
  call void @__omp_offloading_47_69b57d_omp_target_region__l18(ptr %1, ptr %2, ptr %3)
  br label %omp_offload.cont

omp_offload.cont:                                 ; preds = %omp_offload.failed, %entry
  ret void
}

define internal void @__omp_offloading_47_69b57d_omp_target_region__l18(ptr %0, ptr %1, ptr %2) {
entry:
  %structArg = alloca { ptr, ptr, ptr }, align 8
  br label %omp.target

omp.target:                                       ; preds = %entry
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @4)
  br label %omp_parallel

omp_parallel:                                     ; preds = %omp.target
  %gep_ = getelementptr { ptr, ptr, ptr }, ptr %structArg, i32 0, i32 0
  store ptr %0, ptr %gep_, align 8
  %gep_3 = getelementptr { ptr, ptr, ptr }, ptr %structArg, i32 0, i32 1
  store ptr %1, ptr %gep_3, align 8
  %gep_4 = getelementptr { ptr, ptr, ptr }, ptr %structArg, i32 0, i32 2
  store ptr %2, ptr %gep_4, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @4, i32 1, ptr @__omp_offloading_47_69b57d_omp_target_region__l18..omp_par, ptr %structArg)
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.par.exit.split
  ret void
}

; Function Attrs: nounwind
define internal void @__omp_offloading_47_69b57d_omp_target_region__l18..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr, ptr %0) #0 {
omp.par.entry:
  %gep_ = getelementptr { ptr, ptr, ptr }, ptr %0, i32 0, i32 0
  %loadgep_ = load ptr, ptr %gep_, align 8
  %gep_1 = getelementptr { ptr, ptr, ptr }, ptr %0, i32 0, i32 1
  %loadgep_2 = load ptr, ptr %gep_1, align 8
  %gep_3 = getelementptr { ptr, ptr, ptr }, ptr %0, i32 0, i32 2
  %loadgep_4 = load ptr, ptr %gep_3, align 8
  %tid.addr.local = alloca i32, align 4
  %1 = load i32, ptr %tid.addr, align 4
  store i32 %1, ptr %tid.addr.local, align 4
  %tid = load i32, ptr %tid.addr.local, align 4
  br label %omp.reduction.init

omp.reduction.init:                               ; preds = %omp.par.entry
  br label %omp.par.region

omp.par.region:                                   ; preds = %omp.reduction.init
  br label %omp.par.region2

omp.par.region2:                                  ; preds = %omp.par.region
  %2 = load i32, ptr %loadgep_, align 4
  %3 = load i32, ptr %loadgep_2, align 4
  %4 = add i32 %2, %3
  store i32 %4, ptr %loadgep_4, align 4
  br label %omp.region.cont1

omp.region.cont1:                                 ; preds = %omp.par.region2
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont1
  br label %omp.par.outlined.exit.exitStub

omp.par.outlined.exit.exitStub:                   ; preds = %omp.par.pre_finalize
  ret void
}

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #0

; Function Attrs: nounwind
declare i32 @__tgt_target_kernel(ptr, i64, i32, i32, ptr, ptr) #0

; Function Attrs: nounwind
declare !callback !2 void @__kmpc_fork_call(ptr, i32, ptr, ...) #0

attributes #0 = { nounwind }

!llvm.module.flags = !{!0}
!omp_offload.info = !{!1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 0, i32 71, i32 6927741, !"omp_target_region_", i32 18, i32 0, i32 0}
!2 = !{!3}
!3 = !{i64 2, i64 -1, i64 -1, i1 true}
