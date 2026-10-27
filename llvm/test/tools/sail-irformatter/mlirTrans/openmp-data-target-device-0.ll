; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }
%struct.__tgt_offload_entry = type { ptr, ptr, i64, i32, i32 }
%struct.__tgt_kernel_arguments = type { i32, i32, ptr, ptr, ptr, ptr, ptr, ptr, i64, i64, [3 x i32], [3 x i32], i32 }

@__oclc_ABI_version = weak_odr hidden local_unnamed_addr addrspace(4) constant i32 400
@_QFEint_array = internal global [100 x i32] zeroinitializer
@0 = private unnamed_addr constant [116 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/openmp-data-target-device.mlir;unknown;21;11;;\00", align 1
@.offload_sizes = private unnamed_addr constant [1 x i64] [i64 400]
@.offload_maptypes = private unnamed_addr constant [1 x i64] [i64 2]
@.offload_mapnames = private constant [1 x ptr] [ptr @0]
@1 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @1 }, align 8
@3 = private unnamed_addr constant [116 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/openmp-data-target-device.mlir;unknown;23;13;;\00", align 1
@4 = private unnamed_addr constant [116 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/openmp-data-target-device.mlir;unknown;24;13;;\00", align 1
@5 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @1 }, align 8
@.__omp_offloading_47_69b597__QQmain_l25.region_id = weak constant i8 0
@.offload_sizes.1 = private unnamed_addr constant [2 x i64] [i64 400, i64 4]
@.offload_maptypes.2 = private unnamed_addr constant [2 x i64] [i64 34, i64 800]
@.offload_mapnames.3 = private constant [2 x ptr] [ptr @3, ptr @4]
@.offloading.entry_name = internal unnamed_addr constant [39 x i8] c"__omp_offloading_47_69b597__QQmain_l25\00"
@.offloading.entry.__omp_offloading_47_69b597__QQmain_l25 = weak constant %struct.__tgt_offload_entry { ptr @.__omp_offloading_47_69b597__QQmain_l25.region_id, ptr @.offloading.entry_name, i64 0, i32 0, i32 0 }, section "omp_offloading_entries", align 1

define void @_QQmain() {
  %.casted = alloca ptr, align 8
  %.offload_baseptrs1 = alloca [2 x ptr], align 8
  %.offload_ptrs2 = alloca [2 x ptr], align 8
  %.offload_mappers3 = alloca [2 x ptr], align 8
  %kernel_args = alloca %struct.__tgt_kernel_arguments, align 8
  %.offload_baseptrs = alloca [1 x ptr], align 8
  %.offload_ptrs = alloca [1 x ptr], align 8
  %.offload_mappers = alloca [1 x ptr], align 8
  %1 = alloca i32, i64 1, align 4, addrspace(5)
  %2 = addrspacecast ptr addrspace(5) %1 to ptr
  %3 = alloca i32, i64 1, align 4, addrspace(5)
  %4 = addrspacecast ptr addrspace(5) %3 to ptr
  br label %entry

entry:                                            ; preds = %0
  %5 = getelementptr inbounds [1 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  store ptr @_QFEint_array, ptr %5, align 8
  %6 = getelementptr inbounds [1 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  store ptr @_QFEint_array, ptr %6, align 8
  %7 = getelementptr inbounds [1 x ptr], ptr %.offload_mappers, i64 0, i64 0
  store ptr null, ptr %7, align 8
  %8 = getelementptr inbounds [1 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  %9 = getelementptr inbounds [1 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  call void @__tgt_target_data_begin_mapper(ptr @2, i64 -1, i32 1, ptr %8, ptr %9, ptr @.offload_sizes, ptr @.offload_maptypes, ptr @.offload_mapnames, ptr null)
  %10 = load i32, ptr %4, align 4
  store i32 %10, ptr %.casted, align 4
  %11 = load ptr, ptr %.casted, align 8
  %12 = getelementptr inbounds [2 x ptr], ptr %.offload_baseptrs1, i32 0, i32 0
  store ptr @_QFEint_array, ptr %12, align 8
  %13 = getelementptr inbounds [2 x ptr], ptr %.offload_ptrs2, i32 0, i32 0
  store ptr @_QFEint_array, ptr %13, align 8
  %14 = getelementptr inbounds [2 x ptr], ptr %.offload_mappers3, i64 0, i64 0
  store ptr null, ptr %14, align 8
  %15 = getelementptr inbounds [2 x ptr], ptr %.offload_baseptrs1, i32 0, i32 1
  store ptr %11, ptr %15, align 8
  %16 = getelementptr inbounds [2 x ptr], ptr %.offload_ptrs2, i32 0, i32 1
  store ptr %11, ptr %16, align 8
  %17 = getelementptr inbounds [2 x ptr], ptr %.offload_mappers3, i64 0, i64 1
  store ptr null, ptr %17, align 8
  %18 = getelementptr inbounds [2 x ptr], ptr %.offload_baseptrs1, i32 0, i32 0
  %19 = getelementptr inbounds [2 x ptr], ptr %.offload_ptrs2, i32 0, i32 0
  %20 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 0
  store i32 3, ptr %20, align 4
  %21 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 1
  store i32 2, ptr %21, align 4
  %22 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 2
  store ptr %18, ptr %22, align 8
  %23 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 3
  store ptr %19, ptr %23, align 8
  %24 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 4
  store ptr @.offload_sizes.1, ptr %24, align 8
  %25 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 5
  store ptr @.offload_maptypes.2, ptr %25, align 8
  %26 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 6
  store ptr @.offload_mapnames.3, ptr %26, align 8
  %27 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 7
  store ptr null, ptr %27, align 8
  %28 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 8
  store i64 0, ptr %28, align 8
  %29 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 9
  store i64 0, ptr %29, align 8
  %30 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 10
  store [3 x i32] [i32 -1, i32 0, i32 0], ptr %30, align 4
  %31 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 11
  store [3 x i32] zeroinitializer, ptr %31, align 4
  %32 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 12
  store i32 0, ptr %32, align 4
  %33 = call i32 @__tgt_target_kernel(ptr @2, i64 -1, i32 -1, i32 0, ptr @.__omp_offloading_47_69b597__QQmain_l25.region_id, ptr %kernel_args)
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %omp_offload.failed, label %omp_offload.cont

omp_offload.failed:                               ; preds = %entry
  call void @__omp_offloading_47_69b597__QQmain_l25(ptr @_QFEint_array, ptr %4)
  br label %omp_offload.cont

omp_offload.cont:                                 ; preds = %omp_offload.failed, %entry
  %35 = getelementptr inbounds [1 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  %36 = getelementptr inbounds [1 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  call void @__tgt_target_data_end_mapper(ptr @2, i64 -1, i32 1, ptr %35, ptr %36, ptr @.offload_sizes, ptr @.offload_maptypes, ptr @.offload_mapnames, ptr null)
  ret void
}

; Function Attrs: nounwind
declare void @__tgt_target_data_begin_mapper(ptr, i64, i32, ptr, ptr, ptr, ptr, ptr, ptr) #0

define internal void @__omp_offloading_47_69b597__QQmain_l25(ptr %0, ptr %1) {
entry:
  %structArg = alloca { ptr }, align 8
  br label %omp.target

omp.target:                                       ; preds = %entry
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @2)
  br label %omp_parallel

omp_parallel:                                     ; preds = %omp.target
  %gep_ = getelementptr { ptr }, ptr %structArg, i32 0, i32 0
  store ptr %0, ptr %gep_, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @2, i32 1, ptr @__omp_offloading_47_69b597__QQmain_l25..omp_par, ptr %structArg)
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.par.exit.split
  ret void
}

; Function Attrs: nounwind
define internal void @__omp_offloading_47_69b597__QQmain_l25..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr, ptr %0) #0 {
omp.par.entry:
  %gep_ = getelementptr { ptr }, ptr %0, i32 0, i32 0
  %loadgep_ = load ptr, ptr %gep_, align 8
  %p.lastiter = alloca i32, align 4
  %p.lowerbound = alloca i32, align 4
  %p.upperbound = alloca i32, align 4
  %p.stride = alloca i32, align 4
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
  %2 = alloca i32, i64 1, align 4, addrspace(5)
  %3 = addrspacecast ptr addrspace(5) %2 to ptr
  br label %omp_loop.preheader

omp_loop.preheader:                               ; preds = %omp.par.region2
  store i32 0, ptr %p.lowerbound, align 4
  store i32 99, ptr %p.upperbound, align 4
  store i32 1, ptr %p.stride, align 4
  %omp_global_thread_num4 = call i32 @__kmpc_global_thread_num(ptr @2)
  call void @__kmpc_for_static_init_4u(ptr @2, i32 %omp_global_thread_num4, i32 34, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride, i32 1, i32 0)
  %4 = load i32, ptr %p.lowerbound, align 4
  %5 = load i32, ptr %p.upperbound, align 4
  %6 = sub i32 %5, %4
  %7 = add i32 %6, 1
  br label %omp_loop.header

omp_loop.header:                                  ; preds = %omp_loop.inc, %omp_loop.preheader
  %omp_loop.iv = phi i32 [ 0, %omp_loop.preheader ], [ %omp_loop.next, %omp_loop.inc ]
  br label %omp_loop.cond

omp_loop.cond:                                    ; preds = %omp_loop.header
  %omp_loop.cmp = icmp ult i32 %omp_loop.iv, %7
  br i1 %omp_loop.cmp, label %omp_loop.body, label %omp_loop.exit

omp_loop.exit:                                    ; preds = %omp_loop.cond
  call void @__kmpc_for_static_fini(ptr @2, i32 %omp_global_thread_num4)
  %omp_global_thread_num5 = call i32 @__kmpc_global_thread_num(ptr @2)
  call void @__kmpc_barrier(ptr @5, i32 %omp_global_thread_num5)
  br label %omp_loop.after

omp_loop.after:                                   ; preds = %omp_loop.exit
  br label %omp.region.cont1

omp.region.cont1:                                 ; preds = %omp_loop.after
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont1
  br label %omp.par.outlined.exit.exitStub

omp_loop.body:                                    ; preds = %omp_loop.cond
  %8 = add i32 %omp_loop.iv, %4
  %9 = mul i32 %8, 1
  %10 = add i32 %9, 1
  br label %omp.wsloop.region

omp.wsloop.region:                                ; preds = %omp_loop.body
  store i32 %10, ptr %3, align 4
  %11 = load i32, ptr %3, align 4
  %12 = sext i32 %11 to i64
  %13 = sub nsw i64 %12, 1
  %14 = mul nsw i64 %13, 1
  %15 = mul nsw i64 %14, 1
  %16 = add nsw i64 %15, 0
  %17 = getelementptr i32, ptr %loadgep_, i64 %16
  store i32 %11, ptr %17, align 4
  br label %omp.region.cont3

omp.region.cont3:                                 ; preds = %omp.wsloop.region
  br label %omp_loop.inc

omp_loop.inc:                                     ; preds = %omp.region.cont3
  %omp_loop.next = add nuw i32 %omp_loop.iv, 1
  br label %omp_loop.header

omp.par.outlined.exit.exitStub:                   ; preds = %omp.par.pre_finalize
  ret void
}

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #0

; Function Attrs: nounwind
declare void @__kmpc_for_static_init_4u(ptr, i32, i32, ptr, ptr, ptr, ptr, i32, i32) #0

; Function Attrs: nounwind
declare void @__kmpc_for_static_fini(ptr, i32) #0

; Function Attrs: convergent nounwind
declare void @__kmpc_barrier(ptr, i32) #1

; Function Attrs: nounwind
declare i32 @__tgt_target_kernel(ptr, i64, i32, i32, ptr, ptr) #0

; Function Attrs: nounwind
declare void @__tgt_target_data_end_mapper(ptr, i64, i32, ptr, ptr, ptr, ptr, ptr, ptr) #0

; Function Attrs: nounwind
declare !callback !2 void @__kmpc_fork_call(ptr, i32, ptr, ...) #0

attributes #0 = { nounwind }
attributes #1 = { convergent nounwind }

!llvm.module.flags = !{!0}
!omp_offload.info = !{!1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 0, i32 71, i32 6927767, !"_QQmain", i32 25, i32 0, i32 0}
!2 = !{!3}
!3 = !{i64 2, i64 -1, i64 -1, i1 true}
