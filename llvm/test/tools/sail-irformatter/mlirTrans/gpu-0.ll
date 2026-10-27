; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%0 = type { i32, i32 }

@kernel_module_bin_cst = internal constant [4 x i8] c"BLOB", align 8
@kernel_module_kernel_kernel_name = private unnamed_addr constant [7 x i8] c"kernel\00", align 1

define void @foo() {
  %1 = alloca %0, align 8
  %2 = alloca ptr, i64 2, align 8
  %3 = getelementptr inbounds %0, ptr %1, i32 0, i32 0
  store i32 32, ptr %3, align 4
  %4 = getelementptr ptr, ptr %2, i32 0
  store ptr %3, ptr %4, align 8
  %5 = getelementptr inbounds %0, ptr %1, i32 0, i32 1
  store i32 32, ptr %5, align 4
  %6 = getelementptr ptr, ptr %2, i32 1
  store ptr %5, ptr %6, align 8
  %7 = call ptr @mgpuModuleLoad(ptr @kernel_module_bin_cst, i64 4)
  %8 = call ptr @mgpuModuleGetFunction(ptr %7, ptr @kernel_module_kernel_kernel_name)
  %9 = call ptr @mgpuStreamCreate()
  call void @mgpuLaunchKernel(ptr %8, i64 8, i64 8, i64 8, i64 8, i64 8, i64 8, i32 256, ptr %9, ptr %2, ptr null, i64 2)
  call void @mgpuStreamSynchronize(ptr %9)
  call void @mgpuStreamDestroy(ptr %9)
  call void @mgpuModuleUnload(ptr %7)
  ret void
}

declare ptr @mgpuModuleLoad(ptr, i64)

declare ptr @mgpuModuleGetFunction(ptr, ptr)

declare ptr @mgpuStreamCreate()

declare void @mgpuLaunchKernel(ptr, i64, i64, i64, i64, i64, i64, i32, ptr, ptr, ptr, i64)

declare void @mgpuStreamSynchronize(ptr)

declare void @mgpuStreamDestroy(ptr)

declare void @mgpuModuleUnload(ptr)

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

