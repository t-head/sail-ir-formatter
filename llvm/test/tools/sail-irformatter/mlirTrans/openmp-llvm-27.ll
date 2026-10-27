; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @simd_order() {
  %1 = alloca i64, i64 1, align 8
  br label %omp_loop.preheader

omp_loop.preheader:                               ; preds = %0
  br label %omp_loop.header

omp_loop.header:                                  ; preds = %omp_loop.inc, %omp_loop.preheader
  %omp_loop.iv = phi i64 [ 0, %omp_loop.preheader ], [ %omp_loop.next, %omp_loop.inc ]
  br label %omp_loop.cond

omp_loop.cond:                                    ; preds = %omp_loop.header
  %omp_loop.cmp = icmp ult i64 %omp_loop.iv, 10
  br i1 %omp_loop.cmp, label %omp_loop.body, label %omp_loop.exit

omp_loop.body:                                    ; preds = %omp_loop.cond
  %2 = mul i64 %omp_loop.iv, 1
  %3 = add i64 %2, 1
  br label %omp.simd.region

omp.simd.region:                                  ; preds = %omp_loop.body
  store i64 %3, ptr %1, align 4, !llvm.access.group !1
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
!2 = distinct !{!2, !3, !4, !5}
!3 = !{!"llvm.loop.parallel_accesses", !1}
!4 = !{!"llvm.loop.vectorize.enable", i1 true}
!5 = !{!"llvm.loop.vectorize.width", i64 2}

