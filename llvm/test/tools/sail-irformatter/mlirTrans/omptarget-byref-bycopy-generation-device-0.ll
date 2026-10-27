; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }
%struct.DynamicEnvironmentTy = type { i16 }
%struct.KernelEnvironmentTy = type { %struct.ConfigurationEnvironmentTy, ptr, ptr }
%struct.ConfigurationEnvironmentTy = type { i8, i8, i8, i32, i32, i32, i32, i32, i32 }

@_QFEi = internal global i32 1
@_QFEsp = internal global i32 0
@0 = private unnamed_addr constant [130 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-byref-bycopy-generation-device.mlir;unknown;7;10;;\00", align 1
@1 = private unnamed_addr constant [130 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-byref-bycopy-generation-device.mlir;unknown;8;10;;\00", align 1
@2 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@3 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @2 }, align 8
@__omp_offloading_47_69b550__QQmain_l9_dynamic_environment = weak_odr protected global %struct.DynamicEnvironmentTy zeroinitializer
@__omp_offloading_47_69b550__QQmain_l9_kernel_environment = weak_odr protected constant %struct.KernelEnvironmentTy { %struct.ConfigurationEnvironmentTy { i8 1, i8 1, i8 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 }, ptr @3, ptr @__omp_offloading_47_69b550__QQmain_l9_dynamic_environment }

define void @_QQmain() {
  br label %entry

entry:                                            ; preds = %0
  ret void
}

define weak_odr protected void @__omp_offloading_47_69b550__QQmain_l9(ptr %0, ptr %1, ptr %2) {
entry:
  %3 = alloca ptr, align 8
  store ptr %1, ptr %3, align 8
  %4 = alloca ptr, align 8
  store ptr %2, ptr %4, align 8
  %5 = call i32 @__kmpc_target_init(ptr @__omp_offloading_47_69b550__QQmain_l9_kernel_environment, ptr %0)
  %exec_user_code = icmp eq i32 %5, -1
  br i1 %exec_user_code, label %user_code.entry, label %worker.exit

user_code.entry:                                  ; preds = %entry
  %6 = load ptr, ptr %3, align 8
  br label %omp.target

omp.target:                                       ; preds = %user_code.entry
  %7 = load i32, ptr %4, align 4
  store i32 %7, ptr %6, align 4
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
