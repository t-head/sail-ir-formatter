; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@global_smem = external local_unnamed_addr addrspace(3) global [0 x i8]

; CHECK-LABLE: where_kernel_0d1d2d3d4
define void @where_kernel_0d1d2d3d4(ptr addrspace(1) %0, ptr addrspace(1) %1, ptr addrspace(1) %2, ptr addrspace(1) %3, i32 %4) local_unnamed_addr !dbg !5 {
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !8
  %7 = and i32 %6, 127, !dbg !8
  %8 = shl nuw nsw i32 %7, 3, !dbg !8
  %9 = or i32 %8, 1, !dbg !8
  %10 = or i32 %8, 2, !dbg !8
  %11 = or i32 %8, 3, !dbg !8
  %12 = or i32 %8, 4, !dbg !8
  %13 = or i32 %8, 5, !dbg !8
  %14 = or i32 %8, 6, !dbg !8
  %15 = or i32 %8, 7, !dbg !8
  %16 = shl nuw nsw i32 %7, 2, !dbg !8
  %17 = or i32 %16, 1, !dbg !8
  %18 = or i32 %16, 2, !dbg !8
  %19 = or i32 %16, 3, !dbg !8
  %20 = or i32 %16, 512, !dbg !8
  %21 = or i32 %16, 513, !dbg !8
  %22 = or i32 %16, 514, !dbg !8
  %23 = or i32 %16, 515, !dbg !8
  %24 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !dbg !9
  %25 = shl i32 %24, 10, !dbg !10
  %26 = or i32 %8, %25, !dbg !11
  %27 = or i32 %9, %25, !dbg !11
  %28 = or i32 %10, %25, !dbg !11
  %29 = or i32 %11, %25, !dbg !11
  %30 = or i32 %12, %25, !dbg !11
  %31 = or i32 %13, %25, !dbg !11
  %32 = or i32 %14, %25, !dbg !11
  %33 = or i32 %15, %25, !dbg !11
  %34 = or i32 %16, %25, !dbg !11
  %35 = or i32 %17, %25, !dbg !11
  %36 = or i32 %18, %25, !dbg !11
  %37 = or i32 %19, %25, !dbg !11
  %38 = or i32 %20, %25, !dbg !11
  %39 = or i32 %21, %25, !dbg !11
  %40 = or i32 %22, %25, !dbg !11
  %41 = or i32 %23, %25, !dbg !11
  %42 = icmp slt i32 %26, %4, !dbg !12
  %43 = icmp slt i32 %27, %4, !dbg !12
  %44 = icmp slt i32 %28, %4, !dbg !12
  %45 = icmp slt i32 %29, %4, !dbg !12
  %46 = icmp slt i32 %30, %4, !dbg !12
  %47 = icmp slt i32 %31, %4, !dbg !12
  %48 = icmp slt i32 %32, %4, !dbg !12
  %49 = icmp slt i32 %33, %4, !dbg !12
  %50 = icmp slt i32 %34, %4, !dbg !12
  %51 = icmp slt i32 %35, %4, !dbg !12
  %52 = icmp slt i32 %36, %4, !dbg !12
  %53 = icmp slt i32 %37, %4, !dbg !12
  %54 = icmp slt i32 %38, %4, !dbg !12
  %55 = icmp slt i32 %39, %4, !dbg !12
  %56 = icmp slt i32 %40, %4, !dbg !12
  %57 = icmp slt i32 %41, %4, !dbg !12
  %58 = sext i32 %26 to i64, !dbg !13
  %59 = getelementptr i1, ptr addrspace(1) %0, i64 %58, !dbg !13
  %60 = sext i32 %27 to i64, !dbg !13
  %61 = getelementptr i1, ptr addrspace(1) %0, i64 %60, !dbg !13
  %62 = sext i32 %28 to i64, !dbg !13
  %63 = getelementptr i1, ptr addrspace(1) %0, i64 %62, !dbg !13
  %64 = sext i32 %29 to i64, !dbg !13
  %65 = getelementptr i1, ptr addrspace(1) %0, i64 %64, !dbg !13
  %66 = sext i32 %30 to i64, !dbg !13
  %67 = getelementptr i1, ptr addrspace(1) %0, i64 %66, !dbg !13
  %68 = sext i32 %31 to i64, !dbg !13
  %69 = getelementptr i1, ptr addrspace(1) %0, i64 %68, !dbg !13
  %70 = sext i32 %32 to i64, !dbg !13
  %71 = getelementptr i1, ptr addrspace(1) %0, i64 %70, !dbg !13
  %72 = sext i32 %33 to i64, !dbg !13
  %73 = getelementptr i1, ptr addrspace(1) %0, i64 %72, !dbg !13
  %74 = tail call i8 asm sideeffect "mov.u16 $0, 0x0;\0A\09@$2 ld.global.b8 { $0 }, [ $1 + 0 ];", "=c,l,b"(ptr addrspace(1) %59, i1 %42) #2, !dbg !14
  %75 = tail call i8 asm sideeffect "mov.u16 $0, 0x0;\0A\09@$2 ld.global.b8 { $0 }, [ $1 + 0 ];", "=c,l,b"(ptr addrspace(1) %61, i1 %43) #2, !dbg !14
  %76 = tail call i8 asm sideeffect "mov.u16 $0, 0x0;\0A\09@$2 ld.global.b8 { $0 }, [ $1 + 0 ];", "=c,l,b"(ptr addrspace(1) %63, i1 %44) #2, !dbg !14
  %77 = tail call i8 asm sideeffect "mov.u16 $0, 0x0;\0A\09@$2 ld.global.b8 { $0 }, [ $1 + 0 ];", "=c,l,b"(ptr addrspace(1) %65, i1 %45) #2, !dbg !14
  %78 = tail call i8 asm sideeffect "mov.u16 $0, 0x0;\0A\09@$2 ld.global.b8 { $0 }, [ $1 + 0 ];", "=c,l,b"(ptr addrspace(1) %67, i1 %46) #2, !dbg !14
  %79 = tail call i8 asm sideeffect "mov.u16 $0, 0x0;\0A\09@$2 ld.global.b8 { $0 }, [ $1 + 0 ];", "=c,l,b"(ptr addrspace(1) %69, i1 %47) #2, !dbg !14
  %80 = tail call i8 asm sideeffect "mov.u16 $0, 0x0;\0A\09@$2 ld.global.b8 { $0 }, [ $1 + 0 ];", "=c,l,b"(ptr addrspace(1) %71, i1 %48) #2, !dbg !14
  %81 = tail call i8 asm sideeffect "mov.u16 $0, 0x0;\0A\09@$2 ld.global.b8 { $0 }, [ $1 + 0 ];", "=c,l,b"(ptr addrspace(1) %73, i1 %49) #2, !dbg !14
  %82 = zext i32 %8 to i64, !dbg !14
; CHECK: %{{.+}} = getelementptr i8, i8 addrspace(3)* getelementptr inbounds ([0 x i8], [0 x i8] addrspace(3)* @global_smem, i32 0, i32 0), i64  %{{.+}}, !dbg !14
  %83 = getelementptr i8, ptr addrspace(3) @global_smem, i64 %82, !dbg !14
  %84 = insertelement <1 x i8> undef, i8 %74, i64 0, !dbg !14
  store <1 x i8> %84, ptr addrspace(3) %83, align 1, !dbg !14
  %85 = zext i32 %9 to i64, !dbg !14
  %86 = getelementptr i8, ptr addrspace(3) @global_smem, i64 %85, !dbg !14
  %87 = insertelement <1 x i8> undef, i8 %75, i64 0, !dbg !14
  store <1 x i8> %87, ptr addrspace(3) %86, align 1, !dbg !14
  %88 = zext i32 %10 to i64, !dbg !14
  %89 = getelementptr i8, ptr addrspace(3) @global_smem, i64 %88, !dbg !14
  %90 = insertelement <1 x i8> undef, i8 %76, i64 0, !dbg !14
  store <1 x i8> %90, ptr addrspace(3) %89, align 1, !dbg !14
  %91 = zext i32 %11 to i64, !dbg !14
  %92 = getelementptr i8, ptr addrspace(3) @global_smem, i64 %91, !dbg !14
  %93 = insertelement <1 x i8> undef, i8 %77, i64 0, !dbg !14
  store <1 x i8> %93, ptr addrspace(3) %92, align 1, !dbg !14
  %94 = zext i32 %12 to i64, !dbg !14
  %95 = getelementptr i8, ptr addrspace(3) @global_smem, i64 %94, !dbg !14
  %96 = insertelement <1 x i8> undef, i8 %78, i64 0, !dbg !14
  store <1 x i8> %96, ptr addrspace(3) %95, align 1, !dbg !14
  %97 = zext i32 %13 to i64, !dbg !14
  %98 = getelementptr i8, ptr addrspace(3) @global_smem, i64 %97, !dbg !14
  %99 = insertelement <1 x i8> undef, i8 %79, i64 0, !dbg !14
  store <1 x i8> %99, ptr addrspace(3) %98, align 1, !dbg !14
  %100 = zext i32 %14 to i64, !dbg !14
  %101 = getelementptr i8, ptr addrspace(3) @global_smem, i64 %100, !dbg !14
  %102 = insertelement <1 x i8> undef, i8 %80, i64 0, !dbg !14
  store <1 x i8> %102, ptr addrspace(3) %101, align 1, !dbg !14
  %103 = zext i32 %15 to i64, !dbg !14
  %104 = getelementptr i8, ptr addrspace(3) @global_smem, i64 %103, !dbg !14
  %105 = insertelement <1 x i8> undef, i8 %81, i64 0, !dbg !14
  store <1 x i8> %105, ptr addrspace(3) %104, align 1, !dbg !14
  tail call void @llvm.nvvm.barrier0(), !dbg !14
  %106 = zext i32 %16 to i64, !dbg !14
  %107 = getelementptr i8, ptr addrspace(3) @global_smem, i64 %106, !dbg !14
  %108 = load i8, ptr addrspace(3) %107, align 1, !dbg !14
  %109 = zext i32 %17 to i64, !dbg !14
  %110 = getelementptr i8, ptr addrspace(3) @global_smem, i64 %109, !dbg !14
  %111 = load i8, ptr addrspace(3) %110, align 1, !dbg !14
  %112 = zext i32 %18 to i64, !dbg !14
  %113 = getelementptr i8, ptr addrspace(3) @global_smem, i64 %112, !dbg !14
  %114 = load i8, ptr addrspace(3) %113, align 1, !dbg !14
  %115 = zext i32 %19 to i64, !dbg !14
  %116 = getelementptr i8, ptr addrspace(3) @global_smem, i64 %115, !dbg !14
  %117 = load i8, ptr addrspace(3) %116, align 1, !dbg !14
  %118 = zext i32 %20 to i64, !dbg !14
  %119 = getelementptr i8, ptr addrspace(3) @global_smem, i64 %118, !dbg !14
  %120 = load i8, ptr addrspace(3) %119, align 1, !dbg !14
  %121 = zext i32 %21 to i64, !dbg !14
  %122 = getelementptr i8, ptr addrspace(3) @global_smem, i64 %121, !dbg !14
  %123 = load i8, ptr addrspace(3) %122, align 1, !dbg !14
  %124 = zext i32 %22 to i64, !dbg !14
  %125 = getelementptr i8, ptr addrspace(3) @global_smem, i64 %124, !dbg !14
  %126 = load i8, ptr addrspace(3) %125, align 1, !dbg !14
  %127 = zext i32 %23 to i64, !dbg !14
  %128 = getelementptr i8, ptr addrspace(3) @global_smem, i64 %127, !dbg !14
  %129 = load i8, ptr addrspace(3) %128, align 1, !dbg !14
  %130 = sext i32 %34 to i64, !dbg !15
  %131 = getelementptr float, ptr addrspace(1) %1, i64 %130, !dbg !15
  %132 = sext i32 %35 to i64, !dbg !15
  %133 = getelementptr float, ptr addrspace(1) %1, i64 %132, !dbg !15
  %134 = sext i32 %36 to i64, !dbg !15
  %135 = getelementptr float, ptr addrspace(1) %1, i64 %134, !dbg !15
  %136 = sext i32 %37 to i64, !dbg !15
  %137 = getelementptr float, ptr addrspace(1) %1, i64 %136, !dbg !15
  %138 = sext i32 %38 to i64, !dbg !15
  %139 = getelementptr float, ptr addrspace(1) %1, i64 %138, !dbg !15
  %140 = sext i32 %39 to i64, !dbg !15
  %141 = getelementptr float, ptr addrspace(1) %1, i64 %140, !dbg !15
  %142 = sext i32 %40 to i64, !dbg !15
  %143 = getelementptr float, ptr addrspace(1) %1, i64 %142, !dbg !15
  %144 = sext i32 %41 to i64, !dbg !15
  %145 = getelementptr float, ptr addrspace(1) %1, i64 %144, !dbg !15
  %146 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %131, i1 %50) #2, !dbg !16
  %147 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %133, i1 %51) #2, !dbg !16
  %148 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %135, i1 %52) #2, !dbg !16
  %149 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %137, i1 %53) #2, !dbg !16
  %150 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %139, i1 %54) #2, !dbg !16
  %151 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %141, i1 %55) #2, !dbg !16
  %152 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %143, i1 %56) #2, !dbg !16
  %153 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %145, i1 %57) #2, !dbg !16
  %154 = getelementptr float, ptr addrspace(1) %2, i64 %130, !dbg !17
  %155 = getelementptr float, ptr addrspace(1) %2, i64 %132, !dbg !17
  %156 = getelementptr float, ptr addrspace(1) %2, i64 %134, !dbg !17
  %157 = getelementptr float, ptr addrspace(1) %2, i64 %136, !dbg !17
  %158 = getelementptr float, ptr addrspace(1) %2, i64 %138, !dbg !17
  %159 = getelementptr float, ptr addrspace(1) %2, i64 %140, !dbg !17
  %160 = getelementptr float, ptr addrspace(1) %2, i64 %142, !dbg !17
  %161 = getelementptr float, ptr addrspace(1) %2, i64 %144, !dbg !17
  %162 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %154, i1 %50) #2, !dbg !18
  %163 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %155, i1 %51) #2, !dbg !18
  %164 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %156, i1 %52) #2, !dbg !18
  %165 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %157, i1 %53) #2, !dbg !18
  %166 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %158, i1 %54) #2, !dbg !18
  %167 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %159, i1 %55) #2, !dbg !18
  %168 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %160, i1 %56) #2, !dbg !18
  %169 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %161, i1 %57) #2, !dbg !18
  %.not = icmp eq i8 %108, 0, !dbg !19
  %.not1 = icmp eq i8 %111, 0, !dbg !19
  %.not2 = icmp eq i8 %114, 0, !dbg !19
  %.not3 = icmp eq i8 %117, 0, !dbg !19
  %.not4 = icmp eq i8 %120, 0, !dbg !19
  %.not5 = icmp eq i8 %123, 0, !dbg !19
  %.not6 = icmp eq i8 %126, 0, !dbg !19
  %.not7 = icmp eq i8 %129, 0, !dbg !19
  %.v = select i1 %.not, i32 %162, i32 %146, !dbg !19
  %.v8 = select i1 %.not1, i32 %163, i32 %147, !dbg !19
  %.v9 = select i1 %.not2, i32 %164, i32 %148, !dbg !19
  %.v10 = select i1 %.not3, i32 %165, i32 %149, !dbg !19
  %.v11 = select i1 %.not4, i32 %166, i32 %150, !dbg !19
  %.v12 = select i1 %.not5, i32 %167, i32 %151, !dbg !19
  %.v13 = select i1 %.not6, i32 %168, i32 %152, !dbg !19
  %.v14 = select i1 %.not7, i32 %169, i32 %153, !dbg !19
  %170 = getelementptr float, ptr addrspace(1) %3, i64 %130, !dbg !20
  %171 = getelementptr float, ptr addrspace(1) %3, i64 %132, !dbg !20
  %172 = getelementptr float, ptr addrspace(1) %3, i64 %134, !dbg !20
  %173 = getelementptr float, ptr addrspace(1) %3, i64 %136, !dbg !20
  %174 = getelementptr float, ptr addrspace(1) %3, i64 %138, !dbg !20
  %175 = getelementptr float, ptr addrspace(1) %3, i64 %140, !dbg !20
  %176 = getelementptr float, ptr addrspace(1) %3, i64 %142, !dbg !20
  %177 = getelementptr float, ptr addrspace(1) %3, i64 %144, !dbg !20
  tail call void asm sideeffect "@$2 st.global.b32 [ $1 + 0 ], { $0 };", "r,l,b"(i32 %.v, ptr addrspace(1) %170, i1 %50) #2, !dbg !21
  tail call void asm sideeffect "@$2 st.global.b32 [ $1 + 0 ], { $0 };", "r,l,b"(i32 %.v8, ptr addrspace(1) %171, i1 %51) #2, !dbg !21
  tail call void asm sideeffect "@$2 st.global.b32 [ $1 + 0 ], { $0 };", "r,l,b"(i32 %.v9, ptr addrspace(1) %172, i1 %52) #2, !dbg !21
  tail call void asm sideeffect "@$2 st.global.b32 [ $1 + 0 ], { $0 };", "r,l,b"(i32 %.v10, ptr addrspace(1) %173, i1 %53) #2, !dbg !21
  tail call void asm sideeffect "@$2 st.global.b32 [ $1 + 0 ], { $0 };", "r,l,b"(i32 %.v11, ptr addrspace(1) %174, i1 %54) #2, !dbg !21
  tail call void asm sideeffect "@$2 st.global.b32 [ $1 + 0 ], { $0 };", "r,l,b"(i32 %.v12, ptr addrspace(1) %175, i1 %55) #2, !dbg !21
  tail call void asm sideeffect "@$2 st.global.b32 [ $1 + 0 ], { $0 };", "r,l,b"(i32 %.v13, ptr addrspace(1) %176, i1 %56) #2, !dbg !21
  tail call void asm sideeffect "@$2 st.global.b32 [ $1 + 0 ], { $0 };", "r,l,b"(i32 %.v14, ptr addrspace(1) %177, i1 %57) #2, !dbg !21
  ret void, !dbg !22
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #1

