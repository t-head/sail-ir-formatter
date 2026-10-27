; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }
%struct.DynamicEnvironmentTy = type { i16 }
%struct.KernelEnvironmentTy = type { %struct.ConfigurationEnvironmentTy, ptr, ptr }
%struct.ConfigurationEnvironmentTy = type { i8, i8, i8, i32, i32, i32, i32, i32, i32 }

@0 = private unnamed_addr constant [122 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-constant-alloca-raise.mlir;unknown;17;10;;\00", align 1
@1 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @1 }, align 8
@__omp_offloading_47_69b558__QQmain_l18_dynamic_environment = weak_odr protected global %struct.DynamicEnvironmentTy zeroinitializer
@__omp_offloading_47_69b558__QQmain_l18_kernel_environment = weak_odr protected constant %struct.KernelEnvironmentTy { %struct.ConfigurationEnvironmentTy { i8 1, i8 1, i8 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 }, ptr @2, ptr @__omp_offloading_47_69b558__QQmain_l18_dynamic_environment }

declare {} @_ExternalCall(ptr, ptr)

define weak_odr protected void @__omp_offloading_47_69b558__QQmain_l18(ptr %0, ptr %1) {
entry:
  %2 = alloca { ptr }, align 8
  %3 = alloca i32, i64 1, align 4
  %4 = alloca ptr, align 8
  store ptr %1, ptr %4, align 8
  %5 = call i32 @__kmpc_target_init(ptr @__omp_offloading_47_69b558__QQmain_l18_kernel_environment, ptr %0)
  %exec_user_code = icmp eq i32 %5, -1
  br i1 %exec_user_code, label %user_code.entry, label %worker.exit

user_code.entry:                                  ; preds = %entry
  %6 = load ptr, ptr %4, align 8
  br label %omp.target

omp.target:                                       ; preds = %user_code.entry
  store i32 50, ptr %3, align 4
  %7 = insertvalue { ptr } undef, ptr %3, 0
  store { ptr } %7, ptr %2, align 8
  %8 = call {} @_ExternalCall(ptr %6, ptr %2)
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
