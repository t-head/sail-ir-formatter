; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%0 = type {}

@kernel_module_bin_cst = internal constant [4 x i8] c"BLOB", align 8
@kernel_module_kernel_kernel_name = private unnamed_addr constant [7 x i8] c"kernel\00", align 1

define void @foo() {
  %1 = call ptr @mgpuStreamCreate()
  %2 = alloca %0, align 8
  %3 = alloca ptr, i64 0, align 8
  %4 = call ptr @mgpuModuleLoad(ptr @kernel_module_bin_cst, i64 4)
  %5 = call ptr @mgpuModuleGetFunction(ptr %4, ptr @kernel_module_kernel_kernel_name)
  call void @mgpuLaunchKernel(ptr %5, i64 8, i64 8, i64 8, i64 8, i64 8, i64 8, i32 0, ptr %1, ptr %3, ptr null, i64 0)
  call void @mgpuModuleUnload(ptr %4)
  call void @mgpuStreamSynchronize(ptr %1)
  call void @mgpuStreamDestroy(ptr %1)
  ret void
}

declare ptr @mgpuStreamCreate()

declare void @mgpuStreamSynchronize(ptr)

declare void @mgpuStreamDestroy(ptr)

declare ptr @mgpuModuleLoad(ptr, i64)

declare ptr @mgpuModuleGetFunction(ptr, ptr)

declare void @mgpuLaunchKernel(ptr, i64, i64, i64, i64, i64, i64, i32, ptr, ptr, ptr, i64)

declare void @mgpuModuleUnload(ptr)

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

