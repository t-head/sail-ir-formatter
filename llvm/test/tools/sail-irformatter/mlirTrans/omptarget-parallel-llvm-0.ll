; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

%struct.ident_t = type { i32, i32, i32, i32, ptr }
%struct.DynamicEnvironmentTy = type { i16 }
%struct.KernelEnvironmentTy = type { %struct.ConfigurationEnvironmentTy, ptr, ptr }
%struct.ConfigurationEnvironmentTy = type { i8, i8, i8, i32, i32, i32, i32, i32, i32 }

@0 = private unnamed_addr constant [113 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-parallel-llvm.mlir;unknown;8;10;;\00", align 1
@1 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@2 = private unnamed_addr addrspace(1) constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @1 }, align 8
@__omp_offloading_47_69b571__QQmain_omp_outline_1_l9_dynamic_environment = weak_odr protected addrspace(1) global %struct.DynamicEnvironmentTy zeroinitializer
@__omp_offloading_47_69b571__QQmain_omp_outline_1_l9_kernel_environment = weak_odr protected addrspace(1) constant %struct.KernelEnvironmentTy { %struct.ConfigurationEnvironmentTy { i8 1, i8 1, i8 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 }, ptr addrspacecast (ptr addrspace(1) @2 to ptr), ptr addrspacecast (ptr addrspace(1) @__omp_offloading_47_69b571__QQmain_omp_outline_1_l9_dynamic_environment to ptr) }
@3 = private unnamed_addr constant [114 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-parallel-llvm.mlir;unknown;22;10;;\00", align 1
@__omp_offloading_47_69b571__test_num_threads_l23_dynamic_environment = weak_odr protected addrspace(1) global %struct.DynamicEnvironmentTy zeroinitializer
@__omp_offloading_47_69b571__test_num_threads_l23_kernel_environment = weak_odr protected addrspace(1) constant %struct.KernelEnvironmentTy { %struct.ConfigurationEnvironmentTy { i8 1, i8 1, i8 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 }, ptr addrspacecast (ptr addrspace(1) @2 to ptr), ptr addrspacecast (ptr addrspace(1) @__omp_offloading_47_69b571__test_num_threads_l23_dynamic_environment to ptr) }
@4 = private unnamed_addr constant [114 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-parallel-llvm.mlir;unknown;39;10;;\00", align 1
@5 = private unnamed_addr constant [114 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-parallel-llvm.mlir;unknown;40;10;;\00", align 1
@__omp_offloading_47_69b571_parallel_if_l41_dynamic_environment = weak_odr protected addrspace(1) global %struct.DynamicEnvironmentTy zeroinitializer
@__omp_offloading_47_69b571_parallel_if_l41_kernel_environment = weak_odr protected addrspace(1) constant %struct.KernelEnvironmentTy { %struct.ConfigurationEnvironmentTy { i8 1, i8 1, i8 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 }, ptr addrspacecast (ptr addrspace(1) @2 to ptr), ptr addrspacecast (ptr addrspace(1) @__omp_offloading_47_69b571_parallel_if_l41_dynamic_environment to ptr) }

define void @parallel_if(ptr %0) {
  %2 = alloca i32, i64 1, align 4
  br label %entry

entry:                                            ; preds = %1
  ret void
}

define weak_odr protected amdgpu_kernel void @__omp_offloading_47_69b571__QQmain_omp_outline_1_l9(ptr %0, ptr %1) {
entry:
  %2 = alloca [1 x ptr], align 8, addrspace(5)
  %3 = addrspacecast ptr addrspace(5) %2 to ptr
  %structArg = alloca { ptr }, align 8, addrspace(5)
  %structArg.ascast = addrspacecast ptr addrspace(5) %structArg to ptr
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %4 to ptr
  store ptr %1, ptr %5, align 8
  %6 = call i32 @__kmpc_target_init(ptr addrspacecast (ptr addrspace(1) @__omp_offloading_47_69b571__QQmain_omp_outline_1_l9_kernel_environment to ptr), ptr %0)
  %exec_user_code = icmp eq i32 %6, -1
  br i1 %exec_user_code, label %user_code.entry, label %worker.exit

user_code.entry:                                  ; preds = %entry
  %7 = load ptr, ptr %5, align 8
  br label %omp.target

omp.target:                                       ; preds = %user_code.entry
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr addrspacecast (ptr addrspace(1) @2 to ptr))
  br label %omp_parallel

omp_parallel:                                     ; preds = %omp.target
  %gep_ = getelementptr { ptr }, ptr addrspace(5) %structArg, i32 0, i32 0
  store ptr %7, ptr addrspace(5) %gep_, align 8
  %8 = getelementptr inbounds [1 x ptr], ptr %3, i64 0, i64 0
  store ptr %structArg.ascast, ptr %8, align 8
  call void @__kmpc_parallel_51(ptr addrspacecast (ptr addrspace(1) @2 to ptr), i32 %omp_global_thread_num, i32 1, i32 -1, i32 -1, ptr @__omp_offloading_47_69b571__QQmain_omp_outline_1_l9..omp_par, ptr null, ptr %3, i64 1)
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.par.exit.split
  call void @__kmpc_target_deinit()
  ret void

worker.exit:                                      ; preds = %entry
  ret void
}

; Function Attrs: nounwind
define internal void @__omp_offloading_47_69b571__QQmain_omp_outline_1_l9..omp_par(ptr noalias noundef %tid.addr.ascast, ptr noalias noundef %zero.addr.ascast, ptr %0) #0 {
omp.par.entry:
  %gep_ = getelementptr { ptr }, ptr %0, i32 0, i32 0
  %loadgep_ = load ptr, ptr %gep_, align 8
  %tid.addr.local = alloca i32, align 4, addrspace(5)
  %1 = load i32, ptr %tid.addr.ascast, align 4
  store i32 %1, ptr addrspace(5) %tid.addr.local, align 4
  %tid = load i32, ptr addrspace(5) %tid.addr.local, align 4
  br label %omp.reduction.init

omp.reduction.init:                               ; preds = %omp.par.entry
  br label %omp.par.region

omp.par.region:                                   ; preds = %omp.reduction.init
  br label %omp.par.region2

omp.par.region2:                                  ; preds = %omp.par.region
  store i32 1, ptr %loadgep_, align 4
  br label %omp.region.cont1

omp.region.cont1:                                 ; preds = %omp.par.region2
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont1
  br label %omp.par.outlined.exit.exitStub

omp.par.outlined.exit.exitStub:                   ; preds = %omp.par.pre_finalize
  ret void
}

declare i32 @__kmpc_target_init(ptr, ptr)

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #0

declare void @__kmpc_target_deinit()

define weak_odr protected amdgpu_kernel void @__omp_offloading_47_69b571__test_num_threads_l23(ptr %0, ptr %1) {
entry:
  %2 = alloca [1 x ptr], align 8, addrspace(5)
  %3 = addrspacecast ptr addrspace(5) %2 to ptr
  %structArg = alloca { ptr }, align 8, addrspace(5)
  %structArg.ascast = addrspacecast ptr addrspace(5) %structArg to ptr
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %4 to ptr
  store ptr %1, ptr %5, align 8
  %6 = call i32 @__kmpc_target_init(ptr addrspacecast (ptr addrspace(1) @__omp_offloading_47_69b571__test_num_threads_l23_kernel_environment to ptr), ptr %0)
  %exec_user_code = icmp eq i32 %6, -1
  br i1 %exec_user_code, label %user_code.entry, label %worker.exit

user_code.entry:                                  ; preds = %entry
  %7 = load ptr, ptr %5, align 8
  br label %omp.target

omp.target:                                       ; preds = %user_code.entry
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr addrspacecast (ptr addrspace(1) @2 to ptr))
  br label %omp_parallel

omp_parallel:                                     ; preds = %omp.target
  %gep_ = getelementptr { ptr }, ptr addrspace(5) %structArg, i32 0, i32 0
  store ptr %7, ptr addrspace(5) %gep_, align 8
  %8 = getelementptr inbounds [1 x ptr], ptr %3, i64 0, i64 0
  store ptr %structArg.ascast, ptr %8, align 8
  call void @__kmpc_parallel_51(ptr addrspacecast (ptr addrspace(1) @2 to ptr), i32 %omp_global_thread_num, i32 1, i32 156, i32 -1, ptr @__omp_offloading_47_69b571__test_num_threads_l23..omp_par, ptr null, ptr %3, i64 1)
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.par.exit.split
  call void @__kmpc_target_deinit()
  ret void

worker.exit:                                      ; preds = %entry
  ret void
}

