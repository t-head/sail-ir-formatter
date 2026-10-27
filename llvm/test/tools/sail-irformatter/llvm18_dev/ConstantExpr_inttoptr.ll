; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = './Invalid_global_mem_access_alignment.cu'
source_filename = "./Invalid_global_mem_access_alignment.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-f16:16-f32:32-v16:16-v32:32-n16:32:64"
target triple = "ppu"

; CHECK: @global_memory = dso_local addrspace(1) externally_initialized global i8* inttoptr
@global_memory = dso_local addrspace(1) externally_initialized global ptr inttoptr (i64 39321 to ptr), align 8
@llvm.compiler.used = appending global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @global_memory to ptr)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind null_pointer_is_valid
define dso_local ppu_kernel void @_Z8DecreasePiS_S_(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr addrspacecast (ptr addrspace(1) @global_memory to ptr), align 8
  store i32 0, ptr %7, align 4
  %8 = load ptr, ptr %4, align 8
  %9 = load i32, ptr %8, align 4
  %10 = load ptr, ptr %5, align 8
  %11 = load i32, ptr %10, align 4
  %12 = sub nsw i32 %9, %11
  %13 = load ptr, ptr addrspacecast (ptr addrspace(1) @global_memory to ptr), align 8
  %14 = load i32, ptr %13, align 4
  %15 = add nsw i32 %12, %14
  %16 = load ptr, ptr %6, align 8
  store i32 %15, ptr %16, align 4
  ret void
}

; uselistorder directives
uselistorder ptr addrspacecast (ptr addrspace(1) @global_memory to ptr), { 1, 2, 0 }

attributes #0 = { convergent mustprogress norecurse nounwind null_pointer_is_valid "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="ppu001" "target-features"="+ppu001,+ptx32" "uniform-work-group-size"="true" }

!llvm.build.commands = !{!0}
!ppu.module.id = !{!1}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = !{!"clang"}
!1 = !{!"2C33VKS6NJO6O"}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 4, !"hggc-reflect-ftz", i32 0}
!4 = !{i32 4, !"hggc-reflect-fastmath", i32 0}
!5 = !{i32 4, !"hggc-reflect-fmad", i32 1}
!6 = !{i32 4, !"hggc-reflect-precdiv", i32 1}
!7 = !{i32 4, !"hggc-reflect-precsqrt", i32 1}
!8 = !{i32 4, !"hggc-reflect-strictftz", i32 0}
!9 = !{i32 4, !"hggc-reflect-simtbranch", i32 1}
!10 = !{i32 4, !"hggc-reflect-mathcfg", i32 15}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 18.1.7 (dev-c9f112360139)"}
