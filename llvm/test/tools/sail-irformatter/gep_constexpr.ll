; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@global_smem = external addrspace(3) global [0 x i8], align 16

; CHECK-LABLE: _kernel
define void @_kernel(ptr addrspace(1) %0, ptr addrspace(1) %1, ptr addrspace(1) %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr !dbg !7 {
  %10 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #2, !dbg !10
  %11 = tail call i32 asm "mov.u32 $0, %ctaid.y;", "=r"() #2, !dbg !11
  %12 = add i32 %3, 15, !dbg !12
  %13 = sdiv i32 %12, 16, !dbg !16
  %14 = add i32 %4, 15, !dbg !17
  %15 = sdiv i32 %14, 16, !dbg !19
  %16 = shl nsw i32 %15, 3, !dbg !20
  %.frozen = freeze i32 %10
  %.frozen97 = freeze i32 %16
  %17 = sdiv i32 %.frozen, %.frozen97, !dbg !21
  %18 = shl i32 %17, 3, !dbg !22
  %19 = sub i32 %13, %18, !dbg !23
  %20 = tail call i32 @llvm.smin.i32(i32 %19, i32 8), !dbg !24
  %21 = srem i32 %10, %20, !dbg !25
  %22 = add i32 %18, %21, !dbg !26
  %23 = mul i32 %17, %.frozen97
  %.decomposed = sub i32 %.frozen, %23
  %24 = sdiv i32 %.decomposed, %20, !dbg !27
  %25 = shl i32 %22, 4, !dbg !28
  %26 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !29
  %27 = and i32 %26, 31, !dbg !29
  %28 = lshr i32 %26, 1, !dbg !29
  %29 = and i32 %28, 15, !dbg !29
  %30 = shl i32 %26, 3, !dbg !29
  %31 = and i32 %30, 8, !dbg !29
  %32 = or disjoint i32 %25, %29, !dbg !30
  %33 = shl i32 %24, 4, !dbg !31
  %34 = or disjoint i32 %33, %31, !dbg !32
  %35 = srem i32 %32, %3, !dbg !33
  %36 = srem i32 %34, %4, !dbg !34
  %37 = shl i32 %11, 4, !dbg !35
  %38 = or disjoint i32 %37, %31, !dbg !36
  %39 = or disjoint i32 %37, %29, !dbg !36
  %40 = mul i32 %35, %6, !dbg !37
  %41 = add i32 %38, %40, !dbg !38
  %42 = sext i32 %41 to i64, !dbg !39
  %43 = getelementptr half, ptr addrspace(1) %0, i64 %42, !dbg !39
  %44 = mul i32 %39, %7, !dbg !40
  %45 = add i32 %36, %44, !dbg !41
  %46 = sext i32 %45 to i64, !dbg !42
  %47 = getelementptr half, ptr addrspace(1) %1, i64 %46, !dbg !42
  %48 = add i32 %5, 15, !dbg !43
  %49 = sdiv i32 %48, 16, !dbg !45
  %50 = xor i32 %30, %26, !dbg !46
  %51 = and i32 %50, 8, !dbg !46
  %52 = shl nuw nsw i32 %29, 4, !dbg !46
  %53 = or disjoint i32 %51, %52, !dbg !46
  %54 = zext nneg i32 %53 to i64, !dbg !46
  %55 = getelementptr inbounds half, ptr addrspace(3) @global_smem, i64 %54, !dbg !46
  %.inv = icmp slt i32 %48, 16, !dbg !46
  %56 = select i1 %.inv, i32 0, i32 16, !dbg !46
  tail call void asm sideeffect "@$3 cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r,b"(ptr addrspace(3) %55, ptr addrspace(1) %43, i32 %56, i1 true) #2, !dbg !46
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #2, !dbg !46
  ; CHECK: [[GEP:%.*]] = getelementptr i8, i8 addrspace(3)* getelementptr inbounds ([0 x i8], [0 x i8] addrspace(3)* @global_smem, i32 0, i32 0), i64 1024
  ; CHECK: [[BITCAST:%.*]] = bitcast i8 addrspace(3)* [[GEP]] to half addrspace(3)*
  ; CHECK: %{{[0-9]+}} = getelementptr inbounds half, half addrspace(3)* [[BITCAST]], i64 %{{[0-9]+}}
  %57 = getelementptr inbounds half, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 1024), i64 %54, !dbg !47
  tail call void asm sideeffect "@$3 cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r,b"(ptr addrspace(3) %57, ptr addrspace(1) %47, i32 %56, i1 true) #2, !dbg !47
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #2, !dbg !47
  tail call void asm sideeffect "cp.async.wait_group 0x0;", ""() #2, !dbg !46
  tail call void @llvm.nvvm.barrier0(), !dbg !46
  %58 = lshr i32 %27, 4, !dbg !46
  %59 = lshr i32 %26, 2, !dbg !46
  %60 = and i32 %59, 1, !dbg !46
  %61 = xor i32 %58, %60, !dbg !46
  %62 = shl i32 %26, 4, !dbg !46
  %63 = and i32 %62, 240, !dbg !46
  %64 = shl nuw nsw i32 %61, 3, !dbg !46
  %65 = or disjoint i32 %64, %63, !dbg !46
  %66 = zext nneg i32 %65 to i64, !dbg !46
  %67 = getelementptr half, ptr addrspace(3) @global_smem, i64 %66, !dbg !46
  %68 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,r"(ptr addrspace(3) %67) #2, !dbg !46
  %69 = getelementptr half, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 1024), i64 %66, !dbg !47
  %70 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.trans.shared.b16 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,r"(ptr addrspace(3) %69) #2, !dbg !47
  %71 = icmp sgt i32 %48, 15, !dbg !48
  br i1 %71, label %.lr.ph, label %._crit_edge, !dbg !48

