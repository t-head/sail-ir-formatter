; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s
; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@assertFunc_1 = internal constant [7 x i8] c"unknown"
@assertFile_1 = internal constant [7 x i8] c"unknown"
@assertMessage_1 = internal constant [37 x i8] c"index out of bounds: 0 <= tmp11 < ks1"
@assertFunc_0 = internal constant [7 x i8] c"unknown"
@assertFile_0 = internal constant [7 x i8] c"unknown"
@assertMessage_0 = internal constant [36 x i8] c"index out of bounds: 0 <= tmp4 < ks1"
@global_smem = external local_unnamed_addr addrspace(3) global [0 x i8], align 16

; Function Attrs: noreturn
declare !dbg !7 void @__assertfail(ptr, ptr, i32, ptr, i64) local_unnamed_addr #0

; CHECK-LABLE: triton_
define void @triton_(ptr addrspace(1) %0, ptr addrspace(1) %1, ptr addrspace(1) %2, ptr addrspace(1) %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr !dbg !11 {
  %10 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #3, !dbg !12
  %11 = shl i32 %10, 10, !dbg !13
  %12 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !14
  %13 = shl i32 %12, 2, !dbg !14
  %14 = and i32 %13, 508, !dbg !14
  %15 = or disjoint i32 %11, %14, !dbg !15
  %16 = or disjoint i32 %15, 1, !dbg !15
  %17 = or disjoint i32 %15, 2, !dbg !15
  %18 = or disjoint i32 %15, 3, !dbg !15
  %19 = or disjoint i32 %15, 512, !dbg !15
  %20 = or disjoint i32 %15, 513, !dbg !15
  %21 = or disjoint i32 %15, 514, !dbg !15
  %22 = or disjoint i32 %15, 515, !dbg !15
  %23 = insertelement <8 x i32> poison, i32 %16, i64 0, !dbg !16
  %24 = insertelement <8 x i32> %23, i32 %15, i64 1, !dbg !16
  %25 = insertelement <8 x i32> %24, i32 %17, i64 2, !dbg !16
  %26 = insertelement <8 x i32> %25, i32 %18, i64 3, !dbg !16
  %27 = insertelement <8 x i32> %26, i32 %19, i64 4, !dbg !16
  %28 = insertelement <8 x i32> %27, i32 %20, i64 5, !dbg !16
  %29 = insertelement <8 x i32> %28, i32 %21, i64 6, !dbg !16
  %30 = insertelement <8 x i32> %29, i32 %22, i64 7, !dbg !16
  %31 = insertelement <8 x i32> poison, i32 %8, i64 0, !dbg !16
  %32 = shufflevector <8 x i32> %31, <8 x i32> poison, <8 x i32> zeroinitializer, !dbg !16
  %33 = icmp slt <8 x i32> %30, %32, !dbg !16
  %.frozen85 = freeze i32 %15
  %.frozen86 = freeze i32 %4
  %34 = sdiv i32 %.frozen85, %.frozen86, !dbg !17
  %.frozen82 = freeze i32 %16
  %.frozen83 = freeze i32 %4
  %35 = sdiv i32 %.frozen82, %.frozen83, !dbg !17
  %.frozen79 = freeze i32 %17
  %.frozen80 = freeze i32 %4
  %36 = sdiv i32 %.frozen79, %.frozen80, !dbg !17
  %.frozen76 = freeze i32 %18
  %.frozen77 = freeze i32 %4
  %37 = sdiv i32 %.frozen76, %.frozen77, !dbg !17
  %.frozen73 = freeze i32 %19
  %.frozen74 = freeze i32 %4
  %38 = sdiv i32 %.frozen73, %.frozen74, !dbg !17
  %.frozen70 = freeze i32 %20
  %.frozen71 = freeze i32 %4
  %39 = sdiv i32 %.frozen70, %.frozen71, !dbg !17
  %.frozen67 = freeze i32 %21
  %.frozen68 = freeze i32 %4
  %40 = sdiv i32 %.frozen67, %.frozen68, !dbg !17
  %.frozen = freeze i32 %22
  %.frozen66 = freeze i32 %4
  %41 = sdiv i32 %.frozen, %.frozen66, !dbg !17
  %42 = sext i32 %34 to i64, !dbg !18
  %43 = getelementptr i64, ptr addrspace(1) %0, i64 %42, !dbg !18
  %44 = sext i32 %35 to i64, !dbg !18
  %45 = getelementptr i64, ptr addrspace(1) %0, i64 %44, !dbg !18
  %46 = sext i32 %36 to i64, !dbg !18
  %47 = getelementptr i64, ptr addrspace(1) %0, i64 %46, !dbg !18
  %48 = sext i32 %37 to i64, !dbg !18
  %49 = getelementptr i64, ptr addrspace(1) %0, i64 %48, !dbg !18
  %50 = sext i32 %38 to i64, !dbg !18
  %51 = getelementptr i64, ptr addrspace(1) %0, i64 %50, !dbg !18
  %52 = sext i32 %39 to i64, !dbg !18
  %53 = getelementptr i64, ptr addrspace(1) %0, i64 %52, !dbg !18
  %54 = sext i32 %40 to i64, !dbg !18
  %55 = getelementptr i64, ptr addrspace(1) %0, i64 %54, !dbg !18
  %56 = sext i32 %41 to i64, !dbg !18
  %57 = getelementptr i64, ptr addrspace(1) %0, i64 %56, !dbg !18
  %58 = extractelement <8 x i1> %33, i64 1, !dbg !19
  %59 = tail call i64 asm sideeffect "mov.u64 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b64 { $0 }, [ $1 + 0 ];", "=l,l,b"(ptr addrspace(1) %43, i1 %58) #3, !dbg !19
  %60 = extractelement <8 x i1> %33, i64 0, !dbg !19
  %61 = tail call i64 asm sideeffect "mov.u64 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b64 { $0 }, [ $1 + 0 ];", "=l,l,b"(ptr addrspace(1) %45, i1 %60) #3, !dbg !19
  %62 = extractelement <8 x i1> %33, i64 2, !dbg !19
  %63 = tail call i64 asm sideeffect "mov.u64 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b64 { $0 }, [ $1 + 0 ];", "=l,l,b"(ptr addrspace(1) %47, i1 %62) #3, !dbg !19
  %64 = extractelement <8 x i1> %33, i64 3, !dbg !19
  %65 = tail call i64 asm sideeffect "mov.u64 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b64 { $0 }, [ $1 + 0 ];", "=l,l,b"(ptr addrspace(1) %49, i1 %64) #3, !dbg !19
  %66 = extractelement <8 x i1> %33, i64 4, !dbg !19
  %67 = tail call i64 asm sideeffect "mov.u64 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b64 { $0 }, [ $1 + 0 ];", "=l,l,b"(ptr addrspace(1) %51, i1 %66) #3, !dbg !19
  %68 = extractelement <8 x i1> %33, i64 5, !dbg !19
  %69 = tail call i64 asm sideeffect "mov.u64 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b64 { $0 }, [ $1 + 0 ];", "=l,l,b"(ptr addrspace(1) %53, i1 %68) #3, !dbg !19
  %70 = extractelement <8 x i1> %33, i64 6, !dbg !19
  %71 = tail call i64 asm sideeffect "mov.u64 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b64 { $0 }, [ $1 + 0 ];", "=l,l,b"(ptr addrspace(1) %55, i1 %70) #3, !dbg !19
  %72 = extractelement <8 x i1> %33, i64 7, !dbg !19
  %73 = tail call i64 asm sideeffect "mov.u64 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b64 { $0 }, [ $1 + 0 ];", "=l,l,b"(ptr addrspace(1) %57, i1 %72) #3, !dbg !19
  %74 = sext i32 %15 to i64, !dbg !20
  %75 = getelementptr float, ptr addrspace(1) %1, i64 %74, !dbg !20
  %76 = sext i32 %16 to i64, !dbg !20
  %77 = getelementptr float, ptr addrspace(1) %1, i64 %76, !dbg !20
  %78 = sext i32 %17 to i64, !dbg !20
  %79 = getelementptr float, ptr addrspace(1) %1, i64 %78, !dbg !20
  %80 = sext i32 %18 to i64, !dbg !20
  %81 = getelementptr float, ptr addrspace(1) %1, i64 %80, !dbg !20
  %82 = sext i32 %19 to i64, !dbg !20
  %83 = getelementptr float, ptr addrspace(1) %1, i64 %82, !dbg !20
  %84 = sext i32 %20 to i64, !dbg !20
  %85 = getelementptr float, ptr addrspace(1) %1, i64 %84, !dbg !20
  %86 = sext i32 %21 to i64, !dbg !20
  %87 = getelementptr float, ptr addrspace(1) %1, i64 %86, !dbg !20
  %88 = sext i32 %22 to i64, !dbg !20
  %89 = getelementptr float, ptr addrspace(1) %1, i64 %88, !dbg !20
  %90 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %75, i1 %58) #3, !dbg !21
  %91 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %77, i1 %60) #3, !dbg !21
  %92 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %79, i1 %62) #3, !dbg !21
  %93 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %81, i1 %64) #3, !dbg !21
  %94 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %83, i1 %66) #3, !dbg !21
  %95 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %85, i1 %68) #3, !dbg !21
  %96 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %87, i1 %70) #3, !dbg !21
  %97 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %89, i1 %72) #3, !dbg !21
  %98 = sext i32 %5 to i64, !dbg !22
  %99 = insertelement <8 x i64> poison, i64 %61, i64 0, !dbg !23
  %100 = insertelement <8 x i64> %99, i64 %59, i64 1, !dbg !23
  %101 = insertelement <8 x i64> %100, i64 %63, i64 2, !dbg !23
  %102 = insertelement <8 x i64> %101, i64 %65, i64 3, !dbg !23
  %103 = insertelement <8 x i64> %102, i64 %67, i64 4, !dbg !23
  %104 = insertelement <8 x i64> %103, i64 %69, i64 5, !dbg !23
  %105 = insertelement <8 x i64> %104, i64 %71, i64 6, !dbg !23
  %106 = insertelement <8 x i64> %105, i64 %73, i64 7, !dbg !23
  %107 = icmp slt <8 x i64> %106, zeroinitializer, !dbg !23
  %108 = insertelement <8 x i64> poison, i64 %98, i64 0, !dbg !24
  %109 = shufflevector <8 x i64> %108, <8 x i64> poison, <8 x i32> zeroinitializer, !dbg !24
  %110 = select <8 x i1> %107, <8 x i64> %109, <8 x i64> zeroinitializer, !dbg !24
  %111 = add <8 x i64> %110, %106, !dbg !24
  %112 = icmp slt <8 x i64> %111, zeroinitializer, !dbg !25
  %113 = shl <8 x i64> %109, <i64 32, i64 32, i64 32, i64 32, i64 32, i64 32, i64 32, i64 32>, !dbg !26
  %114 = ashr exact <8 x i64> %113, <i64 32, i64 32, i64 32, i64 32, i64 32, i64 32, i64 32, i64 32>, !dbg !26
  %115 = icmp sge <8 x i64> %111, %114, !dbg !26
  %116 = or <8 x i1> %112, %115, !dbg !27
  %117 = and <8 x i1> %33, %116, !dbg !28
  %118 = bitcast <8 x i1> %117 to i8, !dbg !29
  %.not = icmp eq i8 %118, 0, !dbg !29
  br i1 %.not, label %120, label %119, !dbg !29

