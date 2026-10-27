; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = './device.cu'
source_filename = "./device.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-f16:16-f32:32-v16:16-v32:32-n16:32:64"
target triple = "ppu"

@dev_data = external dso_local addrspace(1) global ptr, align 8

; CHECK-NOT: ptr addrspace(1)*

; Function Attrs: convergent mustprogress norecurse nounwind null_pointer_is_valid
define dso_local ppu_kernel void @_Z7kernel2PPFffE(ptr noundef %0, i64 %idx) {
  %base = alloca i32, align 4
; CHECK: %{{.+}} = load i8*, i8** addrspacecast (ptr addrspace(1) @dev_data to i8**), align 8
  %2 = load ptr, ptr addrspacecast (ptr addrspace(1) @dev_data to ptr), align 8
  %3 = getelementptr inbounds float, ptr %2, i64 %idx
  %4 = load float, ptr %3, align 4
  %5 = fadd float %4, 7.000000e+00
; CHECK: %{{.+}} = load i8*, i8** addrspacecast (ptr addrspace(1) @dev_data to i8**), align 8
  %6 = load ptr, ptr addrspacecast (ptr addrspace(1) @dev_data to ptr), align 8
  %7 = load i32, ptr %base, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds float, ptr %6, i64 %8
  store float %5, ptr %9, align 4
  ret void
}

attributes #0 = { "managed-var" }
attributes #1 = { convergent mustprogress noinline nounwind null_pointer_is_valid "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="ppu001" "target-features"="+ppu001,+ptx32" }
attributes #2 = { alwaysinline convergent mustprogress nounwind null_pointer_is_valid "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="ppu001" "target-features"="+ppu001,+ptx32" }
attributes #3 = { convergent mustprogress norecurse nounwind null_pointer_is_valid "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="ppu001" "target-features"="+ppu001,+ptx32" "uniform-work-group-size"="true" }
attributes #4 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { convergent nounwind null_pointer_is_valid "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="ppu001" "target-features"="+ppu001,+ptx32" }
attributes #7 = { convergent nounwind }
attributes #8 = { nounwind }

!llvm.build.commands = !{!0}
!ppu.module.id = !{!1}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = !{!"clang"}
!1 = !{!"2I3UC9P7LRAM5"}
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
!12 = !{!"clang version 18.1.7 (dev-13c197078674)"}
