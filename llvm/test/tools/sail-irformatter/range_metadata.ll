; RUN: sail-irformatter -S < %s | FileCheck %s --implicit-check-not=llvm-irformatter.range --implicit-check-not='range('
; RUN: sail-irformatter -S --type-pointers=false --trans-memory-attributes=false < %s | FileCheck %s --implicit-check-not=llvm-irformatter.range --implicit-check-not='range('
; RUN: sail-irformatter -S < %s | opt -passes=verify -disable-output
; RUN: sail-irformatter < %s | sail-irformatter -S | FileCheck %s --implicit-check-not=llvm-irformatter.range --implicit-check-not='range('

; A forward intrinsic declaration must survive intrinsic attribute auto-upgrade.
; CHECK-LABEL: define i32 @sreg()
; CHECK: call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range ![[TID:[0-9]+]]
define i32 @sreg() {
  %tid = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  ret i32 %tid
}
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x()

; A real intrinsic signature upgrade must keep the call-site return carrier.
declare range(i32 0, 33) i32 @llvm.ctlz.i32(i32)
; CHECK-LABEL: define i32 @upgraded_intrinsic(
; CHECK: call i32 @llvm.ctlz.i32(i32 %{{.*}}, i1 false), !range ![[UPGRADE:[0-9]+]]
define i32 @upgraded_intrinsic(i32 %x) {
  %v = call range(i32 0, 17) i32 @llvm.ctlz.i32(i32 %x)
  ret i32 %v
}

declare range(i32 0, 64) i32 @read_index(ptr)

; Intersect declaration, call-site and existing metadata ranges.
; CHECK-LABEL: define i32 @precedence(
; CHECK: call i32 @read_index({{.*}}), !range ![[DECL:[0-9]+]]
; CHECK: call i32 @read_index({{.*}}), !range ![[SITE:[0-9]+]]
; CHECK: call i32 @read_index({{.*}}), !range ![[EXISTING:[0-9]+]]
define i32 @precedence(ptr %p) {
  %a = call i32 @read_index(ptr %p)
  %b = call range(i32 8, 32) i32 @read_index(ptr %p)
  %c = call range(i32 8, 32) i32 @read_index(ptr %p), !range !0
  %ab = add i32 %a, %b
  %abc = add i32 %ab, %c
  ret i32 %abc
}

; A definition's return range also applies to its direct callers.
; CHECK-LABEL: define i32 @bounded_definition()
define range(i32 0, 64) i32 @bounded_definition() {
  ret i32 1
}
; CHECK-LABEL: define i32 @use_definition()
; CHECK: call i32 @bounded_definition(), !range ![[DECL]]
define i32 @use_definition() {
  %v = call i32 @bounded_definition()
  ret i32 %v
}

; Parameter ranges have no !range equivalent; unrelated attributes survive.
; CHECK-LABEL: define i32 @parameters(i32 noundef %{{.*}})
; CHECK: call i32 @parameter_callee(i32 noundef %{{.*}})
; CHECK-NEXT: ret i32
define i32 @parameters(i32 noundef range(i32 0, 8) %x) {
  %v = call i32 @parameter_callee(i32 noundef range(i32 0, 8) %x)
  ret i32 %v
}
declare i32 @parameter_callee(i32 range(i32 0, 8))

; Vector ranges apply to each element, using scalar-typed bounds.
declare range(i8 -8, 8) <2 x i8> @vector_callee()
; CHECK-LABEL: define <2 x i8> @vectors()
; CHECK: call <2 x i8> @vector_callee(), !range ![[WRAP:[0-9]+]]
define <2 x i8> @vectors() {
  %v = call <2 x i8> @vector_callee()
  ret <2 x i8> %v
}

; Keep unsigned endpoints and APInt widths, including widths greater than 64.
declare range(i64 9223372036854775808, 0) i64 @wide_callee()
declare range(i128 18446744073709551616, 36893488147419103232) i128 @wider_callee()
; CHECK-LABEL: define i128 @wide_ranges()
; CHECK: call i64 @wide_callee(), !range ![[WIDE:[0-9]+]]
; CHECK: call i128 @wider_callee(), !range ![[WIDER:[0-9]+]]
define i128 @wide_ranges() {
  %a = call i64 @wide_callee()
  %b = call i128 @wider_callee()
  ret i128 %b
}

; Empty ranges produce poison while the calls remain for their side effects.
declare range(i32 0, 0) i32 @empty_callee()
; CHECK-LABEL: define i32 @empty_range()
; CHECK: call i32 @empty_callee()
; CHECK-NEXT: call i32 @read_index({{.*}})
; CHECK-NEXT: ret i32 poison
define i32 @empty_range() {
  %a = call i32 @empty_callee()
  %b = call range(i32 0, 0) i32 @read_index(ptr null)
  ret i32 %b
}

; CHECK: ![[TID]] = !{i32 0, i32 1024}
; CHECK: ![[UPGRADE]] = !{i32 0, i32 17}
; CHECK: ![[DECL]] = !{i32 0, i32 64}
; CHECK: ![[SITE]] = !{i32 8, i32 32}
; CHECK: ![[EXISTING]] = !{i32 12, i32 16}
; CHECK: ![[WRAP]] = !{i8 -8, i8 8}
; CHECK: ![[WIDE]] = !{i64 -9223372036854775808, i64 0}
; CHECK: ![[WIDER]] = !{i128 18446744073709551616, i128 36893488147419103232}
!0 = !{i32 12, i32 16}
