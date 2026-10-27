; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@global_smem = external addrspace(3) global [0 x i8]

; CHECK-LABEL: _dsd_kernel_0d1d2d3d4d5c6d7d8d9c10d11d12d13d14c15d16d17d
define void @_dsd_kernel_0d1d2d3d4d5c6d7d8d9c10d11d12d13d14c15d16d17d(ptr addrspace(1) %0, ptr addrspace(1) %1, ptr addrspace(1) %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13, ptr addrspace(1) %14) local_unnamed_addr !dbg !5 {
  %16 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !8
  %17 = and i32 %16, 31, !dbg !8
  %18 = lshr i32 %16, 5, !dbg !8
  %19 = shl i32 %16, 3, !dbg !8
  %20 = and i32 %19, 8, !dbg !8
  %21 = and i32 %18, 3, !dbg !8
  %22 = shl nuw nsw i32 %21, 1, !dbg !8
  %23 = and i32 %16, 7, !dbg !9
  %24 = shl nuw nsw i32 %23, 1, !dbg !9
  %25 = lshr i32 %17, 3, !dbg !10
  %26 = shl nuw nsw i32 %21, 2, !dbg !10
  %27 = or i32 %26, %25, !dbg !10
  %28 = lshr i32 %17, 1, !dbg !11
  %29 = shl nuw nsw i32 %21, 4, !dbg !11
  %30 = or i32 %29, %28, !dbg !11
  %31 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !dbg !12
  %32 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !dbg !13
  %33 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x(), !dbg !14
  %34 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.y(), !dbg !15
  %35 = mul i32 %32, %33, !dbg !16
  %36 = add i32 %35, %31, !dbg !20
  %37 = shl i32 %33, 2, !dbg !21
  %38 = sdiv i32 %36, %37, !dbg !22
  %39 = shl i32 %38, 2, !dbg !23
  %40 = sub i32 %34, %39, !dbg !24
  %41 = tail call i32 @llvm.smin.i32(i32 %40, i32 4), !dbg !25
  %42 = srem i32 %36, %41, !dbg !30
  %43 = add i32 %39, %42, !dbg !31
  %44 = mul i32 %38, %37
  %.decomposed = sub i32 %36, %44
  %45 = sdiv i32 %.decomposed, %41, !dbg !32
  %46 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.z(), !dbg !33
  %47 = shl i32 %43, 2, !dbg !34
  %48 = sext i32 %47 to i64, !dbg !35
  %49 = getelementptr i32, ptr addrspace(1) %14, i64 %48, !dbg !35
  %50 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %49, i1 true) #3, !dbg !36
  %51 = getelementptr i32, ptr addrspace(1) %49, i64 1, !dbg !37
  %52 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %51, i1 true) #3, !dbg !38
  %53 = getelementptr i32, ptr addrspace(1) %49, i64 2, !dbg !39
  %54 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %53, i1 true) #3, !dbg !40
  %55 = getelementptr i32, ptr addrspace(1) %49, i64 3, !dbg !41
  %56 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %55, i1 true) #3, !dbg !42
  %57 = sext i32 %50 to i64, !dbg !43
  %58 = getelementptr i32, ptr addrspace(1) %14, i64 %57, !dbg !43
  %59 = getelementptr i32, ptr addrspace(1) %58, i64 1, !dbg !44
  %60 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %59, i1 true) #3, !dbg !45
  %61 = mul i32 %46, %3, !dbg !46
  %62 = sext i32 %61 to i64, !dbg !47
  %63 = getelementptr half, ptr addrspace(1) %0, i64 %62, !dbg !47
  %64 = mul i32 %60, %4, !dbg !48
  %65 = sext i32 %64 to i64, !dbg !49
  %66 = getelementptr half, ptr addrspace(1) %63, i64 %65, !dbg !49
  %67 = zext i32 %24 to i64, !dbg !9
  %68 = getelementptr half, ptr addrspace(1) %66, i64 %67, !dbg !9
  %69 = mul i32 %27, %5, !dbg !50
  %70 = sext i32 %69 to i64, !dbg !10
  %71 = getelementptr half, ptr addrspace(1) %68, i64 %70, !dbg !10
  %72 = shl i32 %45, 7, !dbg !51
  %73 = or i32 %72, %30, !dbg !52
  %74 = or i32 %73, 64, !dbg !52
  %75 = srem i32 %73, %12, !dbg !53
  %76 = srem i32 %74, %12, !dbg !53
  %77 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %58, i1 true) #3, !dbg !54
  %78 = add i32 %77, %20, !dbg !55
  %79 = mul i32 %46, %6, !dbg !56
  %80 = sext i32 %79 to i64, !dbg !57
  %81 = getelementptr half, ptr addrspace(1) %1, i64 %80, !dbg !57
  %82 = mul i32 %56, %7, !dbg !58
  %83 = sext i32 %82 to i64, !dbg !59
  %84 = getelementptr half, ptr addrspace(1) %81, i64 %83, !dbg !59
  %85 = mul i32 %75, %8, !dbg !60
  %86 = mul i32 %76, %8, !dbg !60
  %87 = sext i32 %85 to i64, !dbg !61
  %88 = getelementptr half, ptr addrspace(1) %84, i64 %87, !dbg !61
  %89 = sext i32 %86 to i64, !dbg !61
  %90 = getelementptr half, ptr addrspace(1) %84, i64 %89, !dbg !61
  %91 = sext i32 %78 to i64, !dbg !62
  %92 = getelementptr half, ptr addrspace(1) %88, i64 %91, !dbg !62
  %93 = getelementptr half, ptr addrspace(1) %90, i64 %91, !dbg !62
  %94 = getelementptr i32, ptr addrspace(1) %58, i64 2, !dbg !63
  %95 = getelementptr i32, ptr addrspace(1) %58, i64 3, !dbg !64
  %96 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %95, i1 true) #3, !dbg !65
  %97 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %94, i1 true) #3, !dbg !66
  %98 = icmp sgt i32 %52, 0, !dbg !67
  %99 = and i32 %18, 1, !dbg !68
  %100 = shl nuw nsw i32 %27, 4, !dbg !68
  %101 = lshr i32 %23, 2, !dbg !68
  %102 = xor i32 %101, %99, !dbg !68
  %103 = shl nuw nsw i32 %102, 3, !dbg !68
  %104 = shl i32 %16, 1, !dbg !68
  %105 = and i32 %104, 6, !dbg !68
  %106 = or i32 %103, %105, !dbg !68
  %107 = or i32 %100, %106, !dbg !68
  %108 = zext i32 %107 to i64, !dbg !68
  %109 = getelementptr half, ptr addrspace(3) @global_smem, i64 %108, !dbg !68
  %110 = select i1 %98, i32 4, i32 0, !dbg !68
  tail call void asm sideeffect "cp.async.ca.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x4, $2;", "r,l,r"(ptr addrspace(3) %109, ptr addrspace(1) %71, i32 %110) #3, !dbg !68
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #3, !dbg !68
  %111 = shl nuw nsw i32 %30, 4, !dbg !69
  %112 = xor i32 %19, %16, !dbg !69
  %113 = and i32 %112, 8, !dbg !69
  %114 = or i32 %111, %113, !dbg !69
  %115 = zext i32 %114 to i64, !dbg !69
  %116 = getelementptr half, ptr addrspace(3) getelementptr ([0 x i8], ptr addrspace(3) @global_smem, i64 0, i64 2048), i64 %115, !dbg !69
  %117 = getelementptr half, ptr addrspace(3) %116, i64 1024, !dbg !69
  %118 = select i1 %98, i32 16, i32 0, !dbg !69
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %116, ptr addrspace(1) %92, i32 %118) #3, !dbg !69
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %117, ptr addrspace(1) %93, i32 %118) #3, !dbg !69
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #3, !dbg !69
  %119 = sext i32 %96 to i64, !dbg !70
  %120 = getelementptr half, ptr addrspace(1) %71, i64 %119, !dbg !70
  %121 = sext i32 %97 to i64, !dbg !71
  %122 = getelementptr half, ptr addrspace(1) %92, i64 %121, !dbg !71
  %123 = getelementptr half, ptr addrspace(1) %93, i64 %121, !dbg !71
  %124 = getelementptr i32, ptr addrspace(1) %58, i64 4, !dbg !72
  %125 = getelementptr i32, ptr addrspace(1) %58, i64 5, !dbg !73
  %126 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %125, i1 %98) #3, !dbg !74
  %127 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %124, i1 %98) #3, !dbg !75
  %128 = icmp sgt i32 %52, 16, !dbg !67
  tail call void @llvm.nvvm.barrier0(), !dbg !68
  %129 = getelementptr half, ptr addrspace(3) getelementptr ([0 x i8], ptr addrspace(3) @global_smem, i64 0, i64 512), i64 %108, !dbg !68
  %130 = select i1 %128, i32 4, i32 0, !dbg !68
  tail call void asm sideeffect "cp.async.ca.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x4, $2;", "r,l,r"(ptr addrspace(3) %129, ptr addrspace(1) %120, i32 %130) #3, !dbg !68
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #3, !dbg !68
  %131 = getelementptr half, ptr addrspace(3) getelementptr ([0 x i8], ptr addrspace(3) @global_smem, i64 0, i64 6144), i64 %115, !dbg !69
  %132 = getelementptr half, ptr addrspace(3) %131, i64 1024, !dbg !69
  %133 = select i1 %128, i32 16, i32 0, !dbg !69
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %131, ptr addrspace(1) %122, i32 %133) #3, !dbg !69
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %132, ptr addrspace(1) %123, i32 %133) #3, !dbg !69
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #3, !dbg !69
  %134 = sext i32 %126 to i64, !dbg !70
  %135 = getelementptr half, ptr addrspace(1) %120, i64 %134, !dbg !70
  %136 = sext i32 %127 to i64, !dbg !71
  %137 = getelementptr half, ptr addrspace(1) %122, i64 %136, !dbg !71
  %138 = getelementptr half, ptr addrspace(1) %123, i64 %136, !dbg !71
  %139 = getelementptr i32, ptr addrspace(1) %58, i64 6, !dbg !72
  %140 = getelementptr i32, ptr addrspace(1) %58, i64 7, !dbg !73
  %141 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %140, i1 %128) #3, !dbg !74
  %142 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %139, i1 %128) #3, !dbg !75
  %143 = icmp sgt i32 %52, 32, !dbg !67
  tail call void @llvm.nvvm.barrier0(), !dbg !68
  %144 = getelementptr half, ptr addrspace(3) getelementptr ([0 x i8], ptr addrspace(3) @global_smem, i64 0, i64 1024), i64 %108, !dbg !68
  %145 = select i1 %143, i32 4, i32 0, !dbg !68
  tail call void asm sideeffect "cp.async.ca.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x4, $2;", "r,l,r"(ptr addrspace(3) %144, ptr addrspace(1) %135, i32 %145) #3, !dbg !68
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #3, !dbg !68
  %146 = getelementptr half, ptr addrspace(3) getelementptr ([0 x i8], ptr addrspace(3) @global_smem, i64 0, i64 10240), i64 %115, !dbg !69
  %147 = getelementptr half, ptr addrspace(3) %146, i64 1024, !dbg !69
  %148 = select i1 %143, i32 16, i32 0, !dbg !69
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %146, ptr addrspace(1) %137, i32 %148) #3, !dbg !69
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %147, ptr addrspace(1) %138, i32 %148) #3, !dbg !69
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #3, !dbg !69
  tail call void asm sideeffect "cp.async.wait_group 0x4;", ""() #3, !dbg !68
  tail call void @llvm.nvvm.barrier0(), !dbg !68
  %149 = lshr i32 %17, 4
  br i1 %98, label %.lr.ph, label %._crit_edge, !dbg !76

