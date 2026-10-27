; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@global_smem = external addrspace(3) global [0 x i8], align 16

; CHECK-LABLE: triton_
define void @triton_(ptr addrspace(1) %0, ptr addrspace(1) %1, ptr addrspace(1) %2, ptr addrspace(1) %3, ptr addrspace(1) %4, ptr addrspace(1) %5, ptr addrspace(1) %6, ptr addrspace(1) %7, ptr addrspace(1) %8, i32 %9, i32 %10) local_unnamed_addr !dbg !7 {
  %12 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #3, !dbg !10
  %13 = shl i32 %12, 2, !dbg !11
  %14 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !12
  %15 = lshr i32 %14, 5, !dbg !12
  %16 = lshr i32 %14, 7, !dbg !12
  %.lobit = and i32 %16, 1, !dbg !12
  %17 = or disjoint i32 %.lobit, 2, !dbg !12
  %18 = or disjoint i32 %13, %.lobit, !dbg !13
  %19 = or disjoint i32 %13, %17, !dbg !13
  %20 = or disjoint i32 %13, 1, !dbg !13
  %21 = or disjoint i32 %13, 2, !dbg !13
  %22 = or disjoint i32 %13, 3, !dbg !13
  %23 = icmp slt i32 %18, 4, !dbg !14
  %24 = icmp slt i32 %19, 4, !dbg !14
  %25 = icmp slt i32 %13, 4, !dbg !14
  %26 = icmp slt i32 %20, 4, !dbg !14
  %27 = icmp slt i32 %21, 4, !dbg !14
  %28 = icmp slt i32 %22, 4, !dbg !14
  %29 = and i32 %14, 31, !dbg !15
  %30 = shl i32 %14, 3, !dbg !15
  %31 = and i32 %30, 1016, !dbg !15
  %32 = or disjoint i32 %31, 4, !dbg !15
  %33 = shl i32 %14, 2, !dbg !15
  %34 = and i32 %33, 1020, !dbg !15
  %35 = icmp ult i32 %31, 768, !dbg !16
  %36 = icmp ult i32 %34, 768, !dbg !16
  %37 = mul i32 %18, 768, !dbg !17
  %38 = mul i32 %19, 768, !dbg !17
  %39 = mul i32 %12, 3072, !dbg !17
  %40 = mul i32 %20, 768, !dbg !17
  %41 = mul i32 %21, 768, !dbg !17
  %42 = mul i32 %22, 768, !dbg !17
  %43 = add i32 %37, %31, !dbg !18
  %44 = add i32 %37, %32, !dbg !18
  %45 = add i32 %38, %31, !dbg !18
  %46 = add i32 %38, %32, !dbg !18
  %47 = or disjoint i32 %39, %34, !dbg !18
  %48 = add i32 %40, %34, !dbg !18
  %49 = add i32 %41, %34, !dbg !18
  %50 = add i32 %42, %34, !dbg !18
  %51 = sext i32 %43 to i64, !dbg !19
  %52 = getelementptr half, ptr addrspace(1) %1, i64 %51, !dbg !19
  %53 = sext i32 %45 to i64, !dbg !19
  %54 = getelementptr half, ptr addrspace(1) %1, i64 %53, !dbg !19
  %55 = and i1 %35, %23, !dbg !20
  %56 = and i1 %35, %24, !dbg !20
  %57 = and i1 %36, %25, !dbg !20
  %58 = and i1 %36, %26, !dbg !20
  %59 = and i1 %36, %27, !dbg !20
  %60 = and i1 %36, %28, !dbg !20
  %61 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.L1::evict_last.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];\0A\09@!$7 mov.u32 $0, $6;\0A\09@!$9 mov.u32 $1, $8;\0A\09@!$11 mov.u32 $2, $10;\0A\09@!$13 mov.u32 $3, $12;", "=r,=r,=r,=r,l,b,r,b,r,b,r,b,r,b"(ptr addrspace(1) %52, i1 %55, i32 0, i1 %55, i32 0, i1 %55, i32 0, i1 %55, i32 0, i1 %55) #3, !dbg !21
  %62 = extractvalue { i32, i32, i32, i32 } %61, 0, !dbg !21
  %63 = extractvalue { i32, i32, i32, i32 } %61, 1, !dbg !21
  %64 = extractvalue { i32, i32, i32, i32 } %61, 2, !dbg !21
  %65 = extractvalue { i32, i32, i32, i32 } %61, 3, !dbg !21
  %extelt.offset = lshr i32 %62, 16, !dbg !21
  %extelt.offset1 = lshr i32 %63, 16, !dbg !21
  %extelt.offset2 = lshr i32 %64, 16, !dbg !21
  %extelt.offset3 = lshr i32 %65, 16, !dbg !21
  %66 = insertelement <8 x i32> poison, i32 %62, i64 0, !dbg !21
  %67 = insertelement <8 x i32> %66, i32 %extelt.offset, i64 1, !dbg !21
  %68 = insertelement <8 x i32> %67, i32 %63, i64 2, !dbg !21
  %69 = insertelement <8 x i32> %68, i32 %extelt.offset1, i64 3, !dbg !21
  %70 = insertelement <8 x i32> %69, i32 %64, i64 4, !dbg !21
  %71 = insertelement <8 x i32> %70, i32 %extelt.offset2, i64 5, !dbg !21
  %72 = insertelement <8 x i32> %71, i32 %65, i64 6, !dbg !21
  %73 = insertelement <8 x i32> %72, i32 %extelt.offset3, i64 7, !dbg !21
  %74 = trunc <8 x i32> %73 to <8 x i16>, !dbg !21
  %75 = bitcast <8 x i16> %74 to <8 x half>, !dbg !21
  %76 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.L1::evict_last.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];\0A\09@!$7 mov.u32 $0, $6;\0A\09@!$9 mov.u32 $1, $8;\0A\09@!$11 mov.u32 $2, $10;\0A\09@!$13 mov.u32 $3, $12;", "=r,=r,=r,=r,l,b,r,b,r,b,r,b,r,b"(ptr addrspace(1) %54, i1 %56, i32 0, i1 %56, i32 0, i1 %56, i32 0, i1 %56, i32 0, i1 %56) #3, !dbg !21
  %77 = extractvalue { i32, i32, i32, i32 } %76, 0, !dbg !21
  %78 = extractvalue { i32, i32, i32, i32 } %76, 1, !dbg !21
  %79 = extractvalue { i32, i32, i32, i32 } %76, 2, !dbg !21
  %80 = extractvalue { i32, i32, i32, i32 } %76, 3, !dbg !21
  %extelt.offset4 = lshr i32 %77, 16, !dbg !21
  %extelt.offset5 = lshr i32 %78, 16, !dbg !21
  %extelt.offset6 = lshr i32 %79, 16, !dbg !21
  %extelt.offset7 = lshr i32 %80, 16, !dbg !21
  %81 = insertelement <8 x i32> poison, i32 %77, i64 0, !dbg !21
  %82 = insertelement <8 x i32> %81, i32 %extelt.offset4, i64 1, !dbg !21
  %83 = insertelement <8 x i32> %82, i32 %78, i64 2, !dbg !21
  %84 = insertelement <8 x i32> %83, i32 %extelt.offset5, i64 3, !dbg !21
  %85 = insertelement <8 x i32> %84, i32 %79, i64 4, !dbg !21
  %86 = insertelement <8 x i32> %85, i32 %extelt.offset6, i64 5, !dbg !21
  %87 = insertelement <8 x i32> %86, i32 %80, i64 6, !dbg !21
  %88 = insertelement <8 x i32> %87, i32 %extelt.offset7, i64 7, !dbg !21
  %89 = trunc <8 x i32> %88 to <8 x i16>, !dbg !21
  %90 = bitcast <8 x i16> %89 to <8 x half>, !dbg !21
  %91 = extractelement <8 x half> %75, i64 0, !dbg !22
  %92 = fpext half %91 to float, !dbg !22
  %93 = extractelement <8 x half> %75, i64 1, !dbg !22
  %94 = fpext half %93 to float, !dbg !22
  %95 = extractelement <8 x half> %90, i64 0, !dbg !22
  %96 = fpext half %95 to float, !dbg !22
  %97 = extractelement <8 x half> %90, i64 1, !dbg !22
  %98 = fpext half %97 to float, !dbg !22
  %99 = and i32 %15, 3, !dbg !22
  %100 = mul nuw nsw i32 %.lobit, 1032, !dbg !22
  %101 = add nuw nsw i32 %100, %31, !dbg !22
  %102 = zext nneg i32 %101 to i64, !dbg !22
  %103 = getelementptr half, ptr addrspace(3) @global_smem, i64 %102, !dbg !22
  store <8 x i16> %74, ptr addrspace(3) %103, align 16, !dbg !22
  tail call void @llvm.nvvm.barrier0(), !dbg !22
  %104 = and i32 %15, 7, !dbg !22
  %105 = zext nneg i32 %34 to i64, !dbg !22
  %106 = getelementptr half, ptr addrspace(3) @global_smem, i64 %105, !dbg !22
  %107 = getelementptr inbounds i8, ptr addrspace(3) %106, i64 4, !dbg !22
  %108 = load half, ptr addrspace(3) %107, align 4, !dbg !22
  %109 = getelementptr inbounds i8, ptr addrspace(3) %106, i64 6, !dbg !22
  %110 = load half, ptr addrspace(3) %109, align 2, !dbg !22
  %111 = add nuw nsw i32 %34, 1032, !dbg !22
  %112 = zext nneg i32 %111 to i64, !dbg !22
  %113 = getelementptr half, ptr addrspace(3) @global_smem, i64 %112, !dbg !22
  %114 = getelementptr inbounds i8, ptr addrspace(3) %113, i64 4, !dbg !22
  %115 = load half, ptr addrspace(3) %114, align 4, !dbg !22
  %116 = getelementptr inbounds i8, ptr addrspace(3) %113, i64 6, !dbg !22
  %117 = load half, ptr addrspace(3) %116, align 2, !dbg !22
  %118 = fpext half %108 to float, !dbg !22
  %119 = fpext half %110 to float, !dbg !22
  %120 = fpext half %115 to float, !dbg !22
  %121 = fpext half %117 to float, !dbg !22
  %122 = getelementptr float, ptr addrspace(1) %2, i64 %105, !dbg !23
  %123 = getelementptr float, ptr addrspace(1) %3, i64 %51, !dbg !24
  %124 = sext i32 %44 to i64, !dbg !24
  %125 = getelementptr float, ptr addrspace(1) %3, i64 %124, !dbg !24
  %126 = getelementptr float, ptr addrspace(1) %3, i64 %53, !dbg !24
  %127 = sext i32 %46 to i64, !dbg !24
  %128 = getelementptr float, ptr addrspace(1) %3, i64 %127, !dbg !24
  %129 = getelementptr float, ptr addrspace(3) @global_smem, i64 %105, !dbg !25
  %130 = zext nneg i32 %31 to i64, !dbg !25
  %131 = getelementptr float, ptr addrspace(3) @global_smem, i64 %130, !dbg !25
  %132 = getelementptr inbounds i8, ptr addrspace(3) %131, i64 4, !dbg !25
  %133 = getelementptr inbounds i8, ptr addrspace(3) %131, i64 8, !dbg !25
  %134 = getelementptr inbounds i8, ptr addrspace(3) %131, i64 16, !dbg !25
  %135 = getelementptr inbounds i8, ptr addrspace(3) %131, i64 24, !dbg !25
  %136 = load <2 x half>, ptr addrspace(3) %106, align 8, !dbg !22
  %137 = fpext <2 x half> %136 to <2 x float>, !dbg !22
  %138 = load <2 x half>, ptr addrspace(3) %113, align 8, !dbg !22
  %139 = fpext <2 x half> %138 to <2 x float>, !dbg !22
  tail call void @llvm.nvvm.barrier0(), !dbg !22
  store <8 x i16> %89, ptr addrspace(3) %103, align 16, !dbg !22
  tail call void @llvm.nvvm.barrier0(), !dbg !22
  %140 = load half, ptr addrspace(3) %107, align 4, !dbg !22
  %141 = load half, ptr addrspace(3) %109, align 2, !dbg !22
  %142 = load half, ptr addrspace(3) %114, align 4, !dbg !22
  %143 = load half, ptr addrspace(3) %116, align 2, !dbg !22
  %144 = fpext half %140 to float, !dbg !22
  %145 = fpext half %141 to float, !dbg !22
  %146 = fpext half %142 to float, !dbg !22
  %147 = fpext half %143 to float, !dbg !22
  %148 = load <2 x half>, ptr addrspace(3) %106, align 8, !dbg !22
  %149 = fpext <2 x half> %148 to <2 x float>, !dbg !22
  %150 = load <2 x half>, ptr addrspace(3) %113, align 8, !dbg !22
  %151 = fpext <2 x half> %150 to <2 x float>, !dbg !22
  %152 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.L1::evict_last.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];\0A\09@!$7 mov.u32 $0, $6;\0A\09@!$9 mov.u32 $1, $8;\0A\09@!$11 mov.u32 $2, $10;\0A\09@!$13 mov.u32 $3, $12;", "=r,=r,=r,=r,l,b,r,b,r,b,r,b,r,b"(ptr addrspace(1) %122, i1 %36, i32 0, i1 %36, i32 0, i1 %36, i32 0, i1 %36, i32 0, i1 %36) #3, !dbg !26
  %153 = extractvalue { i32, i32, i32, i32 } %152, 0, !dbg !26
  %154 = extractvalue { i32, i32, i32, i32 } %152, 1, !dbg !26
  %155 = extractvalue { i32, i32, i32, i32 } %152, 2, !dbg !26
  %156 = extractvalue { i32, i32, i32, i32 } %152, 3, !dbg !26
  %157 = insertelement <2 x i32> poison, i32 %153, i64 0, !dbg !26
  %158 = insertelement <2 x i32> %157, i32 %154, i64 1, !dbg !26
  %159 = bitcast <2 x i32> %158 to <2 x float>, !dbg !26
  %160 = bitcast i32 %155 to float, !dbg !26
  %161 = bitcast i32 %156 to float, !dbg !26
  %162 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.L1::evict_last.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];\0A\09@!$7 mov.u32 $0, $6;\0A\09@!$9 mov.u32 $1, $8;\0A\09@!$11 mov.u32 $2, $10;\0A\09@!$13 mov.u32 $3, $12;", "=r,=r,=r,=r,l,b,r,b,r,b,r,b,r,b"(ptr addrspace(1) %123, i1 %55, i32 0, i1 %55, i32 0, i1 %55, i32 0, i1 %55, i32 0, i1 %55) #3, !dbg !27
  %163 = extractvalue { i32, i32, i32, i32 } %162, 0, !dbg !27
  %164 = extractvalue { i32, i32, i32, i32 } %162, 1, !dbg !27
  %165 = extractvalue { i32, i32, i32, i32 } %162, 2, !dbg !27
  %166 = extractvalue { i32, i32, i32, i32 } %162, 3, !dbg !27
  %167 = bitcast i32 %163 to float, !dbg !27
  %168 = bitcast i32 %164 to float, !dbg !27
  %169 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.L1::evict_last.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];\0A\09@!$7 mov.u32 $0, $6;\0A\09@!$9 mov.u32 $1, $8;\0A\09@!$11 mov.u32 $2, $10;\0A\09@!$13 mov.u32 $3, $12;", "=r,=r,=r,=r,l,b,r,b,r,b,r,b,r,b"(ptr addrspace(1) %125, i1 %55, i32 0, i1 %55, i32 0, i1 %55, i32 0, i1 %55, i32 0, i1 %55) #3, !dbg !27
  %170 = extractvalue { i32, i32, i32, i32 } %169, 0, !dbg !27
  %171 = extractvalue { i32, i32, i32, i32 } %169, 1, !dbg !27
  %172 = extractvalue { i32, i32, i32, i32 } %169, 2, !dbg !27
  %173 = extractvalue { i32, i32, i32, i32 } %169, 3, !dbg !27
  %174 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.L1::evict_last.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];\0A\09@!$7 mov.u32 $0, $6;\0A\09@!$9 mov.u32 $1, $8;\0A\09@!$11 mov.u32 $2, $10;\0A\09@!$13 mov.u32 $3, $12;", "=r,=r,=r,=r,l,b,r,b,r,b,r,b,r,b"(ptr addrspace(1) %126, i1 %56, i32 0, i1 %56, i32 0, i1 %56, i32 0, i1 %56, i32 0, i1 %56) #3, !dbg !27
  %175 = extractvalue { i32, i32, i32, i32 } %174, 0, !dbg !27
  %176 = extractvalue { i32, i32, i32, i32 } %174, 1, !dbg !27
  %177 = extractvalue { i32, i32, i32, i32 } %174, 2, !dbg !27
  %178 = extractvalue { i32, i32, i32, i32 } %174, 3, !dbg !27
  %179 = bitcast i32 %175 to float, !dbg !27
  %180 = bitcast i32 %176 to float, !dbg !27
  %181 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.L1::evict_last.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];\0A\09@!$7 mov.u32 $0, $6;\0A\09@!$9 mov.u32 $1, $8;\0A\09@!$11 mov.u32 $2, $10;\0A\09@!$13 mov.u32 $3, $12;", "=r,=r,=r,=r,l,b,r,b,r,b,r,b,r,b"(ptr addrspace(1) %128, i1 %56, i32 0, i1 %56, i32 0, i1 %56, i32 0, i1 %56, i32 0, i1 %56) #3, !dbg !27
  %182 = extractvalue { i32, i32, i32, i32 } %181, 0, !dbg !27
  %183 = extractvalue { i32, i32, i32, i32 } %181, 1, !dbg !27
  %184 = extractvalue { i32, i32, i32, i32 } %181, 2, !dbg !27
  %185 = extractvalue { i32, i32, i32, i32 } %181, 3, !dbg !27
  tail call void @llvm.nvvm.barrier0(), !dbg !25
  %186 = shufflevector <2 x float> %159, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>, !dbg !25
  %187 = insertelement <4 x float> %186, float %160, i64 2, !dbg !25
  %188 = insertelement <4 x float> %187, float %161, i64 3, !dbg !25
  store <4 x float> %188, ptr addrspace(3) %129, align 16, !dbg !25
  tail call void @llvm.nvvm.barrier0(), !dbg !25
  %189 = load float, ptr addrspace(3) %131, align 32, !dbg !25
  %190 = load float, ptr addrspace(3) %132, align 4, !dbg !25
  %191 = fmul float %189, %92, !dbg !25
  %192 = fmul float %190, %94, !dbg !25
  %193 = fmul float %189, %96, !dbg !25
  %194 = fmul float %190, %98, !dbg !25
  %195 = fmul <2 x float> %137, %159, !dbg !25
  %196 = fmul float %118, %160, !dbg !25
  %197 = fmul float %119, %161, !dbg !25
  %198 = fmul <2 x float> %139, %159, !dbg !25
  %199 = fmul float %120, %160, !dbg !25
  %200 = fmul float %121, %161, !dbg !25
  %201 = fmul <2 x float> %149, %159, !dbg !25
  %202 = fmul float %144, %160, !dbg !25
  %203 = fmul float %145, %161, !dbg !25
  %204 = fmul <2 x float> %151, %159, !dbg !25
  %205 = fmul float %146, %160, !dbg !25
  %206 = fmul float %147, %161, !dbg !25
  %207 = fadd <2 x float> %195, zeroinitializer, !dbg !28
  %208 = fadd float %196, 0.000000e+00, !dbg !28
  %209 = fadd float %197, 0.000000e+00, !dbg !28
  %210 = fadd <2 x float> %198, zeroinitializer, !dbg !28
  %211 = fadd float %199, 0.000000e+00, !dbg !28
  %212 = fadd float %200, 0.000000e+00, !dbg !28
  %213 = fadd <2 x float> %201, zeroinitializer, !dbg !28
  %214 = fadd float %202, 0.000000e+00, !dbg !28
  %215 = fadd float %203, 0.000000e+00, !dbg !28
  %216 = fadd <2 x float> %204, zeroinitializer, !dbg !28
  %217 = fadd float %205, 0.000000e+00, !dbg !28
  %218 = fadd float %206, 0.000000e+00, !dbg !28
  %219 = fmul float %191, %167, !dbg !29
  %220 = fmul float %192, %168, !dbg !29
  %221 = fmul float %193, %179, !dbg !29
  %222 = fmul float %194, %180, !dbg !29
  %223 = fadd float %219, 0.000000e+00, !dbg !30
  %224 = fadd float %220, 0.000000e+00, !dbg !30
  %225 = shufflevector <8 x half> %75, <8 x half> poison, <2 x i32> <i32 2, i32 3>, !dbg !22
  %226 = fpext <2 x half> %225 to <2 x float>, !dbg !22
  %227 = insertelement <2 x i32> poison, i32 %165, i64 0, !dbg !27
  %228 = insertelement <2 x i32> %227, i32 %166, i64 1, !dbg !27
  %229 = bitcast <2 x i32> %228 to <2 x float>, !dbg !27
  %230 = load <2 x float>, ptr addrspace(3) %133, align 8, !dbg !25
  %231 = fmul <2 x float> %230, %226, !dbg !25
  %232 = fmul <2 x float> %231, %229, !dbg !29
  %233 = fadd <2 x float> %232, zeroinitializer, !dbg !30
  %234 = shufflevector <8 x half> %75, <8 x half> poison, <2 x i32> <i32 4, i32 5>, !dbg !22
  %235 = fpext <2 x half> %234 to <2 x float>, !dbg !22
  %236 = insertelement <2 x i32> poison, i32 %170, i64 0, !dbg !27
  %237 = insertelement <2 x i32> %236, i32 %171, i64 1, !dbg !27
  %238 = bitcast <2 x i32> %237 to <2 x float>, !dbg !27
  %239 = load <2 x float>, ptr addrspace(3) %134, align 16, !dbg !25
  %240 = fmul <2 x float> %239, %235, !dbg !25
  %241 = fmul <2 x float> %240, %238, !dbg !29
  %242 = fadd <2 x float> %241, zeroinitializer, !dbg !30
  %243 = shufflevector <8 x half> %75, <8 x half> poison, <2 x i32> <i32 6, i32 7>, !dbg !22
  %244 = fpext <2 x half> %243 to <2 x float>, !dbg !22
  %245 = insertelement <2 x i32> poison, i32 %172, i64 0, !dbg !27
  %246 = insertelement <2 x i32> %245, i32 %173, i64 1, !dbg !27
  %247 = bitcast <2 x i32> %246 to <2 x float>, !dbg !27
  %248 = load <2 x float>, ptr addrspace(3) %135, align 8, !dbg !25
  %249 = shufflevector <2 x float> %248, <2 x float> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %250 = fmul <2 x float> %248, %244, !dbg !25
  %251 = fmul <2 x float> %250, %247, !dbg !29
  %252 = fadd <2 x float> %251, zeroinitializer, !dbg !30
  %253 = fadd float %221, 0.000000e+00, !dbg !30
  %254 = fadd float %222, 0.000000e+00, !dbg !30
  %255 = shufflevector <8 x half> %90, <8 x half> poison, <2 x i32> <i32 2, i32 3>, !dbg !22
  %256 = fpext <2 x half> %255 to <2 x float>, !dbg !22
  %257 = insertelement <2 x i32> poison, i32 %177, i64 0, !dbg !27
  %258 = insertelement <2 x i32> %257, i32 %178, i64 1, !dbg !27
  %259 = bitcast <2 x i32> %258 to <2 x float>, !dbg !27
  %260 = fmul <2 x float> %230, %256, !dbg !25
  %261 = fmul <2 x float> %260, %259, !dbg !29
  %262 = fadd <2 x float> %261, zeroinitializer, !dbg !30
  %263 = shufflevector <8 x half> %90, <8 x half> poison, <2 x i32> <i32 4, i32 5>, !dbg !22
  %264 = fpext <2 x half> %263 to <2 x float>, !dbg !22
  %265 = insertelement <2 x i32> poison, i32 %182, i64 0, !dbg !27
  %266 = insertelement <2 x i32> %265, i32 %183, i64 1, !dbg !27
  %267 = bitcast <2 x i32> %266 to <2 x float>, !dbg !27
  %268 = fmul <2 x float> %239, %264, !dbg !25
  %269 = fmul <2 x float> %268, %267, !dbg !29
  %270 = fadd <2 x float> %269, zeroinitializer, !dbg !30
  %271 = shufflevector <8 x half> %90, <8 x half> poison, <2 x i32> <i32 6, i32 7>, !dbg !22
  %272 = fpext <2 x half> %271 to <2 x float>, !dbg !22
  %273 = insertelement <2 x i32> poison, i32 %184, i64 0, !dbg !27
  %274 = insertelement <2 x i32> %273, i32 %185, i64 1, !dbg !27
  %275 = bitcast <2 x i32> %274 to <2 x float>, !dbg !27
  %276 = fmul <2 x float> %248, %272, !dbg !25
  %277 = fmul <2 x float> %276, %275, !dbg !29
  %278 = fadd <2 x float> %277, zeroinitializer, !dbg !30
  tail call void @llvm.nvvm.barrier0(), !dbg !31
  %shift = shufflevector <2 x float> %207, <2 x float> poison, <2 x i32> <i32 1, i32 poison>, !dbg !35
  %279 = fadd <2 x float> %207, %shift, !dbg !35
  %280 = extractelement <2 x float> %279, i64 0, !dbg !35
  %281 = fadd float %208, %280, !dbg !35
  %282 = fadd float %209, %281, !dbg !35
  %283 = select i1 %57, float %282, float 0.000000e+00, !dbg !35
  %shift47 = shufflevector <2 x float> %210, <2 x float> poison, <2 x i32> <i32 1, i32 poison>, !dbg !35
  %284 = fadd <2 x float> %210, %shift47, !dbg !35
  %285 = extractelement <2 x float> %284, i64 0, !dbg !35
  %286 = fadd float %211, %285, !dbg !35
  %287 = fadd float %212, %286, !dbg !35
  %288 = select i1 %58, float %287, float 0.000000e+00, !dbg !35
  %shift48 = shufflevector <2 x float> %213, <2 x float> poison, <2 x i32> <i32 1, i32 poison>, !dbg !35
  %289 = fadd <2 x float> %213, %shift48, !dbg !35
  %290 = extractelement <2 x float> %289, i64 0, !dbg !35
  %291 = fadd float %214, %290, !dbg !35
  %292 = fadd float %215, %291, !dbg !35
  %293 = select i1 %59, float %292, float 0.000000e+00, !dbg !35
  %shift49 = shufflevector <2 x float> %216, <2 x float> poison, <2 x i32> <i32 1, i32 poison>, !dbg !35
  %294 = fadd <2 x float> %216, %shift49, !dbg !35
  %295 = extractelement <2 x float> %294, i64 0, !dbg !35
  %296 = fadd float %217, %295, !dbg !35
  %297 = fadd float %218, %296, !dbg !35
  %298 = select i1 %60, float %297, float 0.000000e+00, !dbg !35
  %299 = bitcast float %283 to i32, !dbg !31
  %300 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %299, i32 16, i32 31), !dbg !31
  %301 = bitcast i32 %300 to float, !dbg !31
  %302 = fadd float %283, %301, !dbg !35
  %303 = bitcast float %302 to i32, !dbg !31
  %304 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %303, i32 8, i32 31), !dbg !31
  %305 = bitcast i32 %304 to float, !dbg !31
  %306 = fadd float %302, %305, !dbg !35
  %307 = bitcast float %306 to i32, !dbg !31
  %308 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %307, i32 4, i32 31), !dbg !31
  %309 = bitcast i32 %308 to float, !dbg !31
  %310 = fadd float %306, %309, !dbg !35
  %311 = bitcast float %310 to i32, !dbg !31
  %312 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %311, i32 2, i32 31), !dbg !31
  %313 = bitcast i32 %312 to float, !dbg !31
  %314 = fadd float %310, %313, !dbg !35
  %315 = bitcast float %314 to i32, !dbg !31
  %316 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %315, i32 1, i32 31), !dbg !31
  %317 = bitcast i32 %316 to float, !dbg !31
  %318 = fadd float %314, %317, !dbg !35
  %319 = bitcast float %288 to i32, !dbg !31
  %320 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %319, i32 16, i32 31), !dbg !31
  %321 = bitcast i32 %320 to float, !dbg !31
  %322 = fadd float %288, %321, !dbg !35
  %323 = bitcast float %322 to i32, !dbg !31
  %324 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %323, i32 8, i32 31), !dbg !31
  %325 = bitcast i32 %324 to float, !dbg !31
  %326 = fadd float %322, %325, !dbg !35
  %327 = bitcast float %326 to i32, !dbg !31
  %328 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %327, i32 4, i32 31), !dbg !31
  %329 = bitcast i32 %328 to float, !dbg !31
  %330 = fadd float %326, %329, !dbg !35
  %331 = bitcast float %330 to i32, !dbg !31
  %332 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %331, i32 2, i32 31), !dbg !31
  %333 = bitcast i32 %332 to float, !dbg !31
  %334 = fadd float %330, %333, !dbg !35
  %335 = bitcast float %334 to i32, !dbg !31
  %336 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %335, i32 1, i32 31), !dbg !31
  %337 = bitcast i32 %336 to float, !dbg !31
  %338 = fadd float %334, %337, !dbg !35
  %339 = bitcast float %293 to i32, !dbg !31
  %340 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %339, i32 16, i32 31), !dbg !31
  %341 = bitcast i32 %340 to float, !dbg !31
  %342 = fadd float %293, %341, !dbg !35
  %343 = bitcast float %342 to i32, !dbg !31
  %344 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %343, i32 8, i32 31), !dbg !31
  %345 = bitcast i32 %344 to float, !dbg !31
  %346 = fadd float %342, %345, !dbg !35
  %347 = bitcast float %346 to i32, !dbg !31
  %348 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %347, i32 4, i32 31), !dbg !31
  %349 = bitcast i32 %348 to float, !dbg !31
  %350 = fadd float %346, %349, !dbg !35
  %351 = bitcast float %350 to i32, !dbg !31
  %352 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %351, i32 2, i32 31), !dbg !31
  %353 = bitcast i32 %352 to float, !dbg !31
  %354 = fadd float %350, %353, !dbg !35
  %355 = bitcast float %354 to i32, !dbg !31
  %356 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %355, i32 1, i32 31), !dbg !31
  %357 = bitcast i32 %356 to float, !dbg !31
  %358 = fadd float %354, %357, !dbg !35
  %359 = bitcast float %298 to i32, !dbg !31
  %360 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %359, i32 16, i32 31), !dbg !31
  %361 = bitcast i32 %360 to float, !dbg !31
  %362 = fadd float %298, %361, !dbg !35
  %363 = bitcast float %362 to i32, !dbg !31
  %364 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %363, i32 8, i32 31), !dbg !31
  %365 = bitcast i32 %364 to float, !dbg !31
  %366 = fadd float %362, %365, !dbg !35
  %367 = bitcast float %366 to i32, !dbg !31
  %368 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %367, i32 4, i32 31), !dbg !31
  %369 = bitcast i32 %368 to float, !dbg !31
  %370 = fadd float %366, %369, !dbg !35
  %371 = bitcast float %370 to i32, !dbg !31
  %372 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %371, i32 2, i32 31), !dbg !31
  %373 = bitcast i32 %372 to float, !dbg !31
  %374 = fadd float %370, %373, !dbg !35
  %375 = bitcast float %374 to i32, !dbg !31
  %376 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %375, i32 1, i32 31), !dbg !31
  %377 = bitcast i32 %376 to float, !dbg !31
  %378 = fadd float %374, %377, !dbg !35
  %379 = icmp eq i32 %29, 0, !dbg !31
  %380 = zext nneg i32 %104 to i64, !dbg !31
  %381 = getelementptr float, ptr addrspace(3) @global_smem, i64 %380, !dbg !31
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %381, float %318, i1 %379) #3, !dbg !31
  %382 = or disjoint i32 %104, 8, !dbg !31
  %383 = zext nneg i32 %382 to i64, !dbg !31
  %384 = getelementptr float, ptr addrspace(3) @global_smem, i64 %383, !dbg !31
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %384, float %338, i1 %379) #3, !dbg !31
  %385 = or disjoint i32 %104, 16, !dbg !31
  %386 = zext nneg i32 %385 to i64, !dbg !31
  %387 = getelementptr float, ptr addrspace(3) @global_smem, i64 %386, !dbg !31
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %387, float %358, i1 %379) #3, !dbg !31
  %388 = or disjoint i32 %104, 24, !dbg !31
  %389 = zext nneg i32 %388 to i64, !dbg !31
  %390 = getelementptr float, ptr addrspace(3) @global_smem, i64 %389, !dbg !31
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %390, float %378, i1 %379) #3, !dbg !31
  tail call void @llvm.nvvm.barrier0(), !dbg !31
  %391 = icmp slt i32 %14, 32, !dbg !31
  %392 = sext i32 %14 to i64, !dbg !31
  %393 = getelementptr float, ptr addrspace(3) @global_smem, i64 %392, !dbg !31
  %394 = tail call float asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %393, i1 %391) #3, !dbg !31
  %395 = bitcast float %394 to i32, !dbg !31
  %396 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %395, i32 4, i32 31), !dbg !31
  %397 = bitcast i32 %396 to float, !dbg !31
  %398 = fadd float %394, %397, !dbg !35
  %399 = bitcast float %398 to i32, !dbg !31
  %400 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %399, i32 2, i32 31), !dbg !31
  %401 = bitcast i32 %400 to float, !dbg !31
  %402 = fadd float %398, %401, !dbg !35
  %403 = bitcast float %402 to i32, !dbg !31
  %404 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %403, i32 1, i32 31), !dbg !31
  %405 = bitcast i32 %404 to float, !dbg !31
  %406 = fadd float %402, %405, !dbg !35
  %407 = and i32 %14, 7, !dbg !31
  %408 = icmp eq i32 %407, 0, !dbg !31
  %409 = and i1 %391, %408, !dbg !31
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %393, float %406, i1 %409) #3, !dbg !31
  tail call void @llvm.nvvm.barrier0(), !dbg !31
  %410 = load float, ptr addrspace(3) @global_smem, align 16, !dbg !31
  %411 = load float, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32), align 16, !dbg !31
  %412 = load float, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 64), align 16, !dbg !31
  %413 = load float, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 96), align 16, !dbg !31
  tail call void @llvm.nvvm.barrier0(), !dbg !37
  %414 = fadd float %223, %224, !dbg !39
  %415 = extractelement <2 x float> %233, i64 0, !dbg !39
  %416 = fadd float %415, %414, !dbg !39
  %417 = extractelement <2 x float> %233, i64 1, !dbg !39
  %418 = fadd float %417, %416, !dbg !39
  %419 = extractelement <2 x float> %242, i64 0, !dbg !39
  %420 = fadd float %419, %418, !dbg !39
  %421 = extractelement <2 x float> %242, i64 1, !dbg !39
  %422 = fadd float %421, %420, !dbg !39
  %423 = extractelement <2 x float> %252, i64 0, !dbg !39
  %424 = fadd float %423, %422, !dbg !39
  %425 = extractelement <2 x float> %252, i64 1, !dbg !39
  %426 = fadd float %425, %424, !dbg !39
  %427 = select i1 %55, float %426, float 0.000000e+00, !dbg !39
  %428 = fadd float %253, %254, !dbg !39
  %429 = extractelement <2 x float> %262, i64 0, !dbg !39
  %430 = fadd float %429, %428, !dbg !39
  %431 = extractelement <2 x float> %262, i64 1, !dbg !39
  %432 = fadd float %431, %430, !dbg !39
  %433 = extractelement <2 x float> %270, i64 0, !dbg !39
  %434 = fadd float %433, %432, !dbg !39
  %435 = extractelement <2 x float> %270, i64 1, !dbg !39
  %436 = fadd float %435, %434, !dbg !39
  %437 = extractelement <2 x float> %278, i64 0, !dbg !39
  %438 = fadd float %437, %436, !dbg !39
  %439 = extractelement <2 x float> %278, i64 1, !dbg !39
  %440 = fadd float %439, %438, !dbg !39
  %441 = select i1 %56, float %440, float 0.000000e+00, !dbg !39
  %442 = bitcast float %427 to i32, !dbg !37
  %443 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %442, i32 16, i32 31), !dbg !37
  %444 = bitcast i32 %443 to float, !dbg !37
  %445 = fadd float %427, %444, !dbg !39
  %446 = bitcast float %445 to i32, !dbg !37
  %447 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %446, i32 8, i32 31), !dbg !37
  %448 = bitcast i32 %447 to float, !dbg !37
  %449 = fadd float %445, %448, !dbg !39
  %450 = bitcast float %449 to i32, !dbg !37
  %451 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %450, i32 4, i32 31), !dbg !37
  %452 = bitcast i32 %451 to float, !dbg !37
  %453 = fadd float %449, %452, !dbg !39
  %454 = bitcast float %453 to i32, !dbg !37
  %455 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %454, i32 2, i32 31), !dbg !37
  %456 = bitcast i32 %455 to float, !dbg !37
  %457 = fadd float %453, %456, !dbg !39
  %458 = bitcast float %457 to i32, !dbg !37
  %459 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %458, i32 1, i32 31), !dbg !37
  %460 = bitcast i32 %459 to float, !dbg !37
  %461 = fadd float %457, %460, !dbg !39
  %462 = bitcast float %441 to i32, !dbg !37
  %463 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %462, i32 16, i32 31), !dbg !37
  %464 = bitcast i32 %463 to float, !dbg !37
  %465 = fadd float %441, %464, !dbg !39
  %466 = bitcast float %465 to i32, !dbg !37
  %467 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %466, i32 8, i32 31), !dbg !37
  %468 = bitcast i32 %467 to float, !dbg !37
  %469 = fadd float %465, %468, !dbg !39
  %470 = bitcast float %469 to i32, !dbg !37
  %471 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %470, i32 4, i32 31), !dbg !37
  %472 = bitcast i32 %471 to float, !dbg !37
  %473 = fadd float %469, %472, !dbg !39
  %474 = bitcast float %473 to i32, !dbg !37
  %475 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %474, i32 2, i32 31), !dbg !37
  %476 = bitcast i32 %475 to float, !dbg !37
  %477 = fadd float %473, %476, !dbg !39
  %478 = bitcast float %477 to i32, !dbg !37
  %479 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %478, i32 1, i32 31), !dbg !37
  %480 = bitcast i32 %479 to float, !dbg !37
  %481 = fadd float %477, %480, !dbg !39
  %482 = shl nuw nsw i32 %.lobit, 2, !dbg !37
  %483 = or disjoint i32 %482, %99, !dbg !37
  %484 = zext nneg i32 %483 to i64, !dbg !37
  %485 = getelementptr float, ptr addrspace(3) @global_smem, i64 %484, !dbg !37
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %485, float %461, i1 %379) #3, !dbg !37
  %486 = shl nuw nsw i32 %17, 2, !dbg !37
  %487 = or disjoint i32 %486, %99, !dbg !37
  %488 = zext nneg i32 %487 to i64, !dbg !37
  %489 = getelementptr float, ptr addrspace(3) @global_smem, i64 %488, !dbg !37
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %489, float %481, i1 %379) #3, !dbg !37
  tail call void @llvm.nvvm.barrier0(), !dbg !37
  %490 = icmp slt i32 %14, 16, !dbg !37
  %491 = tail call float asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %393, i1 %490) #3, !dbg !37
  %492 = bitcast float %491 to i32, !dbg !37
  %493 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %492, i32 2, i32 31), !dbg !37
  %494 = bitcast i32 %493 to float, !dbg !37
  %495 = fadd float %491, %494, !dbg !39
  %496 = bitcast float %495 to i32, !dbg !37
  %497 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %496, i32 1, i32 31), !dbg !37
  %498 = bitcast i32 %497 to float, !dbg !37
  %499 = fadd float %495, %498, !dbg !39
  %500 = and i32 %14, 3, !dbg !37
  %501 = icmp eq i32 %500, 0, !dbg !37
  %502 = and i1 %490, %501, !dbg !37
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %393, float %499, i1 %502) #3, !dbg !37
  tail call void @llvm.nvvm.barrier0(), !dbg !37
  %503 = zext nneg i32 %482 to i64, !dbg !37
  %504 = getelementptr float, ptr addrspace(3) @global_smem, i64 %503, !dbg !37
  %505 = load float, ptr addrspace(3) %504, align 16, !dbg !37
  %506 = zext nneg i32 %486 to i64, !dbg !37
  %507 = getelementptr float, ptr addrspace(3) @global_smem, i64 %506, !dbg !37
  %508 = load float, ptr addrspace(3) %507, align 16, !dbg !37
  %509 = mul i32 %18, 577, !dbg !40
  %510 = mul i32 %19, 577, !dbg !40
  %511 = sext i32 %509 to i64, !dbg !41
  %512 = getelementptr float, ptr addrspace(1) %4, i64 %511, !dbg !41
  %513 = sext i32 %510 to i64, !dbg !41
  %514 = getelementptr float, ptr addrspace(1) %4, i64 %513, !dbg !41
  %515 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %512, i1 %23) #3, !dbg !42
  %516 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %512, i1 %23) #3, !dbg !42
  %517 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %512, i1 %23) #3, !dbg !42
  %518 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %512, i1 %23) #3, !dbg !42
  %519 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %512, i1 %23) #3, !dbg !42
  %520 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %512, i1 %23) #3, !dbg !42
  %521 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %512, i1 %23) #3, !dbg !42
  %522 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %512, i1 %23) #3, !dbg !42
  %523 = bitcast i32 %522 to float, !dbg !42
  %524 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %514, i1 %24) #3, !dbg !42
  %525 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %514, i1 %24) #3, !dbg !42
  %526 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %514, i1 %24) #3, !dbg !42
  %527 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %514, i1 %24) #3, !dbg !42
  %528 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %514, i1 %24) #3, !dbg !42
  %529 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %514, i1 %24) #3, !dbg !42
  %530 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %514, i1 %24) #3, !dbg !42
  %531 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %514, i1 %24) #3, !dbg !42
  %532 = bitcast i32 %531 to float, !dbg !42
  %533 = sext i32 %18 to i64, !dbg !43
  %534 = getelementptr float, ptr addrspace(1) %6, i64 %533, !dbg !43
  %535 = sext i32 %19 to i64, !dbg !43
  %536 = getelementptr float, ptr addrspace(1) %6, i64 %535, !dbg !43
  %537 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %534, i1 %23) #3, !dbg !44
  %538 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %534, i1 %23) #3, !dbg !44
  %539 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %534, i1 %23) #3, !dbg !44
  %540 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %534, i1 %23) #3, !dbg !44
  %541 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %534, i1 %23) #3, !dbg !44
  %542 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %534, i1 %23) #3, !dbg !44
  %543 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %534, i1 %23) #3, !dbg !44
  %544 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %534, i1 %23) #3, !dbg !44
  %545 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %536, i1 %24) #3, !dbg !44
  %546 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %536, i1 %24) #3, !dbg !44
  %547 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %536, i1 %24) #3, !dbg !44
  %548 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %536, i1 %24) #3, !dbg !44
  %549 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %536, i1 %24) #3, !dbg !44
  %550 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %536, i1 %24) #3, !dbg !44
  %551 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %536, i1 %24) #3, !dbg !44
  %552 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %536, i1 %24) #3, !dbg !44
  %553 = getelementptr float, ptr addrspace(1) %0, i64 %51, !dbg !45
  %554 = getelementptr float, ptr addrspace(1) %0, i64 %124, !dbg !45
  %555 = getelementptr float, ptr addrspace(1) %0, i64 %53, !dbg !45
  %556 = getelementptr float, ptr addrspace(1) %0, i64 %127, !dbg !45
  %557 = sext i32 %47 to i64, !dbg !45
  %558 = getelementptr float, ptr addrspace(1) %0, i64 %557, !dbg !45
  %559 = sext i32 %48 to i64, !dbg !45
  %560 = getelementptr float, ptr addrspace(1) %0, i64 %559, !dbg !45
  %561 = sext i32 %49 to i64, !dbg !45
  %562 = getelementptr float, ptr addrspace(1) %0, i64 %561, !dbg !45
  %563 = sext i32 %50 to i64, !dbg !45
  %564 = getelementptr float, ptr addrspace(1) %0, i64 %563, !dbg !45
  %565 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.L1::evict_first.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];\0A\09@!$7 mov.u32 $0, $6;\0A\09@!$9 mov.u32 $1, $8;\0A\09@!$11 mov.u32 $2, $10;\0A\09@!$13 mov.u32 $3, $12;", "=r,=r,=r,=r,l,b,r,b,r,b,r,b,r,b"(ptr addrspace(1) %553, i1 %55, i32 0, i1 %55, i32 0, i1 %55, i32 0, i1 %55, i32 0, i1 %55) #3, !dbg !46
  %566 = extractvalue { i32, i32, i32, i32 } %565, 0, !dbg !46
  %567 = extractvalue { i32, i32, i32, i32 } %565, 1, !dbg !46
  %568 = extractvalue { i32, i32, i32, i32 } %565, 2, !dbg !46
  %569 = extractvalue { i32, i32, i32, i32 } %565, 3, !dbg !46
  %570 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.L1::evict_first.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];\0A\09@!$7 mov.u32 $0, $6;\0A\09@!$9 mov.u32 $1, $8;\0A\09@!$11 mov.u32 $2, $10;\0A\09@!$13 mov.u32 $3, $12;", "=r,=r,=r,=r,l,b,r,b,r,b,r,b,r,b"(ptr addrspace(1) %554, i1 %55, i32 0, i1 %55, i32 0, i1 %55, i32 0, i1 %55, i32 0, i1 %55) #3, !dbg !46
  %571 = extractvalue { i32, i32, i32, i32 } %570, 0, !dbg !46
  %572 = extractvalue { i32, i32, i32, i32 } %570, 1, !dbg !46
  %573 = extractvalue { i32, i32, i32, i32 } %570, 2, !dbg !46
  %574 = extractvalue { i32, i32, i32, i32 } %570, 3, !dbg !46
  %575 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.L1::evict_first.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];\0A\09@!$7 mov.u32 $0, $6;\0A\09@!$9 mov.u32 $1, $8;\0A\09@!$11 mov.u32 $2, $10;\0A\09@!$13 mov.u32 $3, $12;", "=r,=r,=r,=r,l,b,r,b,r,b,r,b,r,b"(ptr addrspace(1) %555, i1 %56, i32 0, i1 %56, i32 0, i1 %56, i32 0, i1 %56, i32 0, i1 %56) #3, !dbg !46
  %576 = extractvalue { i32, i32, i32, i32 } %575, 0, !dbg !46
  %577 = extractvalue { i32, i32, i32, i32 } %575, 1, !dbg !46
  %578 = extractvalue { i32, i32, i32, i32 } %575, 2, !dbg !46
  %579 = extractvalue { i32, i32, i32, i32 } %575, 3, !dbg !46
  %580 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.L1::evict_first.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];\0A\09@!$7 mov.u32 $0, $6;\0A\09@!$9 mov.u32 $1, $8;\0A\09@!$11 mov.u32 $2, $10;\0A\09@!$13 mov.u32 $3, $12;", "=r,=r,=r,=r,l,b,r,b,r,b,r,b,r,b"(ptr addrspace(1) %556, i1 %56, i32 0, i1 %56, i32 0, i1 %56, i32 0, i1 %56, i32 0, i1 %56) #3, !dbg !46
  %581 = extractvalue { i32, i32, i32, i32 } %580, 0, !dbg !46
  %582 = extractvalue { i32, i32, i32, i32 } %580, 1, !dbg !46
  %583 = extractvalue { i32, i32, i32, i32 } %580, 2, !dbg !46
  %584 = extractvalue { i32, i32, i32, i32 } %580, 3, !dbg !46
  %585 = mul i32 %18, 443136, !dbg !47
  %586 = mul i32 %19, 443136, !dbg !47
  %587 = add i32 %585, %31, !dbg !48
  %588 = add i32 %585, %32, !dbg !48
  %589 = add i32 %586, %31, !dbg !48
  %590 = add i32 %586, %32, !dbg !48
  %591 = sext i32 %587 to i64, !dbg !49
  %592 = getelementptr float, ptr addrspace(1) %5, i64 %591, !dbg !49
  %593 = sext i32 %588 to i64, !dbg !49
  %594 = getelementptr float, ptr addrspace(1) %5, i64 %593, !dbg !49
  %595 = sext i32 %589 to i64, !dbg !49
  %596 = getelementptr float, ptr addrspace(1) %5, i64 %595, !dbg !49
  %597 = sext i32 %590 to i64, !dbg !49
  %598 = getelementptr float, ptr addrspace(1) %5, i64 %597, !dbg !49
  %599 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.L1::evict_first.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];\0A\09@!$7 mov.u32 $0, $6;\0A\09@!$9 mov.u32 $1, $8;\0A\09@!$11 mov.u32 $2, $10;\0A\09@!$13 mov.u32 $3, $12;", "=r,=r,=r,=r,l,b,r,b,r,b,r,b,r,b"(ptr addrspace(1) %592, i1 %55, i32 0, i1 %55, i32 0, i1 %55, i32 0, i1 %55, i32 0, i1 %55) #3, !dbg !50
  %600 = extractvalue { i32, i32, i32, i32 } %599, 0, !dbg !50
  %601 = extractvalue { i32, i32, i32, i32 } %599, 1, !dbg !50
  %602 = extractvalue { i32, i32, i32, i32 } %599, 2, !dbg !50
  %603 = extractvalue { i32, i32, i32, i32 } %599, 3, !dbg !50
  %604 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.L1::evict_first.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];\0A\09@!$7 mov.u32 $0, $6;\0A\09@!$9 mov.u32 $1, $8;\0A\09@!$11 mov.u32 $2, $10;\0A\09@!$13 mov.u32 $3, $12;", "=r,=r,=r,=r,l,b,r,b,r,b,r,b,r,b"(ptr addrspace(1) %594, i1 %55, i32 0, i1 %55, i32 0, i1 %55, i32 0, i1 %55, i32 0, i1 %55) #3, !dbg !50
  %605 = extractvalue { i32, i32, i32, i32 } %604, 0, !dbg !50
  %606 = extractvalue { i32, i32, i32, i32 } %604, 1, !dbg !50
  %607 = extractvalue { i32, i32, i32, i32 } %604, 2, !dbg !50
  %608 = extractvalue { i32, i32, i32, i32 } %604, 3, !dbg !50
  %609 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.L1::evict_first.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];\0A\09@!$7 mov.u32 $0, $6;\0A\09@!$9 mov.u32 $1, $8;\0A\09@!$11 mov.u32 $2, $10;\0A\09@!$13 mov.u32 $3, $12;", "=r,=r,=r,=r,l,b,r,b,r,b,r,b,r,b"(ptr addrspace(1) %596, i1 %56, i32 0, i1 %56, i32 0, i1 %56, i32 0, i1 %56, i32 0, i1 %56) #3, !dbg !50
  %610 = extractvalue { i32, i32, i32, i32 } %609, 0, !dbg !50
  %611 = extractvalue { i32, i32, i32, i32 } %609, 1, !dbg !50
  %612 = extractvalue { i32, i32, i32, i32 } %609, 2, !dbg !50
  %613 = extractvalue { i32, i32, i32, i32 } %609, 3, !dbg !50
  %614 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.L1::evict_first.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];\0A\09@!$7 mov.u32 $0, $6;\0A\09@!$9 mov.u32 $1, $8;\0A\09@!$11 mov.u32 $2, $10;\0A\09@!$13 mov.u32 $3, $12;", "=r,=r,=r,=r,l,b,r,b,r,b,r,b,r,b"(ptr addrspace(1) %598, i1 %56, i32 0, i1 %56, i32 0, i1 %56, i32 0, i1 %56, i32 0, i1 %56) #3, !dbg !50
  %615 = extractvalue { i32, i32, i32, i32 } %614, 0, !dbg !50
  %616 = extractvalue { i32, i32, i32, i32 } %614, 1, !dbg !50
  %617 = extractvalue { i32, i32, i32, i32 } %614, 2, !dbg !50
  %618 = extractvalue { i32, i32, i32, i32 } %614, 3, !dbg !50
  %619 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.L1::evict_first.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];\0A\09@!$7 mov.u32 $0, $6;\0A\09@!$9 mov.u32 $1, $8;\0A\09@!$11 mov.u32 $2, $10;\0A\09@!$13 mov.u32 $3, $12;", "=r,=r,=r,=r,l,b,r,b,r,b,r,b,r,b"(ptr addrspace(1) %52, i1 %55, i32 0, i1 %55, i32 0, i1 %55, i32 0, i1 %55, i32 0, i1 %55) #3, !dbg !51
  %620 = extractvalue { i32, i32, i32, i32 } %619, 0, !dbg !51
  %621 = extractvalue { i32, i32, i32, i32 } %619, 1, !dbg !51
  %622 = extractvalue { i32, i32, i32, i32 } %619, 2, !dbg !51
  %623 = extractvalue { i32, i32, i32, i32 } %619, 3, !dbg !51
  %extelt.offset9 = lshr i32 %620, 16, !dbg !51
  %extelt.offset10 = lshr i32 %621, 16, !dbg !51
  %extelt.offset11 = lshr i32 %622, 16, !dbg !51
  %extelt.offset12 = lshr i32 %623, 16, !dbg !51
  %624 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.L1::evict_first.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];\0A\09@!$7 mov.u32 $0, $6;\0A\09@!$9 mov.u32 $1, $8;\0A\09@!$11 mov.u32 $2, $10;\0A\09@!$13 mov.u32 $3, $12;", "=r,=r,=r,=r,l,b,r,b,r,b,r,b,r,b"(ptr addrspace(1) %54, i1 %56, i32 0, i1 %56, i32 0, i1 %56, i32 0, i1 %56, i32 0, i1 %56) #3, !dbg !51
  %625 = extractvalue { i32, i32, i32, i32 } %624, 0, !dbg !51
  %626 = extractvalue { i32, i32, i32, i32 } %624, 1, !dbg !51
  %627 = extractvalue { i32, i32, i32, i32 } %624, 2, !dbg !51
  %628 = extractvalue { i32, i32, i32, i32 } %624, 3, !dbg !51
  %extelt.offset13 = lshr i32 %625, 16, !dbg !51
  %extelt.offset14 = lshr i32 %626, 16, !dbg !51
  %extelt.offset15 = lshr i32 %627, 16, !dbg !51
  %extelt.offset16 = lshr i32 %628, 16, !dbg !51
  %629 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.L1::evict_first.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];\0A\09@!$7 mov.u32 $0, $6;\0A\09@!$9 mov.u32 $1, $8;\0A\09@!$11 mov.u32 $2, $10;\0A\09@!$13 mov.u32 $3, $12;", "=r,=r,=r,=r,l,b,r,b,r,b,r,b,r,b"(ptr addrspace(1) %123, i1 %55, i32 0, i1 %55, i32 0, i1 %55, i32 0, i1 %55, i32 0, i1 %55) #3, !dbg !52
  %630 = extractvalue { i32, i32, i32, i32 } %629, 0, !dbg !52
  %631 = extractvalue { i32, i32, i32, i32 } %629, 1, !dbg !52
  %632 = extractvalue { i32, i32, i32, i32 } %629, 2, !dbg !52
  %633 = extractvalue { i32, i32, i32, i32 } %629, 3, !dbg !52
  %634 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.L1::evict_first.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];\0A\09@!$7 mov.u32 $0, $6;\0A\09@!$9 mov.u32 $1, $8;\0A\09@!$11 mov.u32 $2, $10;\0A\09@!$13 mov.u32 $3, $12;", "=r,=r,=r,=r,l,b,r,b,r,b,r,b,r,b"(ptr addrspace(1) %125, i1 %55, i32 0, i1 %55, i32 0, i1 %55, i32 0, i1 %55, i32 0, i1 %55) #3, !dbg !52
  %635 = extractvalue { i32, i32, i32, i32 } %634, 0, !dbg !52
  %636 = extractvalue { i32, i32, i32, i32 } %634, 1, !dbg !52
  %637 = extractvalue { i32, i32, i32, i32 } %634, 2, !dbg !52
  %638 = extractvalue { i32, i32, i32, i32 } %634, 3, !dbg !52
  %639 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.L1::evict_first.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];\0A\09@!$7 mov.u32 $0, $6;\0A\09@!$9 mov.u32 $1, $8;\0A\09@!$11 mov.u32 $2, $10;\0A\09@!$13 mov.u32 $3, $12;", "=r,=r,=r,=r,l,b,r,b,r,b,r,b,r,b"(ptr addrspace(1) %126, i1 %56, i32 0, i1 %56, i32 0, i1 %56, i32 0, i1 %56, i32 0, i1 %56) #3, !dbg !52
  %640 = extractvalue { i32, i32, i32, i32 } %639, 0, !dbg !52
  %641 = extractvalue { i32, i32, i32, i32 } %639, 1, !dbg !52
  %642 = extractvalue { i32, i32, i32, i32 } %639, 2, !dbg !52
  %643 = extractvalue { i32, i32, i32, i32 } %639, 3, !dbg !52
  %644 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.L1::evict_first.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];\0A\09@!$7 mov.u32 $0, $6;\0A\09@!$9 mov.u32 $1, $8;\0A\09@!$11 mov.u32 $2, $10;\0A\09@!$13 mov.u32 $3, $12;", "=r,=r,=r,=r,l,b,r,b,r,b,r,b,r,b"(ptr addrspace(1) %128, i1 %56, i32 0, i1 %56, i32 0, i1 %56, i32 0, i1 %56, i32 0, i1 %56) #3, !dbg !52
  %645 = extractvalue { i32, i32, i32, i32 } %644, 0, !dbg !52
  %646 = extractvalue { i32, i32, i32, i32 } %644, 1, !dbg !52
  %647 = extractvalue { i32, i32, i32, i32 } %644, 2, !dbg !52
  %648 = extractvalue { i32, i32, i32, i32 } %644, 3, !dbg !52
  %649 = getelementptr float, ptr addrspace(1) %7, i64 %105, !dbg !53
  %650 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.L1::evict_last.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];\0A\09@!$7 mov.u32 $0, $6;\0A\09@!$9 mov.u32 $1, $8;\0A\09@!$11 mov.u32 $2, $10;\0A\09@!$13 mov.u32 $3, $12;", "=r,=r,=r,=r,l,b,r,b,r,b,r,b,r,b"(ptr addrspace(1) %649, i1 %36, i32 0, i1 %36, i32 0, i1 %36, i32 0, i1 %36, i32 0, i1 %36) #3, !dbg !54
  %651 = extractvalue { i32, i32, i32, i32 } %650, 0, !dbg !54
  %652 = extractvalue { i32, i32, i32, i32 } %650, 1, !dbg !54
  %653 = extractvalue { i32, i32, i32, i32 } %650, 2, !dbg !54
  %654 = extractvalue { i32, i32, i32, i32 } %650, 3, !dbg !54
  %655 = fmul float %523, 0x3F55555560000000, !dbg !55
  %656 = fmul float %532, 0x3F55555560000000, !dbg !55
  tail call void @llvm.nvvm.barrier0(), !dbg !56
  %657 = insertelement <1 x float> poison, float %410, i64 0, !dbg !56
  store <1 x float> %657, ptr addrspace(3) @global_smem, align 16, !dbg !56
  %658 = insertelement <1 x float> poison, float %411, i64 0, !dbg !56
  ; CHECK: [[GEP:%7.*]] = bitcast i8 addrspace(3)* getelementptr inbounds ([0 x i8], [0 x i8] addrspace(3)* @global_smem, i32 0, i32 0) to <1 x float> addrspace(3)*, !dbg !{{[0-9]+}}
  ; CHECK: store <1 x float> %{{[0-9]+}}, <1 x float> addrspace(3)* [[GEP]], align 16
  store <1 x float> %658, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 8), align 8, !dbg !56
  tail call void @llvm.nvvm.barrier0(), !dbg !56
  %659 = shl nuw nsw i32 %.lobit, 1, !dbg !56
  %660 = zext nneg i32 %659 to i64, !dbg !56
  %661 = getelementptr float, ptr addrspace(3) @global_smem, i64 %660, !dbg !56
  %662 = load float, ptr addrspace(3) %661, align 8, !dbg !56
  tail call void @llvm.nvvm.barrier0(), !dbg !56
  %663 = insertelement <1 x float> poison, float %412, i64 0, !dbg !56
  store <1 x float> %663, ptr addrspace(3) @global_smem, align 16, !dbg !56
  %664 = insertelement <1 x float> poison, float %413, i64 0, !dbg !56
  store <1 x float> %664, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 8), align 8, !dbg !56
  tail call void @llvm.nvvm.barrier0(), !dbg !56
  %665 = load float, ptr addrspace(3) %661, align 8, !dbg !56
  %666 = insertelement <8 x i32> poison, i32 %566, i64 0, !dbg !46
  %667 = insertelement <8 x i32> %666, i32 %567, i64 1, !dbg !46
  %668 = insertelement <8 x i32> %667, i32 %568, i64 2, !dbg !46
  %669 = insertelement <8 x i32> %668, i32 %569, i64 3, !dbg !46
  %670 = insertelement <8 x i32> %669, i32 %571, i64 4, !dbg !46
  %671 = insertelement <8 x i32> %670, i32 %572, i64 5, !dbg !46
  %672 = insertelement <8 x i32> %671, i32 %573, i64 6, !dbg !46
  %673 = insertelement <8 x i32> %672, i32 %574, i64 7, !dbg !46
  %674 = bitcast <8 x i32> %673 to <8 x float>, !dbg !46
  %675 = insertelement <8 x i32> poison, i32 %600, i64 0, !dbg !50
  %676 = insertelement <8 x i32> %675, i32 %601, i64 1, !dbg !50
  %677 = insertelement <8 x i32> %676, i32 %602, i64 2, !dbg !50
  %678 = insertelement <8 x i32> %677, i32 %603, i64 3, !dbg !50
  %679 = insertelement <8 x i32> %678, i32 %605, i64 4, !dbg !50
  %680 = insertelement <8 x i32> %679, i32 %606, i64 5, !dbg !50
  %681 = insertelement <8 x i32> %680, i32 %607, i64 6, !dbg !50
  %682 = insertelement <8 x i32> %681, i32 %608, i64 7, !dbg !50
  %683 = bitcast <8 x i32> %682 to <8 x float>, !dbg !50
  %684 = insertelement <8 x i32> poison, i32 %620, i64 0, !dbg !51
  %685 = insertelement <8 x i32> %684, i32 %extelt.offset9, i64 1, !dbg !51
  %686 = insertelement <8 x i32> %685, i32 %621, i64 2, !dbg !51
  %687 = insertelement <8 x i32> %686, i32 %extelt.offset10, i64 3, !dbg !51
  %688 = insertelement <8 x i32> %687, i32 %622, i64 4, !dbg !51
  %689 = insertelement <8 x i32> %688, i32 %extelt.offset11, i64 5, !dbg !51
  %690 = insertelement <8 x i32> %689, i32 %623, i64 6, !dbg !51
  %691 = insertelement <8 x i32> %690, i32 %extelt.offset12, i64 7, !dbg !51
  %692 = trunc <8 x i32> %691 to <8 x i16>, !dbg !51
  %693 = bitcast <8 x i16> %692 to <8 x half>, !dbg !51
  %694 = fpext <8 x half> %693 to <8 x float>, !dbg !57
  %695 = insertelement <8 x i32> poison, i32 %630, i64 0, !dbg !52
  %696 = insertelement <8 x i32> %695, i32 %631, i64 1, !dbg !52
  %697 = insertelement <8 x i32> %696, i32 %632, i64 2, !dbg !52
  %698 = insertelement <8 x i32> %697, i32 %633, i64 3, !dbg !52
  %699 = insertelement <8 x i32> %698, i32 %635, i64 4, !dbg !52
  %700 = insertelement <8 x i32> %699, i32 %636, i64 5, !dbg !52
  %701 = insertelement <8 x i32> %700, i32 %637, i64 6, !dbg !52
  %702 = insertelement <8 x i32> %701, i32 %638, i64 7, !dbg !52
  %703 = bitcast <8 x i32> %702 to <8 x float>, !dbg !52
  %704 = insertelement <8 x float> poison, float %655, i64 0, !dbg !58
  %705 = shufflevector <8 x float> %704, <8 x float> poison, <8 x i32> zeroinitializer, !dbg !58
  %706 = fmul <8 x float> %705, %683, !dbg !58
  %707 = fadd <8 x float> %706, %674, !dbg !59
  %708 = shufflevector <2 x float> %230, <2 x float> %239, <8 x i32> <i32 poison, i32 poison, i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison>, !dbg !60
  %709 = insertelement <8 x float> %708, float %189, i64 0, !dbg !60
  %710 = insertelement <8 x float> %709, float %190, i64 1, !dbg !60
  %711 = shufflevector <8 x float> %710, <8 x float> %249, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>, !dbg !60
  %712 = fmul <8 x float> %711, %694, !dbg !60
  %713 = fmul <8 x float> %712, <float 7.680000e+02, float 7.680000e+02, float 7.680000e+02, float 7.680000e+02, float 7.680000e+02, float 7.680000e+02, float 7.680000e+02, float 7.680000e+02>, !dbg !61
  %714 = insertelement <8 x float> poison, float %662, i64 0, !dbg !56
  %715 = shufflevector <8 x float> %714, <8 x float> poison, <8 x i32> zeroinitializer, !dbg !56
  %716 = fsub <8 x float> %713, %715, !dbg !56
  %717 = insertelement <8 x float> poison, float %505, i64 0, !dbg !62
  %718 = shufflevector <8 x float> %717, <8 x float> poison, <8 x i32> zeroinitializer, !dbg !62
  %719 = fmul <8 x float> %718, %703, !dbg !62
  %720 = fsub <8 x float> %716, %719, !dbg !63
  %721 = insertelement <8 x i32> poison, i32 %544, i64 0, !dbg !64
  %722 = bitcast <8 x i32> %721 to <8 x float>, !dbg !64
  %723 = shufflevector <8 x float> %722, <8 x float> poison, <8 x i32> zeroinitializer, !dbg !64
  %724 = fmul <8 x float> %720, %723, !dbg !64
  %725 = fadd <8 x float> %707, %724, !dbg !65
  %726 = insertelement <8 x i32> poison, i32 %576, i64 0, !dbg !46
  %727 = insertelement <8 x i32> %726, i32 %577, i64 1, !dbg !46
  %728 = insertelement <8 x i32> %727, i32 %578, i64 2, !dbg !46
  %729 = insertelement <8 x i32> %728, i32 %579, i64 3, !dbg !46
  %730 = insertelement <8 x i32> %729, i32 %581, i64 4, !dbg !46
  %731 = insertelement <8 x i32> %730, i32 %582, i64 5, !dbg !46
  %732 = insertelement <8 x i32> %731, i32 %583, i64 6, !dbg !46
  %733 = insertelement <8 x i32> %732, i32 %584, i64 7, !dbg !46
  %734 = bitcast <8 x i32> %733 to <8 x float>, !dbg !46
  %735 = insertelement <8 x i32> poison, i32 %610, i64 0, !dbg !50
  %736 = insertelement <8 x i32> %735, i32 %611, i64 1, !dbg !50
  %737 = insertelement <8 x i32> %736, i32 %612, i64 2, !dbg !50
  %738 = insertelement <8 x i32> %737, i32 %613, i64 3, !dbg !50
  %739 = insertelement <8 x i32> %738, i32 %615, i64 4, !dbg !50
  %740 = insertelement <8 x i32> %739, i32 %616, i64 5, !dbg !50
  %741 = insertelement <8 x i32> %740, i32 %617, i64 6, !dbg !50
  %742 = insertelement <8 x i32> %741, i32 %618, i64 7, !dbg !50
  %743 = bitcast <8 x i32> %742 to <8 x float>, !dbg !50
  %744 = insertelement <8 x i32> poison, i32 %625, i64 0, !dbg !51
  %745 = insertelement <8 x i32> %744, i32 %extelt.offset13, i64 1, !dbg !51
  %746 = insertelement <8 x i32> %745, i32 %626, i64 2, !dbg !51
  %747 = insertelement <8 x i32> %746, i32 %extelt.offset14, i64 3, !dbg !51
  %748 = insertelement <8 x i32> %747, i32 %627, i64 4, !dbg !51
  %749 = insertelement <8 x i32> %748, i32 %extelt.offset15, i64 5, !dbg !51
  %750 = insertelement <8 x i32> %749, i32 %628, i64 6, !dbg !51
  %751 = insertelement <8 x i32> %750, i32 %extelt.offset16, i64 7, !dbg !51
  %752 = trunc <8 x i32> %751 to <8 x i16>, !dbg !51
  %753 = bitcast <8 x i16> %752 to <8 x half>, !dbg !51
  %754 = fpext <8 x half> %753 to <8 x float>, !dbg !57
  %755 = insertelement <8 x i32> poison, i32 %640, i64 0, !dbg !52
  %756 = insertelement <8 x i32> %755, i32 %641, i64 1, !dbg !52
  %757 = insertelement <8 x i32> %756, i32 %642, i64 2, !dbg !52
  %758 = insertelement <8 x i32> %757, i32 %643, i64 3, !dbg !52
  %759 = insertelement <8 x i32> %758, i32 %645, i64 4, !dbg !52
  %760 = insertelement <8 x i32> %759, i32 %646, i64 5, !dbg !52
  %761 = insertelement <8 x i32> %760, i32 %647, i64 6, !dbg !52
  %762 = insertelement <8 x i32> %761, i32 %648, i64 7, !dbg !52
  %763 = bitcast <8 x i32> %762 to <8 x float>, !dbg !52
  %764 = insertelement <8 x float> poison, float %656, i64 0, !dbg !58
  %765 = shufflevector <8 x float> %764, <8 x float> poison, <8 x i32> zeroinitializer, !dbg !58
  %766 = fmul <8 x float> %765, %743, !dbg !58
  %767 = fadd <8 x float> %766, %734, !dbg !59
  %768 = fmul <8 x float> %711, %754, !dbg !60
  %769 = fmul <8 x float> %768, <float 7.680000e+02, float 7.680000e+02, float 7.680000e+02, float 7.680000e+02, float 7.680000e+02, float 7.680000e+02, float 7.680000e+02, float 7.680000e+02>, !dbg !61
  %770 = insertelement <8 x float> poison, float %665, i64 0, !dbg !56
  %771 = shufflevector <8 x float> %770, <8 x float> poison, <8 x i32> zeroinitializer, !dbg !56
  %772 = fsub <8 x float> %769, %771, !dbg !56
  %773 = insertelement <8 x float> poison, float %508, i64 0, !dbg !62
  %774 = shufflevector <8 x float> %773, <8 x float> poison, <8 x i32> zeroinitializer, !dbg !62
  %775 = fmul <8 x float> %774, %763, !dbg !62
  %776 = fsub <8 x float> %772, %775, !dbg !63
  %777 = insertelement <8 x i32> poison, i32 %552, i64 0, !dbg !64
  %778 = bitcast <8 x i32> %777 to <8 x float>, !dbg !64
  %779 = shufflevector <8 x float> %778, <8 x float> poison, <8 x i32> zeroinitializer, !dbg !64
  %780 = fmul <8 x float> %776, %779, !dbg !64
  %781 = fadd <8 x float> %767, %780, !dbg !65
  tail call void @llvm.nvvm.barrier0(), !dbg !66
  %782 = insertelement <4 x i32> poison, i32 %651, i64 0, !dbg !66
  %783 = insertelement <4 x i32> %782, i32 %652, i64 1, !dbg !66
  %784 = insertelement <4 x i32> %783, i32 %653, i64 2, !dbg !66
  %785 = insertelement <4 x i32> %784, i32 %654, i64 3, !dbg !66
  store <4 x i32> %785, ptr addrspace(3) %129, align 16, !dbg !66
  tail call void @llvm.nvvm.barrier0(), !dbg !66
  %786 = getelementptr float, ptr addrspace(3) @global_smem, i64 %102, !dbg !67
  %787 = getelementptr float, ptr addrspace(3) @global_smem, i64 %112, !dbg !67
  %788 = getelementptr half, ptr addrspace(1) %8, i64 %51, !dbg !68
  %789 = getelementptr half, ptr addrspace(1) %8, i64 %53, !dbg !68
  %790 = load <2 x float>, ptr addrspace(3) %131, align 32, !dbg !66
  %791 = shufflevector <8 x float> %725, <8 x float> poison, <2 x i32> <i32 0, i32 1>, !dbg !69
  %792 = fmul <2 x float> %791, %790, !dbg !69
  %793 = fptrunc <2 x float> %792 to <2 x half>, !dbg !66
  %794 = load <2 x float>, ptr addrspace(3) %133, align 8, !dbg !66
  %795 = shufflevector <8 x float> %725, <8 x float> poison, <2 x i32> <i32 2, i32 3>, !dbg !69
  %796 = fmul <2 x float> %795, %794, !dbg !69
  %797 = fptrunc <2 x float> %796 to <2 x half>, !dbg !66
  %798 = load <2 x float>, ptr addrspace(3) %134, align 16, !dbg !66
  %799 = shufflevector <8 x float> %725, <8 x float> poison, <2 x i32> <i32 4, i32 5>, !dbg !69
  %800 = fmul <2 x float> %799, %798, !dbg !69
  %801 = fptrunc <2 x float> %800 to <2 x half>, !dbg !66
  %802 = load <2 x float>, ptr addrspace(3) %135, align 8, !dbg !66
  %803 = shufflevector <8 x float> %725, <8 x float> poison, <2 x i32> <i32 6, i32 7>, !dbg !69
  %804 = fmul <2 x float> %803, %802, !dbg !69
  tail call void @llvm.nvvm.barrier0(), !dbg !67
  store <8 x float> %725, ptr addrspace(3) %786, align 32, !dbg !67
  tail call void @llvm.nvvm.barrier0(), !dbg !67
  %805 = load <4 x i32>, ptr addrspace(3) %129, align 16, !dbg !67
  %806 = load <4 x i32>, ptr addrspace(3) %787, align 16, !dbg !67
  tail call void @llvm.nvvm.barrier0(), !dbg !67
  store <8 x float> %781, ptr addrspace(3) %786, align 32, !dbg !67
  tail call void @llvm.nvvm.barrier0(), !dbg !67
  %807 = load <4 x i32>, ptr addrspace(3) %129, align 16, !dbg !67
  %808 = load <4 x i32>, ptr addrspace(3) %787, align 16, !dbg !67
  %.extract = extractelement <4 x i32> %805, i64 0, !dbg !67
  %.extract18 = extractelement <4 x i32> %805, i64 1, !dbg !67
  %.extract20 = extractelement <4 x i32> %805, i64 2, !dbg !67
  %.extract22 = extractelement <4 x i32> %805, i64 3, !dbg !67
  tail call void asm sideeffect "@$5 st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l,b"(i32 %.extract, i32 %.extract18, i32 %.extract20, i32 %.extract22, ptr addrspace(1) %558, i1 %57) #3, !dbg !67
  %.extract24 = extractelement <4 x i32> %806, i64 0, !dbg !67
  %.extract26 = extractelement <4 x i32> %806, i64 1, !dbg !67
  %.extract28 = extractelement <4 x i32> %806, i64 2, !dbg !67
  %.extract30 = extractelement <4 x i32> %806, i64 3, !dbg !67
  tail call void asm sideeffect "@$5 st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l,b"(i32 %.extract24, i32 %.extract26, i32 %.extract28, i32 %.extract30, ptr addrspace(1) %560, i1 %58) #3, !dbg !67
  %.extract32 = extractelement <4 x i32> %807, i64 0, !dbg !67
  %.extract34 = extractelement <4 x i32> %807, i64 1, !dbg !67
  %.extract36 = extractelement <4 x i32> %807, i64 2, !dbg !67
  %.extract38 = extractelement <4 x i32> %807, i64 3, !dbg !67
  tail call void asm sideeffect "@$5 st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l,b"(i32 %.extract32, i32 %.extract34, i32 %.extract36, i32 %.extract38, ptr addrspace(1) %562, i1 %59) #3, !dbg !67
  %.extract40 = extractelement <4 x i32> %808, i64 0, !dbg !67
  %.extract42 = extractelement <4 x i32> %808, i64 1, !dbg !67
  %.extract44 = extractelement <4 x i32> %808, i64 2, !dbg !67
  %.extract46 = extractelement <4 x i32> %808, i64 3, !dbg !67
  tail call void asm sideeffect "@$5 st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l,b"(i32 %.extract40, i32 %.extract42, i32 %.extract44, i32 %.extract46, ptr addrspace(1) %564, i1 %60) #3, !dbg !67
  %809 = fptrunc <2 x float> %804 to <2 x half>, !dbg !66
  %810 = shufflevector <8 x float> %781, <8 x float> poison, <2 x i32> <i32 0, i32 1>, !dbg !69
  %811 = fmul <2 x float> %810, %790, !dbg !69
  %812 = fptrunc <2 x float> %811 to <2 x half>, !dbg !66
  %813 = shufflevector <8 x float> %781, <8 x float> poison, <2 x i32> <i32 2, i32 3>, !dbg !69
  %814 = fmul <2 x float> %813, %794, !dbg !69
  %815 = fptrunc <2 x float> %814 to <2 x half>, !dbg !66
  %816 = shufflevector <8 x float> %781, <8 x float> poison, <2 x i32> <i32 4, i32 5>, !dbg !69
  %817 = fmul <2 x float> %816, %798, !dbg !69
  %818 = fptrunc <2 x float> %817 to <2 x half>, !dbg !66
  %819 = shufflevector <8 x float> %781, <8 x float> poison, <2 x i32> <i32 6, i32 7>, !dbg !69
  %820 = fmul <2 x float> %819, %802, !dbg !69
  %821 = fptrunc <2 x float> %820 to <2 x half>, !dbg !66
  %822 = bitcast <2 x half> %793 to i32, !dbg !66
  %823 = bitcast <2 x half> %797 to i32, !dbg !66
  %824 = bitcast <2 x half> %801 to i32, !dbg !66
  %825 = bitcast <2 x half> %809 to i32, !dbg !66
  tail call void asm sideeffect "@$5 st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l,b"(i32 %822, i32 %823, i32 %824, i32 %825, ptr addrspace(1) %788, i1 %55) #3, !dbg !66
  %826 = bitcast <2 x half> %812 to i32, !dbg !66
  %827 = bitcast <2 x half> %815 to i32, !dbg !66
  %828 = bitcast <2 x half> %818 to i32, !dbg !66
  %829 = bitcast <2 x half> %821 to i32, !dbg !66
  tail call void asm sideeffect "@$5 st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l,b"(i32 %826, i32 %827, i32 %828, i32 %829, ptr addrspace(1) %789, i1 %56) #3, !dbg !66
  ret void, !dbg !70
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #1

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #2

