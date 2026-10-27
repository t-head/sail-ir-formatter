; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8

declare void @foo()

define void @omp_sections_with_clauses() {
  %p.lastiter = alloca i32, align 4
  %p.lowerbound = alloca i32, align 4
  %p.upperbound = alloca i32, align 4
  %p.stride = alloca i32, align 4
  br label %entry

entry:                                            ; preds = %0
  br label %omp_section_loop.preheader

omp_section_loop.preheader:                       ; preds = %entry
  store i32 0, ptr %p.lowerbound, align 4
  store i32 1, ptr %p.upperbound, align 4
  store i32 1, ptr %p.stride, align 4
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_4u(ptr @1, i32 %omp_global_thread_num, i32 34, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride, i32 1, i32 0)
  %1 = load i32, ptr %p.lowerbound, align 4
  %2 = load i32, ptr %p.upperbound, align 4
  %3 = sub i32 %2, %1
  %4 = add i32 %3, 1
  br label %omp_section_loop.header

omp_section_loop.header:                          ; preds = %omp_section_loop.inc, %omp_section_loop.preheader
  %omp_section_loop.iv = phi i32 [ 0, %omp_section_loop.preheader ], [ %omp_section_loop.next, %omp_section_loop.inc ]
  br label %omp_section_loop.cond

omp_section_loop.cond:                            ; preds = %omp_section_loop.header
  %omp_section_loop.cmp = icmp ult i32 %omp_section_loop.iv, %4
  br i1 %omp_section_loop.cmp, label %omp_section_loop.body, label %omp_section_loop.exit

omp_section_loop.body:                            ; preds = %omp_section_loop.cond
  %5 = add i32 %omp_section_loop.iv, %1
  %6 = mul i32 %5, 1
  %7 = add i32 %6, 0
  switch i32 %7, label %omp_section_loop.body.sections.after [
    i32 0, label %omp_section_loop.body.case
    i32 1, label %omp_section_loop.body.case1
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
  call void @foo()
  br label %omp.region.cont2

omp.region.cont2:                                 ; preds = %omp.section.region3
  br label %omp_section_loop.body.sections.after

omp_section_loop.body.sections.after:             ; preds = %omp.region.cont2, %omp.region.cont, %omp_section_loop.body
  br label %omp_section_loop.inc

omp_section_loop.inc:                             ; preds = %omp_section_loop.body.sections.after
  %omp_section_loop.next = add nuw i32 %omp_section_loop.iv, 1
  br label %omp_section_loop.header

omp_section_loop.exit:                            ; preds = %omp_section_loop.cond
  call void @__kmpc_for_static_fini(ptr @1, i32 %omp_global_thread_num)
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

attributes #0 = { nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

