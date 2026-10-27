; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

$any = comdat any

declare void @foo()

declare i64 @bar(i64, i64)

define i64 @baz(i64 %0) {
  ret i64 %0
}

declare void @qux(ptr noalias, i64)

declare void @roundtrip1()

declare double @roundtrip2(i64, float)

declare void @roundtrip3(i32, i1)

define void @roundtrip4(i32 %0, i1 %1) {
  ret void
}

declare void @roundtrip5()

define void @roundtrip6() {
  ret void
}

define void @roundtrip7() {
  ret void
}

declare i32 @roundtrip8()

declare void @roundtrip9(ptr noalias)

declare void @roundtrip10(ptr noalias)

define void @roundtrip11(ptr noalias %0) {
  ret void
}

define void @roundtrip12(ptr noalias %0) {
  ret void
}

define void @byvalattr(ptr byval(i32) %0) {
  ret void
}

define void @sretattr(ptr sret(i32) %0) {
  ret void
}

define void @nestattr(ptr nest %0) {
  ret void
}

declare void @llvm_noalias_decl(ptr noalias)

declare void @byrefattr_decl(ptr byref(i32))

declare void @byvalattr_decl(ptr byval(i32))

declare void @sretattr_decl(ptr sret(i32))

declare void @nestattr_decl(ptr nest)

declare void @noundefattr_decl(i32 noundef)

declare void @llvm_align_decl(ptr align 4)

declare void @inallocaattr_decl(ptr inalloca(i32))

declare void @variadic(...)

declare void @variadic_args(i32, i32, ...)

define internal void @internal_func() {
  ret void
}

define weak void @weak_linkage() {
  ret void
}

define ptx_kernel void @calling_conv() {
  ret void
}

declare void @external_func()

define void @arg_struct_attr({ i32 } %0) {
  ret void
}

define { i32 } @res_struct_attr({ i32 } %0) {
  ret { i32 } %0
}

define void @cconv1() {
  ret void
}

define weak void @cconv2() {
  ret void
}

define weak fastcc void @cconv3() {
  ret void
}

define ghccc void @cconv4() {
  ret void
}

define void @test_ccs() {
  call void @cconv1()
  call void @cconv2()
  call fastcc void @cconv3()
  call ghccc void @cconv4()
  ret void
}

define void @variadic_def(...) {
  ret void
}

; Function Attrs: memory(argmem: read, inaccessiblemem: readwrite)
define void @memory_attr() #0 {
  ret void
}

define hidden void @hidden() {
  ret void
}

define protected void @protected() {
  ret void
}

define void @local_unnamed_addr_func() local_unnamed_addr {
  ret void
}

define void @align_func() align 2 {
  ret void
}

define dso_local void @any() comdat {
  ret void
}

; Function Attrs: vscale_range(1,2)
define void @vscale_roundtrip() #1 {
  ret void
}

define void @frame_pointer_roundtrip() #2 {
  ret void
}

define void @unsafe_fp_math_roundtrip() #3 {
  ret void
}

define void @no_infs_fp_math_roundtrip() #4 {
  ret void
}

define void @no_nans_fp_math_roundtrip() #5 {
  ret void
}

define void @approx_func_fp_math_roundtrip() #6 {
  ret void
}

define void @no_signed_zeros_fp_math_roundtrip() #7 {
  ret void
}

; Function Attrs: convergent
define void @convergent_function() #8 {
  ret void
}

define void @denormal_fp_math_roundtrip() #9 {
  ret void
}

define void @denormal_fp_math_f32_roundtrip() #10 {
  ret void
}

define void @fp_contract_roundtrip() #11 {
  ret void
}

attributes #0 = { memory(argmem: read, inaccessiblemem: readwrite) }
attributes #1 = { vscale_range(1,2) }
attributes #2 = { "frame-pointer"="non-leaf" }
attributes #3 = { "unsafe-fp-math"="true" }
attributes #4 = { "no-infs-fp-math"="true" }
attributes #5 = { "no-nans-fp-math"="true" }
attributes #6 = { "approx-func-fp-math"="true" }
attributes #7 = { "no-signed-zeros-fp-math"="true" }
attributes #8 = { convergent }
attributes #9 = { "denormal-fp-math"="preserve-sign" }
attributes #10 = { "denormal-fp-math-f32"="preserve-sign" }
attributes #11 = { "fp-contract"="fast" }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}














