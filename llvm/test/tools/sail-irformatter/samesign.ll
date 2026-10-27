; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

@global_smem = external addrspace(3) global [0 x i8], align 16

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #1

; CHECK-LABLE: gemm_fusion_dot_45
define void @gemm_fusion_dot_45(ptr noalias align 16 dereferenceable(524288) %arg0, ptr noalias align 16 dereferenceable(4096) %arg1, ptr noalias align 16 dereferenceable(40960) %arg2, ptr noalias align 128 dereferenceable(5120) %arg3) local_unnamed_addr {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #4
  %.frozen = freeze i32 %4
  %5 = sdiv i32 %.frozen, 8
  %6 = shl nsw i32 %5, 3
  %7 = sub i32 4, %6
  %8 = tail call i32 @llvm.smin.i32(i32 %7, i32 8)
  %9 = srem i32 %4, %8
  %10 = add i32 %6, %9
  %11 = mul i32 %5, 8
  %.decomposed = sub i32 %.frozen, %11
  %12 = sdiv i32 %.decomposed, %8
  %13 = shl i32 %10, 5
  %14 = sext i32 %13 to i64
  %15 = shl nsw i32 %12, 4
  %16 = sext i32 %15 to i64
  %17 = tail call range(i32 0, 128) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %18 = and i32 %17, 31
  %19 = lshr i32 %17, 5
  %20 = lshr i32 %17, 3
  %21 = and i32 %20, 7
; CHECK: %{{.+}} = icmp ult i32 %{{.+}}, 64
  %22 = icmp samesign ult i32 %17, 64
  %23 = select i1 %22, i32 0, i32 8
  %24 = or disjoint i32 %21, %23
  %25 = or disjoint i32 %24, 16
  %26 = shl nuw nsw i32 %17, 2
  %27 = and i32 %26, 28
  %28 = zext nneg i32 %24 to i64
  %29 = zext nneg i32 %25 to i64
  %30 = zext nneg i32 %27 to i64
  %31 = or disjoint i64 %14, %28
  %32 = or disjoint i64 %14, %29
  %33 = shl nsw i64 %31, 10
  %34 = shl nsw i64 %32, 10
  %35 = shl nuw nsw i32 %17, 1
  %36 = and i32 %35, 14
  %37 = zext nneg i32 %36 to i64
  %38 = or disjoint i64 %16, %37
  %39 = icmp sgt i32 %12, -1
  %40 = icmp slt i64 %38, 10
  %41 = and i1 %39, %40
  %42 = or disjoint i64 %33, %30
  %43 = or disjoint i64 %34, %30
  %44 = getelementptr float, ptr addrspace(1) %1, i64 %42
  %45 = getelementptr float, ptr addrspace(1) %1, i64 %43
  %46 = shl nuw nsw i32 %24, 5
  %47 = or disjoint i32 %46, %27
  %48 = zext nneg i32 %47 to i64
  %49 = getelementptr inbounds nuw float, ptr addrspace(3) @global_smem, i64 %48
  %50 = shl nuw nsw i32 %25, 5
  %51 = or disjoint i32 %50, %27
  %52 = zext nneg i32 %51 to i64
  %53 = getelementptr inbounds nuw float, ptr addrspace(3) @global_smem, i64 %52
  tail call void asm sideeffect "@$3 cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r,b"(ptr addrspace(3) %49, ptr addrspace(1) %44, i32 16, i1 true) #4
  tail call void asm sideeffect "@$3 cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r,b"(ptr addrspace(3) nonnull %53, ptr addrspace(1) %45, i32 16, i1 true) #4
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #4
  %54 = getelementptr float, ptr addrspace(1) %2, i64 %30
  %55 = getelementptr float, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 12288), i64 %30