.lr.ph:                                           ; preds = %9
  %72 = shl i32 %7, 4, !dbg !49
  %73 = add nsw i32 %49, -1
  %74 = sext i32 %72 to i64
  br label %75, !dbg !48

75:                                               ; preds = %.lr.ph, %75
  %.pn = phi { i32, i32, i32, i32 } [ %70, %.lr.ph ], [ %98, %75 ]
  %.pn72 = phi { i32, i32, i32, i32 } [ %68, %.lr.ph ], [ %97, %75 ]
  %.pn3264 = phi ptr addrspace(1) [ %47, %.lr.ph ], [ %95, %75 ]
  %.pn1663 = phi ptr addrspace(1) [ %43, %.lr.ph ], [ %94, %75 ]
  %76 = phi float [ 0.000000e+00, %.lr.ph ], [ %100, %75 ]
  %77 = phi float [ 0.000000e+00, %.lr.ph ], [ %101, %75 ]
  %78 = phi float [ 0.000000e+00, %.lr.ph ], [ %102, %75 ]
  %79 = phi float [ 0.000000e+00, %.lr.ph ], [ %103, %75 ]
  %80 = phi float [ 0.000000e+00, %.lr.ph ], [ %105, %75 ]
  %81 = phi float [ 0.000000e+00, %.lr.ph ], [ %106, %75 ]
  %82 = phi float [ 0.000000e+00, %.lr.ph ], [ %107, %75 ]
  %83 = phi float [ 0.000000e+00, %.lr.ph ], [ %108, %75 ]
  %84 = phi i32 [ 0, %.lr.ph ], [ %109, %75 ]
  %85 = extractvalue { i32, i32, i32, i32 } %.pn72, 3, !dbg !48
  %86 = extractvalue { i32, i32, i32, i32 } %.pn72, 2, !dbg !48
  %87 = extractvalue { i32, i32, i32, i32 } %.pn72, 1, !dbg !48
  %88 = extractvalue { i32, i32, i32, i32 } %.pn72, 0, !dbg !48
  %89 = extractvalue { i32, i32, i32, i32 } %.pn, 3, !dbg !48
  %90 = extractvalue { i32, i32, i32, i32 } %.pn, 2, !dbg !48
  %91 = extractvalue { i32, i32, i32, i32 } %.pn, 1, !dbg !48
  %92 = extractvalue { i32, i32, i32, i32 } %.pn, 0, !dbg !48
  %93 = icmp slt i32 %84, %73, !dbg !48
  %94 = getelementptr i8, ptr addrspace(1) %.pn1663, i64 32, !dbg !50
  %95 = getelementptr half, ptr addrspace(1) %.pn3264, i64 %74, !dbg !51
  tail call void @llvm.nvvm.barrier0(), !dbg !46
  %96 = select i1 %93, i32 16, i32 0, !dbg !46
  tail call void asm sideeffect "@$3 cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r,b"(ptr addrspace(3) %55, ptr addrspace(1) %94, i32 %96, i1 true) #2, !dbg !46
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #2, !dbg !46
  tail call void asm sideeffect "@$3 cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r,b"(ptr addrspace(3) %57, ptr addrspace(1) %95, i32 %96, i1 true) #2, !dbg !47
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #2, !dbg !47
  tail call void asm sideeffect "cp.async.wait_group 0x0;", ""() #2, !dbg !46
  tail call void @llvm.nvvm.barrier0(), !dbg !46
  %97 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,r"(ptr addrspace(3) %67) #2, !dbg !46
  %98 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.trans.shared.b16 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,r"(ptr addrspace(3) %69) #2, !dbg !47
  %99 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.f16.f16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %76, float %77, float %78, float %79, i32 %88, i32 %87, i32 %86, i32 %85, i32 %92, i32 %91) #2, !dbg !52
  %100 = extractvalue { float, float, float, float } %99, 0, !dbg !52
  %101 = extractvalue { float, float, float, float } %99, 1, !dbg !52
  %102 = extractvalue { float, float, float, float } %99, 2, !dbg !52
  %103 = extractvalue { float, float, float, float } %99, 3, !dbg !52
  %104 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.f16.f16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %80, float %81, float %82, float %83, i32 %88, i32 %87, i32 %86, i32 %85, i32 %90, i32 %89) #2, !dbg !52
  %105 = extractvalue { float, float, float, float } %104, 0, !dbg !52
  %106 = extractvalue { float, float, float, float } %104, 1, !dbg !52
  %107 = extractvalue { float, float, float, float } %104, 2, !dbg !52
  %108 = extractvalue { float, float, float, float } %104, 3, !dbg !52
  %109 = add nuw nsw i32 %84, 1, !dbg !48
  %110 = icmp slt i32 %109, %49, !dbg !48
  br i1 %110, label %75, label %._crit_edge.loopexit, !dbg !48