119:                                              ; preds = %9
  tail call void @__assertfail(ptr nonnull @assertMessage_0, ptr nonnull @assertFile_0, i32 0, ptr nonnull @assertFunc_0, i64 1), !dbg !29
  unreachable, !dbg !29

120:                                              ; preds = %9
  %121 = add <8 x i64> %106, <i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1>, !dbg !30
  %122 = icmp slt <8 x i64> %121, zeroinitializer, !dbg !31
  %123 = select <8 x i1> %122, <8 x i64> %109, <8 x i64> zeroinitializer, !dbg !32
  %124 = add <8 x i64> %123, %121, !dbg !32
  %125 = icmp slt <8 x i64> %124, zeroinitializer, !dbg !33
  %126 = shl <8 x i64> %109, <i64 32, i64 32, i64 32, i64 32, i64 32, i64 32, i64 32, i64 32>, !dbg !34
  %127 = ashr exact <8 x i64> %126, <i64 32, i64 32, i64 32, i64 32, i64 32, i64 32, i64 32, i64 32>, !dbg !34
  %128 = icmp sge <8 x i64> %124, %127, !dbg !34
  %129 = or <8 x i1> %125, %128, !dbg !35
  %130 = and <8 x i1> %33, %129, !dbg !36
  %131 = bitcast <8 x i1> %130 to i8, !dbg !37
  %.not65 = icmp eq i8 %131, 0, !dbg !37
  br i1 %.not65, label %133, label %132, !dbg !37