; Function Attrs: nounwind
define internal void @__omp_offloading_47_69b571__test_num_threads_l23..omp_par(ptr noalias noundef %tid.addr.ascast, ptr noalias noundef %zero.addr.ascast, ptr %0) #0 {
omp.par.entry:
  %gep_ = getelementptr { ptr }, ptr %0, i32 0, i32 0
  %loadgep_ = load ptr, ptr %gep_, align 8
  %tid.addr.local = alloca i32, align 4, addrspace(5)
  %1 = load i32, ptr %tid.addr.ascast, align 4
  store i32 %1, ptr addrspace(5) %tid.addr.local, align 4
  %tid = load i32, ptr addrspace(5) %tid.addr.local, align 4
  br label %omp.reduction.init

omp.reduction.init:                               ; preds = %omp.par.entry
  br label %omp.par.region

omp.par.region:                                   ; preds = %omp.reduction.init
  br label %omp.par.region2

omp.par.region2:                                  ; preds = %omp.par.region
  store i32 1, ptr %loadgep_, align 4
  br label %omp.region.cont1

omp.region.cont1:                                 ; preds = %omp.par.region2
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont1
  br label %omp.par.outlined.exit.exitStub

omp.par.outlined.exit.exitStub:                   ; preds = %omp.par.pre_finalize
  ret void
}

