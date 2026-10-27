; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = 'lineasm_return_type.ll'
source_filename = "shared_to_generic.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-f16:16-f32:32-v16:16-v32:32-n16:32:64"
target triple = "ppu"

%struct.uint3 = type { i32, i32, i32 }

$_ZN12_GLOBAL__N_127test_cvta_shared_to_genericEPm = comdat any

@_ZN12_GLOBAL__N_18s_array1E = internal addrspace(3) global [4 x i32] undef, align 4
@_ZN12_GLOBAL__N_18s_array2E = internal addrspace(3) global [4 x i32] undef, align 4
@threadIdx = extern_weak addrspace(1) global %struct.uint3, align 4

; Function Attrs: convergent mustprogress norecurse nounwind null_pointer_is_valid
define ppu_kernel void @kernel(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
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
  store ptr %0, ptr %2, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr %3) #2
  call void @llvm.lifetime.start.p0(i64 8, ptr %4) #2
; CHECK: %{{.+}} = call i8* asm sideeffect "cvta.shared.u64 $0, $1;", "=l,l"(i8* %{{.+}})
  %13 = call ptr asm sideeffect "cvta.shared.u64 $0, $1;", "=l,l"(ptr addrspacecast (ptr addrspace(3) @_ZN12_GLOBAL__N_18s_array1E to ptr)) #3, !srcloc !14
  store ptr %13, ptr %3, align 8
; CHECK: %{{.+}} = call i8* asm sideeffect "cvta.shared.u64 $0, $1;", "=l,l"(i8* %{{.+}})
  %14 = call ptr asm sideeffect "cvta.shared.u64 $0, $1;", "=l,l"(ptr addrspacecast (ptr addrspace(3) @_ZN12_GLOBAL__N_18s_array2E to ptr)) #3, !srcloc !15
  store ptr %14, ptr %4, align 8
  call void @llvm.lifetime.start.p0(i64 4, ptr %5) #2
  %15 = addrspacecast ptr addrspace(1) @threadIdx to ptr
  %16 = load i32, ptr %6, align 4
  store i32 %16, ptr %5, align 4
  %17 = load ptr, ptr %2, align 8
  %18 = load i32, ptr %5, align 4
  %19 = mul nsw i32 %18, 2
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i64, ptr %17, i64 %20
  store i64 sub (i64 ptrtoint (ptr addrspacecast (ptr addrspace(3) @_ZN12_GLOBAL__N_18s_array2E to ptr) to i64), i64 ptrtoint (ptr addrspacecast (ptr addrspace(3) @_ZN12_GLOBAL__N_18s_array1E to ptr) to i64)), ptr %21, align 8
  %22 = load ptr, ptr %4, align 8
  %23 = ptrtoint ptr %22 to i64
  %24 = load ptr, ptr %3, align 8
  %25 = ptrtoint ptr %24 to i64
  %26 = sub i64 %23, %25
  %27 = load ptr, ptr %2, align 8
  %28 = load i32, ptr %5, align 4
  %29 = mul nsw i32 %28, 2
  %30 = add nsw i32 %29, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i64, ptr %27, i64 %31
  store i64 %26, ptr %32, align 8
  call void @llvm.lifetime.end.p0(i64 4, ptr %5) #2
  call void @llvm.lifetime.end.p0(i64 8, ptr %4) #2
  call void @llvm.lifetime.end.p0(i64 8, ptr %3) #2
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

declare i32 @__ppukernel_read_tidx_u32()

declare i32 @__ppukernel_read_tidy_u32()

declare i32 @__ppukernel_read_tidz_u32()

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; uselistorder directives
uselistorder i32 1, { 2, 0, 1, 3, 4, 5, 6 }
uselistorder i32 2, { 1, 2, 0 }
uselistorder ptr @llvm.lifetime.start.p0, { 2, 1, 0 }
uselistorder ptr @llvm.lifetime.end.p0, { 2, 1, 0 }

attributes #0 = { convergent mustprogress norecurse nounwind null_pointer_is_valid "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="ppu001" "target-features"="+ppu001,+ptx32" "uniform-work-group-size"="true" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind }
attributes #3 = { convergent nounwind }

!llvm.build.commands = !{!0}
!ppu.module.id = !{!1}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = !{!"clang"}
!1 = !{!"_3APXATCA0XZYN"}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 4, !"hggc-reflect-ftz", i32 0}
!4 = !{i32 4, !"hggc-reflect-fastmath", i32 0}
!5 = !{i32 4, !"hggc-reflect-fmad", i32 1}
!6 = !{i32 4, !"hggc-reflect-precdiv", i32 1}
!7 = !{i32 4, !"hggc-reflect-precsqrt", i32 1}
!8 = !{i32 4, !"hggc-reflect-strictftz", i32 0}
!9 = !{i32 4, !"hggc-reflect-simtbranch", i32 0}
!10 = !{i32 4, !"hggc-reflect-mathcfg", i32 15}
!11 = !{i32 8, !"PIC Level", i32 2}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 18.1.7 (dev-ad0826e7c723)"}
!14 = !{i64 3472951}
!15 = !{i64 3473024}
