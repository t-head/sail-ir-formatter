; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@global_smem = external local_unnamed_addr addrspace(3) global [0 x i8], align 16

; CHECK-LABLE: triton_
define void @triton_(ptr addrspace(1) %0, ptr addrspace(1) %1, ptr addrspace(1) %2, ptr addrspace(1) %3, ptr addrspace(1) %4, ptr addrspace(1) %5, ptr addrspace(1) %6, ptr addrspace(1) %7, ptr addrspace(1) %8, ptr addrspace(1) %9, ptr addrspace(1) %10, ptr addrspace(1) %11, ptr addrspace(1) %12, ptr addrspace(1) %13, ptr addrspace(1) %14, ptr addrspace(1) %15, ptr addrspace(1) %16, ptr addrspace(1) %17, i32 %18) local_unnamed_addr !dbg !7 {
  %20 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #2, !dbg !10
  %21 = shl i32 %20, 10, !dbg !11
  %22 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !12
  %23 = shl i32 %22, 3, !dbg !12
  %24 = and i32 %23, 1016, !dbg !12
  %25 = or disjoint i32 %21, %24, !dbg !13
  %26 = or disjoint i32 %25, 2, !dbg !13
  %27 = or disjoint i32 %25, 4, !dbg !13
  %28 = or disjoint i32 %25, 6, !dbg !13
  %.frozen = freeze i32 %25
  %29 = sdiv i32 %.frozen, 14, !dbg !14
  %.frozen20 = freeze i32 %26
  %30 = sdiv i32 %.frozen20, 14, !dbg !14
  %.frozen22 = freeze i32 %27
  %31 = sdiv i32 %.frozen22, 14, !dbg !14
  %.frozen24 = freeze i32 %28
  %32 = sdiv i32 %.frozen24, 14, !dbg !14
  %33 = srem i32 %29, 14, !dbg !15
  %34 = srem i32 %30, 14, !dbg !15
  %35 = srem i32 %31, 14, !dbg !15
  %36 = srem i32 %32, 14, !dbg !15
  %37 = mul i32 %29, 14
  %.decomposed = sub i32 %.frozen, %37
  %38 = mul i32 %30, 14
  %.decomposed21 = sub i32 %.frozen20, %38
  %39 = mul i32 %31, 14
  %.decomposed23 = sub i32 %.frozen22, %39
  %40 = mul i32 %32, 14
  %.decomposed25 = sub i32 %.frozen24, %40
  %41 = sdiv i32 %25, 196, !dbg !16
  %42 = sdiv i32 %27, 196, !dbg !16
  %43 = srem i32 %41, 72, !dbg !17
  %44 = srem i32 %42, 72, !dbg !17
  %45 = sdiv i32 %25, 14112, !dbg !18
  %46 = sext i32 %33 to i64, !dbg !19
  %47 = getelementptr i64, ptr addrspace(1) %0, i64 %46, !dbg !19
  %48 = sext i32 %34 to i64, !dbg !19
  %49 = getelementptr i64, ptr addrspace(1) %0, i64 %48, !dbg !19
  %50 = sext i32 %35 to i64, !dbg !19
  %51 = getelementptr i64, ptr addrspace(1) %0, i64 %50, !dbg !19
  %52 = sext i32 %36 to i64, !dbg !19
  %53 = getelementptr i64, ptr addrspace(1) %0, i64 %52, !dbg !19
  %54 = tail call i64 asm sideeffect "mov.u64 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b64 { $0 }, [ $1 + 0 ];", "=l,l,b"(ptr addrspace(1) %47, i1 true) #2, !dbg !20
  %55 = tail call i64 asm sideeffect "mov.u64 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b64 { $0 }, [ $1 + 0 ];", "=l,l,b"(ptr addrspace(1) %47, i1 true) #2, !dbg !20
  %56 = tail call i64 asm sideeffect "mov.u64 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b64 { $0 }, [ $1 + 0 ];", "=l,l,b"(ptr addrspace(1) %49, i1 true) #2, !dbg !20
  %57 = tail call i64 asm sideeffect "mov.u64 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b64 { $0 }, [ $1 + 0 ];", "=l,l,b"(ptr addrspace(1) %49, i1 true) #2, !dbg !20
  %58 = tail call i64 asm sideeffect "mov.u64 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b64 { $0 }, [ $1 + 0 ];", "=l,l,b"(ptr addrspace(1) %51, i1 true) #2, !dbg !20
  %59 = tail call i64 asm sideeffect "mov.u64 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b64 { $0 }, [ $1 + 0 ];", "=l,l,b"(ptr addrspace(1) %51, i1 true) #2, !dbg !20
  %60 = tail call i64 asm sideeffect "mov.u64 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b64 { $0 }, [ $1 + 0 ];", "=l,l,b"(ptr addrspace(1) %53, i1 true) #2, !dbg !20
  %61 = tail call i64 asm sideeffect "mov.u64 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b64 { $0 }, [ $1 + 0 ];", "=l,l,b"(ptr addrspace(1) %53, i1 true) #2, !dbg !20
  %62 = sext i32 %.decomposed to i64, !dbg !21
  %63 = getelementptr i64, ptr addrspace(1) %0, i64 %62, !dbg !21
  %64 = sext i32 %.decomposed21 to i64, !dbg !21
  %65 = getelementptr i64, ptr addrspace(1) %0, i64 %64, !dbg !21
  %66 = sext i32 %.decomposed23 to i64, !dbg !21
  %67 = getelementptr i64, ptr addrspace(1) %0, i64 %66, !dbg !21
  %68 = sext i32 %.decomposed25 to i64, !dbg !21
  %69 = getelementptr i64, ptr addrspace(1) %0, i64 %68, !dbg !21
  %70 = tail call { i64, i64 } asm sideeffect "mov.u64 $0, 0x0;\0A\09mov.u64 $1, 0x0;\0A\09@$3 ld.global.L1::evict_last.v2.b64 { $0, $1 }, [ $2 + 0 ];", "=l,=l,l,b"(ptr addrspace(1) %63, i1 true) #2, !dbg !22
  %71 = extractvalue { i64, i64 } %70, 0, !dbg !22
  %72 = extractvalue { i64, i64 } %70, 1, !dbg !22
  %73 = tail call { i64, i64 } asm sideeffect "mov.u64 $0, 0x0;\0A\09mov.u64 $1, 0x0;\0A\09@$3 ld.global.L1::evict_last.v2.b64 { $0, $1 }, [ $2 + 0 ];", "=l,=l,l,b"(ptr addrspace(1) %65, i1 true) #2, !dbg !22
  %74 = extractvalue { i64, i64 } %73, 0, !dbg !22
  %75 = extractvalue { i64, i64 } %73, 1, !dbg !22
  %76 = tail call { i64, i64 } asm sideeffect "mov.u64 $0, 0x0;\0A\09mov.u64 $1, 0x0;\0A\09@$3 ld.global.L1::evict_last.v2.b64 { $0, $1 }, [ $2 + 0 ];", "=l,=l,l,b"(ptr addrspace(1) %67, i1 true) #2, !dbg !22
  %77 = extractvalue { i64, i64 } %76, 0, !dbg !22
  %78 = extractvalue { i64, i64 } %76, 1, !dbg !22
  %79 = tail call { i64, i64 } asm sideeffect "mov.u64 $0, 0x0;\0A\09mov.u64 $1, 0x0;\0A\09@$3 ld.global.L1::evict_last.v2.b64 { $0, $1 }, [ $2 + 0 ];", "=l,=l,l,b"(ptr addrspace(1) %69, i1 true) #2, !dbg !22
  %80 = extractvalue { i64, i64 } %79, 0, !dbg !22
  %81 = extractvalue { i64, i64 } %79, 1, !dbg !22
  %82 = sext i32 %25 to i64, !dbg !23
  %83 = getelementptr half, ptr addrspace(1) %1, i64 %82, !dbg !23
  %84 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l,b"(ptr addrspace(1) %83, i1 true) #2, !dbg !24
  %85 = extractvalue { i32, i32, i32, i32 } %84, 0, !dbg !24
  %86 = extractvalue { i32, i32, i32, i32 } %84, 1, !dbg !24
  %87 = extractvalue { i32, i32, i32, i32 } %84, 2, !dbg !24
  %88 = extractvalue { i32, i32, i32, i32 } %84, 3, !dbg !24
  %extelt.offset = lshr i32 %85, 16, !dbg !24
  %extelt.offset1 = lshr i32 %86, 16, !dbg !24
  %extelt.offset2 = lshr i32 %87, 16, !dbg !24
  %extelt.offset3 = lshr i32 %88, 16, !dbg !24
  %89 = getelementptr half, ptr addrspace(1) %2, i64 %82, !dbg !25
  %90 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l,b"(ptr addrspace(1) %89, i1 true) #2, !dbg !26
  %91 = extractvalue { i32, i32, i32, i32 } %90, 0, !dbg !26
  %92 = extractvalue { i32, i32, i32, i32 } %90, 1, !dbg !26
  %93 = extractvalue { i32, i32, i32, i32 } %90, 2, !dbg !26
  %94 = extractvalue { i32, i32, i32, i32 } %90, 3, !dbg !26
  %extelt.offset4 = lshr i32 %91, 16, !dbg !26
  %extelt.offset5 = lshr i32 %92, 16, !dbg !26
  %extelt.offset6 = lshr i32 %93, 16, !dbg !26
  %extelt.offset7 = lshr i32 %94, 16, !dbg !26
  %95 = getelementptr half, ptr addrspace(1) %3, i64 %82, !dbg !27
  %96 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l,b"(ptr addrspace(1) %95, i1 true) #2, !dbg !28
  %97 = extractvalue { i32, i32, i32, i32 } %96, 0, !dbg !28
  %98 = extractvalue { i32, i32, i32, i32 } %96, 1, !dbg !28
  %99 = extractvalue { i32, i32, i32, i32 } %96, 2, !dbg !28
  %100 = extractvalue { i32, i32, i32, i32 } %96, 3, !dbg !28
  %extelt.offset8 = lshr i32 %97, 16, !dbg !28
  %extelt.offset9 = lshr i32 %98, 16, !dbg !28
  %extelt.offset10 = lshr i32 %99, 16, !dbg !28
  %extelt.offset11 = lshr i32 %100, 16, !dbg !28
  %101 = getelementptr half, ptr addrspace(1) %4, i64 %82, !dbg !29
  %102 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l,b"(ptr addrspace(1) %101, i1 true) #2, !dbg !30
  %103 = extractvalue { i32, i32, i32, i32 } %102, 0, !dbg !30
  %104 = extractvalue { i32, i32, i32, i32 } %102, 1, !dbg !30
  %105 = extractvalue { i32, i32, i32, i32 } %102, 2, !dbg !30
  %106 = extractvalue { i32, i32, i32, i32 } %102, 3, !dbg !30
  %extelt.offset12 = lshr i32 %103, 16, !dbg !30
  %extelt.offset13 = lshr i32 %104, 16, !dbg !30
  %extelt.offset14 = lshr i32 %105, 16, !dbg !30
  %extelt.offset15 = lshr i32 %106, 16, !dbg !30
  %107 = sext i32 %43 to i64, !dbg !31
  %108 = getelementptr float, ptr addrspace(1) %5, i64 %107, !dbg !31
  %109 = sext i32 %44 to i64, !dbg !31
  %110 = getelementptr float, ptr addrspace(1) %5, i64 %109, !dbg !31
  %111 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %108, i1 true) #2, !dbg !32
  %112 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %108, i1 true) #2, !dbg !32
  %113 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %108, i1 true) #2, !dbg !32
  %114 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %108, i1 true) #2, !dbg !32
  %115 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %110, i1 true) #2, !dbg !32
  %116 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %110, i1 true) #2, !dbg !32
  %117 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %110, i1 true) #2, !dbg !32
  %118 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %110, i1 true) #2, !dbg !32
  %119 = getelementptr float, ptr addrspace(1) %6, i64 %107, !dbg !33
  %120 = getelementptr float, ptr addrspace(1) %6, i64 %109, !dbg !33
  %121 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %119, i1 true) #2, !dbg !34
  %122 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %119, i1 true) #2, !dbg !34
  %123 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %119, i1 true) #2, !dbg !34
  %124 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %119, i1 true) #2, !dbg !34
  %125 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %120, i1 true) #2, !dbg !34
  %126 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %120, i1 true) #2, !dbg !34
  %127 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %120, i1 true) #2, !dbg !34
  %128 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %120, i1 true) #2, !dbg !34
  %129 = getelementptr float, ptr addrspace(1) %7, i64 %107, !dbg !35
  %130 = getelementptr float, ptr addrspace(1) %7, i64 %109, !dbg !35
  %131 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %129, i1 true) #2, !dbg !36
  %132 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %129, i1 true) #2, !dbg !36
  %133 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %129, i1 true) #2, !dbg !36
  %134 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %129, i1 true) #2, !dbg !36
  %135 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %130, i1 true) #2, !dbg !36
  %136 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %130, i1 true) #2, !dbg !36
  %137 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %130, i1 true) #2, !dbg !36
  %138 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %130, i1 true) #2, !dbg !36
  %139 = getelementptr float, ptr addrspace(1) %8, i64 %107, !dbg !37
  %140 = getelementptr float, ptr addrspace(1) %8, i64 %109, !dbg !37
  %141 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %139, i1 true) #2, !dbg !38
  %142 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %139, i1 true) #2, !dbg !38
  %143 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %139, i1 true) #2, !dbg !38
  %144 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %139, i1 true) #2, !dbg !38
  %145 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %140, i1 true) #2, !dbg !38
  %146 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %140, i1 true) #2, !dbg !38
  %147 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %140, i1 true) #2, !dbg !38
  %148 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %140, i1 true) #2, !dbg !38
  %149 = getelementptr float, ptr addrspace(1) %9, i64 %107, !dbg !39
  %150 = getelementptr float, ptr addrspace(1) %9, i64 %109, !dbg !39
  %151 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %149, i1 true) #2, !dbg !40
  %152 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %149, i1 true) #2, !dbg !40
  %153 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %149, i1 true) #2, !dbg !40
  %154 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %149, i1 true) #2, !dbg !40
  %155 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %150, i1 true) #2, !dbg !40
  %156 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %150, i1 true) #2, !dbg !40
  %157 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %150, i1 true) #2, !dbg !40
  %158 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %150, i1 true) #2, !dbg !40
  %159 = getelementptr half, ptr addrspace(1) %10, i64 %82, !dbg !41
  %160 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09@$5 ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l,b"(ptr addrspace(1) %159, i1 true) #2, !dbg !42
  %161 = extractvalue { i32, i32, i32, i32 } %160, 0, !dbg !42
  %162 = extractvalue { i32, i32, i32, i32 } %160, 1, !dbg !42
  %163 = extractvalue { i32, i32, i32, i32 } %160, 2, !dbg !42
  %164 = extractvalue { i32, i32, i32, i32 } %160, 3, !dbg !42
  %extelt.offset16 = lshr i32 %161, 16, !dbg !42
  %extelt.offset17 = lshr i32 %162, 16, !dbg !42
  %extelt.offset18 = lshr i32 %163, 16, !dbg !42
  %extelt.offset19 = lshr i32 %164, 16, !dbg !42
  %165 = getelementptr float, ptr addrspace(1) %11, i64 %107, !dbg !43
  %166 = getelementptr float, ptr addrspace(1) %11, i64 %109, !dbg !43
  %167 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %165, i1 true) #2, !dbg !44
  %168 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %165, i1 true) #2, !dbg !44
  %169 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %165, i1 true) #2, !dbg !44
  %170 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %165, i1 true) #2, !dbg !44
  %171 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %166, i1 true) #2, !dbg !44
  %172 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %166, i1 true) #2, !dbg !44
  %173 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %166, i1 true) #2, !dbg !44
  %174 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %166, i1 true) #2, !dbg !44
  %175 = getelementptr float, ptr addrspace(1) %12, i64 %107, !dbg !45
  %176 = getelementptr float, ptr addrspace(1) %12, i64 %109, !dbg !45
  %177 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %175, i1 true) #2, !dbg !46
  %178 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %175, i1 true) #2, !dbg !46
  %179 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %175, i1 true) #2, !dbg !46
  %180 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %175, i1 true) #2, !dbg !46
  %181 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %176, i1 true) #2, !dbg !46
  %182 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %176, i1 true) #2, !dbg !46
  %183 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %176, i1 true) #2, !dbg !46
  %184 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %176, i1 true) #2, !dbg !46
  %185 = getelementptr float, ptr addrspace(1) %13, i64 %107, !dbg !47
  %186 = getelementptr float, ptr addrspace(1) %13, i64 %109, !dbg !47
  %187 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %185, i1 true) #2, !dbg !48
  %188 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %185, i1 true) #2, !dbg !48
  %189 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %185, i1 true) #2, !dbg !48
  %190 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %185, i1 true) #2, !dbg !48
  %191 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %186, i1 true) #2, !dbg !48
  %192 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %186, i1 true) #2, !dbg !48
  %193 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %186, i1 true) #2, !dbg !48
  %194 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %186, i1 true) #2, !dbg !48
  %195 = getelementptr float, ptr addrspace(1) %14, i64 %107, !dbg !49
  %196 = getelementptr float, ptr addrspace(1) %14, i64 %109, !dbg !49
  %197 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %195, i1 true) #2, !dbg !50
  %198 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %195, i1 true) #2, !dbg !50
  %199 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %195, i1 true) #2, !dbg !50
  %200 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %195, i1 true) #2, !dbg !50
  %201 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %196, i1 true) #2, !dbg !50
  %202 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %196, i1 true) #2, !dbg !50
  %203 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %196, i1 true) #2, !dbg !50
  %204 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.L1::evict_last.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %196, i1 true) #2, !dbg !50
  %205 = add i64 %54, 7, !dbg !51
  %206 = add i64 %56, 7, !dbg !51
  %207 = add i64 %58, 7, !dbg !51
  %208 = add i64 %60, 7, !dbg !51
  %209 = icmp slt i64 %54, 0, !dbg !52
  %210 = icmp slt i64 %56, 0, !dbg !52
  %211 = icmp slt i64 %58, 0, !dbg !52
  %212 = icmp slt i64 %60, 0, !dbg !52
  %213 = select i1 %209, i64 %205, i64 %54, !dbg !53
  %214 = select i1 %210, i64 %206, i64 %56, !dbg !53
  %215 = select i1 %211, i64 %207, i64 %58, !dbg !53
  %216 = select i1 %212, i64 %208, i64 %60, !dbg !53
  %217 = add i64 %71, 7, !dbg !54
  %218 = add i64 %72, 7, !dbg !54
  %219 = add i64 %74, 7, !dbg !54
  %220 = add i64 %75, 7, !dbg !54
  %221 = add i64 %77, 7, !dbg !54
  %222 = add i64 %78, 7, !dbg !54
  %223 = add i64 %80, 7, !dbg !54
  %224 = add i64 %81, 7, !dbg !54
  %225 = icmp slt i64 %71, 0, !dbg !55
  %226 = icmp slt i64 %72, 0, !dbg !55
  %227 = icmp slt i64 %74, 0, !dbg !55
  %228 = icmp slt i64 %75, 0, !dbg !55
  %229 = icmp slt i64 %77, 0, !dbg !55
  %230 = icmp slt i64 %78, 0, !dbg !55
  %231 = icmp slt i64 %80, 0, !dbg !55
  %232 = icmp slt i64 %81, 0, !dbg !55
  %233 = select i1 %225, i64 %217, i64 %71, !dbg !56
  %234 = select i1 %226, i64 %218, i64 %72, !dbg !56
  %235 = select i1 %227, i64 %219, i64 %74, !dbg !56
  %236 = select i1 %228, i64 %220, i64 %75, !dbg !56
  %237 = select i1 %229, i64 %221, i64 %77, !dbg !56
  %238 = select i1 %230, i64 %222, i64 %78, !dbg !56
  %239 = select i1 %231, i64 %223, i64 %80, !dbg !56
  %240 = select i1 %232, i64 %224, i64 %81, !dbg !56
  %241 = insertelement <8 x i32> poison, i32 %85, i64 0, !dbg !24
  %242 = insertelement <8 x i32> %241, i32 %extelt.offset, i64 1, !dbg !24
  %243 = insertelement <8 x i32> %242, i32 %86, i64 2, !dbg !24
  %244 = insertelement <8 x i32> %243, i32 %extelt.offset1, i64 3, !dbg !24
  %245 = insertelement <8 x i32> %244, i32 %87, i64 4, !dbg !24
  %246 = insertelement <8 x i32> %245, i32 %extelt.offset2, i64 5, !dbg !24
  %247 = insertelement <8 x i32> %246, i32 %88, i64 6, !dbg !24
  %248 = insertelement <8 x i32> %247, i32 %extelt.offset3, i64 7, !dbg !24
  %249 = trunc <8 x i32> %248 to <8 x i16>, !dbg !24
  %250 = bitcast <8 x i16> %249 to <8 x half>, !dbg !24
  %251 = insertelement <8 x i32> poison, i32 %91, i64 0, !dbg !26
  %252 = insertelement <8 x i32> %251, i32 %extelt.offset4, i64 1, !dbg !26
  %253 = insertelement <8 x i32> %252, i32 %92, i64 2, !dbg !26
  %254 = insertelement <8 x i32> %253, i32 %extelt.offset5, i64 3, !dbg !26
  %255 = insertelement <8 x i32> %254, i32 %93, i64 4, !dbg !26
  %256 = insertelement <8 x i32> %255, i32 %extelt.offset6, i64 5, !dbg !26
  %257 = insertelement <8 x i32> %256, i32 %94, i64 6, !dbg !26
  %258 = insertelement <8 x i32> %257, i32 %extelt.offset7, i64 7, !dbg !26
  %259 = trunc <8 x i32> %258 to <8 x i16>, !dbg !26
  %260 = bitcast <8 x i16> %259 to <8 x half>, !dbg !26
  %261 = fpext <8 x half> %260 to <8 x float>, !dbg !57
  %262 = insertelement <8 x i32> poison, i32 %97, i64 0, !dbg !28
  %263 = insertelement <8 x i32> %262, i32 %extelt.offset8, i64 1, !dbg !28
  %264 = insertelement <8 x i32> %263, i32 %98, i64 2, !dbg !28
  %265 = insertelement <8 x i32> %264, i32 %extelt.offset9, i64 3, !dbg !28
  %266 = insertelement <8 x i32> %265, i32 %99, i64 4, !dbg !28
  %267 = insertelement <8 x i32> %266, i32 %extelt.offset10, i64 5, !dbg !28
  %268 = insertelement <8 x i32> %267, i32 %100, i64 6, !dbg !28
  %269 = insertelement <8 x i32> %268, i32 %extelt.offset11, i64 7, !dbg !28
  %270 = trunc <8 x i32> %269 to <8 x i16>, !dbg !28
  %271 = bitcast <8 x i16> %270 to <8 x half>, !dbg !28
  %272 = fpext <8 x half> %271 to <8 x float>, !dbg !58
  %273 = fcmp ole <8 x half> %250, zeroinitializer, !dbg !59
  %274 = fadd <8 x float> %261, %272, !dbg !60
  %275 = select <8 x i1> %273, <8 x float> zeroinitializer, <8 x float> %274, !dbg !61
  %276 = mul i64 %213, 7, !dbg !62
  %277 = mul i64 %214, 7, !dbg !62
  %278 = mul i64 %215, 7, !dbg !62
  %279 = mul i64 %216, 7, !dbg !62
  %280 = mul nsw i32 %43, 49, !dbg !63
  %281 = mul nsw i32 %44, 49, !dbg !63
  %282 = sext i32 %280 to i64, !dbg !64
  %283 = sext i32 %281 to i64, !dbg !64
  %284 = mul nsw i32 %45, 3552, !dbg !65
  %285 = sext i32 %284 to i64, !dbg !66
  %286 = getelementptr float, ptr addrspace(1) %15, i64 %233, !dbg !67
  %287 = getelementptr float, ptr addrspace(1) %286, i64 %276, !dbg !67
  %288 = getelementptr float, ptr addrspace(1) %287, i64 %282, !dbg !67
  %289 = getelementptr float, ptr addrspace(1) %288, i64 %285, !dbg !67
  %290 = getelementptr float, ptr addrspace(1) %15, i64 %234, !dbg !67
  %291 = getelementptr float, ptr addrspace(1) %290, i64 %276, !dbg !67
  %292 = getelementptr float, ptr addrspace(1) %291, i64 %282, !dbg !67
  %293 = getelementptr float, ptr addrspace(1) %292, i64 %285, !dbg !67
  %294 = getelementptr float, ptr addrspace(1) %15, i64 %235, !dbg !67
  %295 = getelementptr float, ptr addrspace(1) %294, i64 %277, !dbg !67
  %296 = getelementptr float, ptr addrspace(1) %295, i64 %282, !dbg !67
  %297 = getelementptr float, ptr addrspace(1) %296, i64 %285, !dbg !67
  %298 = getelementptr float, ptr addrspace(1) %15, i64 %236, !dbg !67
  %299 = getelementptr float, ptr addrspace(1) %298, i64 %277, !dbg !67
  %300 = getelementptr float, ptr addrspace(1) %299, i64 %282, !dbg !67
  %301 = getelementptr float, ptr addrspace(1) %300, i64 %285, !dbg !67
  %302 = getelementptr float, ptr addrspace(1) %15, i64 %237, !dbg !67
  %303 = getelementptr float, ptr addrspace(1) %302, i64 %278, !dbg !67
  %304 = getelementptr float, ptr addrspace(1) %303, i64 %283, !dbg !67
  %305 = getelementptr float, ptr addrspace(1) %304, i64 %285, !dbg !67
  %306 = getelementptr float, ptr addrspace(1) %15, i64 %238, !dbg !67
  %307 = getelementptr float, ptr addrspace(1) %306, i64 %278, !dbg !67
  %308 = getelementptr float, ptr addrspace(1) %307, i64 %283, !dbg !67
  %309 = getelementptr float, ptr addrspace(1) %308, i64 %285, !dbg !67
  %310 = getelementptr float, ptr addrspace(1) %15, i64 %239, !dbg !67
  %311 = getelementptr float, ptr addrspace(1) %310, i64 %279, !dbg !67
  %312 = getelementptr float, ptr addrspace(1) %311, i64 %283, !dbg !67
  %313 = getelementptr float, ptr addrspace(1) %312, i64 %285, !dbg !67
  %314 = getelementptr float, ptr addrspace(1) %15, i64 %240, !dbg !67
  %315 = getelementptr float, ptr addrspace(1) %314, i64 %279, !dbg !67
  %316 = getelementptr float, ptr addrspace(1) %315, i64 %283, !dbg !67
  %317 = getelementptr float, ptr addrspace(1) %316, i64 %285, !dbg !67
  %318 = and i32 %22, 127, !dbg !68
  %319 = shl nuw nsw i32 %318, 3, !dbg !68
  %320 = zext nneg i32 %319 to i64, !dbg !68
  %321 = getelementptr i64, ptr addrspace(3) @global_smem, i64 %320, !dbg !68
  %322 = insertelement <8 x ptr addrspace(1)> poison, ptr addrspace(1) %289, i64 0, !dbg !68
  %323 = insertelement <8 x ptr addrspace(1)> %322, ptr addrspace(1) %293, i64 1, !dbg !68
  %324 = insertelement <8 x ptr addrspace(1)> %323, ptr addrspace(1) %297, i64 2, !dbg !68
  %325 = insertelement <8 x ptr addrspace(1)> %324, ptr addrspace(1) %301, i64 3, !dbg !68
  %326 = insertelement <8 x ptr addrspace(1)> %325, ptr addrspace(1) %305, i64 4, !dbg !68
  %327 = insertelement <8 x ptr addrspace(1)> %326, ptr addrspace(1) %309, i64 5, !dbg !68
  %328 = insertelement <8 x ptr addrspace(1)> %327, ptr addrspace(1) %313, i64 6, !dbg !68
  %329 = insertelement <8 x ptr addrspace(1)> %328, ptr addrspace(1) %317, i64 7, !dbg !68
  ; CHECK: %{{.+}} = ptrtoint <8 x i8 addrspace(1)*> %{{.+}} to <8 x i64>, !dbg !68
  %330 = ptrtoint <8 x ptr addrspace(1)> %329 to <8 x i64>, !dbg !68
  store <8 x i64> %330, ptr addrspace(3) %321, align 64, !dbg !68
  tail call void @llvm.nvvm.barrier0(), !dbg !68
  %331 = zext nneg i32 %318 to i64, !dbg !68
  %332 = getelementptr i64, ptr addrspace(3) @global_smem, i64 %331, !dbg !68
  %333 = load i64, ptr addrspace(3) %332, align 8, !dbg !68
  %334 = inttoptr i64 %333 to ptr addrspace(1), !dbg !68
  %335 = or disjoint i32 %318, 128, !dbg !68
  %336 = zext nneg i32 %335 to i64, !dbg !68
  %337 = getelementptr i64, ptr addrspace(3) @global_smem, i64 %336, !dbg !68
  %338 = load i64, ptr addrspace(3) %337, align 8, !dbg !68
  %339 = inttoptr i64 %338 to ptr addrspace(1), !dbg !68
  %340 = or disjoint i32 %318, 256, !dbg !68
  %341 = zext nneg i32 %340 to i64, !dbg !68
  %342 = getelementptr i64, ptr addrspace(3) @global_smem, i64 %341, !dbg !68
  %343 = load i64, ptr addrspace(3) %342, align 8, !dbg !68
  %344 = inttoptr i64 %343 to ptr addrspace(1), !dbg !68
  %345 = or disjoint i32 %318, 384, !dbg !68
  %346 = zext nneg i32 %345 to i64, !dbg !68
  %347 = getelementptr i64, ptr addrspace(3) @global_smem, i64 %346, !dbg !68
  %348 = load i64, ptr addrspace(3) %347, align 8, !dbg !68
  %349 = inttoptr i64 %348 to ptr addrspace(1), !dbg !68
  %350 = or disjoint i32 %318, 512, !dbg !68
  %351 = zext nneg i32 %350 to i64, !dbg !68
  %352 = getelementptr i64, ptr addrspace(3) @global_smem, i64 %351, !dbg !68
  %353 = load i64, ptr addrspace(3) %352, align 8, !dbg !68
  %354 = inttoptr i64 %353 to ptr addrspace(1), !dbg !68
  %355 = or disjoint i32 %318, 640, !dbg !68
  %356 = zext nneg i32 %355 to i64, !dbg !68
  %357 = getelementptr i64, ptr addrspace(3) @global_smem, i64 %356, !dbg !68
  %358 = load i64, ptr addrspace(3) %357, align 8, !dbg !68
  %359 = inttoptr i64 %358 to ptr addrspace(1), !dbg !68
  %360 = or disjoint i32 %318, 768, !dbg !68
  %361 = zext nneg i32 %360 to i64, !dbg !68
  %362 = getelementptr i64, ptr addrspace(3) @global_smem, i64 %361, !dbg !68
  %363 = load i64, ptr addrspace(3) %362, align 8, !dbg !68
  %364 = inttoptr i64 %363 to ptr addrspace(1), !dbg !68
  %365 = or disjoint i32 %318, 896, !dbg !68
  %366 = zext nneg i32 %365 to i64, !dbg !68
  %367 = getelementptr i64, ptr addrspace(3) @global_smem, i64 %366, !dbg !68
  %368 = load i64, ptr addrspace(3) %367, align 8, !dbg !68
  %369 = inttoptr i64 %368 to ptr addrspace(1), !dbg !68
  tail call void @llvm.nvvm.barrier0(), !dbg !68
  %370 = getelementptr float, ptr addrspace(3) @global_smem, i64 %320, !dbg !68
  store <8 x float> %275, ptr addrspace(3) %370, align 32, !dbg !68
  tail call void @llvm.nvvm.barrier0(), !dbg !68
  %371 = getelementptr float, ptr addrspace(3) @global_smem, i64 %331, !dbg !68
  %372 = load <1 x float>, ptr addrspace(3) %371, align 4, !dbg !68
  %373 = getelementptr float, ptr addrspace(3) @global_smem, i64 %336, !dbg !68
  %374 = load <1 x float>, ptr addrspace(3) %373, align 4, !dbg !68
  %375 = getelementptr float, ptr addrspace(3) @global_smem, i64 %341, !dbg !68
  %376 = load <1 x float>, ptr addrspace(3) %375, align 4, !dbg !68
  %377 = getelementptr float, ptr addrspace(3) @global_smem, i64 %346, !dbg !68
  %378 = load <1 x float>, ptr addrspace(3) %377, align 4, !dbg !68
  %379 = getelementptr float, ptr addrspace(3) @global_smem, i64 %351, !dbg !68
  %380 = load <1 x float>, ptr addrspace(3) %379, align 4, !dbg !68
  %381 = getelementptr float, ptr addrspace(3) @global_smem, i64 %356, !dbg !68
  %382 = load <1 x float>, ptr addrspace(3) %381, align 4, !dbg !68
  %383 = getelementptr float, ptr addrspace(3) @global_smem, i64 %361, !dbg !68
  %384 = load <1 x float>, ptr addrspace(3) %383, align 4, !dbg !68
  %385 = getelementptr float, ptr addrspace(3) @global_smem, i64 %366, !dbg !68
  %386 = load <1 x float>, ptr addrspace(3) %385, align 4, !dbg !68
  %387 = tail call float asm sideeffect "mov.u32 $0, 0x0;\0A\09@$3 atom.global.gpu.acq_rel.add.f32 $0, [ $1 + 0 ], $2;", "=r,l,r,b"(ptr addrspace(1) %334, <1 x float> %372, i1 true) #2, !dbg !68
  %388 = tail call float asm sideeffect "mov.u32 $0, 0x0;\0A\09@$3 atom.global.gpu.acq_rel.add.f32 $0, [ $1 + 0 ], $2;", "=r,l,r,b"(ptr addrspace(1) %339, <1 x float> %374, i1 true) #2, !dbg !68
  %389 = tail call float asm sideeffect "mov.u32 $0, 0x0;\0A\09@$3 atom.global.gpu.acq_rel.add.f32 $0, [ $1 + 0 ], $2;", "=r,l,r,b"(ptr addrspace(1) %344, <1 x float> %376, i1 true) #2, !dbg !68
  %390 = tail call float asm sideeffect "mov.u32 $0, 0x0;\0A\09@$3 atom.global.gpu.acq_rel.add.f32 $0, [ $1 + 0 ], $2;", "=r,l,r,b"(ptr addrspace(1) %349, <1 x float> %378, i1 true) #2, !dbg !68
  %391 = tail call float asm sideeffect "mov.u32 $0, 0x0;\0A\09@$3 atom.global.gpu.acq_rel.add.f32 $0, [ $1 + 0 ], $2;", "=r,l,r,b"(ptr addrspace(1) %354, <1 x float> %380, i1 true) #2, !dbg !68
  %392 = tail call float asm sideeffect "mov.u32 $0, 0x0;\0A\09@$3 atom.global.gpu.acq_rel.add.f32 $0, [ $1 + 0 ], $2;", "=r,l,r,b"(ptr addrspace(1) %359, <1 x float> %382, i1 true) #2, !dbg !68
  %393 = tail call float asm sideeffect "mov.u32 $0, 0x0;\0A\09@$3 atom.global.gpu.acq_rel.add.f32 $0, [ $1 + 0 ], $2;", "=r,l,r,b"(ptr addrspace(1) %364, <1 x float> %384, i1 true) #2, !dbg !68
  %394 = tail call float asm sideeffect "mov.u32 $0, 0x0;\0A\09@$3 atom.global.gpu.acq_rel.add.f32 $0, [ $1 + 0 ], $2;", "=r,l,r,b"(ptr addrspace(1) %369, <1 x float> %386, i1 true) #2, !dbg !68
  %395 = getelementptr half, ptr addrspace(1) %16, i64 %82, !dbg !69
  %396 = insertelement <2 x i32> poison, i32 %103, i64 0, !dbg !30
  %397 = insertelement <2 x i32> %396, i32 %extelt.offset12, i64 1, !dbg !30
  %398 = trunc <2 x i32> %397 to <2 x i16>, !dbg !30
  %399 = bitcast <2 x i16> %398 to <2 x half>, !dbg !30
  %400 = fpext <2 x half> %399 to <2 x float>, !dbg !70
  %401 = insertelement <2 x i32> poison, i32 %111, i64 0, !dbg !32
  %402 = insertelement <2 x i32> %401, i32 %112, i64 1, !dbg !32
  %403 = bitcast <2 x i32> %402 to <2 x float>, !dbg !32
  %404 = insertelement <2 x i32> poison, i32 %121, i64 0, !dbg !34
  %405 = insertelement <2 x i32> %404, i32 %122, i64 1, !dbg !34
  %406 = bitcast <2 x i32> %405 to <2 x float>, !dbg !34
  %407 = insertelement <2 x i32> poison, i32 %131, i64 0, !dbg !36
  %408 = insertelement <2 x i32> %407, i32 %132, i64 1, !dbg !36
  %409 = bitcast <2 x i32> %408 to <2 x float>, !dbg !36
  %410 = insertelement <2 x i32> poison, i32 %141, i64 0, !dbg !38
  %411 = insertelement <2 x i32> %410, i32 %142, i64 1, !dbg !38
  %412 = bitcast <2 x i32> %411 to <2 x float>, !dbg !38
  %413 = insertelement <2 x i32> poison, i32 %151, i64 0, !dbg !40
  %414 = insertelement <2 x i32> %413, i32 %152, i64 1, !dbg !40
  %415 = bitcast <2 x i32> %414 to <2 x float>, !dbg !40
  %416 = fsub <2 x float> %400, %403, !dbg !71
  %417 = fmul <2 x float> %406, <float 0x3F04E5E0A0000000, float 0x3F04E5E0A0000000>, !dbg !72
  %418 = fmul <2 x float> %409, %409, !dbg !73
  %419 = fmul <2 x float> %417, %418, !dbg !74
  %420 = fmul <2 x float> %416, %419, !dbg !75
  %421 = shufflevector <8 x float> %275, <8 x float> poison, <2 x i32> <i32 0, i32 1>, !dbg !76
  %422 = fsub <2 x float> %421, %420, !dbg !76
  %423 = fmul <2 x float> %412, <float 0x3F04E5E0A0000000, float 0x3F04E5E0A0000000>, !dbg !77
  %424 = fsub <2 x float> %422, %423, !dbg !78
  %425 = fmul <2 x float> %409, %415, !dbg !79
  %426 = fmul <2 x float> %424, %425, !dbg !80
  %427 = fptrunc <2 x float> %426 to <2 x half>, !dbg !81
  %428 = insertelement <2 x i32> poison, i32 %104, i64 0, !dbg !30
  %429 = insertelement <2 x i32> %428, i32 %extelt.offset13, i64 1, !dbg !30
  %430 = trunc <2 x i32> %429 to <2 x i16>, !dbg !30
  %431 = bitcast <2 x i16> %430 to <2 x half>, !dbg !30
  %432 = fpext <2 x half> %431 to <2 x float>, !dbg !70
  %433 = insertelement <2 x i32> poison, i32 %113, i64 0, !dbg !32
  %434 = insertelement <2 x i32> %433, i32 %114, i64 1, !dbg !32
  %435 = bitcast <2 x i32> %434 to <2 x float>, !dbg !32
  %436 = insertelement <2 x i32> poison, i32 %123, i64 0, !dbg !34
  %437 = insertelement <2 x i32> %436, i32 %124, i64 1, !dbg !34
  %438 = bitcast <2 x i32> %437 to <2 x float>, !dbg !34
  %439 = insertelement <2 x i32> poison, i32 %133, i64 0, !dbg !36
  %440 = insertelement <2 x i32> %439, i32 %134, i64 1, !dbg !36
  %441 = bitcast <2 x i32> %440 to <2 x float>, !dbg !36
  %442 = insertelement <2 x i32> poison, i32 %143, i64 0, !dbg !38
  %443 = insertelement <2 x i32> %442, i32 %144, i64 1, !dbg !38
  %444 = bitcast <2 x i32> %443 to <2 x float>, !dbg !38
  %445 = insertelement <2 x i32> poison, i32 %153, i64 0, !dbg !40
  %446 = insertelement <2 x i32> %445, i32 %154, i64 1, !dbg !40
  %447 = bitcast <2 x i32> %446 to <2 x float>, !dbg !40
  %448 = fsub <2 x float> %432, %435, !dbg !71
  %449 = fmul <2 x float> %438, <float 0x3F04E5E0A0000000, float 0x3F04E5E0A0000000>, !dbg !72
  %450 = fmul <2 x float> %441, %441, !dbg !73
  %451 = fmul <2 x float> %449, %450, !dbg !74
  %452 = fmul <2 x float> %448, %451, !dbg !75
  %453 = shufflevector <8 x float> %275, <8 x float> poison, <2 x i32> <i32 2, i32 3>, !dbg !76
  %454 = fsub <2 x float> %453, %452, !dbg !76
  %455 = fmul <2 x float> %444, <float 0x3F04E5E0A0000000, float 0x3F04E5E0A0000000>, !dbg !77
  %456 = fsub <2 x float> %454, %455, !dbg !78
  %457 = fmul <2 x float> %441, %447, !dbg !79
  %458 = fmul <2 x float> %456, %457, !dbg !80
  %459 = fptrunc <2 x float> %458 to <2 x half>, !dbg !81
  %460 = insertelement <2 x i32> poison, i32 %105, i64 0, !dbg !30
  %461 = insertelement <2 x i32> %460, i32 %extelt.offset14, i64 1, !dbg !30
  %462 = trunc <2 x i32> %461 to <2 x i16>, !dbg !30
  %463 = bitcast <2 x i16> %462 to <2 x half>, !dbg !30
  %464 = fpext <2 x half> %463 to <2 x float>, !dbg !70
  %465 = insertelement <2 x i32> poison, i32 %115, i64 0, !dbg !32
  %466 = insertelement <2 x i32> %465, i32 %116, i64 1, !dbg !32
  %467 = bitcast <2 x i32> %466 to <2 x float>, !dbg !32
  %468 = insertelement <2 x i32> poison, i32 %125, i64 0, !dbg !34
  %469 = insertelement <2 x i32> %468, i32 %126, i64 1, !dbg !34
  %470 = bitcast <2 x i32> %469 to <2 x float>, !dbg !34
  %471 = insertelement <2 x i32> poison, i32 %135, i64 0, !dbg !36
  %472 = insertelement <2 x i32> %471, i32 %136, i64 1, !dbg !36
  %473 = bitcast <2 x i32> %472 to <2 x float>, !dbg !36
  %474 = insertelement <2 x i32> poison, i32 %145, i64 0, !dbg !38
  %475 = insertelement <2 x i32> %474, i32 %146, i64 1, !dbg !38
  %476 = bitcast <2 x i32> %475 to <2 x float>, !dbg !38
  %477 = insertelement <2 x i32> poison, i32 %155, i64 0, !dbg !40
  %478 = insertelement <2 x i32> %477, i32 %156, i64 1, !dbg !40
  %479 = bitcast <2 x i32> %478 to <2 x float>, !dbg !40
  %480 = fsub <2 x float> %464, %467, !dbg !71
  %481 = fmul <2 x float> %470, <float 0x3F04E5E0A0000000, float 0x3F04E5E0A0000000>, !dbg !72
  %482 = fmul <2 x float> %473, %473, !dbg !73
  %483 = fmul <2 x float> %481, %482, !dbg !74
  %484 = fmul <2 x float> %480, %483, !dbg !75
  %485 = shufflevector <8 x float> %275, <8 x float> poison, <2 x i32> <i32 4, i32 5>, !dbg !76
  %486 = fsub <2 x float> %485, %484, !dbg !76
  %487 = fmul <2 x float> %476, <float 0x3F04E5E0A0000000, float 0x3F04E5E0A0000000>, !dbg !77
  %488 = fsub <2 x float> %486, %487, !dbg !78
  %489 = fmul <2 x float> %473, %479, !dbg !79
  %490 = fmul <2 x float> %488, %489, !dbg !80
  %491 = fptrunc <2 x float> %490 to <2 x half>, !dbg !81
  %492 = insertelement <2 x i32> poison, i32 %106, i64 0, !dbg !30
  %493 = insertelement <2 x i32> %492, i32 %extelt.offset15, i64 1, !dbg !30
  %494 = trunc <2 x i32> %493 to <2 x i16>, !dbg !30
  %495 = bitcast <2 x i16> %494 to <2 x half>, !dbg !30
  %496 = fpext <2 x half> %495 to <2 x float>, !dbg !70
  %497 = insertelement <2 x i32> poison, i32 %117, i64 0, !dbg !32
  %498 = insertelement <2 x i32> %497, i32 %118, i64 1, !dbg !32
  %499 = bitcast <2 x i32> %498 to <2 x float>, !dbg !32
  %500 = insertelement <2 x i32> poison, i32 %127, i64 0, !dbg !34
  %501 = insertelement <2 x i32> %500, i32 %128, i64 1, !dbg !34
  %502 = bitcast <2 x i32> %501 to <2 x float>, !dbg !34
  %503 = insertelement <2 x i32> poison, i32 %137, i64 0, !dbg !36
  %504 = insertelement <2 x i32> %503, i32 %138, i64 1, !dbg !36
  %505 = bitcast <2 x i32> %504 to <2 x float>, !dbg !36
  %506 = insertelement <2 x i32> poison, i32 %147, i64 0, !dbg !38
  %507 = insertelement <2 x i32> %506, i32 %148, i64 1, !dbg !38
  %508 = bitcast <2 x i32> %507 to <2 x float>, !dbg !38
  %509 = insertelement <2 x i32> poison, i32 %157, i64 0, !dbg !40
  %510 = insertelement <2 x i32> %509, i32 %158, i64 1, !dbg !40
  %511 = bitcast <2 x i32> %510 to <2 x float>, !dbg !40
  %512 = fsub <2 x float> %496, %499, !dbg !71
  %513 = fmul <2 x float> %502, <float 0x3F04E5E0A0000000, float 0x3F04E5E0A0000000>, !dbg !72
  %514 = fmul <2 x float> %505, %505, !dbg !73
  %515 = fmul <2 x float> %513, %514, !dbg !74
  %516 = fmul <2 x float> %512, %515, !dbg !75
  %517 = shufflevector <8 x float> %275, <8 x float> poison, <2 x i32> <i32 6, i32 7>, !dbg !76
  %518 = fsub <2 x float> %517, %516, !dbg !76
  %519 = fmul <2 x float> %508, <float 0x3F04E5E0A0000000, float 0x3F04E5E0A0000000>, !dbg !77
  %520 = fsub <2 x float> %518, %519, !dbg !78
  %521 = fmul <2 x float> %505, %511, !dbg !79
  %522 = fmul <2 x float> %520, %521, !dbg !80
  %523 = fptrunc <2 x float> %522 to <2 x half>, !dbg !81
  %524 = bitcast <2 x half> %427 to i32, !dbg !81
  %525 = bitcast <2 x half> %459 to i32, !dbg !81
  %526 = bitcast <2 x half> %491 to i32, !dbg !81
  %527 = bitcast <2 x half> %523 to i32, !dbg !81
  tail call void asm sideeffect "@$5 st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l,b"(i32 %524, i32 %525, i32 %526, i32 %527, ptr addrspace(1) %395, i1 true) #2, !dbg !81
  %528 = getelementptr half, ptr addrspace(1) %17, i64 %82, !dbg !82
  %529 = insertelement <2 x i32> poison, i32 %161, i64 0, !dbg !42
  %530 = insertelement <2 x i32> %529, i32 %extelt.offset16, i64 1, !dbg !42
  %531 = trunc <2 x i32> %530 to <2 x i16>, !dbg !42
  %532 = bitcast <2 x i16> %531 to <2 x half>, !dbg !42
  %533 = fpext <2 x half> %532 to <2 x float>, !dbg !83
  %534 = insertelement <2 x i32> poison, i32 %167, i64 0, !dbg !44
  %535 = insertelement <2 x i32> %534, i32 %168, i64 1, !dbg !44
  %536 = bitcast <2 x i32> %535 to <2 x float>, !dbg !44
  %537 = insertelement <2 x i32> poison, i32 %177, i64 0, !dbg !46
  %538 = insertelement <2 x i32> %537, i32 %178, i64 1, !dbg !46
  %539 = bitcast <2 x i32> %538 to <2 x float>, !dbg !46
  %540 = insertelement <2 x i32> poison, i32 %187, i64 0, !dbg !48
  %541 = insertelement <2 x i32> %540, i32 %188, i64 1, !dbg !48
  %542 = bitcast <2 x i32> %541 to <2 x float>, !dbg !48
  %543 = insertelement <2 x i32> poison, i32 %197, i64 0, !dbg !50
  %544 = insertelement <2 x i32> %543, i32 %198, i64 1, !dbg !50
  %545 = bitcast <2 x i32> %544 to <2 x float>, !dbg !50
  %546 = fsub <2 x float> %533, %536, !dbg !84
  %547 = fmul <2 x float> %539, <float 0x3F04E5E0A0000000, float 0x3F04E5E0A0000000>, !dbg !85
  %548 = fmul <2 x float> %542, %542, !dbg !86
  %549 = fmul <2 x float> %547, %548, !dbg !87
  %550 = fmul <2 x float> %546, %549, !dbg !88
  %551 = fsub <2 x float> %421, %550, !dbg !89
  %552 = fmul <2 x float> %542, %545, !dbg !90
  %553 = fsub <2 x float> %551, %423, !dbg !91
  %554 = fmul <2 x float> %553, %552, !dbg !92
  %555 = fptrunc <2 x float> %554 to <2 x half>, !dbg !93
  %556 = insertelement <2 x i32> poison, i32 %162, i64 0, !dbg !42
  %557 = insertelement <2 x i32> %556, i32 %extelt.offset17, i64 1, !dbg !42
  %558 = trunc <2 x i32> %557 to <2 x i16>, !dbg !42
  %559 = bitcast <2 x i16> %558 to <2 x half>, !dbg !42
  %560 = fpext <2 x half> %559 to <2 x float>, !dbg !83
  %561 = insertelement <2 x i32> poison, i32 %169, i64 0, !dbg !44
  %562 = insertelement <2 x i32> %561, i32 %170, i64 1, !dbg !44
  %563 = bitcast <2 x i32> %562 to <2 x float>, !dbg !44
  %564 = insertelement <2 x i32> poison, i32 %179, i64 0, !dbg !46
  %565 = insertelement <2 x i32> %564, i32 %180, i64 1, !dbg !46
  %566 = bitcast <2 x i32> %565 to <2 x float>, !dbg !46
  %567 = insertelement <2 x i32> poison, i32 %189, i64 0, !dbg !48
  %568 = insertelement <2 x i32> %567, i32 %190, i64 1, !dbg !48
  %569 = bitcast <2 x i32> %568 to <2 x float>, !dbg !48
  %570 = insertelement <2 x i32> poison, i32 %199, i64 0, !dbg !50
  %571 = insertelement <2 x i32> %570, i32 %200, i64 1, !dbg !50
  %572 = bitcast <2 x i32> %571 to <2 x float>, !dbg !50
  %573 = fsub <2 x float> %560, %563, !dbg !84
  %574 = fmul <2 x float> %566, <float 0x3F04E5E0A0000000, float 0x3F04E5E0A0000000>, !dbg !85
  %575 = fmul <2 x float> %569, %569, !dbg !86
  %576 = fmul <2 x float> %574, %575, !dbg !87
  %577 = fmul <2 x float> %573, %576, !dbg !88
  %578 = fsub <2 x float> %453, %577, !dbg !89
  %579 = fmul <2 x float> %569, %572, !dbg !90
  %580 = fsub <2 x float> %578, %455, !dbg !91
  %581 = fmul <2 x float> %580, %579, !dbg !92
  %582 = fptrunc <2 x float> %581 to <2 x half>, !dbg !93
  %583 = insertelement <2 x i32> poison, i32 %163, i64 0, !dbg !42
  %584 = insertelement <2 x i32> %583, i32 %extelt.offset18, i64 1, !dbg !42
  %585 = trunc <2 x i32> %584 to <2 x i16>, !dbg !42
  %586 = bitcast <2 x i16> %585 to <2 x half>, !dbg !42
  %587 = fpext <2 x half> %586 to <2 x float>, !dbg !83
  %588 = insertelement <2 x i32> poison, i32 %171, i64 0, !dbg !44
  %589 = insertelement <2 x i32> %588, i32 %172, i64 1, !dbg !44
  %590 = bitcast <2 x i32> %589 to <2 x float>, !dbg !44
  %591 = insertelement <2 x i32> poison, i32 %181, i64 0, !dbg !46
  %592 = insertelement <2 x i32> %591, i32 %182, i64 1, !dbg !46
  %593 = bitcast <2 x i32> %592 to <2 x float>, !dbg !46
  %594 = insertelement <2 x i32> poison, i32 %191, i64 0, !dbg !48
  %595 = insertelement <2 x i32> %594, i32 %192, i64 1, !dbg !48
  %596 = bitcast <2 x i32> %595 to <2 x float>, !dbg !48
  %597 = insertelement <2 x i32> poison, i32 %201, i64 0, !dbg !50
  %598 = insertelement <2 x i32> %597, i32 %202, i64 1, !dbg !50
  %599 = bitcast <2 x i32> %598 to <2 x float>, !dbg !50
  %600 = fsub <2 x float> %587, %590, !dbg !84
  %601 = fmul <2 x float> %593, <float 0x3F04E5E0A0000000, float 0x3F04E5E0A0000000>, !dbg !85
  %602 = fmul <2 x float> %596, %596, !dbg !86
  %603 = fmul <2 x float> %601, %602, !dbg !87
  %604 = fmul <2 x float> %600, %603, !dbg !88
  %605 = fsub <2 x float> %485, %604, !dbg !89
  %606 = fmul <2 x float> %596, %599, !dbg !90
  %607 = fsub <2 x float> %605, %487, !dbg !91
  %608 = fmul <2 x float> %607, %606, !dbg !92
  %609 = fptrunc <2 x float> %608 to <2 x half>, !dbg !93
  %610 = insertelement <2 x i32> poison, i32 %164, i64 0, !dbg !42
  %611 = insertelement <2 x i32> %610, i32 %extelt.offset19, i64 1, !dbg !42
  %612 = trunc <2 x i32> %611 to <2 x i16>, !dbg !42
  %613 = bitcast <2 x i16> %612 to <2 x half>, !dbg !42
  %614 = fpext <2 x half> %613 to <2 x float>, !dbg !83
  %615 = insertelement <2 x i32> poison, i32 %173, i64 0, !dbg !44
  %616 = insertelement <2 x i32> %615, i32 %174, i64 1, !dbg !44
  %617 = bitcast <2 x i32> %616 to <2 x float>, !dbg !44
  %618 = insertelement <2 x i32> poison, i32 %183, i64 0, !dbg !46
  %619 = insertelement <2 x i32> %618, i32 %184, i64 1, !dbg !46
  %620 = bitcast <2 x i32> %619 to <2 x float>, !dbg !46
  %621 = insertelement <2 x i32> poison, i32 %193, i64 0, !dbg !48
  %622 = insertelement <2 x i32> %621, i32 %194, i64 1, !dbg !48
  %623 = bitcast <2 x i32> %622 to <2 x float>, !dbg !48
  %624 = insertelement <2 x i32> poison, i32 %203, i64 0, !dbg !50
  %625 = insertelement <2 x i32> %624, i32 %204, i64 1, !dbg !50
  %626 = bitcast <2 x i32> %625 to <2 x float>, !dbg !50
  %627 = fsub <2 x float> %614, %617, !dbg !84
  %628 = fmul <2 x float> %620, <float 0x3F04E5E0A0000000, float 0x3F04E5E0A0000000>, !dbg !85
  %629 = fmul <2 x float> %623, %623, !dbg !86
  %630 = fmul <2 x float> %628, %629, !dbg !87
  %631 = fmul <2 x float> %627, %630, !dbg !88
  %632 = fsub <2 x float> %517, %631, !dbg !89
  %633 = fmul <2 x float> %623, %626, !dbg !90
  %634 = fsub <2 x float> %632, %519, !dbg !91
  %635 = fmul <2 x float> %634, %633, !dbg !92
  %636 = fptrunc <2 x float> %635 to <2 x half>, !dbg !93
  %637 = bitcast <2 x half> %555 to i32, !dbg !93
  %638 = bitcast <2 x half> %582 to i32, !dbg !93
  %639 = bitcast <2 x half> %609 to i32, !dbg !93
  %640 = bitcast <2 x half> %636 to i32, !dbg !93
  tail call void asm sideeffect "@$5 st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l,b"(i32 %637, i32 %638, i32 %639, i32 %640, ptr addrspace(1) %528, i1 true) #2, !dbg !93
  ret void, !dbg !94
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #1

