; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = 'kernel.ll'
source_filename = "./vectorAdd.hg"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-f16:16-f32:32-v16:16-v32:32-n16:32:64"
target triple = "ppu"

%struct.uint3 = type { i32, i32, i32 }
%struct.dim3 = type { i32, i32, i32 }

; Function Attrs: convergent mustprogress noinline norecurse nounwind null_pointer_is_valid
; CHECK: define dso_local ppu_kernel void @kernel(i8* noundef %0, i8* noundef %1, i8* noundef %2, i32 noundef %3) #0 {
define dso_local ppu_kernel void @kernel(ptr noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef %3) #0 {
  ret void
}

attributes #0 = { convergent mustprogress noinline norecurse nounwind null_pointer_is_valid "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="ppu001" "target-features"="+ppu001,+ptx32" "uniform-work-group-size"="true" }