._crit_edge.loopexit:                             ; preds = %75
  %111 = insertelement <8 x float> poison, float %100, i64 0, !dbg !53
  %112 = insertelement <8 x float> %111, float %101, i64 1, !dbg !53
  %113 = insertelement <8 x float> %112, float %102, i64 2, !dbg !53
  %114 = insertelement <8 x float> %113, float %103, i64 3, !dbg !53
  %115 = insertelement <8 x float> %114, float %105, i64 4, !dbg !53
  %116 = insertelement <8 x float> %115, float %106, i64 5, !dbg !53
  %117 = insertelement <8 x float> %116, float %107, i64 6, !dbg !53
  %118 = insertelement <8 x float> %117, float %108, i64 7, !dbg !53
  %119 = fptrunc <8 x float> %118 to <8 x half>, !dbg !53
  br label %._crit_edge, !dbg !48

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %9
  %120 = phi <8 x half> [ zeroinitializer, %9 ], [ %119, %._crit_edge.loopexit ]
  tail call void asm sideeffect "cp.async.wait_group 0x0;", ""() #2, !dbg !48
  tail call void @llvm.nvvm.barrier0(), !dbg !48
  %121 = mul i32 %32, %8, !dbg !54
  %122 = add i32 %121, %34, !dbg !55
  %123 = sext i32 %122 to i64, !dbg !56
  %124 = getelementptr half, ptr addrspace(1) %2, i64 %123, !dbg !56
  %125 = icmp slt i32 %32, %3, !dbg !57
  %126 = icmp slt i32 %34, %4, !dbg !58
  %127 = and i1 %125, %126, !dbg !59
  %128 = lshr i32 %27, 2, !dbg !60
  %129 = shl i32 %26, 1, !dbg !60
  %130 = and i32 %129, 6, !dbg !60
  %131 = mul nuw nsw i32 %128, 24, !dbg !60
  %132 = or disjoint i32 %131, %130, !dbg !60
  %133 = zext nneg i32 %132 to i64, !dbg !60
  %134 = getelementptr half, ptr addrspace(3) @global_smem, i64 %133, !dbg !60
  %135 = shufflevector <8 x half> %120, <8 x half> poison, <2 x i32> <i32 0, i32 1>, !dbg !60
  store <2 x half> %135, ptr addrspace(3) %134, align 4, !dbg !60
  %136 = add nuw nsw i32 %131, 192, !dbg !60
  %137 = or disjoint i32 %136, %130, !dbg !60
  %138 = zext nneg i32 %137 to i64, !dbg !60
  %139 = getelementptr half, ptr addrspace(3) @global_smem, i64 %138, !dbg !60
  %140 = shufflevector <8 x half> %120, <8 x half> poison, <2 x i32> <i32 2, i32 3>, !dbg !60
  store <2 x half> %140, ptr addrspace(3) %139, align 4, !dbg !60
  %141 = or disjoint i32 %130, 8, !dbg !60
  %142 = add nuw nsw i32 %131, %141, !dbg !60
  %143 = zext nneg i32 %142 to i64, !dbg !60
  %144 = getelementptr half, ptr addrspace(3) @global_smem, i64 %143, !dbg !60
  %145 = shufflevector <8 x half> %120, <8 x half> poison, <2 x i32> <i32 4, i32 5>, !dbg !60
  store <2 x half> %145, ptr addrspace(3) %144, align 4, !dbg !60
  %146 = add nuw nsw i32 %136, %141, !dbg !60
  %147 = zext nneg i32 %146 to i64, !dbg !60
  %148 = getelementptr half, ptr addrspace(3) @global_smem, i64 %147, !dbg !60
  %149 = shufflevector <8 x half> %120, <8 x half> poison, <2 x i32> <i32 6, i32 7>, !dbg !60
  store <2 x half> %149, ptr addrspace(3) %148, align 4, !dbg !60
  tail call void @llvm.nvvm.barrier0(), !dbg !60
  %150 = lshr i32 %27, 1, !dbg !60
  %151 = mul nuw nsw i32 %150, 24, !dbg !60
  %152 = add nuw nsw i32 %151, %31, !dbg !60
  %153 = zext nneg i32 %152 to i64, !dbg !60
  %154 = getelementptr half, ptr addrspace(3) @global_smem, i64 %153, !dbg !60
  %.extract = load i32, ptr addrspace(3) %154, align 16, !dbg !60
  %155 = getelementptr inbounds i8, ptr addrspace(3) %154, i64 4, !dbg !60
  %.extract58 = load i32, ptr addrspace(3) %155, align 4, !dbg !60
  %156 = getelementptr inbounds i8, ptr addrspace(3) %154, i64 8, !dbg !60
  %.extract60 = load i32, ptr addrspace(3) %156, align 8, !dbg !60
  %157 = getelementptr inbounds i8, ptr addrspace(3) %154, i64 12, !dbg !60
  %.extract62 = load i32, ptr addrspace(3) %157, align 4, !dbg !60
  tail call void asm sideeffect "@$5 st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l,b"(i32 %.extract, i32 %.extract58, i32 %.extract60, i32 %.extract62, ptr addrspace(1) %124, i1 %127) #2, !dbg !60
  ret void, !dbg !61
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #0

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
!3 = !DIFile(filename: "matmul.py", directory: "/usr/local/lib/python3.10/site-packages/triton/ops")
!4 = !{ptr @_kernel, !"kernel", i32 1}
!5 = !{ptr @_kernel, !"maxntidx", i32 32}
!6 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!7 = distinct !DISubprogram(name: "_kernel", linkageName: "_kernel", scope: !3, file: !3, line: 88, type: !8, scopeLine: 88, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2)
!8 = !DISubroutineType(cc: DW_CC_normal, types: !9)
!9 = !{}
!10 = !DILocation(line: 99, column: 24, scope: !7)
!11 = !DILocation(line: 100, column: 26, scope: !7)
!12 = !DILocation(line: 40, column: 22, scope: !13, inlinedAt: !15)
!13 = distinct !DILexicalBlockFile(scope: !7, file: !14, discriminator: 0)
!14 = !DIFile(filename: "standard.py", directory: "/usr/local/lib/python3.10/site-packages/triton/language")
!15 = !DILocation(line: 101, column: 24, scope: !7)
!16 = !DILocation(line: 40, column: 28, scope: !13, inlinedAt: !15)
!17 = !DILocation(line: 40, column: 22, scope: !13, inlinedAt: !18)
!18 = !DILocation(line: 102, column: 24, scope: !7)
!19 = !DILocation(line: 40, column: 28, scope: !13, inlinedAt: !18)
!20 = !DILocation(line: 104, column: 22, scope: !7)
!21 = !DILocation(line: 105, column: 22, scope: !7)
!22 = !DILocation(line: 106, column: 41, scope: !7)
!23 = !DILocation(line: 106, column: 30, scope: !7)
!24 = !DILocation(line: 106, column: 50, scope: !7)
!25 = !DILocation(line: 107, column: 40, scope: !7)
!26 = !DILocation(line: 107, column: 34, scope: !7)
!27 = !DILocation(line: 108, column: 30, scope: !7)
!28 = !DILocation(line: 110, column: 17, scope: !7)
!29 = !DILocation(line: 110, column: 40, scope: !7)
!30 = !DILocation(line: 110, column: 27, scope: !7)
!31 = !DILocation(line: 111, column: 17, scope: !7)
!32 = !DILocation(line: 111, column: 27, scope: !7)
!33 = !DILocation(line: 112, column: 48, scope: !7)
!34 = !DILocation(line: 113, column: 48, scope: !7)
!35 = !DILocation(line: 114, column: 17, scope: !7)
!36 = !DILocation(line: 114, column: 27, scope: !7)
!37 = !DILocation(line: 116, column: 28, scope: !7)
!38 = !DILocation(line: 116, column: 40, scope: !7)
!39 = !DILocation(line: 116, column: 13, scope: !7)
!40 = !DILocation(line: 117, column: 27, scope: !7)
!41 = !DILocation(line: 117, column: 39, scope: !7)
!42 = !DILocation(line: 117, column: 13, scope: !7)
!43 = !DILocation(line: 40, column: 22, scope: !13, inlinedAt: !44)
!44 = !DILocation(line: 119, column: 33, scope: !7)
!45 = !DILocation(line: 40, column: 28, scope: !13, inlinedAt: !44)
!46 = !DILocation(line: 121, column: 24, scope: !7)
!47 = !DILocation(line: 122, column: 24, scope: !7)
!48 = !DILocation(line: 119, column: 22, scope: !7)
!49 = !DILocation(line: 136, column: 33, scope: !7)
!50 = !DILocation(line: 135, column: 13, scope: !7)
!51 = !DILocation(line: 136, column: 13, scope: !7)
!52 = !DILocation(line: 132, column: 31, scope: !7)
!53 = !DILocation(line: 137, column: 17, scope: !7)
!54 = !DILocation(line: 141, column: 27, scope: !7)
!55 = !DILocation(line: 141, column: 39, scope: !7)
!56 = !DILocation(line: 141, column: 13, scope: !7)
!57 = !DILocation(line: 142, column: 17, scope: !7)
!58 = !DILocation(line: 142, column: 37, scope: !7)
!59 = !DILocation(line: 142, column: 31, scope: !7)
!60 = !DILocation(line: 145, column: 20, scope: !7)
!61 = !DILocation(line: 144, column: 4, scope: !7)
