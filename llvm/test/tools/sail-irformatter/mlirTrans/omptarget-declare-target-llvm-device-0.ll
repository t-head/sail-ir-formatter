; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }
%struct.DynamicEnvironmentTy = type { i16 }
%struct.KernelEnvironmentTy = type { %struct.ConfigurationEnvironmentTy, ptr, ptr }
%struct.ConfigurationEnvironmentTy = type { i8, i8, i8, i32, i32, i32, i32, i32, i32 }

@_QMtest_0Esp = global i32 0
@_QMtest_0Esp_decl_tgt_ref_ptr = weak global ptr null, align 8
@0 = private unnamed_addr constant [127 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-declare-target-llvm-device.mlir;unknown;24;12;;\00", align 1
@1 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @1 }, align 8
@__omp_offloading_47_69b55b__QQmain_l25_dynamic_environment = weak_odr protected global %struct.DynamicEnvironmentTy zeroinitializer
@__omp_offloading_47_69b55b__QQmain_l25_kernel_environment = weak_odr protected constant %struct.KernelEnvironmentTy { %struct.ConfigurationEnvironmentTy { i8 1, i8 1, i8 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 }, ptr @2, ptr @__omp_offloading_47_69b55b__QQmain_l25_dynamic_environment }

define void @_QQmain() {
  br label %entry

entry:                                            ; preds = %0
  ret void
}

define weak_odr protected void @__omp_offloading_47_69b55b__QQmain_l25(ptr %0) {
entry:
  %1 = call i32 @__kmpc_target_init(ptr @__omp_offloading_47_69b55b__QQmain_l25_kernel_environment, ptr %0)
  %exec_user_code = icmp eq i32 %1, -1
  br i1 %exec_user_code, label %user_code.entry, label %worker.exit

user_code.entry:                                  ; preds = %entry
  br label %omp.target

omp.target:                                       ; preds = %user_code.entry
  %2 = load ptr, ptr @_QMtest_0Esp_decl_tgt_ref_ptr, align 8
  store i32 1, ptr %2, align 4
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
