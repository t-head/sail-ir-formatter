; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s
; ModuleID = '/mnt/ssd/zhufeng.huang/CI/cuda_conformance_test/compiler/lang/c99_old/6_9_external_definitions/vaarg_function_pointer.cu'
source_filename = "/mnt/ssd/zhufeng.huang/CI/cuda_conformance_test/compiler/lang/c99_old/6_9_external_definitions/vaarg_function_pointer.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-f16:16-f32:32-v16:16-v32:32-n16:32:64"
target triple = "ppu"

%struct.uint3 = type { i32, i32, i32 }

$_ZN12_GLOBAL__N_115kernel_vaarg_fpEPi = comdat any

@threadIdx = extern_weak addrspace(1) global %struct.uint3, align 4

; CHECK: _ZN12_GLOBAL__N_115kernel_vaarg_fpEPi

; Function Attrs: convergent mustprogress norecurse nounwind null_pointer_is_valid
define ppu_kernel void @_ZN12_GLOBAL__N_115kernel_vaarg_fpEPi(ptr noundef %0) #0 comdat {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca %struct.uint3, align 8
  %5 = getelementptr inbounds %struct.uint3, ptr %4, i32 0, i32 0
  %6 = call i32 @__ppukernel_read_tidx_u32()
  store i32 %6, ptr %5, align 4
  %7 = getelementptr inbounds %struct.uint3, ptr %4, i32 0, i32 1
  %8 = call i32 @__ppukernel_read_tidy_u32()
  store i32 %8, ptr %7, align 4
  %9 = getelementptr inbounds %struct.uint3, ptr %4, i32 0, i32 2
  %10 = call i32 @__ppukernel_read_tidz_u32()
  store i32 %10, ptr %9, align 4
  store ptr %0, ptr %2, align 8
  call void @llvm.lifetime.start.p0(i64 4, ptr %3) #4
  %11 = addrspacecast ptr addrspace(1) @threadIdx to ptr
  %12 = load i32, ptr %4, align 4
  store i32 %12, ptr %3, align 4
  %13 = load i32, ptr %3, align 4
  %14 = srem i32 %13, 2
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %22

16:                                               ; preds = %1
  %17 = call i32 (i32, ...) @_ZN12_GLOBAL__N_15vfuncEiz(i32 noundef 10, ptr noundef @_ZN12_GLOBAL__N_13addEii, i32 noundef 1, i32 noundef 2, ptr noundef @_ZN12_GLOBAL__N_13mulEii, i32 noundef 3, i32 noundef 4, ptr noundef @_ZN12_GLOBAL__N_13subEii, i32 noundef 5, i32 noundef 6, ptr noundef @_ZN12_GLOBAL__N_13subEii, i32 noundef 7, i32 noundef 8, ptr noundef @_ZN12_GLOBAL__N_13addEii, i32 noundef 9, i32 noundef 10) #5
  %18 = load ptr, ptr %2, align 8
  %19 = load i32, ptr %3, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, ptr %18, i64 %20
  store i32 %17, ptr %21, align 4
  br label %28

22:                                               ; preds = %1
  %23 = call i32 (i32, ...) @_ZN12_GLOBAL__N_15vfuncEiz(i32 noundef 6, ptr noundef @_ZN12_GLOBAL__N_13mulEii, i32 noundef 1, i32 noundef 2, ptr noundef @_ZN12_GLOBAL__N_13addEii, i32 noundef 3, i32 noundef 4, ptr noundef @_ZN12_GLOBAL__N_13addEii, i32 noundef 5, i32 noundef 6) #5
  %24 = load ptr, ptr %2, align 8
  %25 = load i32, ptr %3, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, ptr %24, i64 %26
  store i32 %23, ptr %27, align 4
  br label %28

28:                                               ; preds = %22, %16
  call void @llvm.lifetime.end.p0(i64 4, ptr %3) #4
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: convergent mustprogress nounwind null_pointer_is_valid
define internal i32 @_ZN12_GLOBAL__N_15vfuncEiz(i32 noundef %0, ...) #2 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.uint3, align 8
  %12 = getelementptr inbounds %struct.uint3, ptr %11, i32 0, i32 0
  %13 = call i32 @__ppukernel_read_tidx_u32()
  store i32 %13, ptr %12, align 4
  %14 = getelementptr inbounds %struct.uint3, ptr %11, i32 0, i32 1
  %15 = call i32 @__ppukernel_read_tidy_u32()
  store i32 %15, ptr %14, align 4
  %16 = getelementptr inbounds %struct.uint3, ptr %11, i32 0, i32 2
  %17 = call i32 @__ppukernel_read_tidz_u32()
  store i32 %17, ptr %16, align 4
  store i32 %0, ptr %2, align 4
  call void @llvm.lifetime.start.p0(i64 8, ptr %3) #4
  call void @llvm.va_start(ptr %3)
  call void @llvm.lifetime.start.p0(i64 4, ptr %4) #4
  store i32 0, ptr %4, align 4
  call void @llvm.lifetime.start.p0(i64 4, ptr %5) #4
  call void @llvm.lifetime.start.p0(i64 4, ptr %6) #4
  call void @llvm.lifetime.start.p0(i64 8, ptr %7) #4
  br label %18

