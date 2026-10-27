; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@global_smem = external addrspace(3) global [0 x i8]

; CHECK-LABLE: _sdd_kernel_0d1d2d3d4d5d6c7d8d9c10d11d12d13d14c15d16d17d
define void @_sdd_kernel_0d1d2d3d4d5d6c7d8d9c10d11d12d13d14c15d16d17d(ptr addrspace(1) %0, ptr addrspace(1) %1, ptr addrspace(1) %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13, ptr addrspace(1) %14) local_unnamed_addr !dbg !5 {
  %16 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !8
  %17 = and i32 %16, 31, !dbg !8
  %18 = lshr i32 %16, 5, !dbg !8
  %19 = lshr i32 %17, 2, !dbg !8
  %20 = shl nuw nsw i32 %18, 3, !dbg !8
  %21 = and i32 %20, 24, !dbg !8
  %22 = or i32 %21, %19, !dbg !8
  %23 = and i32 %16, 3, !dbg !8
  %24 = shl nuw nsw i32 %23, 3, !dbg !8
  %25 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !dbg !9
  %26 = add i32 %25, %13, !dbg !10
  %27 = mul i32 %26, 3, !dbg !11
  %28 = sext i32 %27 to i64, !dbg !12
  %29 = getelementptr i32, ptr addrspace(1) %14, i64 %28, !dbg !12
  %30 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.z(), !dbg !13
  %31 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %29, i1 true) #2, !dbg !14
  %32 = getelementptr i32, ptr addrspace(1) %29, i64 1, !dbg !15
  %33 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %32, i1 true) #2, !dbg !16
  %34 = shl i32 %33, 5, !dbg !17
  %35 = or i32 %34, %22, !dbg !18
  %36 = mul i32 %30, %3, !dbg !19
  %37 = sext i32 %36 to i64, !dbg !20
  %38 = getelementptr half, ptr addrspace(1) %0, i64 %37, !dbg !20
  %39 = mul i32 %31, %4, !dbg !21
  %40 = sext i32 %39 to i64, !dbg !22
  %41 = getelementptr half, ptr addrspace(1) %38, i64 %40, !dbg !22
  %42 = mul i32 %35, %5, !dbg !23
  %43 = sext i32 %42 to i64, !dbg !24
  %44 = getelementptr half, ptr addrspace(1) %41, i64 %43, !dbg !24
  %45 = zext i32 %24 to i64, !dbg !25
  %46 = getelementptr half, ptr addrspace(1) %44, i64 %45, !dbg !25
  %47 = getelementptr i32, ptr addrspace(1) %29, i64 2, !dbg !26
  %48 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %47, i1 true) #2, !dbg !27
  %49 = shl i32 %48, 5, !dbg !28
  %50 = or i32 %49, %22, !dbg !29
  %51 = mul i32 %30, %6, !dbg !30
  %52 = sext i32 %51 to i64, !dbg !31
  %53 = getelementptr half, ptr addrspace(1) %1, i64 %52, !dbg !31
  %54 = mul i32 %31, %7, !dbg !32
  %55 = sext i32 %54 to i64, !dbg !33
  %56 = getelementptr half, ptr addrspace(1) %53, i64 %55, !dbg !33
  %57 = mul i32 %50, %8, !dbg !34
  %58 = sext i32 %57 to i64, !dbg !35
  %59 = getelementptr half, ptr addrspace(1) %56, i64 %58, !dbg !35
  %60 = getelementptr half, ptr addrspace(1) %59, i64 %45, !dbg !36
  %61 = icmp sgt i32 %12, 0, !dbg !37
  %62 = shl nuw nsw i32 %22, 5, !dbg !38
  %63 = shl i32 %16, 3, !dbg !38
  %64 = xor i32 %63, %16, !dbg !38
  %65 = and i32 %64, 24, !dbg !38
  %66 = or i32 %62, %65, !dbg !38
  %67 = zext i32 %66 to i64, !dbg !38
  %68 = getelementptr half, ptr addrspace(3) @global_smem, i64 %67, !dbg !38
  %69 = select i1 %61, i32 16, i32 0, !dbg !38
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %68, ptr addrspace(1) %46, i32 %69) #2, !dbg !38
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #2, !dbg !38
  %70 = getelementptr half, ptr addrspace(3) getelementptr ([0 x i8], ptr addrspace(3) @global_smem, i64 0, i64 8192), i64 %67, !dbg !39
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %70, ptr addrspace(1) %60, i32 %69) #2, !dbg !39
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #2, !dbg !39
  %71 = getelementptr half, ptr addrspace(1) %46, i64 32, !dbg !40
  %72 = getelementptr half, ptr addrspace(1) %60, i64 32, !dbg !41
  %73 = icmp sgt i32 %12, 32, !dbg !37
  tail call void @llvm.nvvm.barrier0(), !dbg !38
  %74 = getelementptr half, ptr addrspace(3) getelementptr ([0 x i8], ptr addrspace(3) @global_smem, i64 0, i64 2048), i64 %67, !dbg !38
  %75 = select i1 %73, i32 16, i32 0, !dbg !38
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %74, ptr addrspace(1) %71, i32 %75) #2, !dbg !38
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #2, !dbg !38
  %76 = getelementptr half, ptr addrspace(3) getelementptr ([0 x i8], ptr addrspace(3) @global_smem, i64 0, i64 10240), i64 %67, !dbg !39
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %76, ptr addrspace(1) %72, i32 %75) #2, !dbg !39
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #2, !dbg !39
  %77 = getelementptr half, ptr addrspace(1) %46, i64 64, !dbg !40
  %78 = getelementptr half, ptr addrspace(1) %60, i64 64, !dbg !41
  %79 = icmp sgt i32 %12, 64, !dbg !37
  tail call void @llvm.nvvm.barrier0(), !dbg !38
  %80 = getelementptr half, ptr addrspace(3) getelementptr ([0 x i8], ptr addrspace(3) @global_smem, i64 0, i64 4096), i64 %67, !dbg !38
  %81 = select i1 %79, i32 16, i32 0, !dbg !38
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %80, ptr addrspace(1) %77, i32 %81) #2, !dbg !38
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #2, !dbg !38
  %82 = getelementptr half, ptr addrspace(3) getelementptr ([0 x i8], ptr addrspace(3) @global_smem, i64 0, i64 12288), i64 %67, !dbg !39
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %82, ptr addrspace(1) %78, i32 %81) #2, !dbg !39
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #2, !dbg !39
  tail call void asm sideeffect "cp.async.wait_group 0x4;", ""() #2, !dbg !38
  tail call void @llvm.nvvm.barrier0(), !dbg !38
  %83 = and i32 %16, 7, !dbg !38
  %84 = lshr i32 %17, 3, !dbg !38
  %85 = and i32 %84, 1, !dbg !38
  %86 = lshr i32 %83, 1, !dbg !38
  %87 = lshr i32 %16, 2, !dbg !38
  %88 = and i32 %87, 16, !dbg !38
  %89 = lshr i32 %16, 1, !dbg !38
  %90 = and i32 %89, 8, !dbg !38
  %91 = or i32 %90, %83, !dbg !38
  %92 = or i32 %91, %88, !dbg !38
  %93 = xor i32 %85, %86, !dbg !38
  %94 = shl nuw nsw i32 %92, 5, !dbg !38
  %95 = shl nuw nsw i32 %93, 3, !dbg !38
  %96 = or i32 %95, %94, !dbg !38
  %97 = zext i32 %96 to i64, !dbg !38
  %98 = getelementptr half, ptr addrspace(3) @global_smem, i64 %97, !dbg !38
  %99 = tail call { i32, i32, i32, i32 } asm sideeffect "ppu.ldmatrix.sync.aligned.m8n8.x4.shared.b16 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,r"(ptr addrspace(3) %98) #2, !dbg !38
  %100 = add nsw i32 %84, -1, !dbg !39
  %101 = icmp ult i32 %100, 2, !dbg !39
  %102 = xor i32 %84, 3, !dbg !39
  %103 = select i1 %101, i32 %102, i32 %84, !dbg !39
  %104 = lshr i32 %103, 1, !dbg !39
  %105 = shl nuw nsw i32 %18, 4, !dbg !39
  %106 = and i32 %105, 16, !dbg !39
  %107 = shl nuw nsw i32 %103, 3, !dbg !39
  %108 = and i32 %107, 8, !dbg !39
  %109 = or i32 %83, %108, !dbg !39
  %110 = or i32 %109, %106, !dbg !39
  %111 = xor i32 %104, %86, !dbg !39
  %112 = shl nuw nsw i32 %110, 5, !dbg !39
  %113 = shl nuw nsw i32 %111, 3, !dbg !39
  %114 = add nuw nsw i32 %112, %113, !dbg !39
  %115 = zext i32 %114 to i64, !dbg !39
  %116 = getelementptr half, ptr addrspace(3) getelementptr ([0 x i8], ptr addrspace(3) @global_smem, i64 0, i64 8192), i64 %115, !dbg !39
  %117 = tail call { i32, i32, i32, i32 } asm sideeffect "ppu.ldmatrix.sync.aligned.m8n8.x4.shared.b16 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,r"(ptr addrspace(3) %116) #2, !dbg !39
  br i1 %61, label %.lr.ph, label %._crit_edge, !dbg !42

