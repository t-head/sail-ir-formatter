; RUN: sail-irformatter -S < %s | FileCheck %s


source_filename = "kernel"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%0 = type { [9 x %S92_ch], [9 x %S92_ch], [9 x %S92_ch], [9 x %S92_ch], [9 x %S92_ch], [9 x %S102_ch], [9 x %S102_ch], [9 x %S110_ch], [9 x %S113_ch], [9 x %S92_ch], [9 x %S92_ch], [9 x %S110_ch], [9 x %S92_ch], [9 x %S92_ch], [9 x %S92_ch], [9 x %S92_ch], [9 x %S92_ch], [9 x %S92_ch], [9 x %S92_ch], [9 x %S92_ch], [9 x %S92_ch], [9 x %S92_ch], [9 x %S92_ch], [9 x %S92_ch], [9 x %S92_ch], [9 x %S102_ch], [9 x %S102_ch], [9 x %S102_ch], [9 x %S102_ch], [9 x %S102_ch], [9 x %S102_ch], [9 x %S102_ch], [9 x %S102_ch], [9 x %S92_ch], [9 x %S92_ch], [9 x %S92_ch], [9 x %S113_ch], [9 x %S113_ch], [12 x %S113_ch], [12 x %S113_ch], [12 x %S113_ch], [12 x %S113_ch], [12 x %S113_ch], [12 x %S113_ch], [12 x %S113_ch], [12 x %S113_ch], [12 x %S113_ch], [12 x %S102_ch], [12 x %S212_ch], [12 x %S110_ch], [12 x %S113_ch], [12 x %S102_ch], [12 x %S212_ch], [12 x %S231_ch], [12 x %S92_ch], [12 x %S113_ch], [12 x %S231_ch], [12 x %S102_ch], [12 x %S212_ch], [12 x %S92_ch], [12 x %S231_ch], [12 x %S102_ch], [12 x %S212_ch], [12 x %S92_ch], [12 x %S102_ch], [12 x %S102_ch], [12 x %S102_ch], [12 x %S212_ch], [12 x %S102_ch], [12 x %S212_ch], [12 x %S102_ch], [12 x %S212_ch], [12 x %S102_ch], [12 x %S102_ch], [12 x %S102_ch], [12 x %S102_ch], [12 x %S92_ch], [12 x %S102_ch], [12 x %S92_ch], [12 x %S102_ch], [12 x %S102_ch], [12 x %S102_ch], [12 x %S102_ch], [12 x %S102_ch], [12 x %S102_ch], [12 x %S102_ch], [12 x %S102_ch], [12 x %S113_ch], [10 x %S113_ch], [10 x %S382_ch], [10 x %S113_ch], [10 x %S113_ch], [10 x %S113_ch], [10 x %S113_ch], [10 x %S113_ch], [10 x %S102_ch], [10 x %S102_ch], [10 x %S102_ch], [24 x %S102_ch], [24 x %S102_ch], [24 x %S212_ch], [24 x %S382_ch], [24 x %S113_ch], [24 x %S113_ch], [24 x %S92_ch], [24 x %S382_ch], [24 x %S113_ch], [24 x %S113_ch], [24 x %S113_ch], [24 x %S113_ch], [24 x %S113_ch], [24 x %S113_ch], [24 x %S113_ch], [24 x %S113_ch], [24 x %S113_ch], [24 x %S113_ch], [24 x %S113_ch], [24 x %S113_ch], [24 x %S113_ch], [24 x %S113_ch], [24 x %S113_ch], [24 x %S113_ch], [24 x %S113_ch], [24 x %S92_ch], [24 x %S92_ch], [24 x %S92_ch], [24 x %S102_ch], [24 x %S212_ch], [24 x %S102_ch], [24 x %S102_ch], [24 x %S113_ch], [24 x %S113_ch], [24 x %S113_ch], [24 x %S113_ch], [24 x %S92_ch], [1371 x %S102_ch], [1371 x %S102_ch], [1371 x %S113_ch], [1371 x %S102_ch], [1371 x %S113_ch], [1371 x %S113_ch], [2646 x %S532_ch], [2646 x %S113_ch], [3969 x %S113_ch], [3969 x %S113_ch], [3969 x %S92_ch], [1371 x %S102_ch], [1 x %S102_ch], [397460 x %S102_ch], [397460 x %S102_ch], [397460 x %S113_ch], [134890 x %S532_ch], [134890 x %S113_ch], [59 x %S102_ch], [59 x %S212_ch], [59 x %S113_ch], [59 x %S113_ch], [59 x %S113_ch], [59 x %S113_ch], [59 x %S113_ch], [59 x %S113_ch], [59 x %S113_ch], [59 x %S212_ch], [59 x %S102_ch], [59 x %S212_ch], [9 x %S113_ch], [9 x %S113_ch], [9 x %S609_ch], [9 x %S113_ch], [9 x %S382_ch], [2 x %S113_ch], [2 x %S113_ch], [2 x %S113_ch], [2 x %S113_ch], [2 x %S113_ch], [2 x %S113_ch], [2 x %S113_ch], [2 x %S113_ch], [2 x %S113_ch], [2 x %S92_ch], [2 x %S651_ch], [2 x %S113_ch] }
%struct.RuntimeContext = type { ptr, ptr, i32, ptr }
%struct.LLVMRuntime = type { %struct.PreallocatedMemoryChunk, %struct.PreallocatedMemoryChunk, ptr, ptr, ptr, ptr, ptr, [512 x ptr], [512 x i64], ptr, ptr, [2048 x ptr], [2048 x ptr], [2048 x ptr], ptr, ptr, ptr, ptr, ptr, [2048 x i8], [32 x i64], i32, i64, ptr, i32, i32, i64 }
%struct.PreallocatedMemoryChunk = type { ptr, ptr, i64 }
%S110_ch = type { float, float }
%S102_ch = type { float, float, float }
%S92_ch = type { float }
%S231_ch = type { float, float, float, float, float, float, float, float, float }
%S212_ch = type { float, float, float, float }
%S113_ch = type { i32 }
%S382_ch = type { float, float, float, float, float, float, float }
%S532_ch = type { i32, i32, i32 }
%S609_ch = type { float, float, float, float, float, float, float, float, float, float, float }
%S651_ch = type { i1 }
%S5_ch = type { [54 x %S92_ch], [1296 x %S92_ch], [1296 x %S92_ch], [1296 x %S92_ch], [1296 x %S92_ch], [1296 x %S92_ch], [9 x %S92_ch], [9 x %S92_ch], [9 x %S92_ch], [36 x %S92_ch], [36 x %S92_ch], [36 x %S92_ch], [324 x %S92_ch], [324 x %S92_ch], [1 x %S113_ch], [9 x %S113_ch], [1 x %S113_ch], [2 x %S113_ch], [1 x %S113_ch], [12 x %S113_ch], [9 x %S92_ch], [9 x %S92_ch], [12 x %S50_ch], [1 x %S102_ch], [192 x %S102_ch], [81 x %S92_ch], [81 x %S92_ch], [9 x %S92_ch], [2 x %S113_ch], [1 x %S92_ch], [81 x %S92_ch], [1 x %S102_ch] }
%S50_ch = type { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn
define void @kernel_init_geom_fields_c262_0_kernel_0_serial(ptr nocapture readonly byval(%struct.RuntimeContext) align 8 %context) local_unnamed_addr #0 {
entry:
  %context1 = addrspacecast ptr %context to ptr addrspace(1)
  %0 = load ptr, ptr addrspace(1) %context1, align 8
  %1 = addrspacecast ptr %0 to ptr addrspace(1)
  %2 = load i32, ptr addrspace(1) %1, align 4
  %3 = getelementptr inbounds %struct.RuntimeContext, ptr addrspace(1) %context1, i64 0, i32 1
  %4 = load ptr, ptr addrspace(1) %3, align 8
  %5 = addrspacecast ptr %4 to ptr addrspace(1)
  %6 = getelementptr inbounds %struct.LLVMRuntime, ptr addrspace(1) %5, i64 0, i32 14
  %7 = load ptr, ptr addrspace(1) %6, align 8
  store i32 %2, ptr %7, align 4
  ret void
}