.lr.ph:                                           ; preds = %15
  %150 = and i32 %16, 15
  %151 = add nsw i32 %25, -1
  %152 = icmp ult i32 %151, 2
  %153 = xor i32 %25, 3
  %154 = select i1 %152, i32 %153, i32 %25
  %155 = lshr i32 %154, 1
  %156 = and i32 %154, 1
  %157 = or i32 %156, %22
  %158 = shl nuw nsw i32 %157, 3
  %159 = or i32 %158, %23
  br label %160, !dbg !76

160:                                              ; preds = %.lr.ph, %160
  %161 = phi i32 [ 1, %.lr.ph ], [ %309, %160 ]
  %162 = phi i32 [ 3, %.lr.ph ], [ %308, %160 ]
  %163 = phi i32 [ 32, %.lr.ph ], [ %272, %160 ]
  %164 = phi i32 [ %142, %.lr.ph ], [ %284, %160 ]
  %.pn2055 = phi ptr addrspace(1) [ %138, %.lr.ph ], [ %280, %160 ]
  %.pn3654 = phi ptr addrspace(1) [ %137, %.lr.ph ], [ %279, %160 ]
  %165 = phi ptr addrspace(1) [ %139, %.lr.ph ], [ %281, %160 ]
  %166 = phi i32 [ %141, %.lr.ph ], [ %283, %160 ]
  %.pn453 = phi ptr addrspace(1) [ %135, %.lr.ph ], [ %277, %160 ]
  %167 = phi { ptr addrspace(3), i32, i32, i32, i32 } [ { ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i32 2048), i32 1, i32 16, i32 0, i32 0 }, %.lr.ph ], [ %307, %160 ]
  %168 = phi { ptr addrspace(3), i32, i32, i32, i32 } [ { ptr addrspace(3) @global_smem, i32 1, i32 16, i32 0, i32 0 }, %.lr.ph ], [ %299, %160 ]
  %169 = phi ptr addrspace(1) [ %94, %.lr.ph ], [ %268, %160 ]
  %170 = phi { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } [ zeroinitializer, %.lr.ph ], [ %267, %160 ]
  %171 = phi i32 [ 0, %.lr.ph ], [ %310, %160 ]
  %172 = extractvalue { ptr addrspace(3), i32, i32, i32, i32 } %168, 0, !dbg !68
  %173 = extractvalue { ptr addrspace(3), i32, i32, i32, i32 } %168, 2, !dbg !68
  %174 = extractvalue { ptr addrspace(3), i32, i32, i32, i32 } %168, 3, !dbg !68
  %175 = lshr i32 %174, 3, !dbg !68
  %176 = add nuw nsw i32 %175, %149, !dbg !68
  %177 = xor i32 %176, %101, !dbg !68
  %178 = mul i32 %173, %150, !dbg !68
  %179 = shl i32 %177, 3, !dbg !68
  %180 = add i32 %179, %178, !dbg !68
  %181 = sub i32 0, %174, !dbg !68
  %182 = sext i32 %181 to i64, !dbg !68
  %183 = getelementptr half, ptr addrspace(3) %172, i64 %182, !dbg !68
  %184 = sext i32 %180 to i64, !dbg !68
  %185 = getelementptr half, ptr addrspace(3) %183, i64 %184, !dbg !68
  %186 = tail call { i32, i32, i32, i32 } asm sideeffect "ppu.ldmatrix.sync.aligned.m8n8.x4.trans.shared.b16 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,r"(ptr addrspace(3) %185) #3, !dbg !68
  %187 = extractvalue { i32, i32, i32, i32 } %186, 0, !dbg !68
  %188 = extractvalue { i32, i32, i32, i32 } %186, 1, !dbg !68
  %189 = extractvalue { i32, i32, i32, i32 } %186, 2, !dbg !68
  %190 = extractvalue { i32, i32, i32, i32 } %186, 3, !dbg !68
  %191 = extractvalue { ptr addrspace(3), i32, i32, i32, i32 } %167, 0, !dbg !69
  %192 = extractvalue { ptr addrspace(3), i32, i32, i32, i32 } %167, 2, !dbg !69
  %193 = extractvalue { ptr addrspace(3), i32, i32, i32, i32 } %167, 3, !dbg !69
  %194 = lshr i32 %193, 3, !dbg !69
  %195 = add nuw nsw i32 %194, %155, !dbg !69
  %196 = xor i32 %195, %101, !dbg !69
  %197 = mul i32 %192, %159, !dbg !69
  %198 = shl i32 %196, 3, !dbg !69
  %199 = add i32 %198, %197, !dbg !69
  %200 = sub i32 0, %193, !dbg !69
  %201 = sext i32 %200 to i64, !dbg !69
  %202 = getelementptr half, ptr addrspace(3) %191, i64 %201, !dbg !69
  %203 = sext i32 %199 to i64, !dbg !69
  %204 = getelementptr half, ptr addrspace(3) %202, i64 %203, !dbg !69
  %205 = tail call { i32, i32, i32, i32 } asm sideeffect "ppu.ldmatrix.sync.aligned.m8n8.x4.shared.b16 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,r"(ptr addrspace(3) %204) #3, !dbg !69
  %206 = extractvalue { i32, i32, i32, i32 } %205, 0, !dbg !69
  %207 = extractvalue { i32, i32, i32, i32 } %205, 1, !dbg !69
  %208 = extractvalue { i32, i32, i32, i32 } %205, 2, !dbg !69
  %209 = extractvalue { i32, i32, i32, i32 } %205, 3, !dbg !69
  %210 = shl i32 %192, 6, !dbg !69
  %211 = sext i32 %210 to i64, !dbg !69
  %212 = getelementptr half, ptr addrspace(3) %204, i64 %211, !dbg !69
  %213 = tail call { i32, i32, i32, i32 } asm sideeffect "ppu.ldmatrix.sync.aligned.m8n8.x4.shared.b16 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,r"(ptr addrspace(3) %212) #3, !dbg !69
  %214 = extractvalue { i32, i32, i32, i32 } %213, 0, !dbg !69
  %215 = extractvalue { i32, i32, i32, i32 } %213, 1, !dbg !69
  %216 = extractvalue { i32, i32, i32, i32 } %213, 2, !dbg !69
  %217 = extractvalue { i32, i32, i32, i32 } %213, 3, !dbg !69
  %218 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %170, 0, !dbg !77
  %219 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %170, 1, !dbg !77
  %220 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %170, 2, !dbg !77
  %221 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %170, 3, !dbg !77
  %222 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %170, 4, !dbg !77
  %223 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %170, 5, !dbg !77
  %224 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %170, 6, !dbg !77
  %225 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %170, 7, !dbg !77
  %226 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %170, 8, !dbg !77
  %227 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %170, 9, !dbg !77
  %228 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %170, 10, !dbg !77
  %229 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %170, 11, !dbg !77
  %230 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %170, 12, !dbg !77
  %231 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %170, 13, !dbg !77
  %232 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %170, 14, !dbg !77
  %233 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %170, 15, !dbg !77
  %234 = tail call { float, float, float, float, float, float, float, float } asm sideeffect "ppu.mma.sync.aligned.m16n16k16.row.col.f32.f16.f16.f32 { $0, $1, $2, $3, $4, $5, $6, $7 }, { $8, $9, $10, $11 }, { $12, $13, $14, $15 }, { $16, $17, $18, $19, $20, $21, $22, $23 };", "=f,=f,=f,=f,=f,=f,=f,=f,r,r,r,r,r,r,r,r,0,1,2,3,4,5,6,7"(i32 %187, i32 %188, i32 %189, i32 %190, i32 %206, i32 %207, i32 %208, i32 %209, float %218, float %219, float %220, float %221, float %222, float %223, float %224, float %225) #3, !dbg !77
  %235 = extractvalue { float, float, float, float, float, float, float, float } %234, 0, !dbg !77
  %236 = extractvalue { float, float, float, float, float, float, float, float } %234, 1, !dbg !77
  %237 = extractvalue { float, float, float, float, float, float, float, float } %234, 2, !dbg !77
  %238 = extractvalue { float, float, float, float, float, float, float, float } %234, 3, !dbg !77
  %239 = extractvalue { float, float, float, float, float, float, float, float } %234, 4, !dbg !77
  %240 = extractvalue { float, float, float, float, float, float, float, float } %234, 5, !dbg !77
  %241 = extractvalue { float, float, float, float, float, float, float, float } %234, 6, !dbg !77
  %242 = extractvalue { float, float, float, float, float, float, float, float } %234, 7, !dbg !77
  %243 = tail call { float, float, float, float, float, float, float, float } asm sideeffect "ppu.mma.sync.aligned.m16n16k16.row.col.f32.f16.f16.f32 { $0, $1, $2, $3, $4, $5, $6, $7 }, { $8, $9, $10, $11 }, { $12, $13, $14, $15 }, { $16, $17, $18, $19, $20, $21, $22, $23 };", "=f,=f,=f,=f,=f,=f,=f,=f,r,r,r,r,r,r,r,r,0,1,2,3,4,5,6,7"(i32 %187, i32 %188, i32 %189, i32 %190, i32 %214, i32 %215, i32 %216, i32 %217, float %226, float %227, float %228, float %229, float %230, float %231, float %232, float %233) #3, !dbg !77
  %244 = extractvalue { float, float, float, float, float, float, float, float } %243, 0, !dbg !77
  %245 = extractvalue { float, float, float, float, float, float, float, float } %243, 1, !dbg !77
  %246 = extractvalue { float, float, float, float, float, float, float, float } %243, 2, !dbg !77
  %247 = extractvalue { float, float, float, float, float, float, float, float } %243, 3, !dbg !77
  %248 = extractvalue { float, float, float, float, float, float, float, float } %243, 4, !dbg !77
  %249 = extractvalue { float, float, float, float, float, float, float, float } %243, 5, !dbg !77
  %250 = extractvalue { float, float, float, float, float, float, float, float } %243, 6, !dbg !77
  %251 = extractvalue { float, float, float, float, float, float, float, float } %243, 7, !dbg !77
  %252 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %235, 0, !dbg !77
  %253 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %252, float %236, 1, !dbg !77
  %254 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %253, float %237, 2, !dbg !77
  %255 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %254, float %238, 3, !dbg !77
  %256 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %255, float %239, 4, !dbg !77
  %257 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %256, float %240, 5, !dbg !77
  %258 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %257, float %241, 6, !dbg !77
  %259 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %258, float %242, 7, !dbg !77
  %260 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %259, float %244, 8, !dbg !77
  %261 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, float %245, 9, !dbg !77
  %262 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, float %246, 10, !dbg !77
  %263 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %262, float %247, 11, !dbg !77
  %264 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %263, float %248, 12, !dbg !77
  %265 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %264, float %249, 13, !dbg !77
  %266 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %265, float %250, 14, !dbg !77
  %267 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %266, float %251, 15, !dbg !77
  %268 = getelementptr i32, ptr addrspace(1) %169, i64 2, !dbg !72
  %269 = getelementptr i32, ptr addrspace(1) %169, i64 3, !dbg !73
  %270 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %269, i1 true) #3, !dbg !74
  %271 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %268, i1 true) #3, !dbg !75
  %272 = add i32 %163, 16, !dbg !76
  %273 = icmp slt i32 %272, %52, !dbg !76
  %274 = srem i32 %162, 4, !dbg !76
  %275 = srem i32 %161, 4, !dbg !76
  %276 = sext i32 %166 to i64, !dbg !70
  %277 = getelementptr half, ptr addrspace(1) %.pn453, i64 %276, !dbg !70
  %278 = sext i32 %164 to i64, !dbg !71
  %279 = getelementptr half, ptr addrspace(1) %.pn3654, i64 %278, !dbg !71
  %280 = getelementptr half, ptr addrspace(1) %.pn2055, i64 %278, !dbg !71
  %281 = getelementptr i32, ptr addrspace(1) %165, i64 2, !dbg !72
  %282 = getelementptr i32, ptr addrspace(1) %165, i64 3, !dbg !73
  %283 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %282, i1 %273) #3, !dbg !74
  %284 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09@$2 ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l,b"(ptr addrspace(1) %281, i1 %273) #3, !dbg !75
  tail call void @llvm.nvvm.barrier0(), !dbg !68
  %285 = shl nsw i32 %274, 8, !dbg !68
  %286 = sext i32 %285 to i64, !dbg !68
  %gep = getelementptr half, ptr addrspace(3) %109, i64 %286, !dbg !68
  %287 = select i1 %273, i32 4, i32 0, !dbg !68
  tail call void asm sideeffect "cp.async.ca.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x4, $2;", "r,l,r"(ptr addrspace(3) %gep, ptr addrspace(1) %277, i32 %287) #3, !dbg !68
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #3, !dbg !68
  %288 = shl nsw i32 %274, 11, !dbg !69
  %289 = sext i32 %288 to i64, !dbg !69
  %gep52 = getelementptr half, ptr addrspace(3) %116, i64 %289, !dbg !69
  %290 = getelementptr half, ptr addrspace(3) %gep52, i64 1024, !dbg !69
  %291 = select i1 %273, i32 16, i32 0, !dbg !69
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %gep52, ptr addrspace(1) %279, i32 %291) #3, !dbg !69
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %290, ptr addrspace(1) %280, i32 %291) #3, !dbg !69
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #3, !dbg !69
  tail call void asm sideeffect "cp.async.wait_group 0x4;", ""() #3, !dbg !68
  tail call void @llvm.nvvm.barrier0(), !dbg !68
  %292 = shl nsw i32 %275, 8, !dbg !68
  %293 = sext i32 %292 to i64, !dbg !68
  %294 = getelementptr half, ptr addrspace(3) @global_smem, i64 %293, !dbg !68
  %295 = insertvalue { ptr addrspace(3), i32, i32, i32, i32 } undef, ptr addrspace(3) %294, 0, !dbg !68
  %296 = insertvalue { ptr addrspace(3), i32, i32, i32, i32 } %295, i32 1, 1, !dbg !68
  %297 = insertvalue { ptr addrspace(3), i32, i32, i32, i32 } %296, i32 16, 2, !dbg !68
  %298 = insertvalue { ptr addrspace(3), i32, i32, i32, i32 } %297, i32 0, 3, !dbg !68
  %299 = insertvalue { ptr addrspace(3), i32, i32, i32, i32 } %298, i32 0, 4, !dbg !68
  %300 = shl nsw i32 %275, 11, !dbg !69
  %301 = sext i32 %300 to i64, !dbg !69
  %302 = getelementptr half, ptr addrspace(3) getelementptr ([0 x i8], ptr addrspace(3) @global_smem, i64 0, i64 2048), i64 %301, !dbg !69
  %303 = insertvalue { ptr addrspace(3), i32, i32, i32, i32 } undef, ptr addrspace(3) %302, 0, !dbg !69
  %304 = insertvalue { ptr addrspace(3), i32, i32, i32, i32 } %303, i32 1, 1, !dbg !69
  %305 = insertvalue { ptr addrspace(3), i32, i32, i32, i32 } %304, i32 16, 2, !dbg !69
  %306 = insertvalue { ptr addrspace(3), i32, i32, i32, i32 } %305, i32 0, 3, !dbg !69
  %307 = insertvalue { ptr addrspace(3), i32, i32, i32, i32 } %306, i32 0, 4, !dbg !69
  %308 = add i32 %162, 1, !dbg !76
  %309 = add i32 %161, 1, !dbg !76
  %310 = add i32 %171, 16, !dbg !76
  %311 = icmp slt i32 %310, %52, !dbg !76
  br i1 %311, label %160, label %._crit_edge, !dbg !76