132:                                              ; preds = %120
  tail call void @__assertfail(ptr nonnull @assertMessage_1, ptr nonnull @assertFile_1, i32 0, ptr nonnull @assertFunc_1, i64 1), !dbg !37
  unreachable, !dbg !37

133:                                              ; preds = %120
  %134 = insertelement <4 x i32> poison, i32 %94, i64 0, !dbg !21
  %135 = insertelement <4 x i32> %134, i32 %95, i64 1, !dbg !21
  %136 = insertelement <4 x i32> %135, i32 %96, i64 2, !dbg !21
  %137 = insertelement <4 x i32> %136, i32 %97, i64 3, !dbg !21
  %138 = bitcast <4 x i32> %137 to <4 x float>, !dbg !21
  %139 = insertelement <4 x i32> poison, i32 %90, i64 0, !dbg !21
  %140 = insertelement <4 x i32> %139, i32 %91, i64 1, !dbg !21
  %141 = insertelement <4 x i32> %140, i32 %92, i64 2, !dbg !21
  %142 = insertelement <4 x i32> %141, i32 %93, i64 3, !dbg !21
  %143 = bitcast <4 x i32> %142 to <4 x float>, !dbg !21
  %144 = mul i32 %41, %.frozen66
  %.decomposed = sub i32 %.frozen, %144
  %145 = mul i32 %40, %.frozen68
  %.decomposed69 = sub i32 %.frozen67, %145
  %146 = mul i32 %39, %.frozen71
  %.decomposed72 = sub i32 %.frozen70, %146
  %147 = mul i32 %38, %.frozen74
  %.decomposed75 = sub i32 %.frozen73, %147
  %148 = mul i32 %37, %.frozen77
  %.decomposed78 = sub i32 %.frozen76, %148
  %149 = mul i32 %36, %.frozen80
  %.decomposed81 = sub i32 %.frozen79, %149
  %150 = mul i32 %35, %.frozen83
  %.decomposed84 = sub i32 %.frozen82, %150
  %151 = mul i32 %34, %.frozen86
  %.decomposed87 = sub i32 %.frozen85, %151
  %152 = and i32 %12, 127, !dbg !14
  %153 = or disjoint i32 %152, %11, !dbg !15
  %154 = or disjoint i32 %153, 896, !dbg !15
  %155 = icmp slt i32 %154, %8, !dbg !16
  %156 = or disjoint i32 %153, 768, !dbg !15
  %157 = icmp slt i32 %156, %8, !dbg !16
  %158 = or disjoint i32 %153, 640, !dbg !15
  %159 = icmp slt i32 %158, %8, !dbg !16
  %160 = or disjoint i32 %153, 512, !dbg !15
  %161 = icmp slt i32 %160, %8, !dbg !16
  %162 = or disjoint i32 %152, 384, !dbg !14
  %163 = or disjoint i32 %11, %162, !dbg !15
  %164 = icmp slt i32 %163, %8, !dbg !16
  %165 = or disjoint i32 %152, 256, !dbg !14
  %166 = or disjoint i32 %11, %165, !dbg !15
  %167 = icmp slt i32 %166, %8, !dbg !16
  %168 = or disjoint i32 %152, 128, !dbg !14
  %169 = or disjoint i32 %11, %168, !dbg !15
  %170 = icmp slt i32 %169, %8, !dbg !16
  %171 = icmp slt i32 %153, %8, !dbg !16
  %172 = fadd <4 x float> %143, <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, !dbg !38
  %173 = fadd <4 x float> %138, <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, !dbg !38
  %174 = sext i32 %6 to i64, !dbg !39
  %175 = mul i32 %7, %7, !dbg !40
  %176 = sext i32 %175 to i64, !dbg !41
  %177 = mul nsw i64 %176, %174, !dbg !39
  %178 = extractelement <8 x i64> %111, i64 1, !dbg !41
  %179 = mul i64 %177, %178, !dbg !41
  %180 = extractelement <8 x i64> %111, i64 0, !dbg !41
  %181 = mul i64 %177, %180, !dbg !41
  %182 = extractelement <8 x i64> %111, i64 2, !dbg !41
  %183 = mul i64 %177, %182, !dbg !41
  %184 = extractelement <8 x i64> %111, i64 3, !dbg !41
  %185 = mul i64 %177, %184, !dbg !41
  %186 = extractelement <8 x i64> %111, i64 4, !dbg !41
  %187 = mul i64 %177, %186, !dbg !41
  %188 = extractelement <8 x i64> %111, i64 5, !dbg !41
  %189 = mul i64 %177, %188, !dbg !41
  %190 = extractelement <8 x i64> %111, i64 6, !dbg !41
  %191 = mul i64 %177, %190, !dbg !41
  %192 = extractelement <8 x i64> %111, i64 7, !dbg !41
  %193 = mul i64 %177, %192, !dbg !41
  %194 = sext i32 %.decomposed87 to i64, !dbg !42
  %195 = sext i32 %.decomposed84 to i64, !dbg !42
  %196 = sext i32 %.decomposed81 to i64, !dbg !42
  %197 = sext i32 %.decomposed78 to i64, !dbg !42
  %198 = sext i32 %.decomposed75 to i64, !dbg !42
  %199 = sext i32 %.decomposed72 to i64, !dbg !42
  %200 = sext i32 %.decomposed69 to i64, !dbg !42
  %201 = sext i32 %.decomposed to i64, !dbg !42
  %202 = getelementptr float, ptr addrspace(1) %2, i64 %179, !dbg !43
  %203 = getelementptr float, ptr addrspace(1) %202, i64 %194, !dbg !43
  %204 = getelementptr float, ptr addrspace(1) %2, i64 %181, !dbg !43
  %205 = getelementptr float, ptr addrspace(1) %204, i64 %195, !dbg !43
  %206 = getelementptr float, ptr addrspace(1) %2, i64 %183, !dbg !43
  %207 = getelementptr float, ptr addrspace(1) %206, i64 %196, !dbg !43
  %208 = getelementptr float, ptr addrspace(1) %2, i64 %185, !dbg !43
  %209 = getelementptr float, ptr addrspace(1) %208, i64 %197, !dbg !43
  %210 = getelementptr float, ptr addrspace(1) %2, i64 %187, !dbg !43
  %211 = getelementptr float, ptr addrspace(1) %210, i64 %198, !dbg !43
  %212 = getelementptr float, ptr addrspace(1) %2, i64 %189, !dbg !43
  %213 = getelementptr float, ptr addrspace(1) %212, i64 %199, !dbg !43
  %214 = getelementptr float, ptr addrspace(1) %2, i64 %191, !dbg !43
  %215 = getelementptr float, ptr addrspace(1) %214, i64 %200, !dbg !43
  %216 = getelementptr float, ptr addrspace(1) %2, i64 %193, !dbg !43
  %217 = getelementptr float, ptr addrspace(1) %216, i64 %201, !dbg !43
  %218 = shl nuw nsw i32 %152, 2, !dbg !44
  %219 = zext i32 %218 to i64, !dbg !44
  %220 = getelementptr i64, ptr addrspace(3) @global_smem, i64 %219, !dbg !44
  ; CHECK: %{{.+}} = insertelement <4 x i8 addrspace(1)*> poison, i8 addrspace(1)*  %{{.+}}, i64 0, !dbg !44
  %221 = insertelement <4 x ptr addrspace(1)> poison, ptr addrspace(1) %203, i64 0, !dbg !44
  %222 = insertelement <4 x ptr addrspace(1)> %221, ptr addrspace(1) %205, i64 1, !dbg !44
  %223 = insertelement <4 x ptr addrspace(1)> %222, ptr addrspace(1) %207, i64 2, !dbg !44
  %224 = insertelement <4 x ptr addrspace(1)> %223, ptr addrspace(1) %209, i64 3, !dbg !44
  ; CHECK: %{{.+}} = ptrtoint <4 x i8 addrspace(1)*> %{{.+}} to <4 x i64>, !dbg !44
  %225 = ptrtoint <4 x ptr addrspace(1)> %224 to <4 x i64>, !dbg !44
  ; CHECK: store <4 x i64> %{{.+}}, <4 x i64> addrspace(3)* %{{.+}}, align 32, !dbg !44
  store <4 x i64> %225, ptr addrspace(3) %220, align 32, !dbg !44
  tail call void @llvm.nvvm.barrier0(), !dbg !44
  %226 = zext i32 %152 to i64, !dbg !44
  %227 = getelementptr i64, ptr addrspace(3) @global_smem, i64 %226, !dbg !44
  %228 = load i64, ptr addrspace(3) %227, align 8, !dbg !44
  %229 = inttoptr i64 %228 to ptr addrspace(1), !dbg !44
  %230 = zext i32 %168 to i64, !dbg !44
  %231 = getelementptr i64, ptr addrspace(3) @global_smem, i64 %230, !dbg !44
  %232 = load i64, ptr addrspace(3) %231, align 8, !dbg !44
  %233 = inttoptr i64 %232 to ptr addrspace(1), !dbg !44
  %234 = zext i32 %165 to i64, !dbg !44
  %235 = getelementptr i64, ptr addrspace(3) @global_smem, i64 %234, !dbg !44
  %236 = load i64, ptr addrspace(3) %235, align 8, !dbg !44
  %237 = inttoptr i64 %236 to ptr addrspace(1), !dbg !44
  %238 = zext i32 %162 to i64, !dbg !44
  %239 = getelementptr i64, ptr addrspace(3) @global_smem, i64 %238, !dbg !44
  %240 = load i64, ptr addrspace(3) %239, align 8, !dbg !44
  %241 = inttoptr i64 %240 to ptr addrspace(1), !dbg !44
  tail call void @llvm.nvvm.barrier0(), !dbg !44
  %242 = insertelement <4 x ptr addrspace(1)> poison, ptr addrspace(1) %211, i64 0, !dbg !44
  %243 = insertelement <4 x ptr addrspace(1)> %242, ptr addrspace(1) %213, i64 1, !dbg !44
  %244 = insertelement <4 x ptr addrspace(1)> %243, ptr addrspace(1) %215, i64 2, !dbg !44
  %245 = insertelement <4 x ptr addrspace(1)> %244, ptr addrspace(1) %217, i64 3, !dbg !44
  %246 = ptrtoint <4 x ptr addrspace(1)> %245 to <4 x i64>, !dbg !44
  store <4 x i64> %246, ptr addrspace(3) %220, align 32, !dbg !44
  tail call void @llvm.nvvm.barrier0(), !dbg !44
  %247 = load i64, ptr addrspace(3) %227, align 8, !dbg !44
  %248 = inttoptr i64 %247 to ptr addrspace(1), !dbg !44
  %249 = load i64, ptr addrspace(3) %231, align 8, !dbg !44
  %250 = inttoptr i64 %249 to ptr addrspace(1), !dbg !44
  %251 = load i64, ptr addrspace(3) %235, align 8, !dbg !44
  %252 = inttoptr i64 %251 to ptr addrspace(1), !dbg !44
  %253 = load i64, ptr addrspace(3) %239, align 8, !dbg !44
  %254 = inttoptr i64 %253 to ptr addrspace(1), !dbg !44
  tail call void @llvm.nvvm.barrier0(), !dbg !44
  %255 = getelementptr float, ptr addrspace(3) @global_smem, i64 %219, !dbg !44
  store <4 x i32> %142, ptr addrspace(3) %255, align 16, !dbg !44
  tail call void @llvm.nvvm.barrier0(), !dbg !44
  %256 = getelementptr float, ptr addrspace(3) @global_smem, i64 %226, !dbg !44
  %257 = load i32, ptr addrspace(3) %256, align 4, !dbg !44
  %258 = getelementptr float, ptr addrspace(3) @global_smem, i64 %230, !dbg !44
  %259 = load i32, ptr addrspace(3) %258, align 4, !dbg !44
  %260 = getelementptr float, ptr addrspace(3) @global_smem, i64 %234, !dbg !44
  %261 = load i32, ptr addrspace(3) %260, align 4, !dbg !44
  %262 = getelementptr float, ptr addrspace(3) @global_smem, i64 %238, !dbg !44
  %263 = load i32, ptr addrspace(3) %262, align 4, !dbg !44
  tail call void @llvm.nvvm.barrier0(), !dbg !44
  store <4 x i32> %137, ptr addrspace(3) %255, align 16, !dbg !44
  tail call void @llvm.nvvm.barrier0(), !dbg !44
  %264 = load i32, ptr addrspace(3) %256, align 4, !dbg !44
  %265 = load i32, ptr addrspace(3) %258, align 4, !dbg !44
  %266 = load i32, ptr addrspace(3) %260, align 4, !dbg !44
  %267 = load i32, ptr addrspace(3) %262, align 4, !dbg !44
  tail call void asm sideeffect "@$2 st.global.b32 [ $1 + 0 ], { $0 };", "r,l,b"(i32 %257, ptr addrspace(1) %229, i1 %171) #3, !dbg !44
  tail call void asm sideeffect "@$2 st.global.b32 [ $1 + 0 ], { $0 };", "r,l,b"(i32 %259, ptr addrspace(1) %233, i1 %170) #3, !dbg !44
  tail call void asm sideeffect "@$2 st.global.b32 [ $1 + 0 ], { $0 };", "r,l,b"(i32 %261, ptr addrspace(1) %237, i1 %167) #3, !dbg !44
  tail call void asm sideeffect "@$2 st.global.b32 [ $1 + 0 ], { $0 };", "r,l,b"(i32 %263, ptr addrspace(1) %241, i1 %164) #3, !dbg !44
  tail call void asm sideeffect "@$2 st.global.b32 [ $1 + 0 ], { $0 };", "r,l,b"(i32 %264, ptr addrspace(1) %248, i1 %161) #3, !dbg !44
  tail call void asm sideeffect "@$2 st.global.b32 [ $1 + 0 ], { $0 };", "r,l,b"(i32 %265, ptr addrspace(1) %250, i1 %159) #3, !dbg !44
  tail call void asm sideeffect "@$2 st.global.b32 [ $1 + 0 ], { $0 };", "r,l,b"(i32 %266, ptr addrspace(1) %252, i1 %157) #3, !dbg !44
  tail call void asm sideeffect "@$2 st.global.b32 [ $1 + 0 ], { $0 };", "r,l,b"(i32 %267, ptr addrspace(1) %254, i1 %155) #3, !dbg !44
  %268 = extractelement <8 x i64> %124, i64 1, !dbg !45
  %269 = mul i64 %177, %268, !dbg !45
  %270 = extractelement <8 x i64> %124, i64 0, !dbg !45
  %271 = mul i64 %177, %270, !dbg !45
  %272 = extractelement <8 x i64> %124, i64 2, !dbg !45
  %273 = mul i64 %177, %272, !dbg !45
  %274 = extractelement <8 x i64> %124, i64 3, !dbg !45
  %275 = mul i64 %177, %274, !dbg !45
  %276 = extractelement <8 x i64> %124, i64 4, !dbg !45
  %277 = mul i64 %177, %276, !dbg !45
  %278 = extractelement <8 x i64> %124, i64 5, !dbg !45
  %279 = mul i64 %177, %278, !dbg !45
  %280 = extractelement <8 x i64> %124, i64 6, !dbg !45
  %281 = mul i64 %177, %280, !dbg !45
  %282 = extractelement <8 x i64> %124, i64 7, !dbg !45
  %283 = mul i64 %177, %282, !dbg !45
  %284 = getelementptr float, ptr addrspace(1) %3, i64 %269, !dbg !46
  %285 = getelementptr float, ptr addrspace(1) %284, i64 %194, !dbg !46
  %286 = getelementptr float, ptr addrspace(1) %3, i64 %271, !dbg !46
  %287 = getelementptr float, ptr addrspace(1) %286, i64 %195, !dbg !46
  %288 = getelementptr float, ptr addrspace(1) %3, i64 %273, !dbg !46
  %289 = getelementptr float, ptr addrspace(1) %288, i64 %196, !dbg !46
  %290 = getelementptr float, ptr addrspace(1) %3, i64 %275, !dbg !46
  %291 = getelementptr float, ptr addrspace(1) %290, i64 %197, !dbg !46
  %292 = getelementptr float, ptr addrspace(1) %3, i64 %277, !dbg !46
  %293 = getelementptr float, ptr addrspace(1) %292, i64 %198, !dbg !46
  %294 = getelementptr float, ptr addrspace(1) %3, i64 %279, !dbg !46
  %295 = getelementptr float, ptr addrspace(1) %294, i64 %199, !dbg !46
  %296 = getelementptr float, ptr addrspace(1) %3, i64 %281, !dbg !46
  %297 = getelementptr float, ptr addrspace(1) %296, i64 %200, !dbg !46
  %298 = getelementptr float, ptr addrspace(1) %3, i64 %283, !dbg !46
  %299 = getelementptr float, ptr addrspace(1) %298, i64 %201, !dbg !46
  tail call void @llvm.nvvm.barrier0(), !dbg !47
  %300 = insertelement <4 x ptr addrspace(1)> poison, ptr addrspace(1) %285, i64 0, !dbg !47
  %301 = insertelement <4 x ptr addrspace(1)> %300, ptr addrspace(1) %287, i64 1, !dbg !47
  %302 = insertelement <4 x ptr addrspace(1)> %301, ptr addrspace(1) %289, i64 2, !dbg !47
  %303 = insertelement <4 x ptr addrspace(1)> %302, ptr addrspace(1) %291, i64 3, !dbg !47
  %304 = ptrtoint <4 x ptr addrspace(1)> %303 to <4 x i64>, !dbg !47
  store <4 x i64> %304, ptr addrspace(3) %220, align 32, !dbg !47
  tail call void @llvm.nvvm.barrier0(), !dbg !47
  %305 = load i64, ptr addrspace(3) %227, align 8, !dbg !47
  %306 = inttoptr i64 %305 to ptr addrspace(1), !dbg !47
  %307 = load i64, ptr addrspace(3) %231, align 8, !dbg !47
  %308 = inttoptr i64 %307 to ptr addrspace(1), !dbg !47
  %309 = load i64, ptr addrspace(3) %235, align 8, !dbg !47
  %310 = inttoptr i64 %309 to ptr addrspace(1), !dbg !47
  %311 = load i64, ptr addrspace(3) %239, align 8, !dbg !47
  %312 = inttoptr i64 %311 to ptr addrspace(1), !dbg !47
  tail call void @llvm.nvvm.barrier0(), !dbg !47
  %313 = insertelement <4 x ptr addrspace(1)> poison, ptr addrspace(1) %293, i64 0, !dbg !47
  %314 = insertelement <4 x ptr addrspace(1)> %313, ptr addrspace(1) %295, i64 1, !dbg !47
  %315 = insertelement <4 x ptr addrspace(1)> %314, ptr addrspace(1) %297, i64 2, !dbg !47
  %316 = insertelement <4 x ptr addrspace(1)> %315, ptr addrspace(1) %299, i64 3, !dbg !47
  %317 = ptrtoint <4 x ptr addrspace(1)> %316 to <4 x i64>, !dbg !47
  store <4 x i64> %317, ptr addrspace(3) %220, align 32, !dbg !47
  tail call void @llvm.nvvm.barrier0(), !dbg !47
  %318 = load i64, ptr addrspace(3) %227, align 8, !dbg !47
  %319 = inttoptr i64 %318 to ptr addrspace(1), !dbg !47
  %320 = load i64, ptr addrspace(3) %231, align 8, !dbg !47
  %321 = inttoptr i64 %320 to ptr addrspace(1), !dbg !47
  %322 = load i64, ptr addrspace(3) %235, align 8, !dbg !47
  %323 = inttoptr i64 %322 to ptr addrspace(1), !dbg !47
  %324 = load i64, ptr addrspace(3) %239, align 8, !dbg !47
  %325 = inttoptr i64 %324 to ptr addrspace(1), !dbg !47
  tail call void @llvm.nvvm.barrier0(), !dbg !47
  store <4 x float> %172, ptr addrspace(3) %255, align 16, !dbg !47
  tail call void @llvm.nvvm.barrier0(), !dbg !47
  %326 = load i32, ptr addrspace(3) %256, align 4, !dbg !47
  %327 = load i32, ptr addrspace(3) %258, align 4, !dbg !47
  %328 = load i32, ptr addrspace(3) %260, align 4, !dbg !47
  %329 = load i32, ptr addrspace(3) %262, align 4, !dbg !47
  tail call void @llvm.nvvm.barrier0(), !dbg !47
  store <4 x float> %173, ptr addrspace(3) %255, align 16, !dbg !47
  tail call void @llvm.nvvm.barrier0(), !dbg !47
  %330 = load i32, ptr addrspace(3) %256, align 4, !dbg !47
  %331 = load i32, ptr addrspace(3) %258, align 4, !dbg !47
  %332 = load i32, ptr addrspace(3) %260, align 4, !dbg !47
  %333 = load i32, ptr addrspace(3) %262, align 4, !dbg !47
  tail call void asm sideeffect "@$2 st.global.b32 [ $1 + 0 ], { $0 };", "r,l,b"(i32 %326, ptr addrspace(1) %306, i1 %171) #3, !dbg !47
  tail call void asm sideeffect "@$2 st.global.b32 [ $1 + 0 ], { $0 };", "r,l,b"(i32 %327, ptr addrspace(1) %308, i1 %170) #3, !dbg !47
  tail call void asm sideeffect "@$2 st.global.b32 [ $1 + 0 ], { $0 };", "r,l,b"(i32 %328, ptr addrspace(1) %310, i1 %167) #3, !dbg !47
  tail call void asm sideeffect "@$2 st.global.b32 [ $1 + 0 ], { $0 };", "r,l,b"(i32 %329, ptr addrspace(1) %312, i1 %164) #3, !dbg !47
  tail call void asm sideeffect "@$2 st.global.b32 [ $1 + 0 ], { $0 };", "r,l,b"(i32 %330, ptr addrspace(1) %319, i1 %161) #3, !dbg !47
  tail call void asm sideeffect "@$2 st.global.b32 [ $1 + 0 ], { $0 };", "r,l,b"(i32 %331, ptr addrspace(1) %321, i1 %159) #3, !dbg !47
  tail call void asm sideeffect "@$2 st.global.b32 [ $1 + 0 ], { $0 };", "r,l,b"(i32 %332, ptr addrspace(1) %323, i1 %157) #3, !dbg !47
  tail call void asm sideeffect "@$2 st.global.b32 [ $1 + 0 ], { $0 };", "r,l,b"(i32 %333, ptr addrspace(1) %325, i1 %155) #3, !dbg !47
  ret void, !dbg !48
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #2