; CHECK: %{{.+}} = icmp ult i32 %{{.+}}, 8
  %56 = icmp samesign ult i32 %17, 8
  tail call void asm sideeffect "@$3 cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r,b"(ptr addrspace(3) %55, ptr addrspace(1) %54, i32 16, i1 %56) #4
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #4
  %.idx = mul nuw nsw i64 %28, 40
  %57 = getelementptr i8, ptr addrspace(1) %3, i64 %.idx
  %58 = getelementptr float, ptr addrspace(1) %57, i64 %38
  %.idx1 = mul nuw nsw i64 %29, 40
  %59 = getelementptr i8, ptr addrspace(1) %3, i64 %.idx1
  %60 = getelementptr float, ptr addrspace(1) %59, i64 %38
  %61 = lshr i32 %17, 1
  %62 = and i32 %61, 8
  %63 = xor i32 %36, %62
  %64 = shl nuw nsw i32 %24, 4
  %65 = or disjoint i32 %64, %63
  %66 = zext nneg i32 %65 to i64
  %67 = getelementptr inbounds nuw float, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 13312), i64 %66
  %68 = shl nuw nsw i32 %25, 4
  %69 = or disjoint i32 %68, %63
  %70 = zext nneg i32 %69 to i64
  %71 = getelementptr inbounds nuw float, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 13312), i64 %70
  %72 = select i1 %41, i32 8, i32 0
  tail call void asm sideeffect "@$3 cp.async.ca.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x8, $2;", "r,l,r,b"(ptr addrspace(3) %67, ptr addrspace(1) %58, i32 %72, i1 true) #4
  tail call void asm sideeffect "@$3 cp.async.ca.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x8, $2;", "r,l,r,b"(ptr addrspace(3) nonnull %71, ptr addrspace(1) %60, i32 %72, i1 true) #4
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #4
  %73 = or disjoint i64 %30, 32
  %74 = or disjoint i64 %33, %73
  %75 = or disjoint i64 %34, %73
  %76 = getelementptr float, ptr addrspace(1) %1, i64 %74
  %77 = getelementptr float, ptr addrspace(1) %1, i64 %75
  tail call void @llvm.nvvm.barrier0()
  %78 = getelementptr inbounds nuw float, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 4096), i64 %48
  %79 = getelementptr inbounds nuw float, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 4096), i64 %52
  tail call void asm sideeffect "@$3 cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r,b"(ptr addrspace(3) %78, ptr addrspace(1) %76, i32 16, i1 true) #4
  tail call void asm sideeffect "@$3 cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r,b"(ptr addrspace(3) nonnull %79, ptr addrspace(1) %77, i32 16, i1 true) #4
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #4
  %80 = getelementptr float, ptr addrspace(1) %2, i64 %73
  %81 = getelementptr inbounds nuw float, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 12416), i64 %30
  tail call void asm sideeffect "@$3 cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r,b"(ptr addrspace(3) %81, ptr addrspace(1) %80, i32 16, i1 %56) #4
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #4
  %82 = getelementptr i8, ptr addrspace(1) %57, i64 1280
  %83 = getelementptr float, ptr addrspace(1) %82, i64 %38
  %84 = getelementptr i8, ptr addrspace(1) %59, i64 1280
  %85 = getelementptr float, ptr addrspace(1) %84, i64 %38
  %86 = getelementptr inbounds nuw float, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 15360), i64 %66
  %87 = getelementptr inbounds nuw float, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 15360), i64 %70
  tail call void asm sideeffect "@$3 cp.async.ca.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x8, $2;", "r,l,r,b"(ptr addrspace(3) %86, ptr addrspace(1) %83, i32 %72, i1 true) #4
  tail call void asm sideeffect "@$3 cp.async.ca.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x8, $2;", "r,l,r,b"(ptr addrspace(3) nonnull %87, ptr addrspace(1) %85, i32 %72, i1 true) #4
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #4
  %88 = or disjoint i64 %30, 64
  %89 = or disjoint i64 %33, %88
  %90 = or disjoint i64 %34, %88
  %91 = getelementptr float, ptr addrspace(1) %1, i64 %89
  %92 = getelementptr float, ptr addrspace(1) %1, i64 %90
  tail call void @llvm.nvvm.barrier0()
  %93 = getelementptr inbounds nuw float, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 8192), i64 %48
  %94 = getelementptr inbounds nuw float, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 8192), i64 %52
  tail call void asm sideeffect "@$3 cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r,b"(ptr addrspace(3) %93, ptr addrspace(1) %91, i32 16, i1 true) #4
  tail call void asm sideeffect "@$3 cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r,b"(ptr addrspace(3) nonnull %94, ptr addrspace(1) %92, i32 16, i1 true) #4
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #4
  %95 = getelementptr float, ptr addrspace(1) %2, i64 %88
  %96 = getelementptr inbounds nuw float, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 12544), i64 %30
  tail call void asm sideeffect "@$3 cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r,b"(ptr addrspace(3) %96, ptr addrspace(1) %95, i32 16, i1 %56) #4
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #4
  %97 = getelementptr i8, ptr addrspace(1) %57, i64 2560
  %98 = getelementptr float, ptr addrspace(1) %97, i64 %38
  %99 = getelementptr i8, ptr addrspace(1) %59, i64 2560
  %100 = getelementptr float, ptr addrspace(1) %99, i64 %38
  %101 = getelementptr inbounds nuw float, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 17408), i64 %66
  %102 = getelementptr inbounds nuw float, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 17408), i64 %70
  tail call void asm sideeffect "@$3 cp.async.ca.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x8, $2;", "r,l,r,b"(ptr addrspace(3) %101, ptr addrspace(1) %98, i32 %72, i1 true) #4
  tail call void asm sideeffect "@$3 cp.async.ca.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x8, $2;", "r,l,r,b"(ptr addrspace(3) nonnull %102, ptr addrspace(1) %100, i32 %72, i1 true) #4
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #4
  tail call void asm sideeffect "cp.async.wait_group 0x6;", ""() #4
  tail call void @llvm.nvvm.barrier0()
  %invariant.gep51 = getelementptr float, ptr addrspace(1) %3, i64 %38
  %103 = xor i32 %61, %26
  %.reass = and i32 %103, 28
  %104 = or disjoint i32 %.reass, %46
  %105 = zext nneg i32 %104 to i64
  %106 = getelementptr inbounds nuw float, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 19456), i64 %105
  %107 = or disjoint i32 %50, %.reass
  %108 = zext nneg i32 %107 to i64
  %109 = getelementptr inbounds nuw float, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 19456), i64 %108
  %110 = and i32 %17, 7
  %111 = lshr i32 %18, 4
  %112 = lshr i32 %17, 2
  %113 = and i32 %112, 16
  %114 = and i32 %17, 15
  %115 = or disjoint i32 %114, %113
  %116 = xor i32 %111, %110
  %117 = shl nuw nsw i32 %115, 5
  %118 = shl nuw nsw i32 %116, 2
  %119 = or disjoint i32 %117, %118
  %120 = zext nneg i32 %119 to i64
  %121 = getelementptr float, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 19456), i64 %120
  %122 = or disjoint i32 %111, 2
  %123 = xor i32 %122, %110
  %124 = shl nuw nsw i32 %123, 2
  %125 = or disjoint i32 %124, %117
  %126 = zext nneg i32 %125 to i64
  %127 = getelementptr float, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 19456), i64 %126
  %128 = or disjoint i32 %111, 4
  %129 = xor i32 %128, %110
  %130 = shl nuw nsw i32 %129, 2
  %131 = or disjoint i32 %130, %117
  %132 = zext nneg i32 %131 to i64
  %133 = getelementptr float, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 19456), i64 %132
  %134 = or disjoint i32 %111, 6
  %135 = xor i32 %134, %110
  %136 = shl nuw nsw i32 %135, 2
  %137 = or disjoint i32 %136, %117
  %138 = zext nneg i32 %137 to i64
  %139 = getelementptr float, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 19456), i64 %138
  %140 = and i32 %19, 1
  %141 = lshr i32 %18, 2
  %142 = and i32 %17, 3
  %143 = lshr i32 %142, 1
  %144 = getelementptr float, ptr addrspace(1) %1, i64 %33
  %145 = getelementptr float, ptr addrspace(1) %1, i64 %34
  br label %146

