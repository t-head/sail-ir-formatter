; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @simd_if(ptr %0, ptr %1) {
  %3 = alloca i32, i64 1, align 4
  %4 = alloca i32, i64 1, align 4
  %5 = load i32, ptr %0, align 4
  %6 = load i32, ptr %0, align 4
  %7 = load i32, ptr %1, align 4
  %8 = icmp sge i32 %6, %7
  %9 = select i1 false, i32 %5, i32 0
  %10 = select i1 false, i32 0, i32 %5
  %11 = sub nsw i32 %10, %9
  %12 = icmp slt i32 %10, %9
  %13 = udiv i32 %11, 1
  %14 = add i32 %13, 1
  %omp_loop.tripcount = select i1 %12, i32 0, i32 %14
  br i1 %8, label %simd.if.then, label %simd.if.else

simd.if.then:                                     ; preds = %2
  br label %omp_loop.preheader

omp_loop.preheader:                               ; preds = %simd.if.then
  br label %omp_loop.header

omp_loop.header:                                  ; preds = %omp_loop.inc, %omp_loop.preheader
  %omp_loop.iv = phi i32 [ 0, %omp_loop.preheader ], [ %omp_loop.next, %omp_loop.inc ]
  br label %omp_loop.cond

omp_loop.cond:                                    ; preds = %omp_loop.header
  %omp_loop.cmp = icmp ult i32 %omp_loop.iv, %omp_loop.tripcount
  br i1 %omp_loop.cmp, label %omp_loop.body, label %omp_loop.exit

omp_loop.body:                                    ; preds = %omp_loop.cond
  %15 = mul i32 %omp_loop.iv, 1
  %16 = add i32 %15, 0
  br label %omp.simd.region

omp.simd.region:                                  ; preds = %omp_loop.body
  store i32 %16, ptr %3, align 4, !llvm.access.group !1
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.simd.region
  br label %omp_loop.inc

omp_loop.inc:                                     ; preds = %omp.region.cont
  %omp_loop.next = add nuw i32 %omp_loop.iv, 1
  br label %omp_loop.header, !llvm.loop !2

simd.if.else:                                     ; preds = %2
  br label %omp_loop.header1

omp_loop.header1:                                 ; preds = %simd.if.else, %omp_loop.inc8
  %omp_loop.iv2 = phi i32 [ 0, %simd.if.else ], [ %omp_loop.next9, %omp_loop.inc8 ]
  br label %omp_loop.cond3

omp_loop.cond3:                                   ; preds = %omp_loop.header1
  %omp_loop.cmp4 = icmp ult i32 %omp_loop.iv2, %omp_loop.tripcount
  br i1 %omp_loop.cmp4, label %omp_loop.body5, label %omp_loop.exit

omp_loop.body5:                                   ; preds = %omp_loop.cond3
  %17 = mul i32 %omp_loop.iv2, 1
  %18 = add i32 %17, 0
  br label %omp.simd.region6

omp.simd.region6:                                 ; preds = %omp_loop.body5
  store i32 %18, ptr %3, align 4
  br label %omp.region.cont7

omp.region.cont7:                                 ; preds = %omp.simd.region6
  br label %omp_loop.inc8

omp_loop.inc8:                                    ; preds = %omp.region.cont7
  %omp_loop.next9 = add nuw i32 %omp_loop.iv2, 1
  br label %omp_loop.header1, !llvm.loop !5

omp_loop.exit:                                    ; preds = %omp_loop.cond3, %omp_loop.cond
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
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.vectorize.enable", i1 false}

