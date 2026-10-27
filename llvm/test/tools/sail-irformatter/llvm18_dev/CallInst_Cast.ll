; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = 'extracted_function.bc'
source_filename = "extracted_function"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-f16:16-f32:32-v16:16-v32:32-n16:32:64"
target triple = "ppu"

; Function Attrs: convergent mustprogress norecurse nounwind null_pointer_is_valid
define dso_local ppu_kernel void @extracted_asm_function(ptr %ld_ptr, ptr %st_ptr) #0 {
entry:
  %r0 = alloca i32, align 4
  %r1 = alloca i32, align 4
  %r2 = alloca i32, align 4
  %r3 = alloca i32, align 4
  %ld_ptr_addr = alloca ptr, align 8
  %st_ptr_addr = alloca ptr, align 8
  store ptr %ld_ptr, ptr %ld_ptr_addr, align 8
  store ptr %st_ptr, ptr %st_ptr_addr, align 8
  %ld_ptr_val = load ptr, ptr %ld_ptr_addr, align 8
  %st_ptr_val = load ptr, ptr %st_ptr_addr, align 8
  %asm_result = call { i32, i32, i32, i32, ptr, ptr } asm sideeffect "{\0Aldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4]; \0Astmatrix.sync.aligned.m8n8.x4.shared.b16 [$5], {$0, $1, $2, $3}; \0A}\0A", 
    "=r,=r,=r,=r,=l,=l,4,5"(ptr %ld_ptr_val, ptr %st_ptr_val) #1, !srcloc !0
  %result_r0 = extractvalue { i32, i32, i32, i32, ptr, ptr } %asm_result, 0
  %result_r1 = extractvalue { i32, i32, i32, i32, ptr, ptr } %asm_result, 1
  %result_r2 = extractvalue { i32, i32, i32, i32, ptr, ptr } %asm_result, 2
  %result_r3 = extractvalue { i32, i32, i32, i32, ptr, ptr } %asm_result, 3
  %result_r4 = extractvalue { i32, i32, i32, i32, ptr, ptr } %asm_result, 4
  %result_r5 = extractvalue { i32, i32, i32, i32, ptr, ptr } %asm_result, 5
  store i32 %result_r0, ptr %r0, align 4
  store i32 %result_r1, ptr %r1, align 4
  store i32 %result_r2, ptr %r2, align 4
  store i32 %result_r3, ptr %r3, align 4
; CHECK-NOT: %{{.+}} = bitcast ptr %result_r4 to i8*
; CHECK-NOT: %{{.+}} = bitcast ptr %result_r5 to i8*
  store ptr %result_r4, ptr %ld_ptr_addr, align 8
  store ptr %result_r5, ptr %st_ptr_addr, align 8
  ret void
}

attributes #0 = { convergent mustprogress norecurse nounwind null_pointer_is_valid "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="ppu001" "target-features"="+ppu001,+ptx32" "uniform-work-group-size"="true" }
attributes #1 = { convergent nounwind }

!llvm.module.flags = !{!1}
!llvm.ident = !{!2}

!0 = !{i64 2885789, i64 2885800, i64 2885875, i64 2885949}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"LLVM IR generated function"}