146:                                              ; preds = %0, %__nv_tanhf.exit50
  %147 = phi { ptr addrspace(3), i32, i32, i32, i32 } [ { ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i32 13312), i32 16, i32 1, i32 0, i32 0 }, %0 ], [ %503, %__nv_tanhf.exit50 ]
  %148 = phi { ptr addrspace(3), i32, i32 } [ { ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i32 12288), i32 1, i32 0 }, %0 ], [ %495, %__nv_tanhf.exit50 ]
  %149 = phi { ptr addrspace(3), i32, i32, i32, i32 } [ { ptr addrspace(3) @global_smem, i32 32, i32 1, i32 0, i32 0 }, %0 ], [ %489, %__nv_tanhf.exit50 ]
  %150 = phi i32 [ 0, %0 ], [ %481, %__nv_tanhf.exit50 ]
  %151 = phi i32 [ 2, %0 ], [ %457, %__nv_tanhf.exit50 ]
  %152 = phi { float, float, float, float } [ zeroinitializer, %0 ], [ %453, %__nv_tanhf.exit50 ]
  %153 = phi i64 [ 64, %0 ], [ %454, %__nv_tanhf.exit50 ]
  %154 = phi i32 [ 0, %0 ], [ %504, %__nv_tanhf.exit50 ]
; CHECK: %{{.+}} = icmp ult i32 %{{.+}}, 928
  %155 = icmp samesign ult i32 %154, 928
  %156 = extractvalue { ptr addrspace(3), i32, i32, i32, i32 } %149, 0
  %157 = extractvalue { ptr addrspace(3), i32, i32, i32, i32 } %149, 1
  %158 = extractvalue { ptr addrspace(3), i32, i32, i32, i32 } %149, 2
  %159 = mul i32 %158, %27
  %160 = mul i32 %157, %24
  %161 = add i32 %159, %160
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, ptr addrspace(3) %156, i64 %162
  %164 = load float, ptr addrspace(3) %163, align 16
  %165 = getelementptr inbounds nuw i8, ptr addrspace(3) %163, i64 4
  %166 = load float, ptr addrspace(3) %165, align 4
  %167 = getelementptr inbounds nuw i8, ptr addrspace(3) %163, i64 8
  %168 = load float, ptr addrspace(3) %167, align 8
  %169 = getelementptr inbounds nuw i8, ptr addrspace(3) %163, i64 12
  %170 = load float, ptr addrspace(3) %169, align 4
  %171 = mul i32 %157, %25
  %172 = add i32 %159, %171
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds float, ptr addrspace(3) %156, i64 %173
  %175 = load float, ptr addrspace(3) %174, align 16
  %176 = getelementptr inbounds nuw i8, ptr addrspace(3) %174, i64 4
  %177 = load float, ptr addrspace(3) %176, align 4
  %178 = getelementptr inbounds nuw i8, ptr addrspace(3) %174, i64 8
  %179 = load float, ptr addrspace(3) %178, align 8
  %180 = getelementptr inbounds nuw i8, ptr addrspace(3) %174, i64 12
  %181 = load float, ptr addrspace(3) %180, align 4
  %182 = extractvalue { ptr addrspace(3), i32, i32 } %148, 0
  %183 = extractvalue { ptr addrspace(3), i32, i32 } %148, 1
  %184 = mul i32 %183, %27
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds float, ptr addrspace(3) %182, i64 %185
  %187 = load float, ptr addrspace(3) %186, align 16
  %188 = getelementptr inbounds nuw i8, ptr addrspace(3) %186, i64 4
  %189 = load float, ptr addrspace(3) %188, align 4
  %190 = getelementptr inbounds nuw i8, ptr addrspace(3) %186, i64 8
  %191 = load float, ptr addrspace(3) %190, align 8
  %192 = getelementptr inbounds nuw i8, ptr addrspace(3) %186, i64 12
  %193 = load float, ptr addrspace(3) %192, align 4
  %194 = fadd float %164, %187
  %195 = fadd float %166, %189
  %196 = fadd float %168, %191
  %197 = fadd float %170, %193
  %198 = fadd float %175, %187
  %199 = fadd float %177, %189
  %200 = fadd float %179, %191
  %201 = fadd float %181, %193
  %202 = tail call float @llvm.nvvm.fabs.f(float %194) #4
  %203 = fcmp ult float %202, 0x3FE3333340000000
  br i1 %203, label %__internal_fmad.exit3.i, label %__internal_fmad.exit1.i

__internal_fmad.exit1.i:                          ; preds = %146
  %204 = fmul float %202, 0x4007154760000000
  %205 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %204) #4
  %206 = fadd float %205, 1.000000e+00
  %207 = tail call float asm "rcp.approx.ftz.f32 $0,$1;", "=f,f"(float %206) #5, !srcloc !4
  %208 = tail call float @llvm.fma.f32(float %207, float -2.000000e+00, float 1.000000e+00)
  %209 = fcmp oge float %202, 0x4022059680000000
  %s.0.i = select i1 %209, float 1.000000e+00, float %208
  %210 = bitcast float %s.0.i to i32
  %211 = bitcast float %194 to i32
  %212 = and i32 %211, -2147483648
  %213 = or i32 %212, %210
  %214 = bitcast i32 %213 to float
  br label %__nv_tanhf.exit

__internal_fmad.exit3.i:                          ; preds = %146
  %215 = fmul float %194, %194
  %216 = tail call float @llvm.fma.f32(float %215, float 0x3F901E1040000000, float 0xBFAAC795C0000000)
  %217 = tail call float @llvm.fma.f32(float %216, float %215, float 0x3FC10B2820000000)
  %218 = tail call float @llvm.fma.f32(float %217, float %215, float 0xBFD5553DA0000000)
  %219 = tail call float @llvm.fma.f32(float %218, float %215, float 0.000000e+00)
  %220 = tail call float @llvm.fma.f32(float %219, float %194, float %194)
  br label %__nv_tanhf.exit

__nv_tanhf.exit:                                  ; preds = %__internal_fmad.exit1.i, %__internal_fmad.exit3.i
  %s.1.i = phi float [ %214, %__internal_fmad.exit1.i ], [ %220, %__internal_fmad.exit3.i ]
  %221 = tail call float @llvm.nvvm.fabs.f(float %195) #4
  %222 = fcmp ult float %221, 0x3FE3333340000000
  br i1 %222, label %__internal_fmad.exit3.i19, label %__internal_fmad.exit1.i16