18:                                               ; preds = %21, %1
  %19 = load i32, ptr %2, align 4
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %36

21:                                               ; preds = %18
  %22 = va_arg ptr %3, ptr
  store ptr %22, ptr %8, align 8
  %23 = load ptr, ptr %8, align 8
  store ptr %23, ptr %7, align 8
  %24 = va_arg ptr %3, i32
  store i32 %24, ptr %9, align 4
  %25 = load i32, ptr %9, align 4
  store i32 %25, ptr %5, align 4
  %26 = va_arg ptr %3, i32
  store i32 %26, ptr %10, align 4
  %27 = load i32, ptr %10, align 4
  store i32 %27, ptr %6, align 4
  %28 = load ptr, ptr %7, align 8
  %29 = load i32, ptr %5, align 4
  %30 = load i32, ptr %6, align 4
  %31 = call i32 %28(i32 noundef %29, i32 noundef %30) #5
  %32 = load i32, ptr %4, align 4
  %33 = add nsw i32 %32, %31
  store i32 %33, ptr %4, align 4
  %34 = load i32, ptr %2, align 4
  %35 = sub nsw i32 %34, 2
  store i32 %35, ptr %2, align 4
  br label %18, !llvm.loop !14

36:                                               ; preds = %18
  call void @llvm.va_end(ptr %3)
  %37 = load i32, ptr %4, align 4
  call void @llvm.lifetime.end.p0(i64 8, ptr %7) #4
  call void @llvm.lifetime.end.p0(i64 4, ptr %6) #4
  call void @llvm.lifetime.end.p0(i64 4, ptr %5) #4
  call void @llvm.lifetime.end.p0(i64 4, ptr %4) #4
  call void @llvm.lifetime.end.p0(i64 8, ptr %3) #4
  ret i32 %37
}

; Function Attrs: convergent mustprogress nounwind null_pointer_is_valid
define internal i32 @_ZN12_GLOBAL__N_13addEii(i32 noundef %0, i32 noundef %1) #2 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca %struct.uint3, align 8
  %6 = getelementptr inbounds %struct.uint3, ptr %5, i32 0, i32 0
  %7 = call i32 @__ppukernel_read_tidx_u32()
  store i32 %7, ptr %6, align 4
  %8 = getelementptr inbounds %struct.uint3, ptr %5, i32 0, i32 1
  %9 = call i32 @__ppukernel_read_tidy_u32()
  store i32 %9, ptr %8, align 4
  %10 = getelementptr inbounds %struct.uint3, ptr %5, i32 0, i32 2
  %11 = call i32 @__ppukernel_read_tidz_u32()
  store i32 %11, ptr %10, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %12 = load i32, ptr %3, align 4
  %13 = load i32, ptr %4, align 4
  %14 = add nsw i32 %12, %13
  ret i32 %14
}

; Function Attrs: convergent mustprogress nounwind null_pointer_is_valid
define internal i32 @_ZN12_GLOBAL__N_13mulEii(i32 noundef %0, i32 noundef %1) #2 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca %struct.uint3, align 8
  %6 = getelementptr inbounds %struct.uint3, ptr %5, i32 0, i32 0
  %7 = call i32 @__ppukernel_read_tidx_u32()
  store i32 %7, ptr %6, align 4
  %8 = getelementptr inbounds %struct.uint3, ptr %5, i32 0, i32 1
  %9 = call i32 @__ppukernel_read_tidy_u32()
  store i32 %9, ptr %8, align 4
  %10 = getelementptr inbounds %struct.uint3, ptr %5, i32 0, i32 2
  %11 = call i32 @__ppukernel_read_tidz_u32()
  store i32 %11, ptr %10, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %12 = load i32, ptr %3, align 4
  %13 = load i32, ptr %4, align 4
  %14 = mul nsw i32 %12, %13
  ret i32 %14
}

; Function Attrs: convergent mustprogress nounwind null_pointer_is_valid
define internal i32 @_ZN12_GLOBAL__N_13subEii(i32 noundef %0, i32 noundef %1) #2 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca %struct.uint3, align 8
  %6 = getelementptr inbounds %struct.uint3, ptr %5, i32 0, i32 0
  %7 = call i32 @__ppukernel_read_tidx_u32()
  store i32 %7, ptr %6, align 4
  %8 = getelementptr inbounds %struct.uint3, ptr %5, i32 0, i32 1
  %9 = call i32 @__ppukernel_read_tidy_u32()
  store i32 %9, ptr %8, align 4
  %10 = getelementptr inbounds %struct.uint3, ptr %5, i32 0, i32 2
  %11 = call i32 @__ppukernel_read_tidz_u32()
  store i32 %11, ptr %10, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %12 = load i32, ptr %3, align 4
  %13 = load i32, ptr %4, align 4
  %14 = sub nsw i32 %12, %13
  ret i32 %14
}

declare i32 @__ppukernel_read_tidx_u32()