attributes #0 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { convergent nocallback nounwind }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}
!nvvm.annotations = !{!4, !5}
!llvm.ident = !{!6}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 4, !"nvvm-reflect-ftz", i32 1}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "triton", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly)
!3 = !DIFile(filename: "c52jjjo2t5g5ay2mff3xz454jfwbma5b3gv5lshze4ixqtkn3k7j.py", directory: "/tmp/tmpjd0ohatt/52")
!4 = !{ptr @triton_, !"kernel", i32 1}
!5 = !{ptr @triton_, !"maxntidx", i32 128}
!6 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!7 = distinct !DISubprogram(name: "triton_", linkageName: "triton_", scope: !3, file: !3, line: 18, type: !8, scopeLine: 18, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2)
!8 = !DISubroutineType(cc: DW_CC_normal, types: !9)
!9 = !{}
!10 = !DILocation(line: 20, column: 28, scope: !7)
!11 = !DILocation(line: 20, column: 33, scope: !7)
!12 = !DILocation(line: 21, column: 36, scope: !7)
!13 = !DILocation(line: 21, column: 23, scope: !7)
!14 = !DILocation(line: 23, column: 20, scope: !7)
!15 = !DILocation(line: 23, column: 26, scope: !7)
!16 = !DILocation(line: 26, column: 20, scope: !7)
!17 = !DILocation(line: 26, column: 27, scope: !7)
!18 = !DILocation(line: 27, column: 20, scope: !7)
!19 = !DILocation(line: 28, column: 30, scope: !7)
!20 = !DILocation(line: 28, column: 35, scope: !7)
!21 = !DILocation(line: 29, column: 30, scope: !7)
!22 = !DILocation(line: 29, column: 35, scope: !7)
!23 = !DILocation(line: 30, column: 30, scope: !7)
!24 = !DILocation(line: 30, column: 35, scope: !7)
!25 = !DILocation(line: 31, column: 31, scope: !7)
!26 = !DILocation(line: 31, column: 36, scope: !7)
!27 = !DILocation(line: 32, column: 31, scope: !7)
!28 = !DILocation(line: 32, column: 36, scope: !7)
!29 = !DILocation(line: 33, column: 31, scope: !7)
!30 = !DILocation(line: 33, column: 36, scope: !7)
!31 = !DILocation(line: 34, column: 31, scope: !7)
!32 = !DILocation(line: 34, column: 36, scope: !7)
!33 = !DILocation(line: 35, column: 31, scope: !7)
!34 = !DILocation(line: 35, column: 36, scope: !7)
!35 = !DILocation(line: 36, column: 31, scope: !7)
!36 = !DILocation(line: 36, column: 36, scope: !7)
!37 = !DILocation(line: 37, column: 31, scope: !7)
!38 = !DILocation(line: 37, column: 36, scope: !7)
!39 = !DILocation(line: 38, column: 31, scope: !7)
!40 = !DILocation(line: 38, column: 36, scope: !7)
!41 = !DILocation(line: 39, column: 32, scope: !7)
!42 = !DILocation(line: 39, column: 37, scope: !7)
!43 = !DILocation(line: 40, column: 32, scope: !7)
!44 = !DILocation(line: 40, column: 37, scope: !7)
!45 = !DILocation(line: 41, column: 32, scope: !7)
!46 = !DILocation(line: 41, column: 37, scope: !7)
!47 = !DILocation(line: 42, column: 32, scope: !7)
!48 = !DILocation(line: 42, column: 37, scope: !7)
!49 = !DILocation(line: 43, column: 32, scope: !7)
!50 = !DILocation(line: 43, column: 37, scope: !7)
!51 = !DILocation(line: 45, column: 18, scope: !7)
!52 = !DILocation(line: 46, column: 18, scope: !7)
!53 = !DILocation(line: 47, column: 32, scope: !7)
!54 = !DILocation(line: 48, column: 18, scope: !7)
!55 = !DILocation(line: 49, column: 18, scope: !7)
!56 = !DILocation(line: 50, column: 32, scope: !7)
!57 = !DILocation(line: 31, column: 45, scope: !7)
!58 = !DILocation(line: 32, column: 45, scope: !7)
!59 = !DILocation(line: 52, column: 20, scope: !7)
!60 = !DILocation(line: 53, column: 20, scope: !7)
!61 = !DILocation(line: 54, column: 35, scope: !7)
!62 = !DILocation(line: 80, column: 40, scope: !7)
!63 = !DILocation(line: 80, column: 52, scope: !7)
!64 = !DILocation(line: 80, column: 49, scope: !7)
!65 = !DILocation(line: 80, column: 64, scope: !7)
!66 = !DILocation(line: 80, column: 59, scope: !7)
!67 = !DILocation(line: 80, column: 30, scope: !7)
!68 = !DILocation(line: 80, column: 77, scope: !7)
!69 = !DILocation(line: 81, column: 25, scope: !7)
!70 = !DILocation(line: 33, column: 45, scope: !7)
!71 = !DILocation(line: 57, column: 20, scope: !7)
!72 = !DILocation(line: 59, column: 20, scope: !7)
!73 = !DILocation(line: 60, column: 20, scope: !7)
!74 = !DILocation(line: 61, column: 20, scope: !7)
!75 = !DILocation(line: 62, column: 20, scope: !7)
!76 = !DILocation(line: 63, column: 20, scope: !7)
!77 = !DILocation(line: 64, column: 20, scope: !7)
!78 = !DILocation(line: 65, column: 20, scope: !7)
!79 = !DILocation(line: 66, column: 20, scope: !7)
!80 = !DILocation(line: 67, column: 20, scope: !7)
!81 = !DILocation(line: 81, column: 37, scope: !7)
!82 = !DILocation(line: 82, column: 25, scope: !7)
!83 = !DILocation(line: 39, column: 46, scope: !7)
!84 = !DILocation(line: 69, column: 20, scope: !7)
!85 = !DILocation(line: 70, column: 20, scope: !7)
!86 = !DILocation(line: 71, column: 20, scope: !7)
!87 = !DILocation(line: 72, column: 20, scope: !7)
!88 = !DILocation(line: 73, column: 20, scope: !7)
!89 = !DILocation(line: 74, column: 20, scope: !7)
!90 = !DILocation(line: 76, column: 20, scope: !7)
!91 = !DILocation(line: 75, column: 20, scope: !7)
!92 = !DILocation(line: 77, column: 20, scope: !7)
!93 = !DILocation(line: 82, column: 37, scope: !7)
!94 = !DILocation(line: 82, column: 4, scope: !7)
