; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = './simple_case.hg'
source_filename = "./simple_case.hg"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-f16:16-f32:32-v16:16-v32:32-n16:32:64"
target triple = "ppu"

%struct.uint3 = type { i32, i32, i32 }
%struct.dim3 = type { i32, i32, i32 }
; CHECK: %struct.MyStruct = type { i8* }
%struct.MyStruct = type { ptr }

@blockIdx = extern_weak dso_local addrspace(1) global %struct.uint3, align 4
@blockDim = extern_weak dso_local addrspace(1) global %struct.dim3, align 4
@threadIdx = extern_weak dso_local addrspace(1) global %struct.uint3, align 4

; Function Attrs: convergent mustprogress norecurse nounwind null_pointer_is_valid
define dso_local ppu_kernel void @_Z14add_one_kernel8MyStructi(ptr noundef byval(%struct.MyStruct) align 8 %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca %struct.uint3, align 8
  %7 = getelementptr inbounds %struct.uint3, ptr %6, i32 0, i32 0
  %8 = call i32 @__ppukernel_read_tidx_u32()
  store i32 %8, ptr %7, align 4
  %9 = getelementptr inbounds %struct.uint3, ptr %6, i32 0, i32 1
  %10 = call i32 @__ppukernel_read_tidy_u32()
  store i32 %10, ptr %9, align 4
  %11 = getelementptr inbounds %struct.uint3, ptr %6, i32 0, i32 2
  %12 = call i32 @__ppukernel_read_tidz_u32()
  store i32 %12, ptr %11, align 4
  %13 = alloca %struct.uint3, align 8
  %14 = getelementptr inbounds %struct.uint3, ptr %13, i32 0, i32 0
  %15 = call i32 @__ppukernel_read_ctaidx_u32()
  store i32 %15, ptr %14, align 4
  %16 = getelementptr inbounds %struct.uint3, ptr %13, i32 0, i32 1
  %17 = call i32 @__ppukernel_read_ctaidy_u32()
  store i32 %17, ptr %16, align 4
  %18 = getelementptr inbounds %struct.uint3, ptr %13, i32 0, i32 2
  %19 = call i32 @__ppukernel_read_ctaidz_u32()
  store i32 %19, ptr %18, align 4
  %20 = alloca %struct.dim3, align 8
  %21 = getelementptr inbounds %struct.dim3, ptr %20, i32 0, i32 0
  %22 = call i32 @__ppukernel_read_ntidx_u32()
  store i32 %22, ptr %21, align 4
  %23 = getelementptr inbounds %struct.dim3, ptr %20, i32 0, i32 1
  %24 = call i32 @__ppukernel_read_ntidy_u32()
  store i32 %24, ptr %23, align 4
  %25 = getelementptr inbounds %struct.dim3, ptr %20, i32 0, i32 2
  %26 = call i32 @__ppukernel_read_ntidz_u32()
  store i32 %26, ptr %25, align 4
  store i32 %1, ptr %3, align 4
  call void @llvm.lifetime.start.p0(i64 4, ptr %4) #2
  %27 = addrspacecast ptr addrspace(1) @blockIdx to ptr
  %28 = load i32, ptr %13, align 4
  %29 = addrspacecast ptr addrspace(1) @blockDim to ptr
  %30 = load i32, ptr %20, align 4
  %31 = mul i32 %28, %30
  %32 = addrspacecast ptr addrspace(1) @threadIdx to ptr
  %33 = load i32, ptr %6, align 4
  %34 = add i32 %31, %33
  store i32 %34, ptr %4, align 4
  %35 = load i32, ptr %4, align 4
  %36 = load i32, ptr %3, align 4
  %37 = icmp slt i32 %35, %36
  br i1 %37, label %38, label %47

38:                                               ; preds = %2
  call void @llvm.lifetime.start.p0(i64 8, ptr %5) #2
  %39 = getelementptr inbounds %struct.MyStruct, ptr %0, i32 0, i32 0
  %40 = load ptr, ptr %39, align 8
  store ptr %40, ptr %5, align 8
  %41 = load ptr, ptr %5, align 8
  %42 = load i32, ptr %4, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, ptr %41, i64 %43
  %45 = load i32, ptr %44, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %44, align 4
  call void @llvm.lifetime.end.p0(i64 8, ptr %5) #2
  br label %47

47:                                               ; preds = %38, %2
  call void @llvm.lifetime.end.p0(i64 4, ptr %4) #2
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

declare i32 @__ppukernel_read_tidx_u32()

declare i32 @__ppukernel_read_tidy_u32()

declare i32 @__ppukernel_read_tidz_u32()

declare i32 @__ppukernel_read_ctaidx_u32()

declare i32 @__ppukernel_read_ctaidy_u32()

declare i32 @__ppukernel_read_ctaidz_u32()

declare i32 @__ppukernel_read_ntidx_u32()

declare i32 @__ppukernel_read_ntidy_u32()

declare i32 @__ppukernel_read_ntidz_u32()

; uselistorder directives
uselistorder i32 1, { 6, 0, 1, 2, 3, 4, 5, 7, 8, 9 }
uselistorder i32 0, { 12, 13, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 }
uselistorder ptr @llvm.lifetime.start.p0, { 1, 0 }
uselistorder ptr @llvm.lifetime.end.p0, { 1, 0 }

attributes #0 = { convergent mustprogress norecurse nounwind null_pointer_is_valid "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="ppu001" "target-features"="+ppu001,+ptx32" "uniform-work-group-size"="true" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind }

!llvm.build.commands = !{!0}
!ppu.module.id = !{!1}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = !{!"clang"}
!1 = !{!"3KOQWRNCVZR9X"}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 4, !"hggc-reflect-ftz", i32 0}
!4 = !{i32 4, !"hggc-reflect-fastmath", i32 0}
!5 = !{i32 4, !"hggc-reflect-fmad", i32 1}
!6 = !{i32 4, !"hggc-reflect-precdiv", i32 1}
!7 = !{i32 4, !"hggc-reflect-precsqrt", i32 1}
!8 = !{i32 4, !"hggc-reflect-strictftz", i32 0}
!9 = !{i32 4, !"hggc-reflect-simtbranch", i32 1}
!10 = !{i32 4, !"hggc-reflect-mathcfg", i32 15}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 18.1.7 (dev-c9f112360139)"}
