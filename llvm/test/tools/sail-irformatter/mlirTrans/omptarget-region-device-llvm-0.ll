; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }
%struct.DynamicEnvironmentTy = type { i16 }
%struct.KernelEnvironmentTy = type { %struct.ConfigurationEnvironmentTy, ptr, ptr }
%struct.ConfigurationEnvironmentTy = type { i8, i8, i8, i32, i32, i32, i32, i32, i32 }

@0 = private unnamed_addr constant [119 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-region-device-llvm.mlir;unknown;15;13;;\00", align 1
@1 = private unnamed_addr constant [119 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-region-device-llvm.mlir;unknown;16;13;;\00", align 1
@2 = private unnamed_addr constant [119 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-region-device-llvm.mlir;unknown;17;13;;\00", align 1
@3 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@4 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @3 }, align 8
@__omp_offloading_47_69b574_omp_target_region__l18_dynamic_environment = weak_odr protected global %struct.DynamicEnvironmentTy zeroinitializer
@__omp_offloading_47_69b574_omp_target_region__l18_kernel_environment = weak_odr protected constant %struct.KernelEnvironmentTy { %struct.ConfigurationEnvironmentTy { i8 1, i8 1, i8 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 }, ptr @4, ptr @__omp_offloading_47_69b574_omp_target_region__l18_dynamic_environment }

define void @omp_target_region_() {
  %1 = alloca i32, i64 1, align 4
  %2 = alloca i32, i64 1, align 4
  %3 = alloca i32, i64 1, align 4
  store i32 10, ptr %1, align 4
  store i32 20, ptr %2, align 4
  br label %entry

entry:                                            ; preds = %0
  ret void
}

define weak_odr protected void @__omp_offloading_47_69b574_omp_target_region__l18(ptr %0, ptr %1, ptr %2, ptr %3) {
entry:
  %4 = alloca ptr, align 8
  store ptr %1, ptr %4, align 8
  %5 = alloca ptr, align 8
  store ptr %2, ptr %5, align 8
  %6 = alloca ptr, align 8
  store ptr %3, ptr %6, align 8
  %7 = call i32 @__kmpc_target_init(ptr @__omp_offloading_47_69b574_omp_target_region__l18_kernel_environment, ptr %0)
  %exec_user_code = icmp eq i32 %7, -1
  br i1 %exec_user_code, label %user_code.entry, label %worker.exit

user_code.entry:                                  ; preds = %entry
  %8 = load ptr, ptr %4, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load ptr, ptr %6, align 8
  br label %omp.target

omp.target:                                       ; preds = %user_code.entry
  %11 = load i32, ptr %8, align 4
  %12 = load i32, ptr %9, align 4
  %13 = add i32 %11, %12
  store i32 %13, ptr %10, align 4
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.target
  call void @__kmpc_target_deinit()
  ret void

worker.exit:                                      ; preds = %entry
  ret void
}

declare i32 @__kmpc_target_init(ptr, ptr)

declare void @__kmpc_target_deinit()

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
