; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%0 = type {}

@kernel_module_bin_cst = internal constant [4 x i8] c"BLOB", align 8
@kernel_module_kernel_kernel_name = private unnamed_addr constant [7 x i8] c"kernel\00", align 1

define void @foo() {
  %1 = alloca %0, align 8
  %2 = alloca ptr, i64 0, align 8
  %3 = call ptr @mgpuModuleLoad(ptr @kernel_module_bin_cst, i64 4)
  %4 = call ptr @mgpuModuleGetFunction(ptr %3, ptr @kernel_module_kernel_kernel_name)
  %5 = call ptr @mgpuStreamCreate()
  call void @mgpuLaunchClusterKernel(ptr %4, i64 2, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i32 0, ptr %5, ptr %2, ptr null)
  call void @mgpuStreamSynchronize(ptr %5)
  call void @mgpuStreamDestroy(ptr %5)
  call void @mgpuModuleUnload(ptr %3)
  ret void
}

declare ptr @mgpuModuleLoad(ptr, i64)

declare ptr @mgpuModuleGetFunction(ptr, ptr)

declare ptr @mgpuStreamCreate()

declare void @mgpuLaunchClusterKernel(ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, ptr, ptr, ptr)

declare void @mgpuStreamSynchronize(ptr)

declare void @mgpuStreamDestroy(ptr)

declare void @mgpuModuleUnload(ptr)

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
