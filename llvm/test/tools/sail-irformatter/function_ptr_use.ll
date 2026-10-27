; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-f16:16-f32:32-v16:16-v32:32-n16:32:64"
target triple = "ppu"

%struct.uint3 = type { i32, i32, i32 }
%class.anon = type { i8 }

@threadIdx = extern_weak dso_local addrspace(1) global %struct.uint3, align 4
@dev_func_ptr = external dso_local addrspace(1) global ptr, align 8

; Function Attrs: convergent mustprogress nounwind null_pointer_is_valid
define dso_local i32 @_Z11exec_lambdaiPFiiE(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = load i32, ptr %3, align 4
  %7 = add nsw i32 %6, 1
  %8 = call i32 %5(i32 noundef %7) #5
  ret i32 %8
}

; Function Attrs: convergent mustprogress norecurse nounwind null_pointer_is_valid
define dso_local ppu_kernel void @_Z21kernel_indirect_call4Pi(ptr noundef %0) #1 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca %class.anon, align 1
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
  store ptr %0, ptr %2, align 8
  call void @llvm.lifetime.start.p0(i64 4, ptr %3) #6
  %12 = addrspacecast ptr addrspace(1) @threadIdx to ptr
  %13 = load i32, ptr %5, align 4
  store i32 %13, ptr %3, align 4
  call void @llvm.lifetime.start.p0(i64 1, ptr %4) #6
  %14 = load ptr, ptr %2, align 8
  %15 = load i32, ptr %3, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i32, ptr %14, i64 %16
  %18 = load i32, ptr %17, align 4
  %19 = load i32, ptr %3, align 4
  %20 = add nsw i32 %18, %19
  %21 = call ptr @_ZZ21kernel_indirect_call4PiENKUliE_cvPFiiEEv(ptr noundef align 1 dereferenceable_or_null(1) %4) #5
  %22 = call i32 @_Z11exec_lambdaiPFiiE(i32 noundef %20, ptr noundef %21) #5
  %23 = load ptr, ptr addrspacecast (ptr addrspace(1) @dev_func_ptr to ptr), align 8
  %24 = call i32 @_Z11exec_lambdaiPFiiE(i32 noundef %22, ptr noundef %23) #5
  %25 = call i32 @_Z11device_funci(i32 noundef %24) #5
  %26 = load ptr, ptr %2, align 8
  %27 = load i32, ptr %3, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i32, ptr %26, i64 %28
  store i32 %25, ptr %29, align 4
  call void @llvm.lifetime.end.p0(i64 1, ptr %4) #6
  call void @llvm.lifetime.end.p0(i64 4, ptr %3) #6
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: convergent nounwind null_pointer_is_valid
declare dso_local i32 @_Z11device_funci(i32 noundef) #3

;CHECK: ret i8* bitcast (i32 (i32)* @_ZZ21kernel_indirect_call4PiENUliE_8__invokeEi to i8*)
; Function Attrs: convergent inlinehint mustprogress nounwind null_pointer_is_valid
define internal ptr @_ZZ21kernel_indirect_call4PiENKUliE_cvPFiiEEv(ptr noundef align 1 dereferenceable_or_null(1) %0) #4 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr @_ZZ21kernel_indirect_call4PiENUliE_8__invokeEi
}

declare i32 @__ppukernel_read_tidx_u32()

declare i32 @__ppukernel_read_tidy_u32()

declare i32 @__ppukernel_read_tidz_u32()

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: convergent inlinehint mustprogress nounwind null_pointer_is_valid
define internal i32 @_ZZ21kernel_indirect_call4PiENUliE_8__invokeEi(i32 noundef %0) #4 align 2 {
  %2 = alloca i32, align 4
  %3 = alloca %class.anon, align 1
  store i32 %0, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  %5 = call i32 @_ZZ21kernel_indirect_call4PiENKUliE_clEi(ptr noundef align 1 dereferenceable_or_null(1) %3, i32 noundef %4) #5
  ret i32 %5
}