declare i32 @__ppukernel_read_tidy_u32()

declare i32 @__ppukernel_read_tidz_u32()

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_start(ptr) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_end(ptr) #3

; uselistorder directives
uselistorder i32 1, { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 25, 26, 23, 24, 27, 28 }
uselistorder i32 0, { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 16, 17, 12, 13, 14, 15, 22, 18, 19, 20, 21 }
uselistorder i32 2, { 0, 1, 2, 4, 3, 6, 7, 8, 5 }
uselistorder ptr @_ZN12_GLOBAL__N_15vfuncEiz, { 1, 0 }
uselistorder ptr @_ZN12_GLOBAL__N_13addEii, { 3, 2, 1, 0 }
uselistorder ptr @_ZN12_GLOBAL__N_13mulEii, { 1, 0 }
uselistorder ptr @_ZN12_GLOBAL__N_13subEii, { 1, 0 }
uselistorder ptr @__ppukernel_read_tidx_u32, { 4, 3, 2, 1, 0 }
uselistorder ptr @__ppukernel_read_tidy_u32, { 4, 3, 2, 1, 0 }
uselistorder ptr @__ppukernel_read_tidz_u32, { 4, 3, 2, 1, 0 }
uselistorder ptr @llvm.lifetime.end.p0, { 5, 4, 3, 2, 1, 0 }

attributes #0 = { convergent mustprogress norecurse nounwind null_pointer_is_valid "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="ppu001" "target-features"="+ppu001,+ptx32" "uniform-work-group-size"="true" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { convergent mustprogress nounwind null_pointer_is_valid "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="ppu001" "target-features"="+ppu001,+ptx32" }
attributes #3 = { nocallback nofree nosync nounwind willreturn }
attributes #4 = { nounwind }
attributes #5 = { convergent nounwind }

!llvm.build.commands = !{!0}
!ppu.module.id = !{!1}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = !{!"/mnt/ssd/zhufeng.huang/CI/llvm-project/build/bin/clang-13 -cc1 -triple ppu -aux-triple x86_64-unknown-linux-gnu -emit-llvm -emit-llvm-uselists -save-temps=cwd -disable-free -clear-ast-before-backend -disable-llvm-verifier -discard-value-names -main-file-name vaarg_function_pointer.cu -main-file-name-with-path /mnt/ssd/zhufeng.huang/CI/cuda_conformance_test/compiler/lang/c99_old/6_9_external_definitions/vaarg_function_pointer.cu -mrelocation-model pic -pic-level 2 -fhalf-no-semantic-interposition -fno-delete-null-pointer-checks -mframe-pointer=all --expt-extended-lambda -D__CUDACC_EXTENDED_LAMBDA__ -relaxed-aliasing -fno-strict-return -ffp-contract=on -fno-rounding-math -no-integrated-as -mconstructor-aliases -aux-target-cpu x86-64 -disable-O0-optnone -fcuda-is-device -O2 -fcuda-prefix -fcuda-allow-variadic-functions --hggc-simt-branch -target-feature +ppu001 -target-sdk-version=0.0 -target-cpu ppu001 -debugger-tuning=gdb -fno-dwarf-directory-asm -fdebug-compilation-dir=/mnt/ssd/zhufeng.huang/CI/cuda_conformance_test/build -fdebug-ranges-base-address -v -fcoverage-compilation-dir=/mnt/ssd/zhufeng.huang/CI/cuda_conformance_test/build -resource-dir /mnt/ssd/zhufeng.huang/CI/llvm-project/build/lib/clang/18 -std=c++11 -fdeprecated-macro -fno-autolink -ferror-limit 19 -fgnuc-version=4.2.1 -fskip-odr-check-in-gmf -fdelayed-template-parsing -fcxx-exceptions -fexceptions -fcolor-diagnostics -fcuda-allow-variadic-functions -mllvm -ppu-64bit-insts=true -mllvm -ppu-simt-branch=true -disable-llvm-passes -cuid=badff8b9c20adf5b -fcuda-allow-variadic-functions -fcuda-prefix -D__GCC_HAVE_DWARF2_CFI_ASM=1 -o vaarg_function_pointer-hggc-ppu-ppu001.bc -x hggc-cpp-output vaarg_function_pointer-hggc-ppu-ppu001.hggci"}
!1 = !{!"3SEXXJMFR8XID"}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 4, !"hggc-reflect-ftz", i32 0}
!4 = !{i32 4, !"hggc-reflect-fastmath", i32 0}
!5 = !{i32 4, !"hggc-reflect-fmad", i32 1}
!6 = !{i32 4, !"hggc-reflect-precdiv", i32 1}
!7 = !{i32 4, !"hggc-reflect-precsqrt", i32 1}
!8 = !{i32 4, !"hggc-reflect-strictftz", i32 0}
!9 = !{i32 4, !"hggc-reflect-simtbranch", i32 1}
!10 = !{i32 4, !"hggc-reflect-mathcfg", i32 15}
!11 = !{i32 8, !"PIC Level", i32 2}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 18.1.7 (dev)"}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