attributes #0 = { noreturn }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { convergent nocallback nounwind }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}
!nvvm.annotations = !{!4, !5}
!llvm.ident = !{!6}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 4, !"nvvm-reflect-ftz", i32 1}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "triton", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly)
!3 = !DIFile(filename: "csxgydq3xnm34gkixeu3mzawqiq6ogg3olc3imwc2sxendzkkzjd.py", directory: "/tmp/tmp3ed3d_ka/sx")
!4 = !{ptr @triton_, !"kernel", i32 1}
!5 = !{ptr @triton_, !"maxntidx", i32 128}
!6 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!7 = !DISubprogram(name: "__assertfail", linkageName: "__assertfail", scope: !8, file: !8, type: !9, spFlags: DISPFlagOptimized)
!8 = !DIFile(filename: "<unknown>", directory: "")
!9 = !DISubroutineType(cc: DW_CC_normal, types: !10)
!10 = !{}
!11 = distinct !DISubprogram(name: "triton_", linkageName: "triton_", scope: !3, file: !3, line: 18, type: !9, scopeLine: 18, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2)
!12 = !DILocation(line: 19, column: 28, scope: !11)
!13 = !DILocation(line: 19, column: 33, scope: !11)
!14 = !DILocation(line: 20, column: 36, scope: !11)
!15 = !DILocation(line: 20, column: 23, scope: !11)
!16 = !DILocation(line: 21, column: 21, scope: !11)
!17 = !DILocation(line: 22, column: 20, scope: !11)
!18 = !DILocation(line: 25, column: 30, scope: !11)
!19 = !DILocation(line: 25, column: 35, scope: !11)
!20 = !DILocation(line: 26, column: 30, scope: !11)
!21 = !DILocation(line: 26, column: 35, scope: !11)
!22 = !DILocation(line: 28, column: 18, scope: !11)
!23 = !DILocation(line: 29, column: 18, scope: !11)
!24 = !DILocation(line: 30, column: 32, scope: !11)
!25 = !DILocation(line: 31, column: 28, scope: !11)
!26 = !DILocation(line: 31, column: 44, scope: !11)
!27 = !DILocation(line: 31, column: 37, scope: !11)
!28 = !DILocation(line: 31, column: 52, scope: !11)
!29 = !DILocation(line: 31, column: 62, scope: !11)
!30 = !DILocation(line: 33, column: 18, scope: !11)
!31 = !DILocation(line: 35, column: 19, scope: !11)
!32 = !DILocation(line: 36, column: 34, scope: !11)
!33 = !DILocation(line: 37, column: 28, scope: !11)
!34 = !DILocation(line: 37, column: 46, scope: !11)
!35 = !DILocation(line: 37, column: 38, scope: !11)
!36 = !DILocation(line: 37, column: 54, scope: !11)
!37 = !DILocation(line: 37, column: 64, scope: !11)
!38 = !DILocation(line: 39, column: 19, scope: !11)
!39 = !DILocation(line: 40, column: 35, scope: !11)
!40 = !DILocation(line: 40, column: 45, scope: !11)
!41 = !DILocation(line: 40, column: 41, scope: !11)
!42 = !DILocation(line: 40, column: 31, scope: !11)
!43 = !DILocation(line: 40, column: 25, scope: !11)
!44 = !DILocation(line: 40, column: 59, scope: !11)
!45 = !DILocation(line: 41, column: 42, scope: !11)
!46 = !DILocation(line: 41, column: 25, scope: !11)
!47 = !DILocation(line: 41, column: 61, scope: !11)
!48 = !DILocation(line: 41, column: 4, scope: !11)

