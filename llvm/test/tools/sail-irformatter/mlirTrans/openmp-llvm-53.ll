; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8

declare void @foo()

declare void @bar(i32)

define void @omp_sections(i32 %0, i32 %1, ptr %2) {
  %p.lastiter = alloca i32, align 4
  %p.lowerbound = alloca i32, align 4
  %p.upperbound = alloca i32, align 4
  %p.stride = alloca i32, align 4
  br label %entry

entry:                                            ; preds = %3
  br label %omp_section_loop.preheader

omp_section_loop.preheader:                       ; preds = %entry
  store i32 0, ptr %p.lowerbound, align 4
  store i32 2, ptr %p.upperbound, align 4
  store i32 1, ptr %p.stride, align 4
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_4u(ptr @1, i32 %omp_global_thread_num, i32 34, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride, i32 1, i32 0)
  %4 = load i32, ptr %p.lowerbound, align 4
  %5 = load i32, ptr %p.upperbound, align 4
  %6 = sub i32 %5, %4
  %7 = add i32 %6, 1
  br label %omp_section_loop.header

omp_section_loop.header:                          ; preds = %omp_section_loop.inc, %omp_section_loop.preheader
  %omp_section_loop.iv = phi i32 [ 0, %omp_section_loop.preheader ], [ %omp_section_loop.next, %omp_section_loop.inc ]
  br label %omp_section_loop.cond

omp_section_loop.cond:                            ; preds = %omp_section_loop.header
  %omp_section_loop.cmp = icmp ult i32 %omp_section_loop.iv, %7
  br i1 %omp_section_loop.cmp, label %omp_section_loop.body, label %omp_section_loop.exit

omp_section_loop.body:                            ; preds = %omp_section_loop.cond
  %8 = add i32 %omp_section_loop.iv, %4
  %9 = mul i32 %8, 1
  %10 = add i32 %9, 0
  switch i32 %10, label %omp_section_loop.body.sections.after [
    i32 0, label %omp_section_loop.body.case
    i32 1, label %omp_section_loop.body.case1
    i32 2, label %omp_section_loop.body.case4
  ]

omp_section_loop.body.case:                       ; preds = %omp_section_loop.body
  br label %omp.section.region

omp.section.region:                               ; preds = %omp_section_loop.body.case
  call void @foo()
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.section.region
  br label %omp_section_loop.body.sections.after

omp_section_loop.body.case1:                      ; preds = %omp_section_loop.body
  br label %omp.section.region3

omp.section.region3:                              ; preds = %omp_section_loop.body.case1
  call void @bar(i32 %0)
  br label %omp.region.cont2

omp.region.cont2:                                 ; preds = %omp.section.region3
  br label %omp_section_loop.body.sections.after

omp_section_loop.body.case4:                      ; preds = %omp_section_loop.body
  br label %omp.section.region6

omp.section.region6:                              ; preds = %omp_section_loop.body.case4
  %11 = add i32 %0, %1
  store i32 %11, ptr %2, align 4
  br label %omp.region.cont5

omp.region.cont5:                                 ; preds = %omp.section.region6
  br label %omp_section_loop.body.sections.after

omp_section_loop.body.sections.after:             ; preds = %omp.region.cont5, %omp.region.cont2, %omp.region.cont, %omp_section_loop.body
  br label %omp_section_loop.inc

omp_section_loop.inc:                             ; preds = %omp_section_loop.body.sections.after
  %omp_section_loop.next = add nuw i32 %omp_section_loop.iv, 1
  br label %omp_section_loop.header

omp_section_loop.exit:                            ; preds = %omp_section_loop.cond
  call void @__kmpc_for_static_fini(ptr @1, i32 %omp_global_thread_num)
  %omp_global_thread_num7 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num7)
  br label %omp_section_loop.after

omp_section_loop.after:                           ; preds = %omp_section_loop.exit
  br label %omp_section_loop.aftersections.fini

omp_section_loop.aftersections.fini:              ; preds = %omp_section_loop.after
  ret void
}

; Function Attrs: nounwind
declare void @__kmpc_for_static_init_4u(ptr, i32, i32, ptr, ptr, ptr, ptr, i32, i32) #0

; Function Attrs: nounwind
declare void @__kmpc_for_static_fini(ptr, i32) #0

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #0

; Function Attrs: convergent nounwind
declare void @__kmpc_barrier(ptr, i32) #1

attributes #0 = { nounwind }
attributes #1 = { convergent nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

