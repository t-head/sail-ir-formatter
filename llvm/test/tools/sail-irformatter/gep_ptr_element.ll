; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@global_smem = external local_unnamed_addr addrspace(3) global [0 x i8]

; CHECK-LABLE: triton__0d1d2d3d_6c09fc585c9bf4e045593a198ea4e581_4_1
define void @triton__0d1d2d3d_6c09fc585c9bf4e045593a198ea4e581_4_1(ptr addrspace(1) %0, ptr addrspace(1) %1, ptr addrspace(1) %2, i32 %3) local_unnamed_addr !dbg !5 {
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !8
  %6 = and i32 %5, 127, !dbg !8
  %7 = or i32 %6, 128, !dbg !8
  %8 = or i32 %6, 256, !dbg !8
  %9 = or i32 %6, 384, !dbg !8
  %10 = shl nuw nsw i32 %6, 2, !dbg !8
  %11 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !dbg !9
  %12 = shl i32 %11, 9, !dbg !10
  %13 = or i32 %12, %6, !dbg !11
  %14 = or i32 %7, %12, !dbg !11
  %15 = or i32 %8, %12, !dbg !11
  %16 = or i32 %9, %12, !dbg !11
  %17 = or i32 %10, %12, !dbg !11
  %18 = sdiv i32 %13, 128, !dbg !12
  %19 = sdiv i32 %14, 128, !dbg !12
  %20 = sdiv i32 %15, 128, !dbg !12
  %21 = sdiv i32 %16, 128, !dbg !12
  %22 = mul i32 %18, 128
  %.decomposed = sub i32 %13, %22
  %23 = mul i32 %19, 128
  %.decomposed1 = sub i32 %14, %23
  %24 = mul i32 %20, 128
  %.decomposed2 = sub i32 %15, %24
  %25 = mul i32 %21, 128
  %.decomposed3 = sub i32 %16, %25
  %26 = sext i32 %18 to i64, !dbg !13
  ; CHECK: %{{.+}} = getelementptr i64, i64 addrspace(1)* %{{.+}}, i64
  %27 = getelementptr i64,  ptr addrspace(1) %0, i64 %26, !dbg !13
  %28 = sext i32 %19 to i64, !dbg !13
  %29 = getelementptr i64, ptr addrspace(1) %0, i64 %28, !dbg !13
  %30 = sext i32 %20 to i64, !dbg !13
  %31 = getelementptr i64, ptr addrspace(1) %0, i64 %30, !dbg !13
  %32 = sext i32 %21 to i64, !dbg !13
  %33 = getelementptr i64, ptr addrspace(1) %0, i64 %32, !dbg !13
  %34 = tail call i64 asm sideeffect "mov.u64 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b64 { $0 }, [ $1 + 0 ];", "=l,l,b"(ptr addrspace(1) %27, i1 true) #2, !dbg !14
  %35 = tail call i64 asm sideeffect "mov.u64 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b64 { $0 }, [ $1 + 0 ];", "=l,l,b"(ptr addrspace(1) %29, i1 true) #2, !dbg !14
  %36 = tail call i64 asm sideeffect "mov.u64 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b64 { $0 }, [ $1 + 0 ];", "=l,l,b"(ptr addrspace(1) %31, i1 true) #2, !dbg !14
  %37 = tail call i64 asm sideeffect "mov.u64 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b64 { $0 }, [ $1 + 0 ];", "=l,l,b"(ptr addrspace(1) %33, i1 true) #2, !dbg !14
  %38 = sext i32 %17 to i64, !dbg !15
  ; CHECK: %{{.+}} = getelementptr float, float addrspace(1)* %{{.+}}, i64
  %39 = getelementptr float, ptr addrspace(1) %1, i64 %38, !dbg !15
  %40 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l,b"(ptr addrspace(1) %39, i1 true) #2, !dbg !16
  %41 = extractvalue { i32, i32, i32, i32 } %40, 0, !dbg !16
  %42 = extractvalue { i32, i32, i32, i32 } %40, 1, !dbg !16
  %43 = extractvalue { i32, i32, i32, i32 } %40, 2, !dbg !16
  %44 = extractvalue { i32, i32, i32, i32 } %40, 3, !dbg !16
  %45 = zext i32 %10 to i64, !dbg !16
  %46 = getelementptr float, ptr addrspace(3) @global_smem, i64 %45, !dbg !16
  store i32 %41, ptr addrspace(3) %46, align 4, !dbg !16
  %47 = or i32 %10, 1, !dbg !16
  %48 = zext i32 %47 to i64, !dbg !16
  %49 = getelementptr float, ptr addrspace(3) @global_smem, i64 %48, !dbg !16
  store i32 %42, ptr addrspace(3) %49, align 4, !dbg !16
  %50 = or i32 %10, 2, !dbg !16
  %51 = zext i32 %50 to i64, !dbg !16
  %52 = getelementptr float, ptr addrspace(3) @global_smem, i64 %51, !dbg !16
  store i32 %43, ptr addrspace(3) %52, align 4, !dbg !16
  %53 = or i32 %10, 3, !dbg !16
  %54 = zext i32 %53 to i64, !dbg !16
  %55 = getelementptr float, ptr addrspace(3) @global_smem, i64 %54, !dbg !16
  store i32 %44, ptr addrspace(3) %55, align 4, !dbg !16
  tail call void @llvm.nvvm.barrier0(), !dbg !16
  %56 = zext i32 %6 to i64, !dbg !16
  %57 = getelementptr float, ptr addrspace(3) @global_smem, i64 %56, !dbg !16
  %58 = load float, ptr addrspace(3) %57, align 4, !dbg !16
  %59 = zext i32 %7 to i64, !dbg !16
  %60 = getelementptr float, ptr addrspace(3) @global_smem, i64 %59, !dbg !16
  %61 = load float, ptr addrspace(3) %60, align 4, !dbg !16
  %62 = zext i32 %8 to i64, !dbg !16
  %63 = getelementptr float, ptr addrspace(3) @global_smem, i64 %62, !dbg !16
  %64 = load float, ptr addrspace(3) %63, align 4, !dbg !16
  %65 = zext i32 %9 to i64, !dbg !16
  %66 = getelementptr float, ptr addrspace(3) @global_smem, i64 %65, !dbg !16
  %67 = load float, ptr addrspace(3) %66, align 4, !dbg !16
  %68 = add i32 %17, 65536, !dbg !17
  %69 = sext i32 %68 to i64, !dbg !18
  %70 = getelementptr float, ptr addrspace(1) %1, i64 %69, !dbg !18
  %71 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l,b"(ptr addrspace(1) %70, i1 true) #2, !dbg !19
  %72 = extractvalue { i32, i32, i32, i32 } %71, 0, !dbg !19
  %73 = extractvalue { i32, i32, i32, i32 } %71, 1, !dbg !19
  %74 = extractvalue { i32, i32, i32, i32 } %71, 2, !dbg !19
  %75 = extractvalue { i32, i32, i32, i32 } %71, 3, !dbg !19
  tail call void @llvm.nvvm.barrier0(), !dbg !19
  store i32 %72, ptr addrspace(3) %46, align 4, !dbg !19
  store i32 %73, ptr addrspace(3) %49, align 4, !dbg !19
  store i32 %74, ptr addrspace(3) %52, align 4, !dbg !19
  store i32 %75, ptr addrspace(3) %55, align 4, !dbg !19
  tail call void @llvm.nvvm.barrier0(), !dbg !19
  %76 = load float, ptr addrspace(3) %57, align 4, !dbg !19
  %77 = load float, ptr addrspace(3) %60, align 4, !dbg !19
  %78 = load float, ptr addrspace(3) %63, align 4, !dbg !19
  %79 = load float, ptr addrspace(3) %66, align 4, !dbg !19
  %80 = add i32 %17, 131072, !dbg !20
  %81 = sext i32 %80 to i64, !dbg !21
  %82 = getelementptr float, ptr addrspace(1) %1, i64 %81, !dbg !21
  %83 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l,b"(ptr addrspace(1) %82, i1 true) #2, !dbg !22
  %84 = extractvalue { i32, i32, i32, i32 } %83, 0, !dbg !22
  %85 = extractvalue { i32, i32, i32, i32 } %83, 1, !dbg !22
  %86 = extractvalue { i32, i32, i32, i32 } %83, 2, !dbg !22
  %87 = extractvalue { i32, i32, i32, i32 } %83, 3, !dbg !22
  tail call void @llvm.nvvm.barrier0(), !dbg !22
  store i32 %84, ptr addrspace(3) %46, align 4, !dbg !22
  store i32 %85, ptr addrspace(3) %49, align 4, !dbg !22
  store i32 %86, ptr addrspace(3) %52, align 4, !dbg !22
  store i32 %87, ptr addrspace(3) %55, align 4, !dbg !22
  tail call void @llvm.nvvm.barrier0(), !dbg !22
  %88 = load float, ptr addrspace(3) %57, align 4, !dbg !22
  %89 = load float, ptr addrspace(3) %60, align 4, !dbg !22
  %90 = load float, ptr addrspace(3) %63, align 4, !dbg !22
  %91 = load float, ptr addrspace(3) %66, align 4, !dbg !22
  %92 = add i32 %17, 196608, !dbg !23
  %93 = sext i32 %92 to i64, !dbg !24
  %94 = getelementptr float, ptr addrspace(1) %1, i64 %93, !dbg !24
  %95 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l,b"(ptr addrspace(1) %94, i1 true) #2, !dbg !25
  %96 = extractvalue { i32, i32, i32, i32 } %95, 0, !dbg !25
  %97 = extractvalue { i32, i32, i32, i32 } %95, 1, !dbg !25
  %98 = extractvalue { i32, i32, i32, i32 } %95, 2, !dbg !25
  %99 = extractvalue { i32, i32, i32, i32 } %95, 3, !dbg !25
  tail call void @llvm.nvvm.barrier0(), !dbg !25
  store i32 %96, ptr addrspace(3) %46, align 4, !dbg !25
  store i32 %97, ptr addrspace(3) %49, align 4, !dbg !25
  store i32 %98, ptr addrspace(3) %52, align 4, !dbg !25
  store i32 %99, ptr addrspace(3) %55, align 4, !dbg !25
  tail call void @llvm.nvvm.barrier0(), !dbg !25
  %100 = load float, ptr addrspace(3) %57, align 4, !dbg !25
  %101 = load float, ptr addrspace(3) %60, align 4, !dbg !25
  %102 = load float, ptr addrspace(3) %63, align 4, !dbg !25
  %103 = load float, ptr addrspace(3) %66, align 4, !dbg !25
  %104 = icmp slt i64 %34, 0, !dbg !26
  %105 = icmp slt i64 %35, 0, !dbg !26
  %106 = icmp slt i64 %36, 0, !dbg !26
  %107 = icmp slt i64 %37, 0, !dbg !26
  %108 = icmp eq i64 %34, -1, !dbg !27
  %109 = icmp eq i64 %35, -1, !dbg !27
  %110 = icmp eq i64 %36, -1, !dbg !27
  %111 = icmp eq i64 %37, -1, !dbg !27
  %112 = fadd float %58, %76, !dbg !28
  %113 = fadd float %61, %77, !dbg !28
  %114 = fadd float %64, %78, !dbg !28
  %115 = fadd float %67, %79, !dbg !28
  %116 = fadd float %112, %88, !dbg !29
  %117 = fadd float %113, %89, !dbg !29
  %118 = fadd float %114, %90, !dbg !29
  %119 = fadd float %115, %91, !dbg !29
  %120 = fadd float %116, %100, !dbg !30
  %121 = fadd float %117, %101, !dbg !30
  %122 = fadd float %118, %102, !dbg !30
  %123 = fadd float %119, %103, !dbg !30
  %124 = select i1 %108, float 0.000000e+00, float %120, !dbg !31
  %125 = select i1 %109, float 0.000000e+00, float %121, !dbg !31
  %126 = select i1 %110, float 0.000000e+00, float %122, !dbg !31
  %127 = select i1 %111, float 0.000000e+00, float %123, !dbg !31
  %128 = shl i64 %34, 7, !dbg !32
  %129 = add i64 %128, 65536, !dbg !32
  %130 = select i1 %104, i64 %129, i64 %128, !dbg !32
  %131 = shl i64 %35, 7, !dbg !32
  %132 = add i64 %131, 65536, !dbg !32
  %133 = select i1 %105, i64 %132, i64 %131, !dbg !32
  %134 = shl i64 %36, 7, !dbg !32
  %135 = add i64 %134, 65536, !dbg !32
  %136 = select i1 %106, i64 %135, i64 %134, !dbg !32
  %137 = shl i64 %37, 7, !dbg !32
  %138 = add i64 %137, 65536, !dbg !32
  %139 = select i1 %107, i64 %138, i64 %137, !dbg !32
  %140 = sext i32 %.decomposed to i64, !dbg !33
  %141 = sext i32 %.decomposed1 to i64, !dbg !33
  %142 = sext i32 %.decomposed2 to i64, !dbg !33
  %143 = sext i32 %.decomposed3 to i64, !dbg !33
  %144 = add i64 %130, %140, !dbg !33
  %145 = add i64 %133, %141, !dbg !33
  %146 = add i64 %136, %142, !dbg !33
  %147 = add i64 %139, %143, !dbg !33
  %148 = getelementptr float, ptr addrspace(1) %2, i64 %144, !dbg !34
  %149 = getelementptr float, ptr addrspace(1) %2, i64 %145, !dbg !34
  %150 = getelementptr float, ptr addrspace(1) %2, i64 %146, !dbg !34
  %151 = getelementptr float, ptr addrspace(1) %2, i64 %147, !dbg !34
  tail call void @llvm.nvvm.barrier0(), !dbg !35
  ; CHECK: %{{.+}} = getelementptr i8 addrspace(1)*, i8 addrspace(1)* addrspace(3)* bitcast ([0 x i8] addrspace(3)* @global_smem to i8 addrspace(1)* addrspace(3)*), i64
  %152 = getelementptr ptr addrspace(1), ptr addrspace(3) @global_smem, i64 %56, !dbg !35
  ; CHECK: %{{.+}} = ptrtoint i8 addrspace(1)* %{{.+}} to i64
  %153 = ptrtoint ptr addrspace(1) %148 to i64, !dbg !35
  %154 = insertelement <1 x i64> undef, i64 %153, i64 0, !dbg !35
  store <1 x i64> %154, ptr addrspace(3) %152, align 8, !dbg !35
  %155 = getelementptr ptr addrspace(1), ptr addrspace(3) @global_smem, i64 %59, !dbg !35
  %156 = ptrtoint ptr addrspace(1) %149 to i64, !dbg !35
  %157 = insertelement <1 x i64> undef, i64 %156, i64 0, !dbg !35
  store <1 x i64> %157, ptr addrspace(3) %155, align 8, !dbg !35
  %158 = getelementptr ptr addrspace(1), ptr addrspace(3) @global_smem, i64 %62, !dbg !35
  %159 = ptrtoint ptr addrspace(1) %150 to i64, !dbg !35
  %160 = insertelement <1 x i64> undef, i64 %159, i64 0, !dbg !35
  store <1 x i64> %160, ptr addrspace(3) %158, align 8, !dbg !35
  %161 = getelementptr ptr addrspace(1), ptr addrspace(3) @global_smem, i64 %65, !dbg !35
  %162 = ptrtoint ptr addrspace(1) %151 to i64, !dbg !35
  %163 = insertelement <1 x i64> undef, i64 %162, i64 0, !dbg !35
  store <1 x i64> %163, ptr addrspace(3) %161, align 8, !dbg !35
  tail call void @llvm.nvvm.barrier0(), !dbg !35
  %164 = getelementptr ptr addrspace(1), ptr addrspace(3) @global_smem, i64 %45, !dbg !35
  %165 = load i64, ptr addrspace(3) %164, align 8, !dbg !35
  ; CHECK: %{{.+}} = inttoptr i64 %{{.+}} to i8 addrspace(1)*
  %166 = inttoptr i64 %165 to ptr addrspace(1), !dbg !35
  %167 = getelementptr ptr addrspace(1), ptr addrspace(3) @global_smem, i64 %48, !dbg !35
  %168 = load i64, ptr addrspace(3) %167, align 8, !dbg !35
  %169 = inttoptr i64 %168 to ptr addrspace(1), !dbg !35
  %170 = getelementptr ptr addrspace(1), ptr addrspace(3) @global_smem, i64 %51, !dbg !35
  %171 = load i64, ptr addrspace(3) %170, align 8, !dbg !35
  %172 = inttoptr i64 %171 to ptr addrspace(1), !dbg !35
  %173 = getelementptr ptr addrspace(1), ptr addrspace(3) @global_smem, i64 %54, !dbg !35
  %174 = load i64, ptr addrspace(3) %173, align 8, !dbg !35
  %175 = inttoptr i64 %174 to ptr addrspace(1), !dbg !35
  tail call void @llvm.nvvm.barrier0(), !dbg !35
  %176 = insertelement <1 x float> undef, float %124, i64 0, !dbg !35
  store <1 x float> %176, ptr addrspace(3) %57, align 4, !dbg !35
  %177 = insertelement <1 x float> undef, float %125, i64 0, !dbg !35
  store <1 x float> %177, ptr addrspace(3) %60, align 4, !dbg !35
  %178 = insertelement <1 x float> undef, float %126, i64 0, !dbg !35
  store <1 x float> %178, ptr addrspace(3) %63, align 4, !dbg !35
  %179 = insertelement <1 x float> undef, float %127, i64 0, !dbg !35
  store <1 x float> %179, ptr addrspace(3) %66, align 4, !dbg !35
  tail call void @llvm.nvvm.barrier0(), !dbg !35
  %180 = load <1 x float>, ptr addrspace(3) %46, align 4, !dbg !35
  %181 = load <1 x float>, ptr addrspace(3) %49, align 4, !dbg !35
  %182 = load <1 x float>, ptr addrspace(3) %52, align 4, !dbg !35
  %183 = load <1 x float>, ptr addrspace(3) %55, align 4, !dbg !35
  %184 = tail call float asm sideeffect "mov.u32 $0, 0x0;\0A\09@$3 atom.global.gpu.acq_rel.add.f32 $0, [ $1 + 0 ], $2;", "=r,l,r,b"(ptr addrspace(1) %166, <1 x float> %180, i1 true) #2, !dbg !35
  %185 = tail call float asm sideeffect "mov.u32 $0, 0x0;\0A\09@$3 atom.global.gpu.acq_rel.add.f32 $0, [ $1 + 0 ], $2;", "=r,l,r,b"(ptr addrspace(1) %169, <1 x float> %181, i1 true) #2, !dbg !35
  %186 = tail call float asm sideeffect "mov.u32 $0, 0x0;\0A\09@$3 atom.global.gpu.acq_rel.add.f32 $0, [ $1 + 0 ], $2;", "=r,l,r,b"(ptr addrspace(1) %172, <1 x float> %182, i1 true) #2, !dbg !35
  %187 = tail call float asm sideeffect "mov.u32 $0, 0x0;\0A\09@$3 atom.global.gpu.acq_rel.add.f32 $0, [ $1 + 0 ], $2;", "=r,l,r,b"(ptr addrspace(1) %175, <1 x float> %183, i1 true) #2, !dbg !35
  ret void, !dbg !36
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
!2 = !DIFile(filename: "cexdelk6dmmml4c7jidc2bwyjoedohq2j2hpfxbbad2tzzxrhde4.py", directory: "/tmp/tmpdxqvj2b3/ex")
!3 = !{ptr @triton__0d1d2d3d_6c09fc585c9bf4e045593a198ea4e581_4_1, !"kernel", i32 1}
!4 = !{ptr @triton__0d1d2d3d_6c09fc585c9bf4e045593a198ea4e581_4_1, !"maxntidx", i32 128}
!5 = distinct !DISubprogram(name: "triton__0d1d2d3d_6c09fc585c9bf4e045593a198ea4e581_4_1", linkageName: "triton__0d1d2d3d_6c09fc585c9bf4e045593a198ea4e581_4_1", scope: !2, file: !2, line: 12, type: !6, scopeLine: 12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !1)
!6 = !DISubroutineType(cc: DW_CC_normal, types: !7)
!7 = !{}
!8 = !DILocation(line: 15, column: 36, scope: !5)
!9 = !DILocation(line: 14, column: 28, scope: !5)
!10 = !DILocation(line: 14, column: 33, scope: !5)
!11 = !DILocation(line: 15, column: 23, scope: !5)
!12 = !DILocation(line: 17, column: 20, scope: !5)
!13 = !DILocation(line: 20, column: 30, scope: !5)
!14 = !DILocation(line: 20, column: 35, scope: !5)
!15 = !DILocation(line: 21, column: 30, scope: !5)
!16 = !DILocation(line: 21, column: 35, scope: !5)
!17 = !DILocation(line: 22, column: 38, scope: !5)
!18 = !DILocation(line: 22, column: 30, scope: !5)
!19 = !DILocation(line: 22, column: 43, scope: !5)
!20 = !DILocation(line: 23, column: 39, scope: !5)
!21 = !DILocation(line: 23, column: 30, scope: !5)
!22 = !DILocation(line: 23, column: 44, scope: !5)
!23 = !DILocation(line: 24, column: 39, scope: !5)
!24 = !DILocation(line: 24, column: 30, scope: !5)
!25 = !DILocation(line: 24, column: 44, scope: !5)
!26 = !DILocation(line: 25, column: 27, scope: !5)
!27 = !DILocation(line: 27, column: 19, scope: !5)
!28 = !DILocation(line: 28, column: 18, scope: !5)
!29 = !DILocation(line: 29, column: 18, scope: !5)
!30 = !DILocation(line: 30, column: 19, scope: !5)
!31 = !DILocation(line: 32, column: 34, scope: !5)
!32 = !DILocation(line: 33, column: 40, scope: !5)
!33 = !DILocation(line: 33, column: 36, scope: !5)
!34 = !DILocation(line: 33, column: 30, scope: !5)
!35 = !DILocation(line: 33, column: 55, scope: !5)
!36 = !DILocation(line: 33, column: 4, scope: !5)