attributes #0 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { convergent nocallback nounwind }
attributes #2 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}
!nvvm.annotations = !{!4, !5}
!llvm.ident = !{!6}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 4, !"nvvm-reflect-ftz", i32 1}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "triton", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly)
!3 = !DIFile(filename: "cs5lwup3dvfmcazo3aioslc5nwazm2ryxpbftnrawfl4y4wdblmj.py", directory: "/tmp/tmpjd0ohatt/s5")
!4 = !{ptr @triton_, !"kernel", i32 1}
!5 = !{ptr @triton_, !"maxntidx", i32 256}
!6 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!7 = distinct !DISubprogram(name: "triton_", linkageName: "triton_", scope: !3, file: !3, line: 18, type: !8, scopeLine: 18, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2)
!8 = !DISubroutineType(cc: DW_CC_normal, types: !9)
!9 = !{}
!10 = !DILocation(line: 21, column: 28, scope: !7)
!11 = !DILocation(line: 21, column: 33, scope: !7)
!12 = !DILocation(line: 22, column: 44, scope: !7)
!13 = !DILocation(line: 22, column: 23, scope: !7)
!14 = !DILocation(line: 23, column: 21, scope: !7)
!15 = !DILocation(line: 24, column: 33, scope: !7)
!16 = !DILocation(line: 30, column: 25, scope: !7)
!17 = !DILocation(line: 32, column: 44, scope: !7)
!18 = !DILocation(line: 32, column: 40, scope: !7)
!19 = !DILocation(line: 32, column: 34, scope: !7)
!20 = !DILocation(line: 32, column: 58, scope: !7)
!21 = !DILocation(line: 32, column: 50, scope: !7)
!22 = !DILocation(line: 32, column: 109, scope: !7)
!23 = !DILocation(line: 33, column: 34, scope: !7)
!24 = !DILocation(line: 34, column: 34, scope: !7)
!25 = !DILocation(line: 36, column: 22, scope: !7)
!26 = !DILocation(line: 33, column: 39, scope: !7)
!27 = !DILocation(line: 34, column: 50, scope: !7)
!28 = !DILocation(line: 38, column: 23, scope: !7)
!29 = !DILocation(line: 40, column: 22, scope: !7)
!30 = !DILocation(line: 42, column: 25, scope: !7)
!31 = !DILocation(line: 267, column: 36, scope: !32, inlinedAt: !34)
!32 = distinct !DILexicalBlockFile(scope: !7, file: !33, discriminator: 0)
!33 = !DIFile(filename: "standard.py", directory: "/usr/local/lib/python3.10/site-packages/triton/language")
!34 = !DILocation(line: 44, column: 25, scope: !7)
!35 = !DILocation(line: 256, column: 15, scope: !36, inlinedAt: !34)
!36 = distinct !DILexicalBlockFile(scope: !32, file: !33, discriminator: 0)
!37 = !DILocation(line: 267, column: 36, scope: !32, inlinedAt: !38)
!38 = !DILocation(line: 45, column: 27, scope: !7)
!39 = !DILocation(line: 256, column: 15, scope: !36, inlinedAt: !38)
!40 = !DILocation(line: 46, column: 35, scope: !7)
!41 = !DILocation(line: 46, column: 31, scope: !7)
!42 = !DILocation(line: 46, column: 40, scope: !7)
!43 = !DILocation(line: 47, column: 31, scope: !7)
!44 = !DILocation(line: 47, column: 36, scope: !7)
!45 = !DILocation(line: 52, column: 39, scope: !7)
!46 = !DILocation(line: 52, column: 55, scope: !7)
!47 = !DILocation(line: 53, column: 48, scope: !7)
!48 = !DILocation(line: 53, column: 41, scope: !7)
!49 = !DILocation(line: 53, column: 35, scope: !7)
!50 = !DILocation(line: 53, column: 54, scope: !7)
!51 = !DILocation(line: 54, column: 51, scope: !7)
!52 = !DILocation(line: 56, column: 51, scope: !7)
!53 = !DILocation(line: 57, column: 35, scope: !7)
!54 = !DILocation(line: 57, column: 40, scope: !7)
!55 = !DILocation(line: 59, column: 24, scope: !7)
!56 = !DILocation(line: 66, column: 24, scope: !7)
!57 = !DILocation(line: 54, column: 111, scope: !7)
!58 = !DILocation(line: 60, column: 24, scope: !7)
!59 = !DILocation(line: 61, column: 24, scope: !7)
!60 = !DILocation(line: 63, column: 24, scope: !7)
!61 = !DILocation(line: 65, column: 24, scope: !7)
!62 = !DILocation(line: 67, column: 24, scope: !7)
!63 = !DILocation(line: 68, column: 24, scope: !7)
!64 = !DILocation(line: 69, column: 24, scope: !7)
!65 = !DILocation(line: 70, column: 24, scope: !7)
!66 = !DILocation(line: 74, column: 52, scope: !7)
!67 = !DILocation(line: 73, column: 55, scope: !7)
!68 = !DILocation(line: 74, column: 29, scope: !7)
!69 = !DILocation(line: 71, column: 24, scope: !7)
!70 = !DILocation(line: 48, column: 4, scope: !7)
