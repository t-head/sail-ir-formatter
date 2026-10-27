; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @omp_atomic_update_intrinsic(ptr %0, i32 %1) {
  %x.new.val4 = alloca i32, align 4
  %x.new.val = alloca i32, align 4
  br label %entry

entry:                                            ; preds = %2
  %.atomic.load = load atomic i32, ptr %0 monotonic, align 4
  br label %.atomic.cont

.atomic.cont:                                     ; preds = %.atomic.cont, %entry
  %3 = phi i32 [ %.atomic.load, %entry ], [ %7, %.atomic.cont ]
  %4 = call i32 @llvm.smax.i32(i32 %3, i32 %1)
  store i32 %4, ptr %x.new.val, align 4
  %5 = load i32, ptr %x.new.val, align 4
  %6 = cmpxchg ptr %0, i32 %3, i32 %5 monotonic monotonic, align 4
  %7 = extractvalue { i32, i1 } %6, 0
  %8 = extractvalue { i32, i1 } %6, 1
  br i1 %8, label %.atomic.exit, label %.atomic.cont

.atomic.exit:                                     ; preds = %.atomic.cont
  %.atomic.load1 = load atomic i32, ptr %0 monotonic, align 4
  br label %.atomic.cont3

.atomic.cont3:                                    ; preds = %.atomic.cont3, %.atomic.exit
  %9 = phi i32 [ %.atomic.load1, %.atomic.exit ], [ %13, %.atomic.cont3 ]
  %10 = call i32 @llvm.umax.i32(i32 %9, i32 %1)
  store i32 %10, ptr %x.new.val4, align 4
  %11 = load i32, ptr %x.new.val4, align 4
  %12 = cmpxchg ptr %0, i32 %9, i32 %11 monotonic monotonic, align 4
  %13 = extractvalue { i32, i1 } %12, 0
  %14 = extractvalue { i32, i1 } %12, 1
  br i1 %14, label %.atomic.exit2, label %.atomic.cont3

.atomic.exit2:                                    ; preds = %.atomic.cont3
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umax.i32(i32, i32) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