.lr.ph:                                           ; preds = %15, %.lr.ph
  %.pn5368 = phi { i32, i32, i32, i32 } [ %235, %.lr.ph ], [ %117, %15 ]
  %.pn4167 = phi { i32, i32, i32, i32 } [ %233, %.lr.ph ], [ %99, %15 ]
  %118 = phi i32 [ %231, %.lr.ph ], [ 1, %15 ]
  %119 = phi i32 [ %230, %.lr.ph ], [ 3, %15 ]
  %120 = phi i32 [ %207, %.lr.ph ], [ 64, %15 ]
  ;CHECK: %{{.+}} = phi i8 addrspace(1)* [ %{{.+}}, %.lr.ph ], [ %{{.+}}, %{{.+}} ]
  %.pn3266 = phi ptr addrspace(1) [ %212, %.lr.ph ], [ %78, %15 ]
  %.pn1665 = phi ptr addrspace(1) [ %211, %.lr.ph ], [ %77, %15 ]
  ;CHECK: %{{.+}} = phi { i8 addrspace(3)*, i32, i32, i32, i32 } [ %{{.+}}, %.lr.ph ], [ %{{.+}}, %{{.+}} ]
  %121 = phi { ptr addrspace(3), i32, i32, i32, i32 } [ %229, %.lr.ph ], [ { ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i32 8192), i32 1, i32 32, i32 0, i32 0 }, %15 ]
  ;CHECK: %{{.+}} = phi { i8 addrspace(3)*, i32, i32, i32, i32 } [ %{{.+}}, %.lr.ph ], [ %{{.+}}, %{{.+}} ]
  %122 = phi { ptr addrspace(3), i32, i32, i32, i32 } [ %223, %.lr.ph ], [ { ptr addrspace(3) @global_smem, i32 32, i32 1, i32 0, i32 0 }, %15 ]
  %123 = phi { float, float, float, float, float, float, float, float } [ %206, %.lr.ph ], [ zeroinitializer, %15 ]
  %124 = phi i32 [ %236, %.lr.ph ], [ 0, %15 ]
  %.pn52 = extractvalue { i32, i32, i32, i32 } %.pn5368, 0, !dbg !39
  %.pn50 = extractvalue { i32, i32, i32, i32 } %.pn5368, 1, !dbg !39
  %.pn48 = extractvalue { i32, i32, i32, i32 } %.pn5368, 2, !dbg !39
  %.pn46 = extractvalue { i32, i32, i32, i32 } %.pn5368, 3, !dbg !39
  %.pn40 = extractvalue { i32, i32, i32, i32 } %.pn4167, 0, !dbg !38
  %.pn38 = extractvalue { i32, i32, i32, i32 } %.pn4167, 1, !dbg !38
  %.pn36 = extractvalue { i32, i32, i32, i32 } %.pn4167, 2, !dbg !38
  %.pn34 = extractvalue { i32, i32, i32, i32 } %.pn4167, 3, !dbg !38
  %125 = extractvalue { ptr addrspace(3), i32, i32, i32, i32 } %122, 0, !dbg !38
  %126 = extractvalue { ptr addrspace(3), i32, i32, i32, i32 } %122, 1, !dbg !38
  %127 = extractvalue { ptr addrspace(3), i32, i32, i32, i32 } %122, 2, !dbg !38
  %128 = extractvalue { ptr addrspace(3), i32, i32, i32, i32 } %122, 4, !dbg !38
  %129 = add i32 %128, 16, !dbg !38
  %130 = shl i32 %127, 4, !dbg !38
  %131 = sext i32 %130 to i64, !dbg !38
  %132 = getelementptr half, ptr addrspace(3) %125, i64 %131, !dbg !38
  %133 = lshr i32 %129, 3, !dbg !38
  %134 = add nuw nsw i32 %133, %85, !dbg !38
  %135 = xor i32 %134, %86, !dbg !38
  %136 = mul i32 %126, %92, !dbg !38
  %137 = shl i32 %135, 3, !dbg !38
  %138 = add i32 %137, %136, !dbg !38
  %139 = sub i32 -16, %128, !dbg !38
  %140 = sext i32 %139 to i64, !dbg !38
  %141 = getelementptr half, ptr addrspace(3) %132, i64 %140, !dbg !38
  %142 = sext i32 %138 to i64, !dbg !38
  %143 = getelementptr half, ptr addrspace(3) %141, i64 %142, !dbg !38
  %144 = tail call { i32, i32, i32, i32 } asm sideeffect "ppu.ldmatrix.sync.aligned.m8n8.x4.shared.b16 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,r"(ptr addrspace(3) %143) #2, !dbg !38
  %145 = extractvalue { i32, i32, i32, i32 } %144, 0, !dbg !38
  %146 = extractvalue { i32, i32, i32, i32 } %144, 1, !dbg !38
  %147 = extractvalue { i32, i32, i32, i32 } %144, 2, !dbg !38
  %148 = extractvalue { i32, i32, i32, i32 } %144, 3, !dbg !38
  %149 = extractvalue { ptr addrspace(3), i32, i32, i32, i32 } %121, 0, !dbg !39
  %150 = extractvalue { ptr addrspace(3), i32, i32, i32, i32 } %121, 1, !dbg !39
  %151 = extractvalue { ptr addrspace(3), i32, i32, i32, i32 } %121, 2, !dbg !39
  %152 = extractvalue { ptr addrspace(3), i32, i32, i32, i32 } %121, 3, !dbg !39
  %153 = add i32 %152, 16, !dbg !39
  %154 = shl i32 %150, 4, !dbg !39
  %155 = sext i32 %154 to i64, !dbg !39
  %156 = getelementptr half, ptr addrspace(3) %149, i64 %155, !dbg !39
  %157 = lshr i32 %153, 3, !dbg !39
  %158 = add nuw nsw i32 %157, %104, !dbg !39
  %159 = xor i32 %158, %86, !dbg !39
  %160 = mul i32 %151, %110, !dbg !39
  %161 = shl i32 %159, 3, !dbg !39
  %162 = add i32 %161, %160, !dbg !39
  %163 = sub i32 -16, %152, !dbg !39
  %164 = sext i32 %163 to i64, !dbg !39
  %165 = getelementptr half, ptr addrspace(3) %156, i64 %164, !dbg !39
  %166 = sext i32 %162 to i64, !dbg !39
  %167 = getelementptr half, ptr addrspace(3) %165, i64 %166, !dbg !39
  %168 = tail call { i32, i32, i32, i32 } asm sideeffect "ppu.ldmatrix.sync.aligned.m8n8.x4.shared.b16 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,r"(ptr addrspace(3) %167) #2, !dbg !39
  %169 = extractvalue { i32, i32, i32, i32 } %168, 0, !dbg !39
  %170 = extractvalue { i32, i32, i32, i32 } %168, 1, !dbg !39
  %171 = extractvalue { i32, i32, i32, i32 } %168, 2, !dbg !39
  %172 = extractvalue { i32, i32, i32, i32 } %168, 3, !dbg !39
  %173 = extractvalue { float, float, float, float, float, float, float, float } %123, 0, !dbg !43
  %174 = extractvalue { float, float, float, float, float, float, float, float } %123, 1, !dbg !43
  %175 = extractvalue { float, float, float, float, float, float, float, float } %123, 2, !dbg !43
  %176 = extractvalue { float, float, float, float, float, float, float, float } %123, 3, !dbg !43
  %177 = extractvalue { float, float, float, float, float, float, float, float } %123, 4, !dbg !43
  %178 = extractvalue { float, float, float, float, float, float, float, float } %123, 5, !dbg !43
  %179 = extractvalue { float, float, float, float, float, float, float, float } %123, 6, !dbg !43
  %180 = extractvalue { float, float, float, float, float, float, float, float } %123, 7, !dbg !43
  %181 = tail call { float, float, float, float, float, float, float, float } asm sideeffect "ppu.mma.sync.aligned.m16n16k16.row.col.f32.f16.f16.f32 { $0, $1, $2, $3, $4, $5, $6, $7 }, { $8, $9, $10, $11 }, { $12, $13, $14, $15 }, { $16, $17, $18, $19, $20, $21, $22, $23 };", "=f,=f,=f,=f,=f,=f,=f,=f,r,r,r,r,r,r,r,r,0,1,2,3,4,5,6,7"(i32 %.pn40, i32 %.pn38, i32 %.pn36, i32 %.pn34, i32 %.pn52, i32 %.pn50, i32 %.pn48, i32 %.pn46, float %173, float %174, float %175, float %176, float %177, float %178, float %179, float %180) #2, !dbg !43
  %182 = extractvalue { float, float, float, float, float, float, float, float } %181, 0, !dbg !43
  %183 = extractvalue { float, float, float, float, float, float, float, float } %181, 1, !dbg !43
  %184 = extractvalue { float, float, float, float, float, float, float, float } %181, 2, !dbg !43
  %185 = extractvalue { float, float, float, float, float, float, float, float } %181, 3, !dbg !43
  %186 = extractvalue { float, float, float, float, float, float, float, float } %181, 4, !dbg !43
  %187 = extractvalue { float, float, float, float, float, float, float, float } %181, 5, !dbg !43
  %188 = extractvalue { float, float, float, float, float, float, float, float } %181, 6, !dbg !43
  %189 = extractvalue { float, float, float, float, float, float, float, float } %181, 7, !dbg !43
  %190 = tail call { float, float, float, float, float, float, float, float } asm sideeffect "ppu.mma.sync.aligned.m16n16k16.row.col.f32.f16.f16.f32 { $0, $1, $2, $3, $4, $5, $6, $7 }, { $8, $9, $10, $11 }, { $12, $13, $14, $15 }, { $16, $17, $18, $19, $20, $21, $22, $23 };", "=f,=f,=f,=f,=f,=f,=f,=f,r,r,r,r,r,r,r,r,0,1,2,3,4,5,6,7"(i32 %145, i32 %146, i32 %147, i32 %148, i32 %169, i32 %170, i32 %171, i32 %172, float %182, float %183, float %184, float %185, float %186, float %187, float %188, float %189) #2, !dbg !43
  %191 = extractvalue { float, float, float, float, float, float, float, float } %190, 0, !dbg !43
  %192 = extractvalue { float, float, float, float, float, float, float, float } %190, 1, !dbg !43
  %193 = extractvalue { float, float, float, float, float, float, float, float } %190, 2, !dbg !43
  %194 = extractvalue { float, float, float, float, float, float, float, float } %190, 3, !dbg !43
  %195 = extractvalue { float, float, float, float, float, float, float, float } %190, 4, !dbg !43
  %196 = extractvalue { float, float, float, float, float, float, float, float } %190, 5, !dbg !43
  %197 = extractvalue { float, float, float, float, float, float, float, float } %190, 6, !dbg !43
  %198 = extractvalue { float, float, float, float, float, float, float, float } %190, 7, !dbg !43
  %199 = insertvalue { float, float, float, float, float, float, float, float } undef, float %191, 0, !dbg !43
  %200 = insertvalue { float, float, float, float, float, float, float, float } %199, float %192, 1, !dbg !43
  %201 = insertvalue { float, float, float, float, float, float, float, float } %200, float %193, 2, !dbg !43
  %202 = insertvalue { float, float, float, float, float, float, float, float } %201, float %194, 3, !dbg !43
  %203 = insertvalue { float, float, float, float, float, float, float, float } %202, float %195, 4, !dbg !43
  %204 = insertvalue { float, float, float, float, float, float, float, float } %203, float %196, 5, !dbg !43
  %205 = insertvalue { float, float, float, float, float, float, float, float } %204, float %197, 6, !dbg !43
  %206 = insertvalue { float, float, float, float, float, float, float, float } %205, float %198, 7, !dbg !43
  %207 = add i32 %120, 32, !dbg !42
  %208 = icmp slt i32 %207, %12, !dbg !42
  %209 = srem i32 %119, 4, !dbg !42
  %210 = srem i32 %118, 4, !dbg !42
  %211 = getelementptr half, ptr addrspace(1) %.pn1665, i64 32, !dbg !40
  %212 = getelementptr half, ptr addrspace(1) %.pn3266, i64 32, !dbg !41
  tail call void @llvm.nvvm.barrier0(), !dbg !38
  %213 = shl nsw i32 %209, 10, !dbg !38
  %214 = sext i32 %213 to i64, !dbg !38
  %gep = getelementptr half, ptr addrspace(3) %68, i64 %214, !dbg !38
  %215 = select i1 %208, i32 16, i32 0, !dbg !38
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %gep, ptr addrspace(1) %211, i32 %215) #2, !dbg !38
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #2, !dbg !38
  %gep64 = getelementptr half, ptr addrspace(3) %70, i64 %214, !dbg !39
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %gep64, ptr addrspace(1) %212, i32 %215) #2, !dbg !39
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #2, !dbg !39
  tail call void asm sideeffect "cp.async.wait_group 0x4;", ""() #2, !dbg !38
  tail call void @llvm.nvvm.barrier0(), !dbg !38
  %216 = shl nsw i32 %210, 10, !dbg !38
  %217 = sext i32 %216 to i64, !dbg !38
  %218 = getelementptr half, ptr addrspace(3) @global_smem, i64 %217, !dbg !38
  %219 = insertvalue { ptr addrspace(3), i32, i32, i32, i32 } undef, ptr addrspace(3) %218, 0, !dbg !38
  %220 = insertvalue { ptr addrspace(3), i32, i32, i32, i32 } %219, i32 32, 1, !dbg !38
  %221 = insertvalue { ptr addrspace(3), i32, i32, i32, i32 } %220, i32 1, 2, !dbg !38
  %222 = insertvalue { ptr addrspace(3), i32, i32, i32, i32 } %221, i32 0, 3, !dbg !38
  %223 = insertvalue { ptr addrspace(3), i32, i32, i32, i32 } %222, i32 0, 4, !dbg !38
  %224 = getelementptr half, ptr addrspace(3) getelementptr ([0 x i8], ptr addrspace(3) @global_smem, i64 0, i64 8192), i64 %217, !dbg !39
  %225 = insertvalue { ptr addrspace(3), i32, i32, i32, i32 } undef, ptr addrspace(3) %224, 0, !dbg !39
  %226 = insertvalue { ptr addrspace(3), i32, i32, i32, i32 } %225, i32 1, 1, !dbg !39
  %227 = insertvalue { ptr addrspace(3), i32, i32, i32, i32 } %226, i32 32, 2, !dbg !39
  %228 = insertvalue { ptr addrspace(3), i32, i32, i32, i32 } %227, i32 0, 3, !dbg !39
  %229 = insertvalue { ptr addrspace(3), i32, i32, i32, i32 } %228, i32 0, 4, !dbg !39
  %230 = add i32 %119, 1, !dbg !42
  %231 = add i32 %118, 1, !dbg !42
  %232 = getelementptr half, ptr addrspace(3) %218, i64 %97, !dbg !38
  %233 = tail call { i32, i32, i32, i32 } asm sideeffect "ppu.ldmatrix.sync.aligned.m8n8.x4.shared.b16 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,r"(ptr addrspace(3) %232) #2, !dbg !38
  %234 = getelementptr half, ptr addrspace(3) %224, i64 %115, !dbg !39
  %235 = tail call { i32, i32, i32, i32 } asm sideeffect "ppu.ldmatrix.sync.aligned.m8n8.x4.shared.b16 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,r"(ptr addrspace(3) %234) #2, !dbg !39
  %236 = add i32 %124, 32, !dbg !42
  %237 = icmp slt i32 %236, %12, !dbg !42
  br i1 %237, label %.lr.ph, label %._crit_edge, !dbg !42