__internal_fmad.exit1.i16:                        ; preds = %__nv_tanhf.exit
  %223 = fmul float %221, 0x4007154760000000
  %224 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %223) #4
  %225 = fadd float %224, 1.000000e+00
  %226 = tail call float asm "rcp.approx.ftz.f32 $0,$1;", "=f,f"(float %225) #5, !srcloc !4
  %227 = tail call float @llvm.fma.f32(float %226, float -2.000000e+00, float 1.000000e+00)
  %228 = fcmp oge float %221, 0x4022059680000000
  %s.0.i17 = select i1 %228, float 1.000000e+00, float %227
  %229 = bitcast float %s.0.i17 to i32
  %230 = bitcast float %195 to i32
  %231 = and i32 %230, -2147483648
  %232 = or i32 %231, %229
  %233 = bitcast i32 %232 to float
  br label %__nv_tanhf.exit20

__internal_fmad.exit3.i19:                        ; preds = %__nv_tanhf.exit
  %234 = fmul float %195, %195
  %235 = tail call float @llvm.fma.f32(float %234, float 0x3F901E1040000000, float 0xBFAAC795C0000000)
  %236 = tail call float @llvm.fma.f32(float %235, float %234, float 0x3FC10B2820000000)
  %237 = tail call float @llvm.fma.f32(float %236, float %234, float 0xBFD5553DA0000000)
  %238 = tail call float @llvm.fma.f32(float %237, float %234, float 0.000000e+00)
  %239 = tail call float @llvm.fma.f32(float %238, float %195, float %195)
  br label %__nv_tanhf.exit20

__nv_tanhf.exit20:                                ; preds = %__internal_fmad.exit1.i16, %__internal_fmad.exit3.i19
  %s.1.i18 = phi float [ %233, %__internal_fmad.exit1.i16 ], [ %239, %__internal_fmad.exit3.i19 ]
  %240 = tail call float @llvm.nvvm.fabs.f(float %196) #4
  %241 = fcmp ult float %240, 0x3FE3333340000000
  br i1 %241, label %__internal_fmad.exit3.i24, label %__internal_fmad.exit1.i21

__internal_fmad.exit1.i21:                        ; preds = %__nv_tanhf.exit20
  %242 = fmul float %240, 0x4007154760000000
  %243 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %242) #4
  %244 = fadd float %243, 1.000000e+00
  %245 = tail call float asm "rcp.approx.ftz.f32 $0,$1;", "=f,f"(float %244) #5, !srcloc !4
  %246 = tail call float @llvm.fma.f32(float %245, float -2.000000e+00, float 1.000000e+00)
  %247 = fcmp oge float %240, 0x4022059680000000
  %s.0.i22 = select i1 %247, float 1.000000e+00, float %246
  %248 = bitcast float %s.0.i22 to i32
  %249 = bitcast float %196 to i32
  %250 = and i32 %249, -2147483648
  %251 = or i32 %250, %248
  %252 = bitcast i32 %251 to float
  br label %__nv_tanhf.exit25

__internal_fmad.exit3.i24:                        ; preds = %__nv_tanhf.exit20
  %253 = fmul float %196, %196
  %254 = tail call float @llvm.fma.f32(float %253, float 0x3F901E1040000000, float 0xBFAAC795C0000000)
  %255 = tail call float @llvm.fma.f32(float %254, float %253, float 0x3FC10B2820000000)
  %256 = tail call float @llvm.fma.f32(float %255, float %253, float 0xBFD5553DA0000000)
  %257 = tail call float @llvm.fma.f32(float %256, float %253, float 0.000000e+00)
  %258 = tail call float @llvm.fma.f32(float %257, float %196, float %196)
  br label %__nv_tanhf.exit25

__nv_tanhf.exit25:                                ; preds = %__internal_fmad.exit1.i21, %__internal_fmad.exit3.i24
  %s.1.i23 = phi float [ %252, %__internal_fmad.exit1.i21 ], [ %258, %__internal_fmad.exit3.i24 ]
  %259 = tail call float @llvm.nvvm.fabs.f(float %197) #4
  %260 = fcmp ult float %259, 0x3FE3333340000000
  br i1 %260, label %__internal_fmad.exit3.i29, label %__internal_fmad.exit1.i26

__internal_fmad.exit1.i26:                        ; preds = %__nv_tanhf.exit25
  %261 = fmul float %259, 0x4007154760000000
  %262 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %261) #4
  %263 = fadd float %262, 1.000000e+00
  %264 = tail call float asm "rcp.approx.ftz.f32 $0,$1;", "=f,f"(float %263) #5, !srcloc !4
  %265 = tail call float @llvm.fma.f32(float %264, float -2.000000e+00, float 1.000000e+00)
  %266 = fcmp oge float %259, 0x4022059680000000
  %s.0.i27 = select i1 %266, float 1.000000e+00, float %265
  %267 = bitcast float %s.0.i27 to i32
  %268 = bitcast float %197 to i32
  %269 = and i32 %268, -2147483648
  %270 = or i32 %269, %267
  %271 = bitcast i32 %270 to float
  br label %__nv_tanhf.exit30

__internal_fmad.exit3.i29:                        ; preds = %__nv_tanhf.exit25
  %272 = fmul float %197, %197
  %273 = tail call float @llvm.fma.f32(float %272, float 0x3F901E1040000000, float 0xBFAAC795C0000000)
  %274 = tail call float @llvm.fma.f32(float %273, float %272, float 0x3FC10B2820000000)
  %275 = tail call float @llvm.fma.f32(float %274, float %272, float 0xBFD5553DA0000000)
  %276 = tail call float @llvm.fma.f32(float %275, float %272, float 0.000000e+00)
  %277 = tail call float @llvm.fma.f32(float %276, float %197, float %197)
  br label %__nv_tanhf.exit30

__nv_tanhf.exit30:                                ; preds = %__internal_fmad.exit1.i26, %__internal_fmad.exit3.i29
  %s.1.i28 = phi float [ %271, %__internal_fmad.exit1.i26 ], [ %277, %__internal_fmad.exit3.i29 ]
  %278 = tail call float @llvm.nvvm.fabs.f(float %198) #4
  %279 = fcmp ult float %278, 0x3FE3333340000000
  br i1 %279, label %__internal_fmad.exit3.i34, label %__internal_fmad.exit1.i31