attributes #0 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { convergent nocallback nounwind }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.dbg.cu = !{!1}
!nvvm.annotations = !{!3, !4, !4, !3}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = distinct !DICompileUnit(language: DW_LANG_C, file: !2, producer: "triton", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!2 = !DIFile(filename: "test_core.py", directory: "/ppuswhome/xiao.han/workspace/triton/python/test/unit/language")
!3 = !{ptr @where_kernel_0d1d2d3d4, !"kernel", i32 1}
!4 = !{ptr @where_kernel_0d1d2d3d4, !"maxntidx", i32 128}
!5 = distinct !DISubprogram(name: "where_kernel_0d1d2d3d4", linkageName: "where_kernel_0d1d2d3d4", scope: !2, file: !2, line: 609, type: !6, scopeLine: 609, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !1)
!6 = !DISubroutineType(cc: DW_CC_normal, types: !7)
!7 = !{}
!8 = !DILocation(line: 613, column: 64, scope: !5)
!9 = !DILocation(line: 613, column: 28, scope: !5)
!10 = !DILocation(line: 613, column: 38, scope: !5)
!11 = !DILocation(line: 613, column: 51, scope: !5)
!12 = !DILocation(line: 614, column: 21, scope: !5)
!13 = !DILocation(line: 615, column: 32, scope: !5)
!14 = !DILocation(line: 615, column: 21, scope: !5)
!15 = !DILocation(line: 624, column: 32, scope: !5)
!16 = !DILocation(line: 624, column: 24, scope: !5)
!17 = !DILocation(line: 625, column: 32, scope: !5)
!18 = !DILocation(line: 625, column: 24, scope: !5)
!19 = !DILocation(line: 626, column: 37, scope: !5)
!20 = !DILocation(line: 627, column: 26, scope: !5)
!21 = !DILocation(line: 627, column: 35, scope: !5)
!22 = !DILocation(line: 627, column: 4, scope: !5)