._crit_edge:                                      ; preds = %.lr.ph, %15
  %.lcssa = phi { float, float, float, float, float, float, float, float } [ zeroinitializer, %15 ], [ %206, %.lr.ph ]
  tail call void asm sideeffect "cp.async.wait_group 0x0;", ""() #2, !dbg !42
  tail call void @llvm.nvvm.barrier0(), !dbg !42
  %238 = extractvalue { float, float, float, float, float, float, float, float } %.lcssa, 0, !dbg !44
  %239 = extractvalue { float, float, float, float, float, float, float, float } %.lcssa, 1, !dbg !44
  %240 = extractvalue { float, float, float, float, float, float, float, float } %.lcssa, 2, !dbg !44
  %241 = extractvalue { float, float, float, float, float, float, float, float } %.lcssa, 3, !dbg !44
  %242 = extractvalue { float, float, float, float, float, float, float, float } %.lcssa, 4, !dbg !44
  %243 = extractvalue { float, float, float, float, float, float, float, float } %.lcssa, 5, !dbg !44
  %244 = extractvalue { float, float, float, float, float, float, float, float } %.lcssa, 6, !dbg !44
  %245 = extractvalue { float, float, float, float, float, float, float, float } %.lcssa, 7, !dbg !44
  %246 = fptrunc float %238 to half, !dbg !44
  %247 = fptrunc float %239 to half, !dbg !44
  %248 = fptrunc float %240 to half, !dbg !44
  %249 = fptrunc float %241 to half, !dbg !44
  %250 = fptrunc float %242 to half, !dbg !44
  %251 = fptrunc float %243 to half, !dbg !44
  %252 = fptrunc float %244 to half, !dbg !44
  %253 = fptrunc float %245 to half, !dbg !44
  %254 = mul i32 %30, %9, !dbg !45
  %255 = sext i32 %254 to i64, !dbg !46
  %256 = getelementptr half, ptr addrspace(1) %2, i64 %255, !dbg !46
  %257 = mul i32 %26, %10, !dbg !47
  %258 = sext i32 %257 to i64, !dbg !48
  %259 = getelementptr half, ptr addrspace(1) %256, i64 %258, !dbg !48
  %260 = mul i32 %22, %11, !dbg !49
  %261 = sext i32 %260 to i64, !dbg !50
  %262 = getelementptr half, ptr addrspace(1) %259, i64 %261, !dbg !50
  %263 = getelementptr half, ptr addrspace(1) %262, i64 %45, !dbg !51
  %264 = or i32 %19, %88, !dbg !52
  %265 = or i32 %106, %23, !dbg !52
  %266 = mul nuw nsw i32 %264, 40, !dbg !52
  %267 = add nuw nsw i32 %266, %265, !dbg !52
  %268 = zext i32 %267 to i64, !dbg !52
  %269 = getelementptr half, ptr addrspace(3) @global_smem, i64 %268, !dbg !52
  %270 = insertelement <1 x half> undef, half %246, i64 0, !dbg !52
  store <1 x half> %270, ptr addrspace(3) %269, align 2, !dbg !52
  %271 = or i32 %265, 4, !dbg !52
  %272 = add nuw nsw i32 %271, %266, !dbg !52
  %273 = zext i32 %272 to i64, !dbg !52
  %274 = getelementptr half, ptr addrspace(3) @global_smem, i64 %273, !dbg !52
  %275 = insertelement <1 x half> undef, half %247, i64 0, !dbg !52
  store <1 x half> %275, ptr addrspace(3) %274, align 2, !dbg !52
  %276 = or i32 %265, 8, !dbg !52
  %277 = add nuw nsw i32 %276, %266, !dbg !52
  %278 = zext i32 %277 to i64, !dbg !52
  %279 = getelementptr half, ptr addrspace(3) @global_smem, i64 %278, !dbg !52
  %280 = insertelement <1 x half> undef, half %248, i64 0, !dbg !52
  store <1 x half> %280, ptr addrspace(3) %279, align 2, !dbg !52
  %281 = or i32 %265, 12, !dbg !52
  %282 = add nuw nsw i32 %281, %266, !dbg !52
  %283 = zext i32 %282 to i64, !dbg !52
  %284 = getelementptr half, ptr addrspace(3) @global_smem, i64 %283, !dbg !52
  %285 = insertelement <1 x half> undef, half %249, i64 0, !dbg !52
  store <1 x half> %285, ptr addrspace(3) %284, align 2, !dbg !52
  %286 = add nuw nsw i32 %266, 320, !dbg !52
  %287 = add nuw nsw i32 %286, %265, !dbg !52
  %288 = zext i32 %287 to i64, !dbg !52
  %289 = getelementptr half, ptr addrspace(3) @global_smem, i64 %288, !dbg !52
  %290 = insertelement <1 x half> undef, half %250, i64 0, !dbg !52
  store <1 x half> %290, ptr addrspace(3) %289, align 2, !dbg !52
  %291 = add nuw nsw i32 %286, %271, !dbg !52
  %292 = zext i32 %291 to i64, !dbg !52
  %293 = getelementptr half, ptr addrspace(3) @global_smem, i64 %292, !dbg !52
  %294 = insertelement <1 x half> undef, half %251, i64 0, !dbg !52
  store <1 x half> %294, ptr addrspace(3) %293, align 2, !dbg !52
  %295 = add nuw nsw i32 %286, %276, !dbg !52
  %296 = zext i32 %295 to i64, !dbg !52
  %297 = getelementptr half, ptr addrspace(3) @global_smem, i64 %296, !dbg !52
  %298 = insertelement <1 x half> undef, half %252, i64 0, !dbg !52
  store <1 x half> %298, ptr addrspace(3) %297, align 2, !dbg !52
  %299 = add nuw nsw i32 %286, %281, !dbg !52
  %300 = zext i32 %299 to i64, !dbg !52
  %301 = getelementptr half, ptr addrspace(3) @global_smem, i64 %300, !dbg !52
  %302 = insertelement <1 x half> undef, half %253, i64 0, !dbg !52
  store <1 x half> %302, ptr addrspace(3) %301, align 2, !dbg !52
  tail call void @llvm.nvvm.barrier0(), !dbg !52
  %303 = mul nuw nsw i32 %22, 40, !dbg !52
  %304 = add nuw nsw i32 %303, %24, !dbg !52
  %305 = zext i32 %304 to i64, !dbg !52
  %306 = getelementptr half, ptr addrspace(3) @global_smem, i64 %305, !dbg !52
  %.extract = load i32, ptr addrspace(3) %306, align 16, !dbg !52
  %307 = getelementptr inbounds <4 x i32>, ptr addrspace(3) %306, i64 0, i64 1, !dbg !52
  %.extract58 = load i32, ptr addrspace(3) %307, align 4, !dbg !52
  %308 = getelementptr inbounds <4 x i32>, ptr addrspace(3) %306, i64 0, i64 2, !dbg !52
  %.extract60 = load i32, ptr addrspace(3) %308, align 8, !dbg !52
  %309 = getelementptr inbounds <4 x i32>, ptr addrspace(3) %306, i64 0, i64 3, !dbg !52
  %.extract62 = load i32, ptr addrspace(3) %309, align 4, !dbg !52
  tail call void asm sideeffect "@$5 st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l,b"(i32 %.extract, i32 %.extract58, i32 %.extract60, i32 %.extract62, ptr addrspace(1) %263, i1 true) #2, !dbg !52
  ret void, !dbg !53
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.z() #0

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
!2 = !DIFile(filename: "matmul.py", directory: "/usr/local/lib/python3.10/site-packages/triton/ops/blocksparse")
!3 = !{ptr @_sdd_kernel_0d1d2d3d4d5d6c7d8d9c10d11d12d13d14c15d16d17d, !"kernel", i32 1}
!4 = !{ptr @_sdd_kernel_0d1d2d3d4d5d6c7d8d9c10d11d12d13d14c15d16d17d, !"maxntidx", i32 128}
!5 = distinct !DISubprogram(name: "_sdd_kernel_0d1d2d3d4d5d6c7d8d9c10d11d12d13d14c15d16d17d", linkageName: "_sdd_kernel_0d1d2d3d4d5d6c7d8d9c10d11d12d13d14c15d16d17d", scope: !2, file: !2, line: 17, type: !6, scopeLine: 17, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !1)
!6 = !DISubroutineType(cc: DW_CC_normal, types: !7)
!7 = !{}
!8 = !DILocation(line: 37, column: 47, scope: !5)
!9 = !DILocation(line: 29, column: 29, scope: !5)
!10 = !DILocation(line: 29, column: 34, scope: !5)
!11 = !DILocation(line: 30, column: 22, scope: !5)
!12 = !DILocation(line: 30, column: 11, scope: !5)
!13 = !DILocation(line: 32, column: 26, scope: !5)
!14 = !DILocation(line: 33, column: 20, scope: !5)
!15 = !DILocation(line: 36, column: 29, scope: !5)
!16 = !DILocation(line: 36, column: 23, scope: !5)
!17 = !DILocation(line: 37, column: 25, scope: !5)
!18 = !DILocation(line: 37, column: 34, scope: !5)
!19 = !DILocation(line: 40, column: 18, scope: !5)
!20 = !DILocation(line: 40, column: 10, scope: !5)
!21 = !DILocation(line: 41, column: 18, scope: !5)
!22 = !DILocation(line: 41, column: 10, scope: !5)
!23 = !DILocation(line: 42, column: 29, scope: !5)
!24 = !DILocation(line: 42, column: 10, scope: !5)
!25 = !DILocation(line: 43, column: 10, scope: !5)
!26 = !DILocation(line: 45, column: 29, scope: !5)
!27 = !DILocation(line: 45, column: 23, scope: !5)
!28 = !DILocation(line: 46, column: 25, scope: !5)
!29 = !DILocation(line: 46, column: 34, scope: !5)
!30 = !DILocation(line: 49, column: 18, scope: !5)
!31 = !DILocation(line: 49, column: 10, scope: !5)
!32 = !DILocation(line: 50, column: 18, scope: !5)
!33 = !DILocation(line: 50, column: 10, scope: !5)
!34 = !DILocation(line: 51, column: 29, scope: !5)
!35 = !DILocation(line: 51, column: 10, scope: !5)
!36 = !DILocation(line: 52, column: 10, scope: !5)
!37 = !DILocation(line: 33, column: 26, scope: !5)
!38 = !DILocation(line: 59, column: 24, scope: !5)
!39 = !DILocation(line: 60, column: 24, scope: !5)
!40 = !DILocation(line: 65, column: 18, scope: !5)
!41 = !DILocation(line: 66, column: 18, scope: !5)
!42 = !DILocation(line: 57, column: 25, scope: !5)
!43 = !DILocation(line: 64, scope: !5)
!44 = !DILocation(line: 67, column: 15, scope: !5)
!45 = !DILocation(line: 74, column: 18, scope: !5)
!46 = !DILocation(line: 74, column: 10, scope: !5)
!47 = !DILocation(line: 75, column: 21, scope: !5)
!48 = !DILocation(line: 75, column: 10, scope: !5)
!49 = !DILocation(line: 76, column: 29, scope: !5)
!50 = !DILocation(line: 76, column: 10, scope: !5)
!51 = !DILocation(line: 77, column: 10, scope: !5)
!52 = !DILocation(line: 78, column: 17, scope: !5)
!53 = !DILocation(line: 78, column: 4, scope: !5)