__internal_fmad.exit1.i31:                        ; preds = %__nv_tanhf.exit30
  %280 = fmul float %278, 0x4007154760000000
  %281 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %280) #4
  %282 = fadd float %281, 1.000000e+00
  %283 = tail call float asm "rcp.approx.ftz.f32 $0,$1;", "=f,f"(float %282) #5, !srcloc !4
  %284 = tail call float @llvm.fma.f32(float %283, float -2.000000e+00, float 1.000000e+00)
  %285 = fcmp oge float %278, 0x4022059680000000
  %s.0.i32 = select i1 %285, float 1.000000e+00, float %284
  %286 = bitcast float %s.0.i32 to i32
  %287 = bitcast float %198 to i32
  %288 = and i32 %287, -2147483648
  %289 = or i32 %288, %286
  %290 = bitcast i32 %289 to float
  br label %__nv_tanhf.exit35

__internal_fmad.exit3.i34:                        ; preds = %__nv_tanhf.exit30
  %291 = fmul float %198, %198
  %292 = tail call float @llvm.fma.f32(float %291, float 0x3F901E1040000000, float 0xBFAAC795C0000000)
  %293 = tail call float @llvm.fma.f32(float %292, float %291, float 0x3FC10B2820000000)
  %294 = tail call float @llvm.fma.f32(float %293, float %291, float 0xBFD5553DA0000000)
  %295 = tail call float @llvm.fma.f32(float %294, float %291, float 0.000000e+00)
  %296 = tail call float @llvm.fma.f32(float %295, float %198, float %198)
  br label %__nv_tanhf.exit35

__nv_tanhf.exit35:                                ; preds = %__internal_fmad.exit1.i31, %__internal_fmad.exit3.i34
  %s.1.i33 = phi float [ %290, %__internal_fmad.exit1.i31 ], [ %296, %__internal_fmad.exit3.i34 ]
  %297 = tail call float @llvm.nvvm.fabs.f(float %199) #4
  %298 = fcmp ult float %297, 0x3FE3333340000000
  br i1 %298, label %__internal_fmad.exit3.i39, label %__internal_fmad.exit1.i36

__internal_fmad.exit1.i36:                        ; preds = %__nv_tanhf.exit35
  %299 = fmul float %297, 0x4007154760000000
  %300 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %299) #4
  %301 = fadd float %300, 1.000000e+00
  %302 = tail call float asm "rcp.approx.ftz.f32 $0,$1;", "=f,f"(float %301) #5, !srcloc !4
  %303 = tail call float @llvm.fma.f32(float %302, float -2.000000e+00, float 1.000000e+00)
  %304 = fcmp oge float %297, 0x4022059680000000
  %s.0.i37 = select i1 %304, float 1.000000e+00, float %303
  %305 = bitcast float %s.0.i37 to i32
  %306 = bitcast float %199 to i32
  %307 = and i32 %306, -2147483648
  %308 = or i32 %307, %305
  %309 = bitcast i32 %308 to float
  br label %__nv_tanhf.exit40

__internal_fmad.exit3.i39:                        ; preds = %__nv_tanhf.exit35
  %310 = fmul float %199, %199
  %311 = tail call float @llvm.fma.f32(float %310, float 0x3F901E1040000000, float 0xBFAAC795C0000000)
  %312 = tail call float @llvm.fma.f32(float %311, float %310, float 0x3FC10B2820000000)
  %313 = tail call float @llvm.fma.f32(float %312, float %310, float 0xBFD5553DA0000000)
  %314 = tail call float @llvm.fma.f32(float %313, float %310, float 0.000000e+00)
  %315 = tail call float @llvm.fma.f32(float %314, float %199, float %199)
  br label %__nv_tanhf.exit40

__nv_tanhf.exit40:                                ; preds = %__internal_fmad.exit1.i36, %__internal_fmad.exit3.i39
  %s.1.i38 = phi float [ %309, %__internal_fmad.exit1.i36 ], [ %315, %__internal_fmad.exit3.i39 ]
  %316 = tail call float @llvm.nvvm.fabs.f(float %200) #4
  %317 = fcmp ult float %316, 0x3FE3333340000000
  br i1 %317, label %__internal_fmad.exit3.i44, label %__internal_fmad.exit1.i41

__internal_fmad.exit1.i41:                        ; preds = %__nv_tanhf.exit40
  %318 = fmul float %316, 0x4007154760000000
  %319 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %318) #4
  %320 = fadd float %319, 1.000000e+00
  %321 = tail call float asm "rcp.approx.ftz.f32 $0,$1;", "=f,f"(float %320) #5, !srcloc !4
  %322 = tail call float @llvm.fma.f32(float %321, float -2.000000e+00, float 1.000000e+00)
  %323 = fcmp oge float %316, 0x4022059680000000
  %s.0.i42 = select i1 %323, float 1.000000e+00, float %322
  %324 = bitcast float %s.0.i42 to i32
  %325 = bitcast float %200 to i32
  %326 = and i32 %325, -2147483648
  %327 = or i32 %326, %324
  %328 = bitcast i32 %327 to float
  br label %__nv_tanhf.exit45

__internal_fmad.exit3.i44:                        ; preds = %__nv_tanhf.exit40
  %329 = fmul float %200, %200
  %330 = tail call float @llvm.fma.f32(float %329, float 0x3F901E1040000000, float 0xBFAAC795C0000000)
  %331 = tail call float @llvm.fma.f32(float %330, float %329, float 0x3FC10B2820000000)
  %332 = tail call float @llvm.fma.f32(float %331, float %329, float 0xBFD5553DA0000000)
  %333 = tail call float @llvm.fma.f32(float %332, float %329, float 0.000000e+00)
  %334 = tail call float @llvm.fma.f32(float %333, float %200, float %200)
  br label %__nv_tanhf.exit45

__nv_tanhf.exit45:                                ; preds = %__internal_fmad.exit1.i41, %__internal_fmad.exit3.i44
  %s.1.i43 = phi float [ %328, %__internal_fmad.exit1.i41 ], [ %334, %__internal_fmad.exit3.i44 ]
  %335 = tail call float @llvm.nvvm.fabs.f(float %201) #4
  %336 = fcmp ult float %335, 0x3FE3333340000000
  br i1 %336, label %__internal_fmad.exit3.i49, label %__internal_fmad.exit1.i46

