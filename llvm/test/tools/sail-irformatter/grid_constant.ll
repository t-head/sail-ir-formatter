; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; CHECK: grid_constant
%struct.S = type { i32 }

; Function Attrs: convergent mustprogress nounwind null_pointer_is_valid
define dso_local void @_Z4funcRK1S(ptr noundef align 4 dereferenceable(4) %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  ret void
}

; Function Attrs: convergent mustprogress norecurse nounwind null_pointer_is_valid
define dso_local ppu_kernel void @_Z6kernel1S(ptr grid_constant noundef byval(%struct.S) align 4 %0) #1 {
  call void @_Z4funcRK1S(ptr noundef align 4 dereferenceable(4) %0) #22
  ret void
}