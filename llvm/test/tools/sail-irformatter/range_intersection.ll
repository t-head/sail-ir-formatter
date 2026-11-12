; RUN: sail-irformatter -S < %s | FileCheck %s --implicit-check-not=llvm-irformatter.range --implicit-check-not='range(' --implicit-check-not=llvm.assume
; RUN: sail-irformatter -S --type-pointers=false --trans-memory-attributes=false < %s | FileCheck %s --implicit-check-not=llvm-irformatter.range
; RUN: sail-irformatter -S < %s | opt -passes=verify -disable-output
; RUN: sail-irformatter < %s | sail-irformatter -S | FileCheck %s --implicit-check-not=llvm-irformatter.range

; All three sources must constrain the result, regardless of declaration order.
declare range(i8 0, 64) i8 @limited()
; CHECK-LABEL: define i8 @three_way()
; CHECK: call i8 @limited(), !range ![[THREE:[0-9]+]]
define i8 @three_way() {
  %v = call range(i8 32, 96) i8 @limited(), !range !0
  ret i8 %v
}

; Intersecting two circular intervals can produce disconnected results.
declare range(i8 100, 50) i8 @wrapped()
; CHECK-LABEL: define i8 @disconnected()
; CHECK: call i8 @wrapped(), !range ![[SPLIT:[0-9]+]]
define i8 @disconnected() {
  %v = call range(i8 0, 200) i8 @wrapped()
  ret i8 %v
}

; Preserve holes in existing multi-interval metadata while clipping endpoints.
declare i8 @unknown()
; CHECK-LABEL: define i8 @multiple()
; CHECK: call i8 @unknown(), !range ![[MULTI:[0-9]+]]
define i8 @multiple() {
  %v = call range(i8 0, 48) i8 @unknown(), !range !1
  ret i8 %v
}

; Intervals meeting across zero must be rejoined into one wrapping interval.
declare range(i8 240, 16) i8 @near_zero()
; CHECK-LABEL: define i8 @wrap_edges()
; CHECK: call i8 @near_zero(), !range ![[WRAP:[0-9]+]]
define i8 @wrap_edges() {
  %v = call range(i8 248, 8) i8 @near_zero()
  ret i8 %v
}

; The exclusive 2^W boundary must not be mistaken for an empty [0,0) interval.
declare range(i8 128, 0) i8 @upper_half()
; CHECK-LABEL: define i8 @upper_boundary()
; CHECK: call i8 @upper_half(), !range ![[UPPER:[0-9]+]]
define i8 @upper_boundary() {
  %v = call range(i8 64, 0) i8 @upper_half()
  ret i8 %v
}

; Output lower bounds must use signed order, even after unsigned set operations.
; CHECK-LABEL: define i8 @signed_order()
; CHECK: call i8 @unknown(), !range ![[SIGNED:[0-9]+]]
define i8 @signed_order() {
  %v = call range(i8 20, 160) i8 @unknown(), !range !2
  ret i8 %v
}

; An empty intersection must keep the call and poison all result uses.
declare range(i8 0, 4) i8 @effect()
; CHECK-LABEL: define i8 @empty_intersection()
; CHECK: call i8 @effect()
; CHECK-NEXT: ret i8 poison
define i8 @empty_intersection() {
  %v = call range(i8 4, 8) i8 @effect(), !range !3
  ret i8 %v
}

