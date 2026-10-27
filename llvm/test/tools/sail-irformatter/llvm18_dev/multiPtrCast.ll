; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = 'kernel.ll'
source_filename = "./vectorAdd.hg"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-f16:16-f32:32-v16:16-v32:32-n16:32:64"
target triple = "ppu"

; Function Attrs: convergent mustprogress noinline norecurse nounwind null_pointer_is_valid
define dso_local ppu_kernel i8* @kernel(i8* %0) #0 {
; CHECK: ret i8* %0
  %2 = bitcast i8* %0 to ptr
  %3 = bitcast ptr %2 to ptr
  %4 = bitcast ptr %3 to i8*
  ret i8* %4
}

attributes #0 = { convergent mustprogress noinline norecurse nounwind null_pointer_is_valid "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="ppu001" "target-features"="+ppu001,+ptx32" "uniform-work-group-size"="true" }