__internal_fmad.exit1.i46:                        ; preds = %__nv_tanhf.exit45
  %337 = fmul float %335, 0x4007154760000000
  %338 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %337) #4
  %339 = fadd float %338, 1.000000e+00
  %340 = tail call float asm "rcp.approx.ftz.f32 $0,$1;", "=f,f"(float %339) #5, !srcloc !4
  %341 = tail call float @llvm.fma.f32(float %340, float -2.000000e+00, float 1.000000e+00)
  %342 = fcmp oge float %335, 0x4022059680000000
  %s.0.i47 = select i1 %342, float 1.000000e+00, float %341
  %343 = bitcast float %s.0.i47 to i32
  %344 = bitcast float %201 to i32
  %345 = and i32 %344, -2147483648
  %346 = or i32 %345, %343
  %347 = bitcast i32 %346 to float
  br label %__nv_tanhf.exit50

__internal_fmad.exit3.i49:                        ; preds = %__nv_tanhf.exit45
  %348 = fmul float %201, %201
  %349 = tail call float @llvm.fma.f32(float %348, float 0x3F901E1040000000, float 0xBFAAC795C0000000)
  %350 = tail call float @llvm.fma.f32(float %349, float %348, float 0x3FC10B2820000000)
  %351 = tail call float @llvm.fma.f32(float %350, float %348, float 0xBFD5553DA0000000)
  %352 = tail call float @llvm.fma.f32(float %351, float %348, float 0.000000e+00)
  %353 = tail call float @llvm.fma.f32(float %352, float %201, float %201)
  br label %__nv_tanhf.exit50