; Function Attrs: convergent inlinehint mustprogress nounwind null_pointer_is_valid
define internal i32 @_ZZ21kernel_indirect_call4PiENKUliE_clEi(ptr noundef align 1 dereferenceable_or_null(1) %0, i32 noundef %1) #4 align 2 {
  %3 = alloca ptr, align 8
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
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %12 = load ptr, ptr %3, align 8
  %13 = load i32, ptr %4, align 4
  %14 = add nsw i32 %13, 1
  ret i32 %14
}

; uselistorder directives
uselistorder i32 1, { 2, 0, 1, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 }
uselistorder ptr @llvm.lifetime.start.p0, { 1, 0 }
uselistorder ptr @llvm.lifetime.end.p0, { 1, 0 }

attributes #0 = { convergent mustprogress nounwind null_pointer_is_valid "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="ppu001" "target-features"="+ppu001,+ptx32" }
attributes #1 = { convergent mustprogress norecurse nounwind null_pointer_is_valid "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="ppu001" "target-features"="+ppu001,+ptx32" "uniform-work-group-size"="true" }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { convergent nounwind null_pointer_is_valid "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="ppu001" "target-features"="+ppu001,+ptx32" }
attributes #4 = { convergent inlinehint mustprogress nounwind null_pointer_is_valid "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="ppu001" "target-features"="+ppu001,+ptx32" }
attributes #5 = { convergent nounwind }
attributes #6 = { nounwind }

!llvm.build.commands = !{!0}
!ppu.module.id = !{!1}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = !{!"/home/image/PPU_SDK/CUDA_SDK/bin/clang++ -cc1 -triple ppu -aux-triple x86_64-unknown-linux-gnu -emit-llvm -emit-llvm-uselists -save-temps=cwd -disable-free -clear-ast-before-backend -disable-llvm-verifier -discard-value-names -main-file-name rdc_indirect_function_call2.cu -main-file-name-with-path ../cuda_code/rdc/rdc_indirect_function_call2.cu -mrelocation-model static -fno-delete-null-pointer-checks -mframe-pointer=all --expt-extended-lambda -D__CUDACC_EXTENDED_LAMBDA__ -relaxed-aliasing -fno-strict-return -ffp-contract=on -fno-rounding-math -no-integrated-as -mconstructor-aliases -aux-target-cpu x86-64 -disable-O0-optnone -fcuda-is-device -O2 -fgpu-rdc -fcuda-prefix -fcuda-allow-variadic-functions --hggc-simt-branch -target-feature +ppu001 -target-sdk-version=0.0 -target-cpu ppu001 -debugger-tuning=gdb -fno-dwarf-directory-asm -fdebug-compilation-dir=/home/image/CompilerTest/ppu_build_test/build -fdebug-ranges-base-address -v -fcoverage-compilation-dir=/home/image/CompilerTest/ppu_build_test/build -resource-dir /home/image/PPU_SDK/CUDA_SDK/targets/x86_64-linux/include/hgrt/details/system/clang/18 -use-gcc-builtins -no-round-trip-args -internal-isystem /home/image/PPU_SDK/CUDA_SDK/targets/x86_64-linux/include/hgrt/details/system/clang/18/include -include gcc_x86imm_builtins.h -include gcc_builtins.h -hgfb-stub-name rdc_indirect_function_call2.hgfb.c -hggc-host-stub-name rdc_indirect_function_call2-host.cpp -ppu-arch-list ppu0010,ppu0015 -w --std=c++17 -fdeprecated-macro -fno-autolink -ferror-limit 19 -fgpu-rdc --hggc-splitter-is-on -fgnuc-version=13.3.0 -fskip-odr-check-in-gmf -fdelayed-template-parsing -fcxx-exceptions -fexceptions -fcolor-diagnostics -mllvm -compatible-sdk-version=128 -disable-llvm-passes -cuid=9d904c3c0768dec6 -fcuda-allow-variadic-functions -fcuda-prefix -DINTERNAL_API_VERSION=1208 -D__GCC_HAVE_DWARF2_CFI_ASM=1 -o rdc_indirect_function_call2-hggc-ppu-ppu001.bc -x hggc-cpp-output rdc_indirect_function_call2-hggc-ppu-ppu001.hggci"}
!1 = !{!"_330RWIV91F3HC"}
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
!12 = !{!"clang version 18.1.7 (dev)"}
