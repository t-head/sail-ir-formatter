; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; CHECK-LABLE: input_concatenate_fusion
; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @input_concatenate_fusion(ptr noalias nocapture readonly align 16 dereferenceable(4) %0, ptr noalias nocapture writeonly align 128 dereferenceable(8) initializes((0, 8)) %1) local_unnamed_addr #0 {
  store i32 0, ptr %1, align 128
  %3 = load i32, ptr %0, align 16, !invariant.load !4
; CHECK: %{{.+}} = getelementptr inbounds i8, i8* %{{.+}}, i64 4
  %4 = getelementptr inbounds nuw i8, ptr %1, i64 4
  store i32 %3, ptr %4, align 4
  ret void
}


; CHECK-LABLE: input_concatenate_fusion2
; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @input_concatenate_fusion2(ptr noalias nocapture readonly align 16 dereferenceable(4) %0, ptr noalias nocapture writeonly align 128 dereferenceable(8) initializes((0, 8)) %1) local_unnamed_addr #0 {
  store i32 0, ptr %1, align 128
  %3 = load i32, ptr %0, align 16, !invariant.load !4
; CHECK: %{{.+}} = getelementptr inbounds i8, i8* %{{.+}}, i64 4
  %4 = getelementptr inbounds nusw i8, ptr %1, i64 4
  store i32 %3, ptr %4, align 4
  ret void
}


attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2, !3}

!0 = !{ptr @input_concatenate_fusion, !"kernel", i32 1}
!1 = !{ptr @input_concatenate_fusion, !"reqntidx", i32 1}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!4 = !{}