__nv_tanhf.exit50:                                ; preds = %__internal_fmad.exit1.i46, %__internal_fmad.exit3.i49
  %s.1.i48 = phi float [ %347, %__internal_fmad.exit1.i46 ], [ %353, %__internal_fmad.exit3.i49 ]
  %354 = insertelement <4 x float> poison, float %s.1.i, i64 0
  %355 = insertelement <4 x float> %354, float %s.1.i18, i64 1
  %356 = insertelement <4 x float> %355, float %s.1.i23, i64 2
  %357 = insertelement <4 x float> %356, float %s.1.i28, i64 3
  store <4 x float> %357, ptr addrspace(3) %106, align 16
  %358 = insertelement <4 x float> poison, float %s.1.i33, i64 0
  %359 = insertelement <4 x float> %358, float %s.1.i38, i64 1
  %360 = insertelement <4 x float> %359, float %s.1.i43, i64 2
  %361 = insertelement <4 x float> %360, float %s.1.i48, i64 3
  store <4 x float> %361, ptr addrspace(3) %109, align 16
  tail call void @llvm.nvvm.barrier0()
  %362 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,r"(ptr addrspace(3) %121) #4
  %363 = extractvalue { i32, i32, i32, i32 } %362, 0
  %364 = extractvalue { i32, i32, i32, i32 } %362, 1
  %365 = extractvalue { i32, i32, i32, i32 } %362, 2
  %366 = extractvalue { i32, i32, i32, i32 } %362, 3
  %367 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,r"(ptr addrspace(3) %127) #4
  %368 = extractvalue { i32, i32, i32, i32 } %367, 0
  %369 = extractvalue { i32, i32, i32, i32 } %367, 1
  %370 = extractvalue { i32, i32, i32, i32 } %367, 2
  %371 = extractvalue { i32, i32, i32, i32 } %367, 3
  %372 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,r"(ptr addrspace(3) %133) #4
  %373 = extractvalue { i32, i32, i32, i32 } %372, 0
  %374 = extractvalue { i32, i32, i32, i32 } %372, 1
  %375 = extractvalue { i32, i32, i32, i32 } %372, 2
  %376 = extractvalue { i32, i32, i32, i32 } %372, 3
  %377 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,r"(ptr addrspace(3) %139) #4
  %378 = extractvalue { i32, i32, i32, i32 } %377, 0
  %379 = extractvalue { i32, i32, i32, i32 } %377, 1
  %380 = extractvalue { i32, i32, i32, i32 } %377, 2
  %381 = extractvalue { i32, i32, i32, i32 } %377, 3
  %382 = extractvalue { ptr addrspace(3), i32, i32, i32, i32 } %147, 0
  %383 = extractvalue { ptr addrspace(3), i32, i32, i32, i32 } %147, 1
  %384 = extractvalue { ptr addrspace(3), i32, i32, i32, i32 } %147, 4
  %385 = lshr i32 %384, 3
  %386 = add nuw nsw i32 %385, %140
  %387 = xor i32 %386, %143
  %388 = shl i32 %387, 3
  %389 = mul i32 %383, %142
  %390 = add i32 %389, %141
  %391 = add i32 %390, %388
  %392 = sub i32 0, %384
  %393 = sext i32 %392 to i64
  %394 = getelementptr float, ptr addrspace(3) %382, i64 %393
  %395 = sext i32 %391 to i64
  %396 = getelementptr float, ptr addrspace(3) %394, i64 %395
  %397 = shl i32 %383, 2
  %398 = sext i32 %397 to i64
  %399 = getelementptr float, ptr addrspace(3) %396, i64 %398
  %400 = load i32, ptr addrspace(3) %396, align 4
  %401 = load i32, ptr addrspace(3) %399, align 4
  %402 = shl i32 %383, 3
  %403 = mul i32 %383, 12
  %404 = sext i32 %402 to i64
  %405 = getelementptr float, ptr addrspace(3) %396, i64 %404
  %406 = sext i32 %403 to i64
  %407 = getelementptr float, ptr addrspace(3) %396, i64 %406
  %408 = load i32, ptr addrspace(3) %405, align 4
  %409 = load i32, ptr addrspace(3) %407, align 4
  %410 = shl i32 %383, 4
  %411 = mul i32 %383, 20
  %412 = sext i32 %410 to i64
  %413 = getelementptr float, ptr addrspace(3) %396, i64 %412
  %414 = sext i32 %411 to i64
  %415 = getelementptr float, ptr addrspace(3) %396, i64 %414
  %416 = load i32, ptr addrspace(3) %413, align 4
  %417 = load i32, ptr addrspace(3) %415, align 4
  %418 = mul i32 %383, 24
  %419 = mul i32 %383, 28
  %420 = sext i32 %418 to i64
  %421 = getelementptr float, ptr addrspace(3) %396, i64 %420
  %422 = sext i32 %419 to i64
  %423 = getelementptr float, ptr addrspace(3) %396, i64 %422
  %424 = load i32, ptr addrspace(3) %421, align 4
  %425 = load i32, ptr addrspace(3) %423, align 4
  %426 = extractvalue { float, float, float, float } %152, 0
  %427 = extractvalue { float, float, float, float } %152, 1
  %428 = extractvalue { float, float, float, float } %152, 2
  %429 = extractvalue { float, float, float, float } %152, 3
  %430 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k8.row.col.f32.tf32.tf32.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %426, float %427, float %428, float %429, i32 %363, i32 %364, i32 %365, i32 %366, i32 %400, i32 %401) #4
  %431 = extractvalue { float, float, float, float } %430, 0
  %432 = extractvalue { float, float, float, float } %430, 1
  %433 = extractvalue { float, float, float, float } %430, 2
  %434 = extractvalue { float, float, float, float } %430, 3
  %435 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k8.row.col.f32.tf32.tf32.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %431, float %432, float %433, float %434, i32 %368, i32 %369, i32 %370, i32 %371, i32 %408, i32 %409) #4
  %436 = extractvalue { float, float, float, float } %435, 0
  %437 = extractvalue { float, float, float, float } %435, 1
  %438 = extractvalue { float, float, float, float } %435, 2
  %439 = extractvalue { float, float, float, float } %435, 3
  %440 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k8.row.col.f32.tf32.tf32.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %436, float %437, float %438, float %439, i32 %373, i32 %374, i32 %375, i32 %376, i32 %416, i32 %417) #4
  %441 = extractvalue { float, float, float, float } %440, 0
  %442 = extractvalue { float, float, float, float } %440, 1
  %443 = extractvalue { float, float, float, float } %440, 2
  %444 = extractvalue { float, float, float, float } %440, 3
  %445 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k8.row.col.f32.tf32.tf32.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %441, float %442, float %443, float %444, i32 %378, i32 %379, i32 %380, i32 %381, i32 %424, i32 %425) #4
  %446 = extractvalue { float, float, float, float } %445, 0
  %447 = extractvalue { float, float, float, float } %445, 1
  %448 = extractvalue { float, float, float, float } %445, 2
  %449 = extractvalue { float, float, float, float } %445, 3
  %450 = insertvalue { float, float, float, float } undef, float %446, 0
  %451 = insertvalue { float, float, float, float } %450, float %447, 1
  %452 = insertvalue { float, float, float, float } %451, float %448, 2
  %453 = insertvalue { float, float, float, float } %452, float %449, 3
  %454 = add nuw nsw i64 %153, 32
  %455 = add i32 %151, 1
  %456 = icmp slt i32 %455, 3
  %457 = select i1 %456, i32 %455, i32 0
  %458 = or disjoint i64 %454, %30
  %459 = getelementptr float, ptr addrspace(1) %144, i64 %458
  %460 = getelementptr float, ptr addrspace(1) %145, i64 %458
  %461 = shl i32 %457, 10
  %462 = sext i32 %461 to i64
  %463 = getelementptr float, ptr addrspace(3) @global_smem, i64 %462
  %464 = getelementptr inbounds nuw float, ptr addrspace(3) %463, i64 %48
  %465 = getelementptr inbounds nuw float, ptr addrspace(3) %463, i64 %52
  %466 = select i1 %155, i32 16, i32 0
  tail call void asm sideeffect "@$3 cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r,b"(ptr addrspace(3) %464, ptr addrspace(1) %459, i32 %466, i1 true) #4
  tail call void asm sideeffect "@$3 cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r,b"(ptr addrspace(3) nonnull %465, ptr addrspace(1) %460, i32 %466, i1 true) #4
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #4
  %467 = getelementptr float, ptr addrspace(1) %2, i64 %458
  %468 = shl i32 %457, 5
  %469 = sext i32 %468 to i64
  %gep = getelementptr float, ptr addrspace(3) %55, i64 %469
  tail call void asm sideeffect "@$3 cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r,b"(ptr addrspace(3) %gep, ptr addrspace(1) %467, i32 %466, i1 %56) #4
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #4
  %470 = or disjoint i64 %454, %28
  %471 = or disjoint i64 %454, %29
  %.idx14 = mul nuw nsw i64 %470, 40
  %gep52 = getelementptr i8, ptr addrspace(1) %invariant.gep51, i64 %.idx14
  %.idx15 = mul nuw nsw i64 %471, 40
  %gep54 = getelementptr i8, ptr addrspace(1) %invariant.gep51, i64 %.idx15
  %472 = shl i32 %457, 9
  %473 = sext i32 %472 to i64
  %474 = getelementptr float, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 13312), i64 %473
  %475 = and i1 %41, %155
  tail call void @llvm.nvvm.barrier0()
  %476 = getelementptr inbounds nuw float, ptr addrspace(3) %474, i64 %66
  %477 = getelementptr inbounds nuw float, ptr addrspace(3) %474, i64 %70
  %478 = select i1 %475, i32 8, i32 0
  tail call void asm sideeffect "@$3 cp.async.ca.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x8, $2;", "r,l,r,b"(ptr addrspace(3) %476, ptr addrspace(1) %gep52, i32 %478, i1 true) #4
  tail call void asm sideeffect "@$3 cp.async.ca.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x8, $2;", "r,l,r,b"(ptr addrspace(3) nonnull %477, ptr addrspace(1) %gep54, i32 %478, i1 true) #4
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #4
  %479 = add i32 %150, 1
  %480 = icmp slt i32 %479, 3
  %481 = select i1 %480, i32 %479, i32 0
  %482 = shl i32 %481, 10
  %483 = sext i32 %482 to i64
  %484 = getelementptr float, ptr addrspace(3) @global_smem, i64 %483
  %485 = insertvalue { ptr addrspace(3), i32, i32, i32, i32 } undef, ptr addrspace(3) %484, 0
  %486 = insertvalue { ptr addrspace(3), i32, i32, i32, i32 } %485, i32 32, 1
  %487 = insertvalue { ptr addrspace(3), i32, i32, i32, i32 } %486, i32 1, 2
  %488 = insertvalue { ptr addrspace(3), i32, i32, i32, i32 } %487, i32 0, 3
  %489 = insertvalue { ptr addrspace(3), i32, i32, i32, i32 } %488, i32 0, 4
  %490 = shl i32 %481, 5
  %491 = sext i32 %490 to i64
  %492 = getelementptr float, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 12288), i64 %491
  %493 = insertvalue { ptr addrspace(3), i32, i32 } undef, ptr addrspace(3) %492, 0
  %494 = insertvalue { ptr addrspace(3), i32, i32 } %493, i32 1, 1
  %495 = insertvalue { ptr addrspace(3), i32, i32 } %494, i32 0, 2
  tail call void asm sideeffect "cp.async.wait_group 0x6;", ""() #4
  tail call void @llvm.nvvm.barrier0()
  %496 = shl i32 %481, 9
  %497 = sext i32 %496 to i64
  %498 = getelementptr float, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 13312), i64 %497
  %499 = insertvalue { ptr addrspace(3), i32, i32, i32, i32 } undef, ptr addrspace(3) %498, 0
  %500 = insertvalue { ptr addrspace(3), i32, i32, i32, i32 } %499, i32 16, 1
  %501 = insertvalue { ptr addrspace(3), i32, i32, i32, i32 } %500, i32 1, 2
  %502 = insertvalue { ptr addrspace(3), i32, i32, i32, i32 } %501, i32 0, 3
  %503 = insertvalue { ptr addrspace(3), i32, i32, i32, i32 } %502, i32 0, 4
  %504 = add nuw nsw i32 %154, 32