; Function Attrs: nounwind
define void @kernel_init_geom_fields_c262_0_kernel_1_range_for(ptr byval(%struct.RuntimeContext) %context) local_unnamed_addr #1 {
entry:
  %context1 = alloca %struct.RuntimeContext, align 8
  %0 = addrspacecast ptr %context1 to ptr addrspace(5)
  %context2 = addrspacecast ptr %context to ptr addrspace(1)
  %context3 = load %struct.RuntimeContext, ptr addrspace(1) %context2, align 8
  %context3.fca.0.extract = extractvalue %struct.RuntimeContext %context3, 0
  store ptr %context3.fca.0.extract, ptr addrspace(5) %0, align 8
  %context3.fca.1.extract = extractvalue %struct.RuntimeContext %context3, 1
  %context3.fca.1.gep = getelementptr inbounds %struct.RuntimeContext, ptr addrspace(5) %0, i32 0, i32 1
  store ptr %context3.fca.1.extract, ptr addrspace(5) %context3.fca.1.gep, align 8
  %context3.fca.2.extract = extractvalue %struct.RuntimeContext %context3, 2
  %context3.fca.2.gep = getelementptr inbounds %struct.RuntimeContext, ptr addrspace(5) %0, i32 0, i32 2
  store i32 %context3.fca.2.extract, ptr addrspace(5) %context3.fca.2.gep, align 8
  %context3.fca.3.extract = extractvalue %struct.RuntimeContext %context3, 3
  %context3.fca.3.gep = getelementptr inbounds %struct.RuntimeContext, ptr addrspace(5) %0, i32 0, i32 3
  store ptr %context3.fca.3.extract, ptr addrspace(5) %context3.fca.3.gep, align 8
  %1 = alloca i8, align 8
  %2 = addrspacecast ptr %context3.fca.1.extract to ptr addrspace(1)
  %3 = getelementptr inbounds %struct.LLVMRuntime, ptr addrspace(1) %2, i64 0, i32 14
  %4 = load ptr, ptr addrspace(1) %3, align 8
  %5 = load i32, ptr %4, align 4
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %1)
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !24
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x(), !range !25
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !26
  %9 = mul nsw i32 %7, %8
  %10 = add nuw nsw i32 %9, %6
  %11 = icmp slt i32 %10, %5
  br i1 %11, label %.lr.ph.i, label %gpu_parallel_range_for.exit

.lr.ph.i:                                         ; preds = %entry
  %12 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x()
  %13 = mul nsw i32 %7, %12
  br label %14

14:                                               ; preds = %14, %.lr.ph.i
  %.01.i = phi i32 [ %10, %.lr.ph.i ], [ %15, %14 ]
  call fastcc void @function_body(ptr noundef nonnull %context1, ptr noundef nonnull %1, i32 noundef %.01.i) #9, !callees !27
  %15 = add i32 %.01.i, %13
  %16 = icmp slt i32 %15, %5
  br i1 %16, label %14, label %gpu_parallel_range_for.exit, !llvm.loop !28

gpu_parallel_range_for.exit:                      ; preds = %14, %entry
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %1)
  ret void
}