._crit_edge:                                      ; preds = %160, %15
  %.lcssa = phi { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } [ zeroinitializer, %15 ], [ %267, %160 ]
  %312 = and i32 %19, 120, !dbg !11
  %313 = or i32 %72, %312, !dbg !52
  %314 = or i32 %22, %149, !dbg !8
  %315 = or i32 %314, 8, !dbg !8
  tail call void asm sideeffect "cp.async.wait_group 0x0;", ""() #3, !dbg !76
  tail call void @llvm.nvvm.barrier0(), !dbg !76
  %316 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %.lcssa, 0, !dbg !78
  %317 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %.lcssa, 1, !dbg !78
  %318 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %.lcssa, 2, !dbg !78
  %319 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %.lcssa, 3, !dbg !78
  %320 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %.lcssa, 4, !dbg !78
  %321 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %.lcssa, 5, !dbg !78
  %322 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %.lcssa, 6, !dbg !78
  %323 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %.lcssa, 7, !dbg !78
  %324 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %.lcssa, 8, !dbg !78
  %325 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %.lcssa, 9, !dbg !78
  %326 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %.lcssa, 10, !dbg !78
  %327 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %.lcssa, 11, !dbg !78
  %328 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %.lcssa, 12, !dbg !78
  %329 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %.lcssa, 13, !dbg !78
  %330 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %.lcssa, 14, !dbg !78
  %331 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %.lcssa, 15, !dbg !78
  %332 = fptrunc float %316 to half, !dbg !78
  %333 = fptrunc float %317 to half, !dbg !78
  %334 = fptrunc float %318 to half, !dbg !78
  %335 = fptrunc float %319 to half, !dbg !78
  %336 = fptrunc float %320 to half, !dbg !78
  %337 = fptrunc float %321 to half, !dbg !78
  %338 = fptrunc float %322 to half, !dbg !78
  %339 = fptrunc float %323 to half, !dbg !78
  %340 = fptrunc float %324 to half, !dbg !78
  %341 = fptrunc float %325 to half, !dbg !78
  %342 = fptrunc float %326 to half, !dbg !78
  %343 = fptrunc float %327 to half, !dbg !78
  %344 = fptrunc float %328 to half, !dbg !78
  %345 = fptrunc float %329 to half, !dbg !78
  %346 = fptrunc float %330 to half, !dbg !78
  %347 = fptrunc float %331 to half, !dbg !78
  %348 = shl i32 %54, 4, !dbg !79
  %349 = or i32 %348, %314, !dbg !80
  %350 = or i32 %348, %315, !dbg !80
  %351 = mul i32 %56, %10, !dbg !81
  %352 = sext i32 %351 to i64, !dbg !82
  %353 = getelementptr half, ptr addrspace(1) %2, i64 %352, !dbg !82
  %354 = mul i32 %46, %9, !dbg !83
  %355 = sext i32 %354 to i64, !dbg !84
  %356 = getelementptr half, ptr addrspace(1) %353, i64 %355, !dbg !84
  %357 = mul i32 %349, %11, !dbg !85
  %358 = mul i32 %350, %11, !dbg !85
  %359 = sext i32 %357 to i64, !dbg !86
  %360 = getelementptr half, ptr addrspace(1) %356, i64 %359, !dbg !86
  %361 = sext i32 %358 to i64, !dbg !86
  %362 = getelementptr half, ptr addrspace(1) %356, i64 %361, !dbg !86
  %363 = sext i32 %313 to i64, !dbg !87
  %364 = getelementptr half, ptr addrspace(1) %360, i64 %363, !dbg !87
  %365 = getelementptr half, ptr addrspace(1) %362, i64 %363, !dbg !87
  %366 = icmp slt i32 %313, %12, !dbg !88
  %367 = lshr i32 %17, 2, !dbg !89
  %368 = and i32 %16, 3, !dbg !89
  %369 = or i32 %29, %368, !dbg !89
  %370 = mul nuw nsw i32 %367, 136, !dbg !89
  %371 = add nuw nsw i32 %369, %370, !dbg !89
  %372 = zext i32 %371 to i64, !dbg !89
  %373 = getelementptr half, ptr addrspace(3) @global_smem, i64 %372, !dbg !89
  %374 = insertelement <1 x half> undef, half %332, i64 0, !dbg !89
  store <1 x half> %374, ptr addrspace(3) %373, align 2, !dbg !89
  %375 = or i32 %369, 4, !dbg !89
  %376 = add nuw nsw i32 %375, %370, !dbg !89
  %377 = zext i32 %376 to i64, !dbg !89
  %378 = getelementptr half, ptr addrspace(3) @global_smem, i64 %377, !dbg !89
  %379 = insertelement <1 x half> undef, half %333, i64 0, !dbg !89
  store <1 x half> %379, ptr addrspace(3) %378, align 2, !dbg !89
  %380 = or i32 %369, 8, !dbg !89
  %381 = add nuw nsw i32 %380, %370, !dbg !89
  %382 = zext i32 %381 to i64, !dbg !89
  %383 = getelementptr half, ptr addrspace(3) @global_smem, i64 %382, !dbg !89
  %384 = insertelement <1 x half> undef, half %334, i64 0, !dbg !89
  store <1 x half> %384, ptr addrspace(3) %383, align 2, !dbg !89
  %385 = or i32 %369, 12, !dbg !89
  %386 = add nuw nsw i32 %385, %370, !dbg !89
  %387 = zext i32 %386 to i64, !dbg !89
  %388 = getelementptr half, ptr addrspace(3) @global_smem, i64 %387, !dbg !89
  %389 = insertelement <1 x half> undef, half %335, i64 0, !dbg !89
  store <1 x half> %389, ptr addrspace(3) %388, align 2, !dbg !89
  %390 = add nuw nsw i32 %370, 1088, !dbg !89
  %391 = add nuw nsw i32 %390, %369, !dbg !89
  %392 = zext i32 %391 to i64, !dbg !89
  %393 = getelementptr half, ptr addrspace(3) @global_smem, i64 %392, !dbg !89
  %394 = insertelement <1 x half> undef, half %336, i64 0, !dbg !89
  store <1 x half> %394, ptr addrspace(3) %393, align 2, !dbg !89
  %395 = add nuw nsw i32 %375, %390, !dbg !89
  %396 = zext i32 %395 to i64, !dbg !89
  %397 = getelementptr half, ptr addrspace(3) @global_smem, i64 %396, !dbg !89
  %398 = insertelement <1 x half> undef, half %337, i64 0, !dbg !89
  store <1 x half> %398, ptr addrspace(3) %397, align 2, !dbg !89
  %399 = add nuw nsw i32 %380, %390, !dbg !89
  %400 = zext i32 %399 to i64, !dbg !89
  %401 = getelementptr half, ptr addrspace(3) @global_smem, i64 %400, !dbg !89
  %402 = insertelement <1 x half> undef, half %338, i64 0, !dbg !89
  store <1 x half> %402, ptr addrspace(3) %401, align 2, !dbg !89
  %403 = add nuw nsw i32 %385, %390, !dbg !89
  %404 = zext i32 %403 to i64, !dbg !89
  %405 = getelementptr half, ptr addrspace(3) @global_smem, i64 %404, !dbg !89
  %406 = insertelement <1 x half> undef, half %339, i64 0, !dbg !89
  store <1 x half> %406, ptr addrspace(3) %405, align 2, !dbg !89
  %407 = or i32 %369, 64, !dbg !89
  %408 = add nuw nsw i32 %407, %370, !dbg !89
  %409 = zext i32 %408 to i64, !dbg !89
  %410 = getelementptr half, ptr addrspace(3) @global_smem, i64 %409, !dbg !89
  %411 = insertelement <1 x half> undef, half %340, i64 0, !dbg !89
  store <1 x half> %411, ptr addrspace(3) %410, align 2, !dbg !89
  %412 = or i32 %369, 68, !dbg !89
  %413 = add nuw nsw i32 %412, %370, !dbg !89
  %414 = zext i32 %413 to i64, !dbg !89
  %415 = getelementptr half, ptr addrspace(3) @global_smem, i64 %414, !dbg !89
  %416 = insertelement <1 x half> undef, half %341, i64 0, !dbg !89
  store <1 x half> %416, ptr addrspace(3) %415, align 2, !dbg !89
  %417 = or i32 %369, 72, !dbg !89
  %418 = add nuw nsw i32 %417, %370, !dbg !89
  %419 = zext i32 %418 to i64, !dbg !89
  %420 = getelementptr half, ptr addrspace(3) @global_smem, i64 %419, !dbg !89
  %421 = insertelement <1 x half> undef, half %342, i64 0, !dbg !89
  store <1 x half> %421, ptr addrspace(3) %420, align 2, !dbg !89
  %422 = or i32 %369, 76, !dbg !89
  %423 = add nuw nsw i32 %422, %370, !dbg !89
  %424 = zext i32 %423 to i64, !dbg !89
  %425 = getelementptr half, ptr addrspace(3) @global_smem, i64 %424, !dbg !89
  %426 = insertelement <1 x half> undef, half %343, i64 0, !dbg !89
  store <1 x half> %426, ptr addrspace(3) %425, align 2, !dbg !89
  %427 = add nuw nsw i32 %407, %390, !dbg !89
  %428 = zext i32 %427 to i64, !dbg !89
  %429 = getelementptr half, ptr addrspace(3) @global_smem, i64 %428, !dbg !89
  %430 = insertelement <1 x half> undef, half %344, i64 0, !dbg !89
  store <1 x half> %430, ptr addrspace(3) %429, align 2, !dbg !89
  %431 = add nuw nsw i32 %412, %390, !dbg !89
  %432 = zext i32 %431 to i64, !dbg !89
  %433 = getelementptr half, ptr addrspace(3) @global_smem, i64 %432, !dbg !89
  %434 = insertelement <1 x half> undef, half %345, i64 0, !dbg !89
  store <1 x half> %434, ptr addrspace(3) %433, align 2, !dbg !89
  %435 = add nuw nsw i32 %417, %390, !dbg !89
  %436 = zext i32 %435 to i64, !dbg !89
  %437 = getelementptr half, ptr addrspace(3) @global_smem, i64 %436, !dbg !89
  %438 = insertelement <1 x half> undef, half %346, i64 0, !dbg !89
  store <1 x half> %438, ptr addrspace(3) %437, align 2, !dbg !89
  %439 = add nuw nsw i32 %422, %390, !dbg !89
  %440 = zext i32 %439 to i64, !dbg !89
  %441 = getelementptr half, ptr addrspace(3) @global_smem, i64 %440, !dbg !89
  %442 = insertelement <1 x half> undef, half %347, i64 0, !dbg !89
  store <1 x half> %442, ptr addrspace(3) %441, align 2, !dbg !89
  tail call void @llvm.nvvm.barrier0(), !dbg !89
  %443 = mul nuw nsw i32 %314, 136, !dbg !89
  %444 = add nuw nsw i32 %443, %312, !dbg !89
  %445 = zext i32 %444 to i64, !dbg !89
  %446 = getelementptr half, ptr addrspace(3) @global_smem, i64 %445, !dbg !89
  %447 = mul nuw nsw i32 %315, 136, !dbg !89
  %448 = add nuw nsw i32 %447, %312, !dbg !89
  %449 = zext i32 %448 to i64, !dbg !89
  %450 = getelementptr half, ptr addrspace(3) @global_smem, i64 %449, !dbg !89
  %451 = load <4 x i32>, ptr addrspace(3) %450, align 16, !dbg !89
  %.extract = load i32, ptr addrspace(3) %446, align 16, !dbg !89
  %452 = getelementptr inbounds <4 x i32>, ptr addrspace(3) %446, i64 0, i64 1, !dbg !89
  %.extract38 = load i32, ptr addrspace(3) %452, align 4, !dbg !89
  %453 = getelementptr inbounds <4 x i32>, ptr addrspace(3) %446, i64 0, i64 2, !dbg !89
  %.extract40 = load i32, ptr addrspace(3) %453, align 8, !dbg !89
  %454 = getelementptr inbounds <4 x i32>, ptr addrspace(3) %446, i64 0, i64 3, !dbg !89
  %.extract42 = load i32, ptr addrspace(3) %454, align 4, !dbg !89
  tail call void asm sideeffect "@$5 st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l,b"(i32 %.extract, i32 %.extract38, i32 %.extract40, i32 %.extract42, ptr addrspace(1) %364, i1 %366) #3, !dbg !89
  %.extract44 = extractelement <4 x i32> %451, i64 0, !dbg !89
  %.extract46 = extractelement <4 x i32> %451, i64 1, !dbg !89
  %.extract48 = extractelement <4 x i32> %451, i64 2, !dbg !89
  %.extract50 = extractelement <4 x i32> %451, i64 3, !dbg !89
  tail call void asm sideeffect "@$5 st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l,b"(i32 %.extract44, i32 %.extract46, i32 %.extract48, i32 %.extract50, ptr addrspace(1) %365, i1 %366) #3, !dbg !89
  ret void, !dbg !90
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.nctaid.y() #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.z() #0

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #2

