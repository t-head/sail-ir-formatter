; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.va_list = type { ptr }

define void @vararg_function(i32 %0, ...) {
  %2 = alloca %struct.va_list, align 8
  call void @llvm.va_start.p0(ptr %2)
  %3 = alloca ptr, align 8
  call void @llvm.va_copy.p0(ptr %3, ptr %2)
  call void @llvm.va_end.p0(ptr %3)
  call void @llvm.va_end.p0(ptr %2)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_start.p0(ptr) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_copy.p0(ptr, ptr) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_end.p0(ptr) #0

attributes #0 = { nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

