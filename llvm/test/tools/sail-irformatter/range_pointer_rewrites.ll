; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s --implicit-check-not=llvm-irformatter.range
; RUN: sail-irformatter -S -verify-pointers < %s | opt -passes=verify -disable-output

; CHECK-LABEL: define i32 @indirect(
; CHECK: call i32 %{{.*}}({{.*}}), !range ![[SITE:[0-9]+]]
define i32 @indirect(ptr %callee, ptr %p) {
  %v = call range(i32 0, 16) i32 %callee(ptr %p)
  ret i32 %v
}

; CHECK-LABEL: define i32 @indirect_metadata(
; CHECK: call i32 %{{.*}}({{.*}}), !range ![[SITE]]
define i32 @indirect_metadata(ptr %callee, ptr %p) {
  %v = call i32 %callee(ptr %p), !range !0
  ret i32 %v
}

declare range(i32 0, 16) i32 @may_throw(ptr)

; CHECK-LABEL: define i32 @invoke_range(
; CHECK: invoke i32 @may_throw(
; CHECK-NEXT: to label %normal unwind label %unwind, !range ![[SITE]]
define i32 @invoke_range(ptr %p) personality ptr null {
  %v = invoke i32 @may_throw(ptr %p) to label %normal unwind label %unwind
normal:
  ret i32 %v
unwind:
  %lp = landingpad { ptr, i32 } cleanup
  unreachable
}

; __nvvm_reflect has a separate call replacement path.
@name = private constant [4 x i8] c"test"
declare range(i32 0, 16) i32 @__nvvm_reflect(ptr)
; CHECK-LABEL: define i32 @reflect_range()
; CHECK: call i32 @__nvvm_reflect({{.*}}), !range ![[SITE]]
define i32 @reflect_range() {
  %v = call i32 @__nvvm_reflect(ptr @name)
  ret i32 %v
}

; Rebuilding an integer load must also preserve preexisting range metadata.
; CHECK-LABEL: define i32 @load_range(
; CHECK: load i32, i32* %{{.*}}, align 4, !range ![[SITE]]
define i32 @load_range(ptr %p) {
  %v = load i32, ptr %p, align 4, !range !0
  ret i32 %v
}

; The intrinsic-to-inline-asm path must keep the declaration's range too.
declare range(i16 0, 128) i16 @llvm.nvvm.f2bf16.rn(float)
; CHECK-LABEL: define i16 @inline_asm_range(
; CHECK: call i16 asm {{.*}}, !range ![[ASM:[0-9]+]]
define i16 @inline_asm_range(float %x) {
  %v = call i16 @llvm.nvvm.f2bf16.rn(float %x)
  ret i16 %v
}

; CHECK: ![[SITE]] = !{i32 0, i32 16}
; CHECK: ![[ASM]] = !{i16 0, i16 128}
!0 = !{i32 0, i32 16}