; CHECK: %{{.+}} = icmp ult i32 %{{.+}}, 992
  %505 = icmp samesign ult i32 %154, 992
  br i1 %505, label %146, label %506

506:                                              ; preds = %__nv_tanhf.exit50
  %507 = and i32 %35, 6
  %508 = addrspacecast ptr %arg3 to ptr addrspace(1)
  tail call void asm sideeffect "cp.async.wait_group 0x0;", ""() #4
  tail call void @llvm.nvvm.barrier0()
  %.idx6 = mul nsw i64 %31, 40
  %509 = getelementptr i8, ptr addrspace(1) %508, i64 %.idx6
  %510 = getelementptr float, ptr addrspace(1) %509, i64 %38
  %.idx7 = mul nsw i64 %32, 40
  %511 = getelementptr i8, ptr addrspace(1) %508, i64 %.idx7
  %512 = getelementptr float, ptr addrspace(1) %511, i64 %38
  %513 = and i32 %26, 112
  %514 = and i32 %112, 8
  %515 = or disjoint i32 %513, %514
  %516 = select i1 %22, i32 0, i32 256
  %517 = or disjoint i32 %515, %516
  %518 = or disjoint i32 %517, %507
  %519 = and i32 %35, 112
  %520 = select i1 %22, i32 0, i32 128
  %521 = or disjoint i32 %519, %520
  %522 = or disjoint i32 %521, %36
  %523 = lshr exact i32 %517, 3
  %524 = and i32 %523, 46
  %525 = add nuw nsw i32 %524, %518
  %526 = zext nneg i32 %525 to i64
  %527 = getelementptr inbounds nuw float, ptr addrspace(3) @global_smem, i64 %526
  %528 = bitcast float %446 to i32
  %529 = bitcast float %447 to i32
  tail call void asm sideeffect "@$3 st.shared.v2.b32 [ $0 + 0 ], { $1, $2 };", "r,r,r,b"(ptr addrspace(3) %527, i32 %528, i32 %529, i1 true) #4
  %530 = or disjoint i32 %518, 128
  %531 = lshr i32 %530, 3
  %532 = and i32 %531, 536870910
  %533 = add nuw nsw i32 %532, %530
  %534 = zext nneg i32 %533 to i64
  %535 = getelementptr inbounds nuw float, ptr addrspace(3) @global_smem, i64 %534
  %536 = bitcast float %448 to i32
  %537 = bitcast float %449 to i32
  tail call void asm sideeffect "@$3 st.shared.v2.b32 [ $0 + 0 ], { $1, $2 };", "r,r,r,b"(ptr addrspace(3) nonnull %535, i32 %536, i32 %537, i1 true) #4
  tail call void @llvm.nvvm.barrier0()
  %538 = lshr exact i32 %521, 3
  %539 = add nuw nsw i32 %538, %522
  %540 = zext nneg i32 %539 to i64
  %541 = getelementptr inbounds nuw float, ptr addrspace(3) @global_smem, i64 %540
  %542 = or disjoint i32 %522, 256
  %543 = lshr i32 %542, 3
  %544 = and i32 %543, 62
  %545 = add nuw nsw i32 %544, %542
  %546 = zext nneg i32 %545 to i64
  %547 = getelementptr inbounds nuw float, ptr addrspace(3) @global_smem, i64 %546
  %548 = load <2 x i32>, ptr addrspace(3) %547, align 8
  %.extract = load i32, ptr addrspace(3) %541, align 8
  %549 = getelementptr inbounds nuw i8, ptr addrspace(3) %541, i64 4
  %.extract11 = load i32, ptr addrspace(3) %549, align 4
  tail call void asm sideeffect "@$3 st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l,b"(i32 %.extract, i32 %.extract11, ptr addrspace(1) %510, i1 %41) #4
  %.extract12 = extractelement <2 x i32> %548, i64 0
  %.extract13 = extractelement <2 x i32> %548, i64 1
  tail call void asm sideeffect "@$3 st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l,b"(i32 %.extract12, i32 %.extract13, ptr addrspace(1) %512, i1 %41) #4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.fabs.f(float) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.ex2.approx.ftz.f(float) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fma.f32(float, float, float) #3

attributes #0 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { convergent nocallback nounwind }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nounwind }
attributes #5 = { nounwind memory(none) }

!nvvm.annotations = !{!0, !1}
!llvm.ident = !{!2}
!llvm.module.flags = !{!3}

!0 = !{ptr @gemm_fusion_dot_45, !"kernel", i32 1}
!1 = !{ptr @gemm_fusion_dot_45, !"reqntidx", i32 128}
!2 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!3 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!4 = !{i32 19609}
