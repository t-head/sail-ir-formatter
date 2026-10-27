; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @simd_simple(i64 %0, i64 %1, i64 %2, ptr %3) {
  %5 = icmp slt i64 %2, 0
  %6 = sub i64 0, %2
  %7 = select i1 %5, i64 %6, i64 %2
  %8 = select i1 %5, i64 %1, i64 %0
  %9 = select i1 %5, i64 %0, i64 %1
  %10 = sub nsw i64 %9, %8
  %11 = icmp slt i64 %9, %8
  %12 = udiv i64 %10, %7
  %13 = add i64 %12, 1
  %omp_loop.tripcount = select i1 %11, i64 0, i64 %13
  br label %omp_loop.preheader

omp_loop.preheader:                               ; preds = %4
  br label %omp_loop.header

omp_loop.header:                                  ; preds = %omp_loop.inc, %omp_loop.preheader
  %omp_loop.iv = phi i64 [ 0, %omp_loop.preheader ], [ %omp_loop.next, %omp_loop.inc ]
  br label %omp_loop.cond

omp_loop.cond:                                    ; preds = %omp_loop.header
  %omp_loop.cmp = icmp ult i64 %omp_loop.iv, %omp_loop.tripcount
  br i1 %omp_loop.cmp, label %omp_loop.body, label %omp_loop.exit

omp_loop.body:                                    ; preds = %omp_loop.cond
  %14 = mul i64 %omp_loop.iv, %2
  %15 = add i64 %14, %0
  br label %omp.simd.region

omp.simd.region:                                  ; preds = %omp_loop.body
  %16 = getelementptr float, ptr %3, i64 %15
  store float 2.000000e+00, ptr %16, align 4, !llvm.access.group !1
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.simd.region
  br label %omp_loop.inc

omp_loop.inc:                                     ; preds = %omp.region.cont
  %omp_loop.next = add nuw i64 %omp_loop.iv, 1
  br label %omp_loop.header, !llvm.loop !2

omp_loop.exit:                                    ; preds = %omp_loop.cond
  br label %omp_loop.after

omp_loop.after:                                   ; preds = %omp_loop.exit
  ret void
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = distinct !{}
!2 = distinct !{!2, !3, !4}
!3 = !{!"llvm.loop.parallel_accesses", !1}
!4 = !{!"llvm.loop.vectorize.enable", i1 true}