; The same rule applies to invoke without changing either control-flow edge.
declare range(i32 0, 4) i32 @throw_effect(ptr)
; CHECK-LABEL: define i32 @empty_invoke(
; CHECK: invoke i32 @throw_effect(
; CHECK-NEXT: to label %normal unwind label %unwind{{$}}
; CHECK: normal:
; CHECK-NEXT: ret i32 poison
; CHECK: unwind:
define i32 @empty_invoke(ptr %p) personality ptr null {
  %v = invoke range(i32 4, 8) i32 @throw_effect(ptr %p)
          to label %normal unwind label %unwind
normal:
  ret i32 %v
unwind:
  %lp = landingpad { ptr, i32 } cleanup
  unreachable
}

; Vector constraints intersect element-wise using scalar-typed endpoints.
declare range(i8 0, 32) <2 x i8> @vector_result()
; CHECK-LABEL: define <2 x i8> @vector_intersection()
; CHECK: call <2 x i8> @vector_result(), !range ![[VECTOR:[0-9]+]]
define <2 x i8> @vector_intersection() {
  %v = call range(i8 16, 48) <2 x i8> @vector_result(), !range !4
  ret <2 x i8> %v
}

; CHECK-LABEL: define <2 x i8> @vector_empty()
; CHECK: call <2 x i8> @vector_result()
; CHECK-NEXT: ret <2 x i8> poison
define <2 x i8> @vector_empty() {
  %v = call range(i8 32, 48) <2 x i8> @vector_result()
  ret <2 x i8> %v
}

; Use APInt endpoints throughout, including intersections above 2^64.
declare range(i128 18446744073709551616, 73786976294838206464) i128 @wide()
; CHECK-LABEL: define i128 @wide_intersection()
; CHECK: call i128 @wide(), !range ![[WIDE:[0-9]+]]
define i128 @wide_intersection() {
  %v = call range(i128 36893488147419103232, 147573952589676412928) i128 @wide(), !range !5
  ret i128 %v
}

; Call-site attributes also constrain indirect calls with preexisting metadata.
; CHECK-LABEL: define i8 @indirect_intersection(
; CHECK: call i8 %{{.*}}(), !range ![[INDIRECT:[0-9]+]]
define i8 @indirect_intersection(ptr %fn) {
  %v = call range(i8 8, 24) i8 %fn(), !range !6
  ret i8 %v
}

; Existing multi-interval metadata remains intact when no new constraints exist.
; CHECK-LABEL: define i8 @passthrough()
; CHECK: call i8 @unknown(), !range ![[PASS:[0-9]+]]
define i8 @passthrough() {
  %v = call i8 @unknown(), !range !1
  ret i8 %v
}

; Pointer conversion must copy the whole multi-interval node for loads as well.
; CHECK-LABEL: define i8 @load_multiple(
; CHECK: load i8, {{.*}}, align 1, !range ![[PASS]]
define i8 @load_multiple(ptr %p) {
  %v = load i8, ptr %p, align 1, !range !1
  ret i8 %v
}

; The smallest integer width must retain the distinction between {0} and {1}.
declare range(i1 0, 1) i1 @one_bit()
; CHECK-LABEL: define i1 @bit_empty()
; CHECK: call i1 @one_bit()
; CHECK-NEXT: ret i1 poison
define i1 @bit_empty() {
  %v = call range(i1 1, 0) i1 @one_bit()
  ret i1 %v
}

; CHECK-DAG: ![[THREE]] = !{i8 48, i8 64}
; CHECK-DAG: ![[SPLIT]] = !{i8 0, i8 50, i8 100, i8 -56}
; CHECK-DAG: ![[MULTI]] = !{i8 0, i8 8, i8 16, i8 24, i8 40, i8 48}
; CHECK-DAG: ![[WRAP]] = !{i8 -8, i8 8}
; CHECK-DAG: ![[UPPER]] = !{i8 -128, i8 0}
; CHECK-DAG: ![[SIGNED]] = !{i8 -100, i8 -96, i8 20, i8 30, i8 100, i8 -120}
; CHECK-DAG: ![[VECTOR]] = !{i8 20, i8 32}
; CHECK-DAG: ![[WIDE]] = !{i128 55340232221128654848, i128 73786976294838206464}
; CHECK-DAG: ![[INDIRECT]] = !{i8 8, i8 16}
; CHECK-DAG: ![[PASS]] = !{i8 -8, i8 8, i8 16, i8 24, i8 40, i8 56}
!0 = !{i8 48, i8 80}
!1 = !{i8 -8, i8 8, i8 16, i8 24, i8 40, i8 56}
!2 = !{i8 -100, i8 -80, i8 10, i8 30, i8 100, i8 -120}
!3 = !{i8 0, i8 8}
!4 = !{i8 20, i8 40}
!5 = !{i128 55340232221128654848, i128 92233720368547758080}
!6 = !{i8 0, i8 16}
