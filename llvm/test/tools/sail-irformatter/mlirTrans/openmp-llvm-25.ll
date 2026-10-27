; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @simd_simple_multiple_simdlen_safelen(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, ptr %6, ptr %7) {
  %9 = icmp slt i64 %2, 0
  %10 = sub i64 0, %2
  %11 = select i1 %9, i64 %10, i64 %2
  %12 = select i1 %9, i64 %1, i64 %0
  %13 = select i1 %9, i64 %0, i64 %1
  %14 = sub nsw i64 %13, %12
  %15 = icmp slt i64 %13, %12
  %16 = udiv i64 %14, %11
  %17 = add i64 %16, 1
  %omp_loop.tripcount = select i1 %15, i64 0, i64 %17
  br label %omp_loop.preheader

omp_loop.preheader:                               ; preds = %8
  %18 = icmp slt i64 %5, 0
  %19 = sub i64 0, %5
  %20 = select i1 %18, i64 %19, i64 %5
  %21 = select i1 %18, i64 %4, i64 %3
  %22 = select i1 %18, i64 %3, i64 %4
  %23 = sub nsw i64 %22, %21
  %24 = icmp slt i64 %22, %21
  %25 = udiv i64 %23, %20
  %26 = add i64 %25, 1
  %omp_loop.tripcount1 = select i1 %24, i64 0, i64 %26
  %27 = mul nuw i64 %omp_loop.tripcount, %omp_loop.tripcount1
  br label %omp_collapsed.preheader

omp_collapsed.preheader:                          ; preds = %omp_loop.preheader
  br label %omp_collapsed.header

omp_collapsed.header:                             ; preds = %omp_collapsed.inc, %omp_collapsed.preheader
  %omp_collapsed.iv = phi i64 [ 0, %omp_collapsed.preheader ], [ %omp_collapsed.next, %omp_collapsed.inc ]
  br label %omp_collapsed.cond

omp_collapsed.cond:                               ; preds = %omp_collapsed.header
  %omp_collapsed.cmp = icmp ult i64 %omp_collapsed.iv, %27
  br i1 %omp_collapsed.cmp, label %omp_collapsed.body, label %omp_collapsed.exit

omp_collapsed.body:                               ; preds = %omp_collapsed.cond
  %28 = urem i64 %omp_collapsed.iv, %omp_loop.tripcount1
  %29 = udiv i64 %omp_collapsed.iv, %omp_loop.tripcount1
  br label %omp_loop.body

omp_loop.body:                                    ; preds = %omp_collapsed.body
  %30 = mul i64 %29, %2
  %31 = add i64 %30, %0
  br label %omp_loop.preheader2

omp_loop.preheader2:                              ; preds = %omp_loop.body
  br label %omp_loop.body5

omp_loop.body5:                                   ; preds = %omp_loop.preheader2
  %32 = mul i64 %28, %5
  %33 = add i64 %32, %3
  br label %omp.simd.region

omp.simd.region:                                  ; preds = %omp_loop.body5
  %34 = getelementptr float, ptr %6, i64 %31
  %35 = getelementptr float, ptr %7, i64 %33
  store float 2.000000e+00, ptr %34, align 4
  store float 2.000000e+00, ptr %35, align 4
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.simd.region
  br label %omp_loop.after8

omp_loop.after8:                                  ; preds = %omp.region.cont
  br label %omp_collapsed.inc

omp_collapsed.inc:                                ; preds = %omp_loop.after8
  %omp_collapsed.next = add nuw i64 %omp_collapsed.iv, 1
  br label %omp_collapsed.header, !llvm.loop !1

omp_collapsed.exit:                               ; preds = %omp_collapsed.cond
  br label %omp_collapsed.after

omp_collapsed.after:                              ; preds = %omp_collapsed.exit
  br label %omp_loop.after

omp_loop.after:                                   ; preds = %omp_collapsed.after
  ret void
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.enable", i1 true}
!3 = !{!"llvm.loop.vectorize.width", i64 1}

