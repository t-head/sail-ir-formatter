; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define void @omp_atomic_capture_prefix_update(ptr %0, ptr %1, i32 %2, ptr %3, ptr %4, float %5) {
  %x.new.val44 = alloca float, align 4
  %x.new.val40 = alloca float, align 4
  %x.new.val36 = alloca i32, align 4
  %x.new.val32 = alloca i32, align 4
  %x.new.val28 = alloca i32, align 4
  %x.new.val24 = alloca i32, align 4
  %x.new.val20 = alloca i32, align 4
  %x.new.val16 = alloca i32, align 4
  %x.new.val12 = alloca i32, align 4
  %x.new.val8 = alloca i32, align 4
  %x.new.val4 = alloca i32, align 4
  %x.new.val = alloca i32, align 4
  br label %entry

entry:                                            ; preds = %6
  %7 = atomicrmw add ptr %0, i32 %2 monotonic, align 4
  %8 = add i32 %7, %2
  store i32 %8, ptr %1, align 4
  %9 = atomicrmw sub ptr %0, i32 %2 monotonic, align 4
  %10 = sub i32 %9, %2
  store i32 %10, ptr %1, align 4
  %11 = atomicrmw and ptr %0, i32 %2 monotonic, align 4
  %12 = and i32 %11, %2
  store i32 %12, ptr %1, align 4
  %13 = atomicrmw or ptr %0, i32 %2 monotonic, align 4
  %14 = or i32 %13, %2
  store i32 %14, ptr %1, align 4
  %15 = atomicrmw xor ptr %0, i32 %2 monotonic, align 4
  %16 = xor i32 %15, %2
  store i32 %16, ptr %1, align 4
  %.atomic.load = load atomic i32, ptr %0 monotonic, align 4
  br label %.atomic.cont

.atomic.cont:                                     ; preds = %.atomic.cont, %entry
  %17 = phi i32 [ %.atomic.load, %entry ], [ %21, %.atomic.cont ]
  %18 = mul i32 %17, %2
  store i32 %18, ptr %x.new.val, align 4
  %19 = load i32, ptr %x.new.val, align 4
  %20 = cmpxchg ptr %0, i32 %17, i32 %19 monotonic monotonic, align 4
  %21 = extractvalue { i32, i1 } %20, 0
  %22 = extractvalue { i32, i1 } %20, 1
  br i1 %22, label %.atomic.exit, label %.atomic.cont

.atomic.exit:                                     ; preds = %.atomic.cont
  store i32 %18, ptr %1, align 4
  %.atomic.load1 = load atomic i32, ptr %0 monotonic, align 4
  br label %.atomic.cont3

.atomic.cont3:                                    ; preds = %.atomic.cont3, %.atomic.exit
  %23 = phi i32 [ %.atomic.load1, %.atomic.exit ], [ %27, %.atomic.cont3 ]
  %24 = sdiv i32 %23, %2
  store i32 %24, ptr %x.new.val4, align 4
  %25 = load i32, ptr %x.new.val4, align 4
  %26 = cmpxchg ptr %0, i32 %23, i32 %25 monotonic monotonic, align 4
  %27 = extractvalue { i32, i1 } %26, 0
  %28 = extractvalue { i32, i1 } %26, 1
  br i1 %28, label %.atomic.exit2, label %.atomic.cont3

.atomic.exit2:                                    ; preds = %.atomic.cont3
  store i32 %24, ptr %1, align 4
  %.atomic.load5 = load atomic i32, ptr %0 monotonic, align 4
  br label %.atomic.cont7

.atomic.cont7:                                    ; preds = %.atomic.cont7, %.atomic.exit2
  %29 = phi i32 [ %.atomic.load5, %.atomic.exit2 ], [ %33, %.atomic.cont7 ]
  %30 = udiv i32 %29, %2
  store i32 %30, ptr %x.new.val8, align 4
  %31 = load i32, ptr %x.new.val8, align 4
  %32 = cmpxchg ptr %0, i32 %29, i32 %31 monotonic monotonic, align 4
  %33 = extractvalue { i32, i1 } %32, 0
  %34 = extractvalue { i32, i1 } %32, 1
  br i1 %34, label %.atomic.exit6, label %.atomic.cont7

.atomic.exit6:                                    ; preds = %.atomic.cont7
  store i32 %30, ptr %1, align 4
  %.atomic.load9 = load atomic i32, ptr %0 monotonic, align 4
  br label %.atomic.cont11

.atomic.cont11:                                   ; preds = %.atomic.cont11, %.atomic.exit6
  %35 = phi i32 [ %.atomic.load9, %.atomic.exit6 ], [ %39, %.atomic.cont11 ]
  %36 = shl i32 %35, %2
  store i32 %36, ptr %x.new.val12, align 4
  %37 = load i32, ptr %x.new.val12, align 4
  %38 = cmpxchg ptr %0, i32 %35, i32 %37 monotonic monotonic, align 4
  %39 = extractvalue { i32, i1 } %38, 0
  %40 = extractvalue { i32, i1 } %38, 1
  br i1 %40, label %.atomic.exit10, label %.atomic.cont11

.atomic.exit10:                                   ; preds = %.atomic.cont11
  store i32 %36, ptr %1, align 4
  %.atomic.load13 = load atomic i32, ptr %0 monotonic, align 4
  br label %.atomic.cont15

.atomic.cont15:                                   ; preds = %.atomic.cont15, %.atomic.exit10
  %41 = phi i32 [ %.atomic.load13, %.atomic.exit10 ], [ %45, %.atomic.cont15 ]
  %42 = lshr i32 %41, %2
  store i32 %42, ptr %x.new.val16, align 4
  %43 = load i32, ptr %x.new.val16, align 4
  %44 = cmpxchg ptr %0, i32 %41, i32 %43 monotonic monotonic, align 4
  %45 = extractvalue { i32, i1 } %44, 0
  %46 = extractvalue { i32, i1 } %44, 1
  br i1 %46, label %.atomic.exit14, label %.atomic.cont15

.atomic.exit14:                                   ; preds = %.atomic.cont15
  store i32 %42, ptr %1, align 4
  %.atomic.load17 = load atomic i32, ptr %0 monotonic, align 4
  br label %.atomic.cont19

.atomic.cont19:                                   ; preds = %.atomic.cont19, %.atomic.exit14
  %47 = phi i32 [ %.atomic.load17, %.atomic.exit14 ], [ %51, %.atomic.cont19 ]
  %48 = ashr i32 %47, %2
  store i32 %48, ptr %x.new.val20, align 4
  %49 = load i32, ptr %x.new.val20, align 4
  %50 = cmpxchg ptr %0, i32 %47, i32 %49 monotonic monotonic, align 4
  %51 = extractvalue { i32, i1 } %50, 0
  %52 = extractvalue { i32, i1 } %50, 1
  br i1 %52, label %.atomic.exit18, label %.atomic.cont19

.atomic.exit18:                                   ; preds = %.atomic.cont19
  store i32 %48, ptr %1, align 4
  %.atomic.load21 = load atomic i32, ptr %0 monotonic, align 4
  br label %.atomic.cont23

.atomic.cont23:                                   ; preds = %.atomic.cont23, %.atomic.exit18
  %53 = phi i32 [ %.atomic.load21, %.atomic.exit18 ], [ %57, %.atomic.cont23 ]
  %54 = call i32 @llvm.smax.i32(i32 %53, i32 %2)
  store i32 %54, ptr %x.new.val24, align 4
  %55 = load i32, ptr %x.new.val24, align 4
  %56 = cmpxchg ptr %0, i32 %53, i32 %55 monotonic monotonic, align 4
  %57 = extractvalue { i32, i1 } %56, 0
  %58 = extractvalue { i32, i1 } %56, 1
  br i1 %58, label %.atomic.exit22, label %.atomic.cont23

.atomic.exit22:                                   ; preds = %.atomic.cont23
  store i32 %54, ptr %1, align 4
  %.atomic.load25 = load atomic i32, ptr %0 monotonic, align 4
  br label %.atomic.cont27

.atomic.cont27:                                   ; preds = %.atomic.cont27, %.atomic.exit22
  %59 = phi i32 [ %.atomic.load25, %.atomic.exit22 ], [ %63, %.atomic.cont27 ]
  %60 = call i32 @llvm.smin.i32(i32 %59, i32 %2)
  store i32 %60, ptr %x.new.val28, align 4
  %61 = load i32, ptr %x.new.val28, align 4
  %62 = cmpxchg ptr %0, i32 %59, i32 %61 monotonic monotonic, align 4
  %63 = extractvalue { i32, i1 } %62, 0
  %64 = extractvalue { i32, i1 } %62, 1
  br i1 %64, label %.atomic.exit26, label %.atomic.cont27

.atomic.exit26:                                   ; preds = %.atomic.cont27
  store i32 %60, ptr %1, align 4
  %.atomic.load29 = load atomic i32, ptr %0 monotonic, align 4
  br label %.atomic.cont31

.atomic.cont31:                                   ; preds = %.atomic.cont31, %.atomic.exit26
  %65 = phi i32 [ %.atomic.load29, %.atomic.exit26 ], [ %69, %.atomic.cont31 ]
  %66 = call i32 @llvm.umax.i32(i32 %65, i32 %2)
  store i32 %66, ptr %x.new.val32, align 4
  %67 = load i32, ptr %x.new.val32, align 4
  %68 = cmpxchg ptr %0, i32 %65, i32 %67 monotonic monotonic, align 4
  %69 = extractvalue { i32, i1 } %68, 0
  %70 = extractvalue { i32, i1 } %68, 1
  br i1 %70, label %.atomic.exit30, label %.atomic.cont31

.atomic.exit30:                                   ; preds = %.atomic.cont31
  store i32 %66, ptr %1, align 4
  %.atomic.load33 = load atomic i32, ptr %0 monotonic, align 4
  br label %.atomic.cont35

.atomic.cont35:                                   ; preds = %.atomic.cont35, %.atomic.exit30
  %71 = phi i32 [ %.atomic.load33, %.atomic.exit30 ], [ %75, %.atomic.cont35 ]
  %72 = call i32 @llvm.umin.i32(i32 %71, i32 %2)
  store i32 %72, ptr %x.new.val36, align 4
  %73 = load i32, ptr %x.new.val36, align 4
  %74 = cmpxchg ptr %0, i32 %71, i32 %73 monotonic monotonic, align 4
  %75 = extractvalue { i32, i1 } %74, 0
  %76 = extractvalue { i32, i1 } %74, 1
  br i1 %76, label %.atomic.exit34, label %.atomic.cont35

.atomic.exit34:                                   ; preds = %.atomic.cont35
  store i32 %72, ptr %1, align 4
  %.atomic.load37 = load atomic i32, ptr %3 monotonic, align 4
  br label %.atomic.cont39

.atomic.cont39:                                   ; preds = %.atomic.cont39, %.atomic.exit34
  %77 = phi i32 [ %.atomic.load37, %.atomic.exit34 ], [ %81, %.atomic.cont39 ]
  %.atomic.fltCast = bitcast i32 %77 to float
  %78 = fadd float %.atomic.fltCast, %5
  store float %78, ptr %x.new.val40, align 4
  %79 = load i32, ptr %x.new.val40, align 4
  %80 = cmpxchg ptr %3, i32 %77, i32 %79 monotonic monotonic, align 4
  %81 = extractvalue { i32, i1 } %80, 0
  %82 = extractvalue { i32, i1 } %80, 1
  br i1 %82, label %.atomic.exit38, label %.atomic.cont39

.atomic.exit38:                                   ; preds = %.atomic.cont39
  store float %78, ptr %4, align 4
  %.atomic.load41 = load atomic i32, ptr %3 monotonic, align 4
  br label %.atomic.cont43

.atomic.cont43:                                   ; preds = %.atomic.cont43, %.atomic.exit38
  %83 = phi i32 [ %.atomic.load41, %.atomic.exit38 ], [ %87, %.atomic.cont43 ]
  %.atomic.fltCast45 = bitcast i32 %83 to float
  %84 = fsub float %.atomic.fltCast45, %5
  store float %84, ptr %x.new.val44, align 4
  %85 = load i32, ptr %x.new.val44, align 4
  %86 = cmpxchg ptr %3, i32 %83, i32 %85 monotonic monotonic, align 4
  %87 = extractvalue { i32, i1 } %86, 0
  %88 = extractvalue { i32, i1 } %86, 1
  br i1 %88, label %.atomic.exit42, label %.atomic.cont43

.atomic.exit42:                                   ; preds = %.atomic.cont43
  store float %84, ptr %4, align 4
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umax.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