; Function Attrs: nofree nounwind
define internal fastcc void @function_body(ptr %0, ptr nocapture readnone %1, i32 %2) unnamed_addr #2 {
allocs:
  %3 = load ptr, ptr %0, align 8
  %4 = getelementptr { { i32, i32 }, ptr }, ptr %3, i64 0, i32 1
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr { { i32, i32 }, ptr }, ptr %3, i64 0, i32 0, i32 1
  %7 = load i32, ptr %6, align 4
  %8 = mul i32 %7, %2
  %9 = sext i32 %8 to i64
  %10 = getelementptr float, ptr %5, i64 %9
  %11 = load float, ptr %10, align 4
  %12 = getelementptr inbounds %struct.RuntimeContext, ptr %0, i64 0, i32 1
  %13 = load ptr, ptr %12, align 8
  %14 = getelementptr inbounds %struct.LLVMRuntime, ptr %13, i64 0, i32 7, i64 2
  %15 = load ptr, ptr %14, align 8
  %getch.i128 = getelementptr %0, ptr %15, i64 0, i32 98
  %16 = sext i32 %2 to i64
  %17 = mul nsw i64 %16, 12
  %18 = getelementptr inbounds i8, ptr %getch.i128, i64 %17
  store float %11, ptr %18, align 4
  %19 = load ptr, ptr %0, align 8
  %20 = getelementptr { { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, i32, i1, i1, i1, i1, i1, i1, i1, i1, i1, i32, i1, i32 }, ptr %19, i64 0, i32 1, i32 1
  %21 = load ptr, ptr %20, align 8
  %22 = getelementptr { { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, i32, i1, i1, i1, i1, i1, i1, i1, i1, i1, i32, i1, i32 }, ptr %19, i64 0, i32 1, i32 0, i32 1
  %23 = load i32, ptr %22, align 4
  %24 = mul i32 %23, %2
  %25 = sext i32 %24 to i64
  %26 = getelementptr float, ptr %21, i64 %25
  %27 = load float, ptr %26, align 4
  %getch.i127 = getelementptr %0, ptr %15, i64 0, i32 99
  %28 = getelementptr inbounds i8, ptr %getch.i127, i64 %17
  store float %27, ptr %28, align 4
  %29 = load ptr, ptr %4, align 8
  %30 = load i32, ptr %6, align 4
  %31 = mul i32 %30, %2
  %32 = add i32 %31, 1
  %33 = sext i32 %32 to i64
  %34 = getelementptr float, ptr %29, i64 %33
  %35 = load float, ptr %34, align 4
  %getch.i126 = getelementptr %S102_ch, ptr %18, i64 0, i32 1
  store float %35, ptr %getch.i126, align 4
  %36 = load ptr, ptr %20, align 8
  %37 = load i32, ptr %22, align 4
  %38 = mul i32 %37, %2
  %39 = add i32 %38, 1
  %40 = sext i32 %39 to i64
  %41 = getelementptr float, ptr %36, i64 %40
  %42 = load float, ptr %41, align 4
  %getch.i125 = getelementptr %S102_ch, ptr %28, i64 0, i32 1
  store float %42, ptr %getch.i125, align 4
  %43 = load ptr, ptr %4, align 8
  %44 = load i32, ptr %6, align 4
  %45 = mul i32 %44, %2
  %46 = add i32 %45, 2
  %47 = sext i32 %46 to i64
  %48 = getelementptr float, ptr %43, i64 %47
  %49 = load float, ptr %48, align 4
  %getch.i124 = getelementptr %S102_ch, ptr %18, i64 0, i32 2
  store float %49, ptr %getch.i124, align 4
  %50 = load ptr, ptr %20, align 8
  %51 = load i32, ptr %22, align 4
  %52 = mul i32 %51, %2
  %53 = add i32 %52, 2
  %54 = sext i32 %53 to i64
  %55 = getelementptr float, ptr %50, i64 %54
  %56 = load float, ptr %55, align 4
  %getch.i123 = getelementptr %S102_ch, ptr %28, i64 0, i32 2
  store float %56, ptr %getch.i123, align 4
  %57 = load ptr, ptr %0, align 8
  %58 = getelementptr { { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, i32, i1, i1, i1, i1, i1, i1, i1, i1, i1, i32, i1, i32 }, ptr %57, i64 0, i32 2, i32 1
  %59 = load ptr, ptr %58, align 8
  %60 = getelementptr { { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, i32, i1, i1, i1, i1, i1, i1, i1, i1, i1, i32, i1, i32 }, ptr %57, i64 0, i32 2, i32 0, i32 1
  %61 = load i32, ptr %60, align 4
  %62 = mul i32 %61, %2
  %63 = sext i32 %62 to i64
  %64 = getelementptr float, ptr %59, i64 %63
  %65 = load float, ptr %64, align 4
  %getch.i122 = getelementptr %0, ptr %15, i64 0, i32 100
  %66 = shl nsw i64 %16, 4
  %67 = getelementptr inbounds i8, ptr %getch.i122, i64 %66
  store float %65, ptr %67, align 4
  %68 = load ptr, ptr %58, align 8
  %69 = load i32, ptr %60, align 4
  %70 = mul i32 %69, %2
  %71 = add i32 %70, 1
  %72 = sext i32 %71 to i64
  %73 = getelementptr float, ptr %68, i64 %72
  %74 = load float, ptr %73, align 4
  %getch.i121 = getelementptr %S212_ch, ptr %67, i64 0, i32 1
  store float %74, ptr %getch.i121, align 4
  %75 = load ptr, ptr %58, align 8
  %76 = load i32, ptr %60, align 4
  %77 = mul i32 %76, %2
  %78 = add i32 %77, 2
  %79 = sext i32 %78 to i64
  %80 = getelementptr float, ptr %75, i64 %79
  %81 = load float, ptr %80, align 4
  %getch.i120 = getelementptr %S212_ch, ptr %67, i64 0, i32 2
  store float %81, ptr %getch.i120, align 4
  %82 = load ptr, ptr %58, align 8
  %83 = load i32, ptr %60, align 4
  %84 = mul i32 %83, %2
  %85 = add i32 %84, 3
  %86 = sext i32 %85 to i64
  %87 = getelementptr float, ptr %82, i64 %86
  %88 = load float, ptr %87, align 4
  %getch.i119 = getelementptr %S212_ch, ptr %67, i64 0, i32 3
  store float %88, ptr %getch.i119, align 4
  %89 = load ptr, ptr %0, align 8
  %90 = getelementptr { { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, i32, i1, i1, i1, i1, i1, i1, i1, i1, i1, i32, i1, i32 }, ptr %89, i64 0, i32 15, i32 1
  %91 = load ptr, ptr %90, align 8
  %92 = getelementptr { { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, i32, i1, i1, i1, i1, i1, i1, i1, i1, i1, i32, i1, i32 }, ptr %89, i64 0, i32 15, i32 0, i32 1
  %93 = load i32, ptr %92, align 4
  %94 = mul i32 %93, %2
  %95 = sext i32 %94 to i64
  %96 = getelementptr float, ptr %91, i64 %95
  %97 = load float, ptr %96, align 4
  %getch.i118 = getelementptr %0, ptr %15, i64 0, i32 101
  %98 = mul nsw i64 %16, 28
  %99 = getelementptr inbounds i8, ptr %getch.i118, i64 %98
  store float %97, ptr %99, align 4
  %100 = load ptr, ptr %0, align 8
  %101 = getelementptr { { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, i32, i1, i1, i1, i1, i1, i1, i1, i1, i1, i32, i1, i32 }, ptr %100, i64 0, i32 6, i32 1
  %102 = load ptr, ptr %101, align 8
  %103 = getelementptr { { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, i32, i1, i1, i1, i1, i1, i1, i1, i1, i1, i32, i1, i32 }, ptr %100, i64 0, i32 6, i32 0, i32 1
  %104 = load i32, ptr %103, align 4
  %105 = mul i32 %104, %2
  %106 = sext i32 %105 to i64
  %107 = getelementptr float, ptr %102, i64 %106
  %108 = load float, ptr %107, align 4
  %getch.i117 = getelementptr %0, ptr %15, i64 0, i32 105
  %109 = getelementptr inbounds i8, ptr %getch.i117, i64 %98
  store float %108, ptr %109, align 4
  %110 = load ptr, ptr %90, align 8
  %111 = load i32, ptr %92, align 4
  %112 = mul i32 %111, %2
  %113 = add i32 %112, 1
  %114 = sext i32 %113 to i64
  %115 = getelementptr float, ptr %110, i64 %114
  %116 = load float, ptr %115, align 4
  %getch.i116 = getelementptr %S382_ch, ptr %99, i64 0, i32 1
  store float %116, ptr %getch.i116, align 4
  %117 = load ptr, ptr %101, align 8
  %118 = load i32, ptr %103, align 4
  %119 = mul i32 %118, %2
  %120 = add i32 %119, 1
  %121 = sext i32 %120 to i64
  %122 = getelementptr float, ptr %117, i64 %121
  %123 = load float, ptr %122, align 4
  %getch.i115 = getelementptr %S382_ch, ptr %109, i64 0, i32 1
  store float %123, ptr %getch.i115, align 4
  %124 = load ptr, ptr %90, align 8
  %125 = load i32, ptr %92, align 4
  %126 = mul i32 %125, %2
  %127 = add i32 %126, 2
  %128 = sext i32 %127 to i64
  %129 = getelementptr float, ptr %124, i64 %128
  %130 = load float, ptr %129, align 4
  %getch.i114 = getelementptr %S382_ch, ptr %99, i64 0, i32 2
  store float %130, ptr %getch.i114, align 4
  %131 = load ptr, ptr %101, align 8
  %132 = load i32, ptr %103, align 4
  %133 = mul i32 %132, %2
  %134 = add i32 %133, 2
  %135 = sext i32 %134 to i64
  %136 = getelementptr float, ptr %131, i64 %135
  %137 = load float, ptr %136, align 4
  %getch.i113 = getelementptr %S382_ch, ptr %109, i64 0, i32 2
  store float %137, ptr %getch.i113, align 4
  %138 = load ptr, ptr %90, align 8
  %139 = load i32, ptr %92, align 4
  %140 = mul i32 %139, %2
  %141 = add i32 %140, 3
  %142 = sext i32 %141 to i64
  %143 = getelementptr float, ptr %138, i64 %142
  %144 = load float, ptr %143, align 4
  %getch.i112 = getelementptr %S382_ch, ptr %99, i64 0, i32 3
  store float %144, ptr %getch.i112, align 4
  %145 = load ptr, ptr %101, align 8
  %146 = load i32, ptr %103, align 4
  %147 = mul i32 %146, %2
  %148 = add i32 %147, 3
  %149 = sext i32 %148 to i64
  %150 = getelementptr float, ptr %145, i64 %149
  %151 = load float, ptr %150, align 4
  %getch.i111 = getelementptr %S382_ch, ptr %109, i64 0, i32 3
  store float %151, ptr %getch.i111, align 4
  %152 = load ptr, ptr %90, align 8
  %153 = load i32, ptr %92, align 4
  %154 = mul i32 %153, %2
  %155 = add i32 %154, 4
  %156 = sext i32 %155 to i64
  %157 = getelementptr float, ptr %152, i64 %156
  %158 = load float, ptr %157, align 4
  %getch.i110 = getelementptr %S382_ch, ptr %99, i64 0, i32 4
  store float %158, ptr %getch.i110, align 4
  %159 = load ptr, ptr %101, align 8
  %160 = load i32, ptr %103, align 4
  %161 = mul i32 %160, %2
  %162 = add i32 %161, 4
  %163 = sext i32 %162 to i64
  %164 = getelementptr float, ptr %159, i64 %163
  %165 = load float, ptr %164, align 4
  %getch.i109 = getelementptr %S382_ch, ptr %109, i64 0, i32 4
  store float %165, ptr %getch.i109, align 4
  %166 = load ptr, ptr %90, align 8
  %167 = load i32, ptr %92, align 4
  %168 = mul i32 %167, %2
  %169 = add i32 %168, 5
  %170 = sext i32 %169 to i64
  %171 = getelementptr float, ptr %166, i64 %170
  %172 = load float, ptr %171, align 4
  %getch.i108 = getelementptr %S382_ch, ptr %99, i64 0, i32 5
  store float %172, ptr %getch.i108, align 4
  %173 = load ptr, ptr %101, align 8
  %174 = load i32, ptr %103, align 4
  %175 = mul i32 %174, %2
  %176 = add i32 %175, 5
  %177 = sext i32 %176 to i64
  %178 = getelementptr float, ptr %173, i64 %177
  %179 = load float, ptr %178, align 4
  %getch.i107 = getelementptr %S382_ch, ptr %109, i64 0, i32 5
  store float %179, ptr %getch.i107, align 4
  %180 = load ptr, ptr %90, align 8
  %181 = load i32, ptr %92, align 4
  %182 = mul i32 %181, %2
  %183 = add i32 %182, 6
  %184 = sext i32 %183 to i64
  %185 = getelementptr float, ptr %180, i64 %184
  %186 = load float, ptr %185, align 4
  %getch.i106 = getelementptr %S382_ch, ptr %99, i64 0, i32 6
  store float %186, ptr %getch.i106, align 4
  %187 = load ptr, ptr %101, align 8
  %188 = load i32, ptr %103, align 4
  %189 = mul i32 %188, %2
  %190 = add i32 %189, 6
  %191 = sext i32 %190 to i64
  %192 = getelementptr float, ptr %187, i64 %191
  %193 = load float, ptr %192, align 4
  %getch.i105 = getelementptr %S382_ch, ptr %109, i64 0, i32 6
  store float %193, ptr %getch.i105, align 4
  %194 = load ptr, ptr %0, align 8
  %195 = getelementptr { { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, i32, i1, i1, i1, i1, i1, i1, i1, i1, i1, i32, i1, i32 }, ptr %194, i64 0, i32 7, i32 1
  %196 = load ptr, ptr %195, align 8
  %197 = getelementptr i32, ptr %196, i64 %16
  %198 = load i32, ptr %197, align 4
  %199 = sext i32 %198 to i64
  %getch.i104 = getelementptr %0, ptr %15, i64 0, i32 107
  %200 = shl nsw i64 %16, 2
  %201 = getelementptr inbounds i8, ptr %getch.i104, i64 %200
  store i32 %198, ptr %201, align 4
  %202 = load ptr, ptr %0, align 8
  %203 = getelementptr { { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, i32, i1, i1, i1, i1, i1, i1, i1, i1, i1, i32, i1, i32 }, ptr %202, i64 0, i32 11, i32 1
  %204 = load ptr, ptr %203, align 8
  %205 = getelementptr i32, ptr %204, i64 %16
  %206 = load i32, ptr %205, align 4
  %getch.i103 = getelementptr %0, ptr %15, i64 0, i32 108
  %207 = getelementptr inbounds i8, ptr %getch.i103, i64 %200
  store i32 %206, ptr %207, align 4
  %208 = sub i32 %206, %198
  %getch.i102 = getelementptr %0, ptr %15, i64 0, i32 106
  %209 = getelementptr inbounds i8, ptr %getch.i102, i64 %200
  store i32 %208, ptr %209, align 4
  %210 = load ptr, ptr %0, align 8
  %211 = getelementptr { { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, i32, i1, i1, i1, i1, i1, i1, i1, i1, i1, i32, i1, i32 }, ptr %210, i64 0, i32 8, i32 1
  %212 = load ptr, ptr %211, align 8
  %213 = getelementptr i32, ptr %212, i64 %16
  %214 = load i32, ptr %213, align 4
  %getch.i101 = getelementptr %0, ptr %15, i64 0, i32 112
  %215 = getelementptr inbounds i8, ptr %getch.i101, i64 %200
  store i32 %214, ptr %215, align 4
  %216 = load ptr, ptr %0, align 8
  %217 = getelementptr { { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, i32, i1, i1, i1, i1, i1, i1, i1, i1, i1, i32, i1, i32 }, ptr %216, i64 0, i32 12, i32 1
  %218 = load ptr, ptr %217, align 8
  %219 = getelementptr i32, ptr %218, i64 %16
  %220 = load i32, ptr %219, align 4
  %getch.i100 = getelementptr %0, ptr %15, i64 0, i32 113
  %221 = getelementptr inbounds i8, ptr %getch.i100, i64 %200
  store i32 %220, ptr %221, align 4
  %222 = sub i32 %220, %214
  %getch.i99 = getelementptr %0, ptr %15, i64 0, i32 111
  %223 = getelementptr inbounds i8, ptr %getch.i99, i64 %200
  store i32 %222, ptr %223, align 4
  %224 = load ptr, ptr %0, align 8
  %225 = getelementptr { { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, i32, i1, i1, i1, i1, i1, i1, i1, i1, i1, i32, i1, i32 }, ptr %224, i64 0, i32 9, i32 1
  %226 = load ptr, ptr %225, align 8
  %227 = getelementptr i32, ptr %226, i64 %16
  %228 = load i32, ptr %227, align 4
  %getch.i98 = getelementptr %0, ptr %15, i64 0, i32 115
  %229 = getelementptr inbounds i8, ptr %getch.i98, i64 %200
  store i32 %228, ptr %229, align 4
  %230 = load ptr, ptr %0, align 8
  %231 = getelementptr { { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, i32, i1, i1, i1, i1, i1, i1, i1, i1, i1, i32, i1, i32 }, ptr %230, i64 0, i32 13, i32 1
  %232 = load ptr, ptr %231, align 8
  %233 = getelementptr i32, ptr %232, i64 %16
  %234 = load i32, ptr %233, align 4
  %getch.i97 = getelementptr %0, ptr %15, i64 0, i32 116
  %235 = getelementptr inbounds i8, ptr %getch.i97, i64 %200
  store i32 %234, ptr %235, align 4
  %236 = sub i32 %234, %228
  %getch.i96 = getelementptr %0, ptr %15, i64 0, i32 114
  %237 = getelementptr inbounds i8, ptr %getch.i96, i64 %200
  store i32 %236, ptr %237, align 4
  %238 = load ptr, ptr %0, align 8
  %239 = getelementptr { { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, i32, i1, i1, i1, i1, i1, i1, i1, i1, i1, i32, i1, i32 }, ptr %238, i64 0, i32 10, i32 1
  %240 = load ptr, ptr %239, align 8
  %241 = getelementptr i32, ptr %240, i64 %16
  %242 = load i32, ptr %241, align 4
  %getch.i95 = getelementptr %0, ptr %15, i64 0, i32 109
  %243 = getelementptr inbounds i8, ptr %getch.i95, i64 %200
  store i32 %242, ptr %243, align 4
  %244 = load ptr, ptr %0, align 8
  %245 = getelementptr { { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, i32, i1, i1, i1, i1, i1, i1, i1, i1, i1, i32, i1, i32 }, ptr %244, i64 0, i32 14, i32 1
  %246 = load ptr, ptr %245, align 8
  %247 = getelementptr i32, ptr %246, i64 %16
  %248 = load i32, ptr %247, align 4
  %getch.i94 = getelementptr %0, ptr %15, i64 0, i32 110
  %249 = getelementptr inbounds i8, ptr %getch.i94, i64 %200
  store i32 %248, ptr %249, align 4
  %250 = load ptr, ptr %0, align 8
  %251 = getelementptr { { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, i32, i1, i1, i1, i1, i1, i1, i1, i1, i1, i32, i1, i32 }, ptr %250, i64 0, i32 3, i32 1
  %252 = load ptr, ptr %251, align 8
  %253 = getelementptr i32, ptr %252, i64 %16
  %254 = load i32, ptr %253, align 4
  %getch.i93 = getelementptr %0, ptr %15, i64 0, i32 102
  %255 = getelementptr inbounds i8, ptr %getch.i93, i64 %200
  store i32 %254, ptr %255, align 4
  %256 = load ptr, ptr %0, align 8
  %257 = getelementptr { { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, i32, i1, i1, i1, i1, i1, i1, i1, i1, i1, i32, i1, i32 }, ptr %256, i64 0, i32 4, i32 1
  %258 = load ptr, ptr %257, align 8
  %259 = getelementptr i32, ptr %258, i64 %16
  %260 = load i32, ptr %259, align 4
  %getch.i92 = getelementptr %0, ptr %15, i64 0, i32 103
  %261 = getelementptr inbounds i8, ptr %getch.i92, i64 %200
  store i32 %260, ptr %261, align 4
  %262 = load ptr, ptr %0, align 8
  %263 = getelementptr { { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, i32, i1, i1, i1, i1, i1, i1, i1, i1, i1, i32, i1, i32 }, ptr %262, i64 0, i32 5, i32 1
  %264 = load ptr, ptr %263, align 8
  %265 = getelementptr float, ptr %264, i64 %16
  %266 = load float, ptr %265, align 4
  %getch.i91 = getelementptr %0, ptr %15, i64 0, i32 104
  %267 = getelementptr inbounds i8, ptr %getch.i91, i64 %200
  store float %266, ptr %267, align 4
  %268 = load ptr, ptr %0, align 8
  %269 = getelementptr { { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, i32, i1, i1, i1, i1, i1, i1, i1, i1, i1, i32, i1, i32 }, ptr %268, i64 0, i32 16, i32 1
  %270 = load ptr, ptr %269, align 8
  %271 = getelementptr i32, ptr %270, i64 %16
  %272 = load i32, ptr %271, align 4
  %getch.i90 = getelementptr %0, ptr %15, i64 0, i32 117
  %273 = getelementptr inbounds i8, ptr %getch.i90, i64 %200
  store i32 %272, ptr %273, align 4
  %274 = load ptr, ptr %0, align 8
  %275 = getelementptr { { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, i32, i1, i1, i1, i1, i1, i1, i1, i1, i1, i32, i1, i32 }, ptr %274, i64 0, i32 17, i32 1
  %276 = load ptr, ptr %275, align 8
  %277 = getelementptr i32, ptr %276, i64 %16
  %278 = load i32, ptr %277, align 4
  %getch.i89 = getelementptr %0, ptr %15, i64 0, i32 122
  %279 = getelementptr inbounds i8, ptr %getch.i89, i64 %200
  store i32 %278, ptr %279, align 4
  %280 = load ptr, ptr %0, align 8
  %281 = getelementptr { { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, i32, i1, i1, i1, i1, i1, i1, i1, i1, i1, i32, i1, i32 }, ptr %280, i64 0, i32 18, i32 1
  %282 = load ptr, ptr %281, align 8
  %283 = getelementptr i32, ptr %282, i64 %16
  %284 = load i32, ptr %283, align 4
  %getch.i88 = getelementptr %0, ptr %15, i64 0, i32 118
  %285 = getelementptr inbounds i8, ptr %getch.i88, i64 %200
  store i32 %284, ptr %285, align 4
  %286 = load ptr, ptr %0, align 8
  %287 = getelementptr { { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, i32, i1, i1, i1, i1, i1, i1, i1, i1, i1, i32, i1, i32 }, ptr %286, i64 0, i32 19, i32 1
  %288 = load ptr, ptr %287, align 8
  %289 = getelementptr i32, ptr %288, i64 %16
  %290 = load i32, ptr %289, align 4
  %getch.i87 = getelementptr %0, ptr %15, i64 0, i32 119
  %291 = getelementptr inbounds i8, ptr %getch.i87, i64 %200
  store i32 %290, ptr %291, align 4
  %292 = load ptr, ptr %0, align 8
  %293 = getelementptr { { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, i32, i1, i1, i1, i1, i1, i1, i1, i1, i1, i32, i1, i32 }, ptr %292, i64 0, i32 20, i32 1
  %294 = load ptr, ptr %293, align 8
  %295 = getelementptr float, ptr %294, i64 %16
  %296 = load float, ptr %295, align 4
  %getch.i86 = getelementptr %0, ptr %15, i64 0, i32 124
  %297 = getelementptr inbounds i8, ptr %getch.i86, i64 %200
  store float %296, ptr %297, align 4
  %298 = load ptr, ptr %0, align 8
  %299 = getelementptr { { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, i32, i1, i1, i1, i1, i1, i1, i1, i1, i1, i32, i1, i32 }, ptr %298, i64 0, i32 21, i32 1
  %300 = load ptr, ptr %299, align 8
  %301 = getelementptr float, ptr %300, i64 %16
  %302 = load float, ptr %301, align 4
  %getch.i85 = getelementptr %0, ptr %15, i64 0, i32 123
  %303 = getelementptr inbounds i8, ptr %getch.i85, i64 %200
  store float %302, ptr %303, align 4
  %304 = load ptr, ptr %0, align 8
  %305 = getelementptr { { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, i32, i1, i1, i1, i1, i1, i1, i1, i1, i1, i32, i1, i32 }, ptr %304, i64 0, i32 22, i32 1
  %306 = load ptr, ptr %305, align 8
  %307 = getelementptr float, ptr %306, i64 %16
  %308 = load float, ptr %307, align 4
  %getch.i84 = getelementptr %0, ptr %15, i64 0, i32 125
  %309 = getelementptr inbounds i8, ptr %getch.i84, i64 %200
  store float %308, ptr %309, align 4
  %310 = load ptr, ptr %0, align 8
  %311 = getelementptr { { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, i32, i1, i1, i1, i1, i1, i1, i1, i1, i1, i32, i1, i32 }, ptr %310, i64 0, i32 23, i32 1
  %312 = load ptr, ptr %311, align 8
  %313 = getelementptr i32, ptr %312, i64 %16
  %314 = load i32, ptr %313, align 4
  %getch.i83 = getelementptr %0, ptr %15, i64 0, i32 120
  %315 = getelementptr inbounds i8, ptr %getch.i83, i64 %200
  store i32 %314, ptr %315, align 4
  %316 = load ptr, ptr %0, align 8
  %317 = getelementptr { { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32, i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, { { i32 }, ptr }, i32, i1, i1, i1, i1, i1, i1, i1, i1, i1, i32, i1, i32 }, ptr %316, i64 0, i32 24, i32 1
  %318 = load ptr, ptr %317, align 8
  %319 = getelementptr i32, ptr %318, i64 %16
  %320 = load i32, ptr %319, align 4
  %getch.i82 = getelementptr %0, ptr %15, i64 0, i32 121
  %321 = getelementptr inbounds i8, ptr %getch.i82, i64 %200
  store i32 %320, ptr %321, align 4
  %322 = icmp sgt i32 %206, %198
  br i1 %322, label %for_loop_body.lr.ph, label %after_for

for_loop_body.lr.ph:                              ; preds = %allocs
  %getch.i81 = getelementptr %0, ptr %15, i64 0, i32 135
  %323 = xor i32 %198, -1
  %324 = add i32 %206, %323
  %xtraiter = and i32 %208, 3
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for_loop_body.prol.loopexit, label %for_loop_body.prol.preheader

for_loop_body.prol.preheader:                     ; preds = %for_loop_body.lr.ph
  %325 = mul i64 %199, 12
  %326 = add nsw i64 %325, 16000
  %uglygep565 = getelementptr i8, ptr %15, i64 %326
  br label %for_loop_body.prol

; CHECK-LABEL: for_loop_body.prol
for_loop_body.prol:                               ; preds = %for_loop_body.prol.preheader, %for_loop_body.prol
; CHECK: phi i8*
; CHECK: phi i32
; CHECK: phi float
; CHECK: phi float
; CHECK: phi float
; CHECK: phi float
; CHECK: phi float
; CHECK: phi float
  %lsr.iv = phi ptr [ %uglygep565, %for_loop_body.prol.preheader ], [ %uglygep566, %for_loop_body.prol ]
  %lsr.iv543 = phi i32 [ %xtraiter, %for_loop_body.prol.preheader ], [ %lsr.iv.next544, %for_loop_body.prol ]
  %.0495.prol = phi float [ %330, %for_loop_body.prol ], [ 0x7FF0000000000000, %for_loop_body.prol.preheader ]
  %.057494.prol = phi float [ %331, %for_loop_body.prol ], [ 0x7FF0000000000000, %for_loop_body.prol.preheader ]
  %.058493.prol = phi float [ %332, %for_loop_body.prol ], [ 0x7FF0000000000000, %for_loop_body.prol.preheader ]
  %.059492.prol = phi float [ %333, %for_loop_body.prol ], [ 0xFFF0000000000000, %for_loop_body.prol.preheader ]
  %.060491.prol = phi float [ %334, %for_loop_body.prol ], [ 0xFFF0000000000000, %for_loop_body.prol.preheader ]
  %.061490.prol = phi float [ %335, %for_loop_body.prol ], [ 0xFFF0000000000000, %for_loop_body.prol.preheader ]
  %uglygep568 = getelementptr i8, ptr %lsr.iv, i64 8
  %327 = tail call reassoc ninf nsz float @llvm.nvvm.ldg.global.f.f32.p0(ptr %lsr.iv, i32 32)
  %uglygep567 = getelementptr i8, ptr %lsr.iv, i64 4
  %328 = tail call reassoc ninf nsz float @llvm.nvvm.ldg.global.f.f32.p0(ptr %uglygep567, i32 32)
  %329 = tail call reassoc ninf nsz float @llvm.nvvm.ldg.global.f.f32.p0(ptr %uglygep568, i32 32)
  %330 = tail call reassoc ninf nsz float @llvm.minnum.f32(float %.0495.prol, float %327)
  %331 = tail call reassoc ninf nsz float @llvm.minnum.f32(float %.057494.prol, float %328)
  %332 = tail call reassoc ninf nsz float @llvm.minnum.f32(float %.058493.prol, float %329)
  %333 = tail call reassoc ninf nsz float @llvm.maxnum.f32(float %.059492.prol, float %327)
  %334 = tail call reassoc ninf nsz float @llvm.maxnum.f32(float %.060491.prol, float %328)
  %335 = tail call reassoc ninf nsz float @llvm.maxnum.f32(float %.061490.prol, float %329)
  %lsr.iv.next544 = add nsw i32 %lsr.iv543, -1
  %uglygep566 = getelementptr i8, ptr %lsr.iv, i64 12
  %prol.iter.cmp.not = icmp eq i32 %lsr.iv.next544, 0
  br i1 %prol.iter.cmp.not, label %for_loop_body.prol.loopexit.loopexit, label %for_loop_body.prol, !llvm.loop !30

for_loop_body.prol.loopexit.loopexit:             ; preds = %for_loop_body.prol
  %336 = add i32 %198, %xtraiter
  br label %for_loop_body.prol.loopexit

for_loop_body.prol.loopexit:                      ; preds = %for_loop_body.prol.loopexit.loopexit, %for_loop_body.lr.ph
  %.lcssa520.unr = phi float [ undef, %for_loop_body.lr.ph ], [ %330, %for_loop_body.prol.loopexit.loopexit ]
  %.lcssa519.unr = phi float [ undef, %for_loop_body.lr.ph ], [ %331, %for_loop_body.prol.loopexit.loopexit ]
  %.lcssa518.unr = phi float [ undef, %for_loop_body.lr.ph ], [ %332, %for_loop_body.prol.loopexit.loopexit ]
  %.lcssa517.unr = phi float [ undef, %for_loop_body.lr.ph ], [ %333, %for_loop_body.prol.loopexit.loopexit ]
  %.lcssa516.unr = phi float [ undef, %for_loop_body.lr.ph ], [ %334, %for_loop_body.prol.loopexit.loopexit ]
  %.lcssa.unr = phi float [ undef, %for_loop_body.lr.ph ], [ %335, %for_loop_body.prol.loopexit.loopexit ]
  %.0495.unr = phi float [ 0x7FF0000000000000, %for_loop_body.lr.ph ], [ %330, %for_loop_body.prol.loopexit.loopexit ]
  %.057494.unr = phi float [ 0x7FF0000000000000, %for_loop_body.lr.ph ], [ %331, %for_loop_body.prol.loopexit.loopexit ]
  %.058493.unr = phi float [ 0x7FF0000000000000, %for_loop_body.lr.ph ], [ %332, %for_loop_body.prol.loopexit.loopexit ]
  %.059492.unr = phi float [ 0xFFF0000000000000, %for_loop_body.lr.ph ], [ %333, %for_loop_body.prol.loopexit.loopexit ]
  %.060491.unr = phi float [ 0xFFF0000000000000, %for_loop_body.lr.ph ], [ %334, %for_loop_body.prol.loopexit.loopexit ]
  %.061490.unr = phi float [ 0xFFF0000000000000, %for_loop_body.lr.ph ], [ %335, %for_loop_body.prol.loopexit.loopexit ]
  %.062489.unr = phi i32 [ %198, %for_loop_body.lr.ph ], [ %336, %for_loop_body.prol.loopexit.loopexit ]
  %337 = icmp ult i32 %324, 3
  br i1 %337, label %after_for, label %for_loop_body.preheader

for_loop_body.preheader:                          ; preds = %for_loop_body.prol.loopexit
  %338 = sext i32 %.062489.unr to i64
  %339 = mul i64 %338, 12
  %340 = add nsw i64 %339, 16000
  %uglygep = getelementptr i8, ptr %15, i64 %340
  br label %for_loop_body

for_loop_body:                                    ; preds = %for_loop_body.preheader, %for_loop_body
  %lsr.iv563 = phi i32 [ %.062489.unr, %for_loop_body.preheader ], [ %lsr.iv.next564, %for_loop_body ]
  %lsr.iv559 = phi ptr [ %uglygep, %for_loop_body.preheader ], [ %uglygep560, %for_loop_body ]
  %.0495 = phi float [ %383, %for_loop_body ], [ %.0495.unr, %for_loop_body.preheader ]
  %.057494 = phi float [ %384, %for_loop_body ], [ %.057494.unr, %for_loop_body.preheader ]
  %.058493 = phi float [ %385, %for_loop_body ], [ %.058493.unr, %for_loop_body.preheader ]
  %.059492 = phi float [ %386, %for_loop_body ], [ %.059492.unr, %for_loop_body.preheader ]
  %.060491 = phi float [ %387, %for_loop_body ], [ %.060491.unr, %for_loop_body.preheader ]
  %.061490 = phi float [ %388, %for_loop_body ], [ %.061490.unr, %for_loop_body.preheader ]
  %uglygep562 = getelementptr i8, ptr %lsr.iv559, i64 8
  %341 = add i32 %lsr.iv563, 3
  %342 = tail call reassoc ninf nsz float @llvm.nvvm.ldg.global.f.f32.p0(ptr %lsr.iv559, i32 32)
  %uglygep561 = getelementptr i8, ptr %lsr.iv559, i64 4
  %343 = tail call reassoc ninf nsz float @llvm.nvvm.ldg.global.f.f32.p0(ptr %uglygep561, i32 32)
  %344 = tail call reassoc ninf nsz float @llvm.nvvm.ldg.global.f.f32.p0(ptr %uglygep562, i32 32)
  %345 = tail call reassoc ninf nsz float @llvm.minnum.f32(float %.0495, float %342)
  %346 = tail call reassoc ninf nsz float @llvm.minnum.f32(float %.057494, float %343)
  %347 = tail call reassoc ninf nsz float @llvm.minnum.f32(float %.058493, float %344)
  %348 = tail call reassoc ninf nsz float @llvm.maxnum.f32(float %.059492, float %342)
  %349 = tail call reassoc ninf nsz float @llvm.maxnum.f32(float %.060491, float %343)
  %350 = tail call reassoc ninf nsz float @llvm.maxnum.f32(float %.061490, float %344)
  %351 = add i32 %lsr.iv563, 1
  %352 = sext i32 %351 to i64
  %353 = mul nsw i64 %352, 12
  %354 = getelementptr inbounds i8, ptr %getch.i81, i64 %353
  %355 = tail call reassoc ninf nsz float @llvm.nvvm.ldg.global.f.f32.p0(ptr %354, i32 32)
  %getch.i80.1 = getelementptr %S102_ch, ptr %354, i64 0, i32 1
  %356 = tail call reassoc ninf nsz float @llvm.nvvm.ldg.global.f.f32.p0(ptr %getch.i80.1, i32 32)
  %getch.i79.1 = getelementptr %S102_ch, ptr %354, i64 0, i32 2
  %357 = tail call reassoc ninf nsz float @llvm.nvvm.ldg.global.f.f32.p0(ptr %getch.i79.1, i32 32)
  %358 = tail call reassoc ninf nsz float @llvm.minnum.f32(float %345, float %355)
  %359 = tail call reassoc ninf nsz float @llvm.minnum.f32(float %346, float %356)
  %360 = tail call reassoc ninf nsz float @llvm.minnum.f32(float %347, float %357)
  %361 = tail call reassoc ninf nsz float @llvm.maxnum.f32(float %348, float %355)
  %362 = tail call reassoc ninf nsz float @llvm.maxnum.f32(float %349, float %356)
  %363 = tail call reassoc ninf nsz float @llvm.maxnum.f32(float %350, float %357)
  %364 = add i32 %lsr.iv563, 2
  %365 = sext i32 %364 to i64
  %366 = mul nsw i64 %365, 12
  %367 = getelementptr inbounds i8, ptr %getch.i81, i64 %366
  %368 = tail call reassoc ninf nsz float @llvm.nvvm.ldg.global.f.f32.p0(ptr %367, i32 32)
  %getch.i80.2 = getelementptr %S102_ch, ptr %367, i64 0, i32 1
  %369 = tail call reassoc ninf nsz float @llvm.nvvm.ldg.global.f.f32.p0(ptr %getch.i80.2, i32 32)
  %getch.i79.2 = getelementptr %S102_ch, ptr %367, i64 0, i32 2
  %370 = tail call reassoc ninf nsz float @llvm.nvvm.ldg.global.f.f32.p0(ptr %getch.i79.2, i32 32)
  %371 = tail call reassoc ninf nsz float @llvm.minnum.f32(float %358, float %368)
  %372 = tail call reassoc ninf nsz float @llvm.minnum.f32(float %359, float %369)
  %373 = tail call reassoc ninf nsz float @llvm.minnum.f32(float %360, float %370)
  %374 = tail call reassoc ninf nsz float @llvm.maxnum.f32(float %361, float %368)
  %375 = tail call reassoc ninf nsz float @llvm.maxnum.f32(float %362, float %369)
  %376 = tail call reassoc ninf nsz float @llvm.maxnum.f32(float %363, float %370)
  %377 = sext i32 %341 to i64
  %378 = mul nsw i64 %377, 12
  %379 = getelementptr inbounds i8, ptr %getch.i81, i64 %378
  %380 = tail call reassoc ninf nsz float @llvm.nvvm.ldg.global.f.f32.p0(ptr %379, i32 32)
  %getch.i80.3 = getelementptr %S102_ch, ptr %379, i64 0, i32 1
  %381 = tail call reassoc ninf nsz float @llvm.nvvm.ldg.global.f.f32.p0(ptr %getch.i80.3, i32 32)
  %getch.i79.3 = getelementptr %S102_ch, ptr %379, i64 0, i32 2
  %382 = tail call reassoc ninf nsz float @llvm.nvvm.ldg.global.f.f32.p0(ptr %getch.i79.3, i32 32)
  %383 = tail call reassoc ninf nsz float @llvm.minnum.f32(float %371, float %380)
  %384 = tail call reassoc ninf nsz float @llvm.minnum.f32(float %372, float %381)
  %385 = tail call reassoc ninf nsz float @llvm.minnum.f32(float %373, float %382)
  %386 = tail call reassoc ninf nsz float @llvm.maxnum.f32(float %374, float %380)
  %387 = tail call reassoc ninf nsz float @llvm.maxnum.f32(float %375, float %381)
  %388 = tail call reassoc ninf nsz float @llvm.maxnum.f32(float %376, float %382)
  %uglygep560 = getelementptr i8, ptr %lsr.iv559, i64 48
  %lsr.iv.next564 = add i32 %lsr.iv563, 4
  %exitcond.not.3 = icmp eq i32 %206, %lsr.iv.next564
  br i1 %exitcond.not.3, label %after_for, label %for_loop_body

after_for:                                        ; preds = %for_loop_body, %for_loop_body.prol.loopexit, %allocs
  %.061.lcssa = phi float [ 0xFFF0000000000000, %allocs ], [ %.lcssa.unr, %for_loop_body.prol.loopexit ], [ %388, %for_loop_body ]
  %.060.lcssa = phi float [ 0xFFF0000000000000, %allocs ], [ %.lcssa516.unr, %for_loop_body.prol.loopexit ], [ %387, %for_loop_body ]
  %.059.lcssa = phi float [ 0xFFF0000000000000, %allocs ], [ %.lcssa517.unr, %for_loop_body.prol.loopexit ], [ %386, %for_loop_body ]
  %.058.lcssa = phi float [ 0x7FF0000000000000, %allocs ], [ %.lcssa518.unr, %for_loop_body.prol.loopexit ], [ %385, %for_loop_body ]
  %.057.lcssa = phi float [ 0x7FF0000000000000, %allocs ], [ %.lcssa519.unr, %for_loop_body.prol.loopexit ], [ %384, %for_loop_body ]
  %.0.lcssa = phi float [ 0x7FF0000000000000, %allocs ], [ %.lcssa520.unr, %for_loop_body.prol.loopexit ], [ %383, %for_loop_body ]
  %sunkaddr = getelementptr inbounds i8, ptr %0, i64 8
  %389 = load ptr, ptr %sunkaddr, align 8
  %390 = getelementptr inbounds %struct.LLVMRuntime, ptr %389, i64 0, i32 7, i64 1
  %391 = load ptr, ptr %390, align 8
  %getch.i78 = getelementptr %S5_ch, ptr %391, i64 0, i32 24
  %392 = shl i32 %2, 3
  %393 = sext i32 %392 to i64
  %394 = mul nsw i64 %393, 12
  %395 = getelementptr inbounds i8, ptr %getch.i78, i64 %394
  store float %.0.lcssa, ptr %395, align 4
  %getch.i77 = getelementptr %S102_ch, ptr %395, i64 0, i32 1
  store float %.057.lcssa, ptr %getch.i77, align 4
  %getch.i76 = getelementptr %S102_ch, ptr %395, i64 0, i32 2
  store float %.058.lcssa, ptr %getch.i76, align 4
  %396 = or i32 %392, 1
  %397 = sext i32 %396 to i64
  %398 = mul nsw i64 %397, 12
  %399 = getelementptr inbounds i8, ptr %getch.i78, i64 %398
  store float %.0.lcssa, ptr %399, align 4
  %getch.i75 = getelementptr %S102_ch, ptr %399, i64 0, i32 1
  store float %.057.lcssa, ptr %getch.i75, align 4
  %getch.i74 = getelementptr %S102_ch, ptr %399, i64 0, i32 2
  store float %.061.lcssa, ptr %getch.i74, align 4
  %400 = or i32 %392, 2
  %401 = sext i32 %400 to i64
  %402 = mul nsw i64 %401, 12
  %403 = getelementptr inbounds i8, ptr %getch.i78, i64 %402
  store float %.0.lcssa, ptr %403, align 4
  %getch.i73 = getelementptr %S102_ch, ptr %403, i64 0, i32 1
  store float %.060.lcssa, ptr %getch.i73, align 4
  %getch.i72 = getelementptr %S102_ch, ptr %403, i64 0, i32 2
  store float %.058.lcssa, ptr %getch.i72, align 4
  %404 = or i32 %392, 3
  %405 = sext i32 %404 to i64
  %406 = mul nsw i64 %405, 12
  %407 = getelementptr inbounds i8, ptr %getch.i78, i64 %406
  store float %.0.lcssa, ptr %407, align 4
  %getch.i71 = getelementptr %S102_ch, ptr %407, i64 0, i32 1
  store float %.060.lcssa, ptr %getch.i71, align 4
  %getch.i70 = getelementptr %S102_ch, ptr %407, i64 0, i32 2
  store float %.061.lcssa, ptr %getch.i70, align 4
  %408 = or i32 %392, 4
  %409 = sext i32 %408 to i64
  %410 = mul nsw i64 %409, 12
  %411 = getelementptr inbounds i8, ptr %getch.i78, i64 %410
  store float %.059.lcssa, ptr %411, align 4
  %getch.i69 = getelementptr %S102_ch, ptr %411, i64 0, i32 1
  store float %.057.lcssa, ptr %getch.i69, align 4
  %getch.i68 = getelementptr %S102_ch, ptr %411, i64 0, i32 2
  store float %.058.lcssa, ptr %getch.i68, align 4
  %412 = or i32 %392, 5
  %413 = sext i32 %412 to i64
  %414 = mul nsw i64 %413, 12
  %415 = getelementptr inbounds i8, ptr %getch.i78, i64 %414
  store float %.059.lcssa, ptr %415, align 4
  %getch.i67 = getelementptr %S102_ch, ptr %415, i64 0, i32 1
  store float %.057.lcssa, ptr %getch.i67, align 4
  %getch.i66 = getelementptr %S102_ch, ptr %415, i64 0, i32 2
  store float %.061.lcssa, ptr %getch.i66, align 4
  %416 = or i32 %392, 6
  %417 = sext i32 %416 to i64
  %418 = mul nsw i64 %417, 12
  %419 = getelementptr inbounds i8, ptr %getch.i78, i64 %418
  store float %.059.lcssa, ptr %419, align 4
  %getch.i65 = getelementptr %S102_ch, ptr %419, i64 0, i32 1
  store float %.060.lcssa, ptr %getch.i65, align 4
  %getch.i64 = getelementptr %S102_ch, ptr %419, i64 0, i32 2
  store float %.058.lcssa, ptr %getch.i64, align 4
  %420 = or i32 %392, 7
  %421 = sext i32 %420 to i64
  %422 = mul nsw i64 %421, 12
  %423 = getelementptr inbounds i8, ptr %getch.i78, i64 %422
  store float %.059.lcssa, ptr %423, align 4
  %getch.i63 = getelementptr %S102_ch, ptr %423, i64 0, i32 1
  store float %.060.lcssa, ptr %getch.i63, align 4
  %getch.i = getelementptr %S102_ch, ptr %423, i64 0, i32 2
  store float %.061.lcssa, ptr %getch.i, align 4
  ret void
}

; Function Attrs: argmemonly nocallback nofree nounwind readonly
declare float @llvm.nvvm.ldg.global.f.f32.p0(ptr nocapture, i32) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #4

; Function Attrs: mustprogress nofree nosync nounwind willreturn
define void @kernel_init_geom_fields_c262_0_kernel_2_serial(ptr nocapture readonly byval(%struct.RuntimeContext) align 8 %context) local_unnamed_addr #5 {
entry:
  %context1 = addrspacecast ptr %context to ptr addrspace(1)
  %0 = getelementptr inbounds %struct.RuntimeContext, ptr addrspace(1) %context1, i64 0, i32 1
  %1 = load ptr, ptr addrspace(1) %0, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(1)
  %3 = getelementptr inbounds %struct.LLVMRuntime, ptr addrspace(1) %2, i64 0, i32 14
  %4 = load ptr, ptr addrspace(1) %3, align 8
  %5 = load i32, ptr %4, align 4
  %6 = tail call i32 @llvm.smax.i32(i32 %5, i32 0)
  %7 = getelementptr inbounds i8, ptr %4, i64 4
  store i32 %6, ptr %7, align 4
  ret void
}

; Function Attrs: nofree nosync nounwind
define void @kernel_init_geom_fields_c262_0_kernel_3_range_for(ptr byval(%struct.RuntimeContext) align 8 %context) local_unnamed_addr #6 {
entry:
  %context2 = addrspacecast ptr %context to ptr addrspace(1)
  %0 = getelementptr inbounds %struct.RuntimeContext, ptr addrspace(1) %context2, i64 0, i32 1
  %1 = load ptr, ptr addrspace(1) %0, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(1)
  %3 = getelementptr inbounds %struct.LLVMRuntime, ptr addrspace(1) %2, i64 0, i32 14
  %4 = load ptr, ptr addrspace(1) %3, align 8
  %5 = getelementptr inbounds i8, ptr %4, i64 4
  %6 = load i32, ptr %5, align 4
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !24
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x(), !range !25
  %9 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !26
  %10 = mul nsw i32 %8, %9
  %11 = add nuw nsw i32 %10, %7
  %12 = icmp slt i32 %11, %6
  br i1 %12, label %.lr.ph.i, label %gpu_parallel_range_for.exit

.lr.ph.i:                                         ; preds = %entry
  %13 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x()
  %14 = mul nsw i32 %8, %13
  %15 = sext i32 %10 to i64
  %16 = zext i32 %7 to i64
  %17 = add nsw i64 %15, %16
  %18 = shl nsw i64 %17, 2
  %19 = add nsw i64 %18, 15904
  %20 = sext i32 %14 to i64
  %21 = shl nsw i64 %20, 2
  br label %22

22:                                               ; preds = %22, %.lr.ph.i
  %lsr.iv = phi i64 [ %lsr.iv.next, %22 ], [ %19, %.lr.ph.i ]
  %.01.i = phi i32 [ %11, %.lr.ph.i ], [ %24, %22 ]
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %2, i64 104
  %23 = load ptr, ptr addrspace(1) %sunkaddr, align 8
  %uglygep = getelementptr i8, ptr %23, i64 %lsr.iv
  store float 1.000000e+00, ptr %uglygep, align 4
  %24 = add nuw nsw i32 %.01.i, %14
  %lsr.iv.next = add i64 %lsr.iv, %21
  %25 = icmp slt i32 %24, %6
  br i1 %25, label %22, label %gpu_parallel_range_for.exit, !llvm.loop !28

gpu_parallel_range_for.exit:                      ; preds = %22, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #7

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #8

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #8

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn "denormal-fp-math-f32"="preserve-sign" "unsafe-fp-math"="false" }
attributes #1 = { nounwind "denormal-fp-math-f32"="preserve-sign" "unsafe-fp-math"="false" }
attributes #2 = { nofree nounwind "denormal-fp-math-f32"="preserve-sign" "unsafe-fp-math"="false" }
attributes #3 = { argmemonly nocallback nofree nounwind readonly "denormal-fp-math-f32"="preserve-sign" "unsafe-fp-math"="false" }
attributes #4 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn "denormal-fp-math-f32"="preserve-sign" "unsafe-fp-math"="false" }
attributes #5 = { mustprogress nofree nosync nounwind willreturn "denormal-fp-math-f32"="preserve-sign" "unsafe-fp-math"="false" }
attributes #6 = { nofree nosync nounwind "denormal-fp-math-f32"="preserve-sign" "unsafe-fp-math"="false" }
attributes #7 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #8 = { argmemonly nocallback nofree nosync nounwind willreturn }
attributes #9 = { nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !12, !14, !14, !14, !14, !15, !15, !14}
!llvm.ident = !{!16}
!nvvmir.version = !{!17}
!llvm.module.flags = !{!18, !19, !20, !21, !22, !23}

!0 = !{ptr @kernel_init_geom_fields_c262_0_kernel_0_serial, !"kernel", i32 1}
!1 = !{ptr @kernel_init_geom_fields_c262_0_kernel_0_serial, !"maxntidx", i32 1}
!2 = !{ptr @kernel_init_geom_fields_c262_0_kernel_0_serial, !"minctasm", i32 2}
!3 = !{ptr @kernel_init_geom_fields_c262_0_kernel_1_range_for, !"kernel", i32 1}
!4 = !{ptr @kernel_init_geom_fields_c262_0_kernel_1_range_for, !"maxntidx", i32 128}
!5 = !{ptr @kernel_init_geom_fields_c262_0_kernel_1_range_for, !"minctasm", i32 2}
!6 = !{ptr @kernel_init_geom_fields_c262_0_kernel_2_serial, !"kernel", i32 1}
!7 = !{ptr @kernel_init_geom_fields_c262_0_kernel_2_serial, !"maxntidx", i32 1}
!8 = !{ptr @kernel_init_geom_fields_c262_0_kernel_2_serial, !"minctasm", i32 2}
!9 = !{ptr @kernel_init_geom_fields_c262_0_kernel_3_range_for, !"kernel", i32 1}
!10 = !{ptr @kernel_init_geom_fields_c262_0_kernel_3_range_for, !"maxntidx", i32 128}
!11 = !{ptr @kernel_init_geom_fields_c262_0_kernel_3_range_for, !"minctasm", i32 2}
!12 = !{null, !"align", i32 8}
!13 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!14 = !{null, !"align", i32 16}
!15 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!16 = !{!"Ubuntu clang version 15.0.7"}
!17 = !{i32 1, i32 4}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"PIC Level", i32 2}
!20 = !{i32 7, !"PIE Level", i32 2}
!21 = !{i32 7, !"uwtable", i32 2}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{i32 4, !"nvvm-reflect-ftz", i32 1}
!24 = !{i32 0, i32 1024}
!25 = !{i32 1, i32 1025}
!26 = !{i32 0, i32 2147483647}
!27 = distinct !{ptr @function_body, null}
!28 = distinct !{!28, !29}
!29 = !{!"llvm.loop.mustprogress"}
!30 = distinct !{!30, !31}
!31 = !{!"llvm.loop.unroll.disable"}