define weak_odr protected amdgpu_kernel void @__omp_offloading_47_69b571_parallel_if_l41(ptr %0, ptr %1, ptr %2) {
entry:
  %3 = alloca [1 x ptr], align 8, addrspace(5)
  %4 = addrspacecast ptr addrspace(5) %3 to ptr
  %structArg = alloca { ptr }, align 8, addrspace(5)
  %structArg.ascast = addrspacecast ptr addrspace(5) %structArg to ptr
  %5 = alloca ptr, align 8, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %5 to ptr
  store ptr %1, ptr %6, align 8
  %7 = alloca ptr, align 8, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %7 to ptr
  store ptr %2, ptr %8, align 8
  %9 = call i32 @__kmpc_target_init(ptr addrspacecast (ptr addrspace(1) @__omp_offloading_47_69b571_parallel_if_l41_kernel_environment to ptr), ptr %0)
  %exec_user_code = icmp eq i32 %9, -1
  br i1 %exec_user_code, label %user_code.entry, label %worker.exit

user_code.entry:                                  ; preds = %entry
  %10 = load ptr, ptr %6, align 8
  br label %omp.target

omp.target:                                       ; preds = %user_code.entry
  %11 = load i32, ptr %8, align 4
  %12 = icmp ne i32 %11, 0
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr addrspacecast (ptr addrspace(1) @2 to ptr))
  br label %omp_parallel

omp_parallel:                                     ; preds = %omp.target
  %gep_ = getelementptr { ptr }, ptr addrspace(5) %structArg, i32 0, i32 0
  store ptr %10, ptr addrspace(5) %gep_, align 8
  %13 = getelementptr inbounds [1 x ptr], ptr %4, i64 0, i64 0
  store ptr %structArg.ascast, ptr %13, align 8
  %14 = sext i1 %12 to i32
  call void @__kmpc_parallel_51(ptr addrspacecast (ptr addrspace(1) @2 to ptr), i32 %omp_global_thread_num, i32 %14, i32 -1, i32 -1, ptr @__omp_offloading_47_69b571_parallel_if_l41..omp_par, ptr null, ptr %4, i64 1)
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.par.exit.split
  call void @__kmpc_target_deinit()
  ret void

worker.exit:                                      ; preds = %entry
  ret void
}

; Function Attrs: nounwind
define internal void @__omp_offloading_47_69b571_parallel_if_l41..omp_par(ptr noalias noundef %tid.addr.ascast, ptr noalias noundef %zero.addr.ascast, ptr %0) #0 {
omp.par.entry:
  %gep_ = getelementptr { ptr }, ptr %0, i32 0, i32 0
  %loadgep_ = load ptr, ptr %gep_, align 8
  %tid.addr.local = alloca i32, align 4, addrspace(5)
  %1 = load i32, ptr %tid.addr.ascast, align 4
  store i32 %1, ptr addrspace(5) %tid.addr.local, align 4
  %tid = load i32, ptr addrspace(5) %tid.addr.local, align 4
  br label %omp.reduction.init

omp.reduction.init:                               ; preds = %omp.par.entry
  br label %omp.par.region

omp.par.region:                                   ; preds = %omp.reduction.init
  br label %omp.par.region2

omp.par.region2:                                  ; preds = %omp.par.region
  store i32 10, ptr %loadgep_, align 4
  br label %omp.region.cont1

omp.region.cont1:                                 ; preds = %omp.par.region2
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont1
  br label %omp.par.outlined.exit.exitStub

omp.par.outlined.exit.exitStub:                   ; preds = %omp.par.pre_finalize
  ret void
}

; Function Attrs: alwaysinline
declare void @__kmpc_parallel_51(ptr, i32, i32, i32, i32, ptr, ptr, ptr, i64) #1

attributes #0 = { nounwind }
attributes #1 = { alwaysinline }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
