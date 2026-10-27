; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = 'jsoncpp.cpp'
source_filename = "jsoncpp.cpp"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-f16:16-f32:32-v16:16-v32:32-n16:32:64"
target triple = "ppu"

%"class.::Json::Features" = type { i8, i8, i8, i8 }

; CHECK: @_ZN4Json8FeaturesC1Ev = unnamed_addr alias void (i8*), void (i8*)* @_ZN4Json8FeaturesC2Ev
; CHECK: @_ZN4Json13ValueIteratorC1ERKS0_ = unnamed_addr alias void (i8*, i8*), void (i8*, i8*)* @_ZN4Json13ValueIteratorC2ERKS0_
; CHECK: @_ZN4Json6WriterD1Ev = unnamed_addr alias void (i8*), void (i8*)* @_ZN4Json6WriterD2Ev
; CHECK: @_ZN4Json12StreamWriterD1Ev = unnamed_addr alias void (i8*), void (i8*)* @_ZN4Json12StreamWriterD2Ev
; CHECK: @_ZN4Json12StreamWriter7FactoryD1Ev = unnamed_addr alias void (i8*), void (i8*)* @_ZN4Json12StreamWriter7FactoryD2Ev

@_ZN4Json8FeaturesC1Ev = unnamed_addr alias void (ptr), ptr @_ZN4Json8FeaturesC2Ev
@_ZN4Json13ValueIteratorC1ERKS0_ = unnamed_addr alias void (ptr, ptr), ptr @_ZN4Json13ValueIteratorC2ERKS0_
@_ZN4Json6WriterD1Ev = unnamed_addr alias void (ptr), ptr @_ZN4Json6WriterD2Ev
@_ZN4Json12StreamWriterD1Ev = unnamed_addr alias void (ptr), ptr @_ZN4Json12StreamWriterD2Ev
@_ZN4Json12StreamWriter7FactoryD1Ev = unnamed_addr alias void (ptr), ptr @_ZN4Json12StreamWriter7FactoryD2Ev

; Function Attrs: convergent mustprogress nounwind null_pointer_is_valid
define void @_ZN4Json8FeaturesC2Ev(ptr noundef align 1 dereferenceable_or_null(4) %0) unnamed_addr #0 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.::Json::Features", ptr %3, i32 0, i32 0
  store i8 1, ptr %4, align 1
  %5 = getelementptr inbounds %"class.::Json::Features", ptr %3, i32 0, i32 1
  store i8 0, ptr %5, align 1
  %6 = getelementptr inbounds %"class.::Json::Features", ptr %3, i32 0, i32 2
  store i8 0, ptr %6, align 1
  %7 = getelementptr inbounds %"class.::Json::Features", ptr %3, i32 0, i32 3
  store i8 0, ptr %7, align 1
; CHECK: call void @_ZN4Json8FeaturesC1Ev(i8* %{{.+}})
  call void @_ZN4Json8FeaturesC1Ev(ptr %4)
  ret void
}

; Function Attrs: convergent mustprogress nounwind null_pointer_is_valid
define void @_ZN4Json13ValueIteratorC2ERKS0_(ptr noundef align 8 dereferenceable_or_null(9) %0, ptr noundef align 8 dereferenceable(9) %1) unnamed_addr #0 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %5, ptr align 8 %6, i64 9, i1 false)
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: convergent mustprogress nounwind null_pointer_is_valid
define void @_ZN4Json6WriterD2Ev(ptr noundef align 8 dereferenceable_or_null(8) %0) unnamed_addr #0 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret void
}

; Function Attrs: convergent mustprogress nounwind null_pointer_is_valid
define void @_ZN4Json6WriterD0Ev(ptr noundef align 8 dereferenceable_or_null(8) %0) unnamed_addr #0 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @llvm.trap() #3
  unreachable
}

; Function Attrs: cold noreturn nounwind memory(inaccessiblemem: write)
declare void @llvm.trap() #2

; Function Attrs: convergent mustprogress nounwind null_pointer_is_valid
define void @_ZN4Json12StreamWriterD2Ev(ptr noundef align 8 dereferenceable_or_null(16) %0) unnamed_addr #0 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret void
}

; Function Attrs: convergent mustprogress nounwind null_pointer_is_valid
define void @_ZN4Json12StreamWriterD0Ev(ptr noundef align 8 dereferenceable_or_null(16) %0) unnamed_addr #0 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @llvm.trap() #3
  unreachable
}

; Function Attrs: convergent mustprogress nounwind null_pointer_is_valid
define void @_ZN4Json12StreamWriter7FactoryD2Ev(ptr noundef align 8 dereferenceable_or_null(8) %0) unnamed_addr #0 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret void
}

; Function Attrs: convergent mustprogress nounwind null_pointer_is_valid
define void @_ZN4Json12StreamWriter7FactoryD0Ev(ptr noundef align 8 dereferenceable_or_null(8) %0) unnamed_addr #0 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @llvm.trap() #3
  unreachable
}

attributes #0 = { convergent mustprogress nounwind null_pointer_is_valid "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="ppu001" "target-features"="+ppu001,+ptx32" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { cold noreturn nounwind memory(inaccessiblemem: write) }
attributes #3 = { noreturn nounwind }

!llvm.build.commands = !{!0}
!ppu.module.id = !{!1}
!ppu.packed.class.\3A\3AJson\3A\3AValueIteratorBase = !{!2}
!ppu.packed.class.\3A\3AJson\3A\3AValueIterator = !{!3}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !{!"clang"}
!1 = !{!"_1WB5H42WUJZ9C"}
!2 = !{i32 2}
!3 = !{i32 0}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 4, !"hggc-reflect-ftz", i32 0}
!6 = !{i32 4, !"hggc-reflect-fastmath", i32 0}
!7 = !{i32 4, !"hggc-reflect-fmad", i32 1}
!8 = !{i32 4, !"hggc-reflect-precdiv", i32 1}
!9 = !{i32 4, !"hggc-reflect-precsqrt", i32 1}
!10 = !{i32 4, !"hggc-reflect-strictftz", i32 0}
!11 = !{i32 4, !"hggc-reflect-simtbranch", i32 1}
!12 = !{i32 4, !"hggc-reflect-mathcfg", i32 15}
!13 = !{i32 8, !"PIC Level", i32 2}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 18.1.7 (dev-fab5d5292005)"}