attributes #0 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { convergent nocallback nounwind }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.dbg.cu = !{!1}
!nvvm.annotations = !{!3, !4, !4, !3}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = distinct !DICompileUnit(language: DW_LANG_C, file: !2, producer: "triton", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!2 = !DIFile(filename: "matmul.py", directory: "/ppuswhome/machuanjiang.mcj/miniforge3/envs/py38-triton-2004/lib/python3.8/site-packages/triton/ops/blocksparse")
!3 = !{ptr @_dsd_kernel_0d1d2d3d4d5c6d7d8d9c10d11d12d13d14c15d16d17d, !"kernel", i32 1}
!4 = !{ptr @_dsd_kernel_0d1d2d3d4d5c6d7d8d9c10d11d12d13d14c15d16d17d, !"maxntidx", i32 128}
!5 = distinct !DISubprogram(name: "_dsd_kernel_0d1d2d3d4d5c6d7d8d9c10d11d12d13d14c15d16d17d", linkageName: "_dsd_kernel_0d1d2d3d4d5c6d7d8d9c10d11d12d13d14c15d16d17d", scope: !2, file: !2, line: 131, type: !6, scopeLine: 131, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !1)
!6 = !DISubroutineType(cc: DW_CC_normal, types: !7)
!7 = !{}
!8 = !DILocation(line: 158, column: 27, scope: !5)
!9 = !DILocation(line: 162, column: 10, scope: !5)
!10 = !DILocation(line: 163, column: 10, scope: !5)
!11 = !DILocation(line: 165, column: 44, scope: !5)
!12 = !DILocation(line: 143, column: 26, scope: !5)
!13 = !DILocation(line: 144, column: 26, scope: !5)
!14 = !DILocation(line: 145, column: 32, scope: !5)
!15 = !DILocation(line: 146, column: 32, scope: !5)
!16 = !DILocation(line: 67, column: 13, scope: !17, inlinedAt: !19)
!17 = distinct !DILexicalBlockFile(scope: !5, file: !18, discriminator: 0)
!18 = !DIFile(filename: "standard.py", directory: "/ppuswhome/machuanjiang.mcj/miniforge3/envs/py38-triton-2004/lib/python3.8/site-packages/triton/language")
!19 = !DILocation(line: 147, column: 68, scope: !17)
!20 = !DILocation(line: 67, column: 22, scope: !17, inlinedAt: !19)
!21 = !DILocation(line: 70, column: 23, scope: !17, inlinedAt: !19)
!22 = !DILocation(line: 72, column: 21, scope: !17, inlinedAt: !19)
!23 = !DILocation(line: 74, column: 23, scope: !17, inlinedAt: !19)
!24 = !DILocation(line: 76, column: 35, scope: !17, inlinedAt: !19)
!25 = !DILocation(line: 1385, column: 27, scope: !26, inlinedAt: !28)
!26 = distinct !DILexicalBlockFile(scope: !17, file: !27, discriminator: 0)
!27 = !DIFile(filename: "core.py", directory: "/ppuswhome/machuanjiang.mcj/miniforge3/envs/py38-triton-2004/lib/python3.8/site-packages/triton/language")
!28 = !DILocation(line: 76, column: 42, scope: !26, inlinedAt: !29)
!29 = !DILocation(line: 147, column: 68, scope: !26)
!30 = !DILocation(line: 78, column: 26, scope: !17, inlinedAt: !19)
!31 = !DILocation(line: 78, column: 21, scope: !17, inlinedAt: !19)
!32 = !DILocation(line: 79, column: 30, scope: !17, inlinedAt: !19)
!33 = !DILocation(line: 148, column: 25, scope: !5)
!34 = !DILocation(line: 149, column: 27, scope: !5)
!35 = !DILocation(line: 149, column: 19, scope: !5)
!36 = !DILocation(line: 150, column: 21, scope: !5)
!37 = !DILocation(line: 151, column: 25, scope: !5)
!38 = !DILocation(line: 151, column: 16, scope: !5)
!39 = !DILocation(line: 152, column: 30, scope: !5)
!40 = !DILocation(line: 152, column: 21, scope: !5)
!41 = !DILocation(line: 153, column: 29, scope: !5)
!42 = !DILocation(line: 153, column: 20, scope: !5)
!43 = !DILocation(line: 154, column: 17, scope: !5)
!44 = !DILocation(line: 156, column: 30, scope: !5)
!45 = !DILocation(line: 156, column: 23, scope: !5)
!46 = !DILocation(line: 160, column: 20, scope: !5)
!47 = !DILocation(line: 160, column: 13, scope: !5)
!48 = !DILocation(line: 161, column: 21, scope: !5)
!49 = !DILocation(line: 161, column: 10, scope: !5)
!50 = !DILocation(line: 163, column: 29, scope: !5)
!51 = !DILocation(line: 165, column: 22, scope: !5)
!52 = !DILocation(line: 165, column: 31, scope: !5)
!53 = !DILocation(line: 166, column: 57, scope: !5)
!54 = !DILocation(line: 167, column: 23, scope: !5)
!55 = !DILocation(line: 169, column: 25, scope: !5)
!56 = !DILocation(line: 170, column: 20, scope: !5)
!57 = !DILocation(line: 170, column: 13, scope: !5)
!58 = !DILocation(line: 171, column: 18, scope: !5)
!59 = !DILocation(line: 171, column: 10, scope: !5)
!60 = !DILocation(line: 172, column: 29, scope: !5)
!61 = !DILocation(line: 172, column: 10, scope: !5)
!62 = !DILocation(line: 173, column: 10, scope: !5)
!63 = !DILocation(line: 178, column: 12, scope: !5)
!64 = !DILocation(line: 179, column: 27, scope: !5)
!65 = !DILocation(line: 179, column: 20, scope: !5)
!66 = !DILocation(line: 181, column: 20, scope: !5)
!67 = !DILocation(line: 150, column: 30, scope: !5)
!68 = !DILocation(line: 184, column: 20, scope: !5)
!69 = !DILocation(line: 185, column: 20, scope: !5)
!70 = !DILocation(line: 187, column: 14, scope: !5)
!71 = !DILocation(line: 188, column: 14, scope: !5)
!72 = !DILocation(line: 189, column: 16, scope: !5)
!73 = !DILocation(line: 190, column: 31, scope: !5)
!74 = !DILocation(line: 190, column: 24, scope: !5)
!75 = !DILocation(line: 192, column: 24, scope: !5)
!76 = !DILocation(line: 183, column: 25, scope: !5)
!77 = !DILocation(line: 186, scope: !5)
!78 = !DILocation(line: 194, column: 15, scope: !5)
!79 = !DILocation(line: 196, column: 23, scope: !5)
!80 = !DILocation(line: 196, column: 32, scope: !5)
!81 = !DILocation(line: 199, column: 18, scope: !5)
!82 = !DILocation(line: 199, column: 10, scope: !5)
!83 = !DILocation(line: 200, column: 17, scope: !5)
!84 = !DILocation(line: 200, column: 10, scope: !5)
!85 = !DILocation(line: 201, column: 29, scope: !5)
!86 = !DILocation(line: 201, column: 10, scope: !5)
!87 = !DILocation(line: 202, column: 10, scope: !5)
!88 = !DILocation(line: 203, column: 44, scope: !5)
!89 = !DILocation(line: 203, column: 17, scope: !5)
!90 = !DILocation(line: 203, column: 4, scope: !5)

