; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; BackendOption: -nvptx-fma-level=2
; BackendOption: -nvptx-prec-divf32=1
; BackendOption: -nvptx-prec-sqrtf32=1
; BackendOption: -misched-stall-cycle=1
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_3 = local_unnamed_addr constant [64 x i8] zeroinitializer, align 128

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn argmemonly
define void @copy_fusion_3(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg12, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg13, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg14, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg15, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg16, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg17, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg18, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg19, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg20, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg21, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg22, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg23, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg24, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg25, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg26, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg27, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg28, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg29, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg30, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg31, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg32, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg33, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg34, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg35, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg36, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg37, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg38, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg39, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg40, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg41, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg42, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg43, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg44, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg45, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg46, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg47, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg48, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg49, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg50, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg51, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg52, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg53, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg54) local_unnamed_addr #0 {
entry:
  %0 = load i64, ptr %arg0, align 128, !invariant.load !47
  %1 = load float, ptr %arg1, align 16, !invariant.load !47
  %.inv = fcmp ole float %1, 0xC3E0000000000000
  %2 = select i1 %.inv, float 0xC3E0000000000000, float %1
  %3 = fptosi float %2 to i64
  %4 = fcmp oge float %1, 0x43E0000000000000
  %5 = select i1 %4, i64 9223372036854775807, i64 %3
  %6 = fcmp uno float %1, 0.000000e+00
  %7 = select i1 %6, i64 0, i64 %5
  store i64 %0, ptr %arg2, align 128
  store i64 %0, ptr %arg3, align 128
  store i64 %0, ptr %arg4, align 128
  store i64 %0, ptr %arg5, align 128
  store i64 %0, ptr %arg6, align 128
  store i64 %0, ptr %arg7, align 128
  store i64 %0, ptr %arg8, align 128
  store i64 %0, ptr %arg9, align 128
  store i64 %0, ptr %arg10, align 128
  store i64 %0, ptr %arg11, align 128
  store i64 %0, ptr %arg12, align 128
  store i64 %0, ptr %arg13, align 128
  store i64 %0, ptr %arg14, align 128
  store i64 %0, ptr %arg15, align 128
  store i64 %0, ptr %arg16, align 128
  store i64 %0, ptr %arg17, align 128
  store i64 %0, ptr %arg18, align 128
  store i64 %0, ptr %arg19, align 128
  store i64 %0, ptr %arg20, align 128
  store i64 %0, ptr %arg21, align 128
  store i64 %0, ptr %arg22, align 128
  store i64 %0, ptr %arg23, align 128
  store i64 %0, ptr %arg24, align 128
  store i64 %0, ptr %arg25, align 128
  store i64 %0, ptr %arg26, align 128
  store i64 %0, ptr %arg27, align 128
  store i64 %7, ptr %arg28, align 128
  store i64 %0, ptr %arg29, align 128
  store i64 %0, ptr %arg30, align 128
  store i64 %0, ptr %arg31, align 128
  store i64 %0, ptr %arg32, align 128
  store i64 %0, ptr %arg33, align 128
  store i64 %0, ptr %arg34, align 128
  store i64 %0, ptr %arg35, align 128
  store i64 %0, ptr %arg36, align 128
  store i64 %0, ptr %arg37, align 128
  store i64 %0, ptr %arg38, align 128
  store i64 %0, ptr %arg39, align 128
  store i64 %0, ptr %arg40, align 128
  store i64 %0, ptr %arg41, align 128
  store i64 %0, ptr %arg42, align 128
  store i64 %0, ptr %arg43, align 128
  store i64 %0, ptr %arg44, align 128
  store i64 %0, ptr %arg45, align 128
  store i64 %0, ptr %arg46, align 128
  store i64 %0, ptr %arg47, align 128
  store i64 %0, ptr %arg48, align 128
  store i64 %0, ptr %arg49, align 128
  store i64 %0, ptr %arg50, align 128
  store i64 %0, ptr %arg51, align 128
  store i64 %0, ptr %arg52, align 128
  store i64 %0, ptr %arg53, align 128
  store i64 %0, ptr %arg54, align 128
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn readnone
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn readnone
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn argmemonly
define void @wrapped_convert_1(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg1) local_unnamed_addr #0 {
entry:
  %0 = load i64, ptr %arg0, align 128, !invariant.load !47
  %1 = sitofp i64 %0 to float
  store float %1, ptr %arg1, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn argmemonly
define void @loop_multiply_fusion_29(ptr noalias nocapture align 16 dereferenceable(256) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture align 16 dereferenceable(256) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg3, ptr noalias nocapture align 16 dereferenceable(256) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg5, ptr noalias nocapture align 16 dereferenceable(256) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg7, ptr noalias nocapture align 16 dereferenceable(256) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg9, ptr noalias nocapture align 16 dereferenceable(256) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg11, ptr noalias nocapture align 16 dereferenceable(256) %arg12, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg13, ptr noalias nocapture align 16 dereferenceable(256) %arg14, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg15, ptr noalias nocapture align 16 dereferenceable(256) %arg16, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg17, ptr noalias nocapture align 16 dereferenceable(256) %arg18, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg19, ptr noalias nocapture align 16 dereferenceable(256) %arg20, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg21, ptr noalias nocapture align 16 dereferenceable(256) %arg22, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg23, ptr noalias nocapture align 16 dereferenceable(256) %arg24, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg25, ptr noalias nocapture align 16 dereferenceable(256) %arg26, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg27, ptr noalias nocapture align 16 dereferenceable(256) %arg28, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg29, ptr noalias nocapture align 16 dereferenceable(256) %arg30, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg31, ptr noalias nocapture align 16 dereferenceable(256) %arg32, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg33, ptr noalias nocapture align 16 dereferenceable(256) %arg34, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg35, ptr noalias nocapture align 16 dereferenceable(256) %arg36, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg37, ptr noalias nocapture align 16 dereferenceable(256) %arg38, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg39, ptr noalias nocapture align 16 dereferenceable(256) %arg40, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg41, ptr noalias nocapture align 16 dereferenceable(256) %arg42, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg43, ptr noalias nocapture align 16 dereferenceable(256) %arg44, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg45, ptr noalias nocapture align 16 dereferenceable(256) %arg46, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg47, ptr noalias nocapture align 16 dereferenceable(256) %arg48, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg49, ptr noalias nocapture align 16 dereferenceable(256) %arg50, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg51, ptr noalias nocapture align 16 dereferenceable(256) %arg52, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg53, ptr noalias nocapture align 16 dereferenceable(256) %arg54, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg55) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !48
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr float, ptr %arg0, i64 %1
  %3 = load float, ptr %2, align 4
  %4 = load float, ptr %arg1, align 16, !invariant.load !47
  %multiply.1388 = fmul float %3, %4
  %5 = getelementptr float, ptr %arg2, i64 %1
  %6 = load float, ptr %5, align 4
  %7 = load float, ptr %arg3, align 16, !invariant.load !47
  %multiply.1389 = fmul float %6, %7
  %8 = getelementptr float, ptr %arg4, i64 %1
  %9 = load float, ptr %8, align 4
  %10 = load float, ptr %arg5, align 16, !invariant.load !47
  %multiply.1390 = fmul float %9, %10
  %11 = getelementptr float, ptr %arg6, i64 %1
  %12 = load float, ptr %11, align 4
  %13 = load float, ptr %arg7, align 16, !invariant.load !47
  %multiply.1391 = fmul float %12, %13
  %14 = getelementptr float, ptr %arg8, i64 %1
  %15 = load float, ptr %14, align 4
  %16 = load float, ptr %arg9, align 16, !invariant.load !47
  %multiply.1392 = fmul float %15, %16
  %17 = getelementptr float, ptr %arg10, i64 %1
  %18 = load float, ptr %17, align 4
  %19 = load float, ptr %arg11, align 16, !invariant.load !47
  %multiply.1393 = fmul float %18, %19
  %20 = getelementptr float, ptr %arg12, i64 %1
  %21 = load float, ptr %20, align 4
  %22 = load float, ptr %arg13, align 16, !invariant.load !47
  %multiply.1394 = fmul float %21, %22
  %23 = getelementptr float, ptr %arg14, i64 %1
  %24 = load float, ptr %23, align 4
  %25 = load float, ptr %arg15, align 16, !invariant.load !47
  %multiply.1395 = fmul float %24, %25
  %26 = getelementptr float, ptr %arg16, i64 %1
  %27 = load float, ptr %26, align 4
  %28 = load float, ptr %arg17, align 16, !invariant.load !47
  %multiply.1396 = fmul float %27, %28
  %29 = getelementptr float, ptr %arg18, i64 %1
  %30 = load float, ptr %29, align 4
  %31 = load float, ptr %arg19, align 16, !invariant.load !47
  %multiply.1397 = fmul float %30, %31
  %32 = getelementptr float, ptr %arg20, i64 %1
  %33 = load float, ptr %32, align 4
  %34 = load float, ptr %arg21, align 16, !invariant.load !47
  %multiply.1398 = fmul float %33, %34
  %35 = getelementptr float, ptr %arg22, i64 %1
  %36 = load float, ptr %35, align 4
  %37 = load float, ptr %arg23, align 16, !invariant.load !47
  %multiply.1399 = fmul float %36, %37
  %38 = getelementptr float, ptr %arg24, i64 %1
  %39 = load float, ptr %38, align 4
  %40 = load float, ptr %arg25, align 16, !invariant.load !47
  %multiply.1400 = fmul float %39, %40
  %41 = getelementptr float, ptr %arg26, i64 %1
  %42 = load float, ptr %41, align 4
  %43 = load float, ptr %arg27, align 16, !invariant.load !47
  %multiply.1401 = fmul float %42, %43
  %44 = getelementptr float, ptr %arg28, i64 %1
  %45 = load float, ptr %44, align 4
  %46 = load float, ptr %arg29, align 16, !invariant.load !47
  %multiply.1402 = fmul float %45, %46
  %47 = getelementptr float, ptr %arg30, i64 %1
  %48 = load float, ptr %47, align 4
  %49 = load float, ptr %arg31, align 16, !invariant.load !47
  %multiply.1403 = fmul float %48, %49
  %50 = getelementptr float, ptr %arg32, i64 %1
  %51 = load float, ptr %50, align 4
  %52 = load float, ptr %arg33, align 16, !invariant.load !47
  %multiply.1404 = fmul float %51, %52
  %53 = getelementptr float, ptr %arg34, i64 %1
  %54 = load float, ptr %53, align 4
  %55 = load float, ptr %arg35, align 16, !invariant.load !47
  %multiply.1405 = fmul float %54, %55
  %56 = getelementptr float, ptr %arg36, i64 %1
  %57 = load float, ptr %56, align 4
  %58 = load float, ptr %arg37, align 16, !invariant.load !47
  %multiply.1406 = fmul float %57, %58
  %59 = getelementptr float, ptr %arg38, i64 %1
  %60 = load float, ptr %59, align 4
  %61 = load float, ptr %arg39, align 16, !invariant.load !47
  %multiply.1407 = fmul float %60, %61
  %62 = getelementptr float, ptr %arg40, i64 %1
  %63 = load float, ptr %62, align 4
  %64 = load float, ptr %arg41, align 16, !invariant.load !47
  %multiply.1408 = fmul float %63, %64
  %65 = getelementptr float, ptr %arg42, i64 %1
  %66 = load float, ptr %65, align 4
  %67 = load float, ptr %arg43, align 16, !invariant.load !47
  %multiply.1409 = fmul float %66, %67
  %68 = getelementptr float, ptr %arg44, i64 %1
  %69 = load float, ptr %68, align 4
  %70 = load float, ptr %arg45, align 16, !invariant.load !47
  %multiply.1410 = fmul float %69, %70
  %71 = getelementptr float, ptr %arg46, i64 %1
  %72 = load float, ptr %71, align 4
  %73 = load float, ptr %arg47, align 16, !invariant.load !47
  %multiply.1411 = fmul float %72, %73
  %74 = getelementptr float, ptr %arg48, i64 %1
  %75 = load float, ptr %74, align 4
  %76 = load float, ptr %arg49, align 16, !invariant.load !47
  %multiply.1412 = fmul float %75, %76
  %77 = getelementptr float, ptr %arg50, i64 %1
  %78 = load float, ptr %77, align 4
  %79 = load float, ptr %arg51, align 16, !invariant.load !47
  %multiply.1413 = fmul float %78, %79
  %80 = getelementptr float, ptr %arg52, i64 %1
  %81 = load float, ptr %80, align 4
  %82 = load float, ptr %arg53, align 16, !invariant.load !47
  %multiply.1414 = fmul float %81, %82
  %83 = getelementptr float, ptr %arg54, i64 %1
  %84 = load float, ptr %83, align 4
  %85 = load float, ptr %arg55, align 16, !invariant.load !47
  %multiply.1415 = fmul float %84, %85
  store float %multiply.1388, ptr %2, align 4
  store float %multiply.1389, ptr %5, align 4
  store float %multiply.1390, ptr %8, align 4
  store float %multiply.1391, ptr %11, align 4
  store float %multiply.1392, ptr %14, align 4
  store float %multiply.1393, ptr %17, align 4
  store float %multiply.1394, ptr %20, align 4
  store float %multiply.1395, ptr %23, align 4
  store float %multiply.1396, ptr %26, align 4
  store float %multiply.1397, ptr %29, align 4
  store float %multiply.1398, ptr %32, align 4
  store float %multiply.1399, ptr %35, align 4
  store float %multiply.1400, ptr %38, align 4
  store float %multiply.1401, ptr %41, align 4
  store float %multiply.1402, ptr %44, align 4
  store float %multiply.1403, ptr %47, align 4
  store float %multiply.1404, ptr %50, align 4
  store float %multiply.1405, ptr %53, align 4
  store float %multiply.1406, ptr %56, align 4
  store float %multiply.1407, ptr %59, align 4
  store float %multiply.1408, ptr %62, align 4
  store float %multiply.1409, ptr %65, align 4
  store float %multiply.1410, ptr %68, align 4
  store float %multiply.1411, ptr %71, align 4
  store float %multiply.1412, ptr %74, align 4
  store float %multiply.1413, ptr %77, align 4
  store float %multiply.1414, ptr %80, align 4
  store float %multiply.1415, ptr %83, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn argmemonly
define void @loop_multiply_fusion_30(ptr noalias nocapture align 16 dereferenceable(512) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture align 16 dereferenceable(512) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg3, ptr noalias nocapture align 16 dereferenceable(512) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg5, ptr noalias nocapture align 16 dereferenceable(512) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg7, ptr noalias nocapture align 16 dereferenceable(512) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg9, ptr noalias nocapture align 16 dereferenceable(512) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg11, ptr noalias nocapture align 16 dereferenceable(512) %arg12, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg13, ptr noalias nocapture align 16 dereferenceable(512) %arg14, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg15, ptr noalias nocapture align 16 dereferenceable(512) %arg16, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg17, ptr noalias nocapture align 16 dereferenceable(512) %arg18, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg19, ptr noalias nocapture align 16 dereferenceable(512) %arg20, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg21, ptr noalias nocapture align 16 dereferenceable(512) %arg22, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg23, ptr noalias nocapture align 16 dereferenceable(512) %arg24, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg25, ptr noalias nocapture align 16 dereferenceable(512) %arg26, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg27, ptr noalias nocapture align 16 dereferenceable(512) %arg28, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg29, ptr noalias nocapture align 16 dereferenceable(512) %arg30, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg31, ptr noalias nocapture align 16 dereferenceable(512) %arg32, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg33, ptr noalias nocapture align 16 dereferenceable(512) %arg34, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg35, ptr noalias nocapture align 16 dereferenceable(512) %arg36, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg37, ptr noalias nocapture align 16 dereferenceable(512) %arg38, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg39, ptr noalias nocapture align 16 dereferenceable(512) %arg40, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg41, ptr noalias nocapture align 16 dereferenceable(512) %arg42, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg43, ptr noalias nocapture align 16 dereferenceable(512) %arg44, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg45, ptr noalias nocapture align 16 dereferenceable(512) %arg46, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg47, ptr noalias nocapture align 16 dereferenceable(512) %arg48, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg49, ptr noalias nocapture align 16 dereferenceable(512) %arg50, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg51, ptr noalias nocapture align 16 dereferenceable(512) %arg52, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg53, ptr noalias nocapture align 16 dereferenceable(512) %arg54, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg55, ptr noalias nocapture align 16 dereferenceable(512) %arg56, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg57, ptr noalias nocapture align 16 dereferenceable(512) %arg58, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg59, ptr noalias nocapture align 16 dereferenceable(512) %arg60, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg61, ptr noalias nocapture align 16 dereferenceable(512) %arg62, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg63) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !49
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr float, ptr %arg0, i64 %1
  %3 = load float, ptr %2, align 4
  %4 = load float, ptr %arg1, align 16, !invariant.load !47
  %multiply.1416 = fmul float %3, %4
  %5 = getelementptr float, ptr %arg2, i64 %1
  %6 = load float, ptr %5, align 4
  %7 = load float, ptr %arg3, align 16, !invariant.load !47
  %multiply.1417 = fmul float %6, %7
  %8 = getelementptr float, ptr %arg4, i64 %1
  %9 = load float, ptr %8, align 4
  %10 = load float, ptr %arg5, align 16, !invariant.load !47
  %multiply.1418 = fmul float %9, %10
  %11 = getelementptr float, ptr %arg6, i64 %1
  %12 = load float, ptr %11, align 4
  %13 = load float, ptr %arg7, align 16, !invariant.load !47
  %multiply.1419 = fmul float %12, %13
  %14 = getelementptr float, ptr %arg8, i64 %1
  %15 = load float, ptr %14, align 4
  %16 = load float, ptr %arg9, align 16, !invariant.load !47
  %multiply.1420 = fmul float %15, %16
  %17 = getelementptr float, ptr %arg10, i64 %1
  %18 = load float, ptr %17, align 4
  %19 = load float, ptr %arg11, align 16, !invariant.load !47
  %multiply.1421 = fmul float %18, %19
  %20 = getelementptr float, ptr %arg12, i64 %1
  %21 = load float, ptr %20, align 4
  %22 = load float, ptr %arg13, align 16, !invariant.load !47
  %multiply.1422 = fmul float %21, %22
  %23 = getelementptr float, ptr %arg14, i64 %1
  %24 = load float, ptr %23, align 4
  %25 = load float, ptr %arg15, align 16, !invariant.load !47
  %multiply.1423 = fmul float %24, %25
  %26 = getelementptr float, ptr %arg16, i64 %1
  %27 = load float, ptr %26, align 4
  %28 = load float, ptr %arg17, align 16, !invariant.load !47
  %multiply.1424 = fmul float %27, %28
  %29 = getelementptr float, ptr %arg18, i64 %1
  %30 = load float, ptr %29, align 4
  %31 = load float, ptr %arg19, align 16, !invariant.load !47
  %multiply.1425 = fmul float %30, %31
  %32 = getelementptr float, ptr %arg20, i64 %1
  %33 = load float, ptr %32, align 4
  %34 = load float, ptr %arg21, align 16, !invariant.load !47
  %multiply.1426 = fmul float %33, %34
  %35 = getelementptr float, ptr %arg22, i64 %1
  %36 = load float, ptr %35, align 4
  %37 = load float, ptr %arg23, align 16, !invariant.load !47
  %multiply.1427 = fmul float %36, %37
  %38 = getelementptr float, ptr %arg24, i64 %1
  %39 = load float, ptr %38, align 4
  %40 = load float, ptr %arg25, align 16, !invariant.load !47
  %multiply.1428 = fmul float %39, %40
  %41 = getelementptr float, ptr %arg26, i64 %1
  %42 = load float, ptr %41, align 4
  %43 = load float, ptr %arg27, align 16, !invariant.load !47
  %multiply.1429 = fmul float %42, %43
  %44 = getelementptr float, ptr %arg28, i64 %1
  %45 = load float, ptr %44, align 4
  %46 = load float, ptr %arg29, align 16, !invariant.load !47
  %multiply.1430 = fmul float %45, %46
  %47 = getelementptr float, ptr %arg30, i64 %1
  %48 = load float, ptr %47, align 4
  %49 = load float, ptr %arg31, align 16, !invariant.load !47
  %multiply.1431 = fmul float %48, %49
  %50 = getelementptr float, ptr %arg32, i64 %1
  %51 = load float, ptr %50, align 4
  %52 = load float, ptr %arg33, align 16, !invariant.load !47
  %multiply.1432 = fmul float %51, %52
  %53 = getelementptr float, ptr %arg34, i64 %1
  %54 = load float, ptr %53, align 4
  %55 = load float, ptr %arg35, align 16, !invariant.load !47
  %multiply.1433 = fmul float %54, %55
  %56 = getelementptr float, ptr %arg36, i64 %1
  %57 = load float, ptr %56, align 4
  %58 = load float, ptr %arg37, align 16, !invariant.load !47
  %multiply.1434 = fmul float %57, %58
  %59 = getelementptr float, ptr %arg38, i64 %1
  %60 = load float, ptr %59, align 4
  %61 = load float, ptr %arg39, align 16, !invariant.load !47
  %multiply.1435 = fmul float %60, %61
  %62 = getelementptr float, ptr %arg40, i64 %1
  %63 = load float, ptr %62, align 4
  %64 = load float, ptr %arg41, align 16, !invariant.load !47
  %multiply.1436 = fmul float %63, %64
  %65 = getelementptr float, ptr %arg42, i64 %1
  %66 = load float, ptr %65, align 4
  %67 = load float, ptr %arg43, align 16, !invariant.load !47
  %multiply.1437 = fmul float %66, %67
  %68 = getelementptr float, ptr %arg44, i64 %1
  %69 = load float, ptr %68, align 4
  %70 = load float, ptr %arg45, align 16, !invariant.load !47
  %multiply.1438 = fmul float %69, %70
  %71 = getelementptr float, ptr %arg46, i64 %1
  %72 = load float, ptr %71, align 4
  %73 = load float, ptr %arg47, align 16, !invariant.load !47
  %multiply.1439 = fmul float %72, %73
  %74 = getelementptr float, ptr %arg48, i64 %1
  %75 = load float, ptr %74, align 4
  %76 = load float, ptr %arg49, align 16, !invariant.load !47
  %multiply.1440 = fmul float %75, %76
  %77 = getelementptr float, ptr %arg50, i64 %1
  %78 = load float, ptr %77, align 4
  %79 = load float, ptr %arg51, align 16, !invariant.load !47
  %multiply.1441 = fmul float %78, %79
  %80 = getelementptr float, ptr %arg52, i64 %1
  %81 = load float, ptr %80, align 4
  %82 = load float, ptr %arg53, align 16, !invariant.load !47
  %multiply.1442 = fmul float %81, %82
  %83 = getelementptr float, ptr %arg54, i64 %1
  %84 = load float, ptr %83, align 4
  %85 = load float, ptr %arg55, align 16, !invariant.load !47
  %multiply.1443 = fmul float %84, %85
  %86 = getelementptr float, ptr %arg56, i64 %1
  %87 = load float, ptr %86, align 4
  %88 = load float, ptr %arg57, align 16, !invariant.load !47
  %multiply.1444 = fmul float %87, %88
  %89 = getelementptr float, ptr %arg58, i64 %1
  %90 = load float, ptr %89, align 4
  %91 = load float, ptr %arg59, align 16, !invariant.load !47
  %multiply.1445 = fmul float %90, %91
  %92 = getelementptr float, ptr %arg60, i64 %1
  %93 = load float, ptr %92, align 4
  %94 = load float, ptr %arg61, align 16, !invariant.load !47
  %multiply.1446 = fmul float %93, %94
  %95 = getelementptr float, ptr %arg62, i64 %1
  %96 = load float, ptr %95, align 4
  %97 = load float, ptr %arg63, align 16, !invariant.load !47
  %multiply.1447 = fmul float %96, %97
  store float %multiply.1416, ptr %2, align 4
  store float %multiply.1417, ptr %5, align 4
  store float %multiply.1418, ptr %8, align 4
  store float %multiply.1419, ptr %11, align 4
  store float %multiply.1420, ptr %14, align 4
  store float %multiply.1421, ptr %17, align 4
  store float %multiply.1422, ptr %20, align 4
  store float %multiply.1423, ptr %23, align 4
  store float %multiply.1424, ptr %26, align 4
  store float %multiply.1425, ptr %29, align 4
  store float %multiply.1426, ptr %32, align 4
  store float %multiply.1427, ptr %35, align 4
  store float %multiply.1428, ptr %38, align 4
  store float %multiply.1429, ptr %41, align 4
  store float %multiply.1430, ptr %44, align 4
  store float %multiply.1431, ptr %47, align 4
  store float %multiply.1432, ptr %50, align 4
  store float %multiply.1433, ptr %53, align 4
  store float %multiply.1434, ptr %56, align 4
  store float %multiply.1435, ptr %59, align 4
  store float %multiply.1436, ptr %62, align 4
  store float %multiply.1437, ptr %65, align 4
  store float %multiply.1438, ptr %68, align 4
  store float %multiply.1439, ptr %71, align 4
  store float %multiply.1440, ptr %74, align 4
  store float %multiply.1441, ptr %77, align 4
  store float %multiply.1442, ptr %80, align 4
  store float %multiply.1443, ptr %83, align 4
  store float %multiply.1444, ptr %86, align 4
  store float %multiply.1445, ptr %89, align 4
  store float %multiply.1446, ptr %92, align 4
  store float %multiply.1447, ptr %95, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn argmemonly
define void @loop_multiply_fusion_31(ptr noalias nocapture align 16 dereferenceable(2048) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture align 16 dereferenceable(2048) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg3, ptr noalias nocapture align 16 dereferenceable(2048) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg5, ptr noalias nocapture align 16 dereferenceable(2048) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg7, ptr noalias nocapture align 16 dereferenceable(2048) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg9, ptr noalias nocapture align 16 dereferenceable(2048) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg11, ptr noalias nocapture align 16 dereferenceable(2048) %arg12, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg13, ptr noalias nocapture align 16 dereferenceable(2048) %arg14, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg15, ptr noalias nocapture align 16 dereferenceable(2048) %arg16, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg17, ptr noalias nocapture align 16 dereferenceable(2048) %arg18, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg19, ptr noalias nocapture align 16 dereferenceable(2048) %arg20, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg21, ptr noalias nocapture align 16 dereferenceable(2048) %arg22, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg23) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !50
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr float, ptr %arg0, i64 %1
  %3 = load float, ptr %2, align 4
  %4 = load float, ptr %arg1, align 16, !invariant.load !47
  %multiply.1544 = fmul float %3, %4
  %5 = getelementptr float, ptr %arg2, i64 %1
  %6 = load float, ptr %5, align 4
  %7 = load float, ptr %arg3, align 16, !invariant.load !47
  %multiply.1545 = fmul float %6, %7
  %8 = getelementptr float, ptr %arg4, i64 %1
  %9 = load float, ptr %8, align 4
  %10 = load float, ptr %arg5, align 16, !invariant.load !47
  %multiply.1546 = fmul float %9, %10
  %11 = getelementptr float, ptr %arg6, i64 %1
  %12 = load float, ptr %11, align 4
  %13 = load float, ptr %arg7, align 16, !invariant.load !47
  %multiply.1547 = fmul float %12, %13
  %14 = getelementptr float, ptr %arg8, i64 %1
  %15 = load float, ptr %14, align 4
  %16 = load float, ptr %arg9, align 16, !invariant.load !47
  %multiply.1548 = fmul float %15, %16
  %17 = getelementptr float, ptr %arg10, i64 %1
  %18 = load float, ptr %17, align 4
  %19 = load float, ptr %arg11, align 16, !invariant.load !47
  %multiply.1549 = fmul float %18, %19
  %20 = getelementptr float, ptr %arg12, i64 %1
  %21 = load float, ptr %20, align 4
  %22 = load float, ptr %arg13, align 16, !invariant.load !47
  %multiply.1550 = fmul float %21, %22
  %23 = getelementptr float, ptr %arg14, i64 %1
  %24 = load float, ptr %23, align 4
  %25 = load float, ptr %arg15, align 16, !invariant.load !47
  %multiply.1551 = fmul float %24, %25
  %26 = getelementptr float, ptr %arg16, i64 %1
  %27 = load float, ptr %26, align 4
  %28 = load float, ptr %arg17, align 16, !invariant.load !47
  %multiply.1552 = fmul float %27, %28
  %29 = getelementptr float, ptr %arg18, i64 %1
  %30 = load float, ptr %29, align 4
  %31 = load float, ptr %arg19, align 16, !invariant.load !47
  %multiply.1553 = fmul float %30, %31
  %32 = getelementptr float, ptr %arg20, i64 %1
  %33 = load float, ptr %32, align 4
  %34 = load float, ptr %arg21, align 16, !invariant.load !47
  %multiply.1554 = fmul float %33, %34
  %35 = getelementptr float, ptr %arg22, i64 %1
  %36 = load float, ptr %35, align 4
  %37 = load float, ptr %arg23, align 16, !invariant.load !47
  %multiply.1555 = fmul float %36, %37
  store float %multiply.1544, ptr %2, align 4
  store float %multiply.1545, ptr %5, align 4
  store float %multiply.1546, ptr %8, align 4
  store float %multiply.1547, ptr %11, align 4
  store float %multiply.1548, ptr %14, align 4
  store float %multiply.1549, ptr %17, align 4
  store float %multiply.1550, ptr %20, align 4
  store float %multiply.1551, ptr %23, align 4
  store float %multiply.1552, ptr %26, align 4
  store float %multiply.1553, ptr %29, align 4
  store float %multiply.1554, ptr %32, align 4
  store float %multiply.1555, ptr %35, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn argmemonly
define void @loop_multiply_fusion_32(ptr noalias nocapture align 16 dereferenceable(1024) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture align 16 dereferenceable(1024) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg3, ptr noalias nocapture align 16 dereferenceable(1024) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg5, ptr noalias nocapture align 16 dereferenceable(1024) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg7, ptr noalias nocapture align 16 dereferenceable(1024) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg9, ptr noalias nocapture align 16 dereferenceable(1024) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg11, ptr noalias nocapture align 16 dereferenceable(1024) %arg12, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg13, ptr noalias nocapture align 16 dereferenceable(1024) %arg14, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg15, ptr noalias nocapture align 16 dereferenceable(1024) %arg16, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg17, ptr noalias nocapture align 16 dereferenceable(1024) %arg18, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg19, ptr noalias nocapture align 16 dereferenceable(1024) %arg20, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg21, ptr noalias nocapture align 16 dereferenceable(1024) %arg22, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg23, ptr noalias nocapture align 16 dereferenceable(1024) %arg24, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg25, ptr noalias nocapture align 16 dereferenceable(1024) %arg26, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg27, ptr noalias nocapture align 16 dereferenceable(1024) %arg28, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg29, ptr noalias nocapture align 16 dereferenceable(1024) %arg30, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg31, ptr noalias nocapture align 16 dereferenceable(1024) %arg32, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg33, ptr noalias nocapture align 16 dereferenceable(1024) %arg34, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg35, ptr noalias nocapture align 16 dereferenceable(1024) %arg36, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg37, ptr noalias nocapture align 16 dereferenceable(1024) %arg38, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg39, ptr noalias nocapture align 16 dereferenceable(1024) %arg40, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg41, ptr noalias nocapture align 16 dereferenceable(1024) %arg42, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg43, ptr noalias nocapture align 16 dereferenceable(1024) %arg44, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg45, ptr noalias nocapture align 16 dereferenceable(1024) %arg46, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg47, ptr noalias nocapture align 16 dereferenceable(1024) %arg48, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg49, ptr noalias nocapture align 16 dereferenceable(1024) %arg50, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg51, ptr noalias nocapture align 16 dereferenceable(1024) %arg52, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg53, ptr noalias nocapture align 16 dereferenceable(1024) %arg54, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg55, ptr noalias nocapture align 16 dereferenceable(1024) %arg56, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg57, ptr noalias nocapture align 16 dereferenceable(1024) %arg58, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg59, ptr noalias nocapture align 16 dereferenceable(1024) %arg60, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg61, ptr noalias nocapture align 16 dereferenceable(1024) %arg62, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg63) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !51
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr float, ptr %arg0, i64 %1
  %3 = load float, ptr %2, align 4
  %4 = load float, ptr %arg1, align 16, !invariant.load !47
  %multiply.1480 = fmul float %3, %4
  %5 = getelementptr float, ptr %arg2, i64 %1
  %6 = load float, ptr %5, align 4
  %7 = load float, ptr %arg3, align 16, !invariant.load !47
  %multiply.1481 = fmul float %6, %7
  %8 = getelementptr float, ptr %arg4, i64 %1
  %9 = load float, ptr %8, align 4
  %10 = load float, ptr %arg5, align 16, !invariant.load !47
  %multiply.1482 = fmul float %9, %10
  %11 = getelementptr float, ptr %arg6, i64 %1
  %12 = load float, ptr %11, align 4
  %13 = load float, ptr %arg7, align 16, !invariant.load !47
  %multiply.1483 = fmul float %12, %13
  %14 = getelementptr float, ptr %arg8, i64 %1
  %15 = load float, ptr %14, align 4
  %16 = load float, ptr %arg9, align 16, !invariant.load !47
  %multiply.1484 = fmul float %15, %16
  %17 = getelementptr float, ptr %arg10, i64 %1
  %18 = load float, ptr %17, align 4
  %19 = load float, ptr %arg11, align 16, !invariant.load !47
  %multiply.1485 = fmul float %18, %19
  %20 = getelementptr float, ptr %arg12, i64 %1
  %21 = load float, ptr %20, align 4
  %22 = load float, ptr %arg13, align 16, !invariant.load !47
  %multiply.1486 = fmul float %21, %22
  %23 = getelementptr float, ptr %arg14, i64 %1
  %24 = load float, ptr %23, align 4
  %25 = load float, ptr %arg15, align 16, !invariant.load !47
  %multiply.1487 = fmul float %24, %25
  %26 = getelementptr float, ptr %arg16, i64 %1
  %27 = load float, ptr %26, align 4
  %28 = load float, ptr %arg17, align 16, !invariant.load !47
  %multiply.1488 = fmul float %27, %28
  %29 = getelementptr float, ptr %arg18, i64 %1
  %30 = load float, ptr %29, align 4
  %31 = load float, ptr %arg19, align 16, !invariant.load !47
  %multiply.1489 = fmul float %30, %31
  %32 = getelementptr float, ptr %arg20, i64 %1
  %33 = load float, ptr %32, align 4
  %34 = load float, ptr %arg21, align 16, !invariant.load !47
  %multiply.1490 = fmul float %33, %34
  %35 = getelementptr float, ptr %arg22, i64 %1
  %36 = load float, ptr %35, align 4
  %37 = load float, ptr %arg23, align 16, !invariant.load !47
  %multiply.1491 = fmul float %36, %37
  %38 = getelementptr float, ptr %arg24, i64 %1
  %39 = load float, ptr %38, align 4
  %40 = load float, ptr %arg25, align 16, !invariant.load !47
  %multiply.1492 = fmul float %39, %40
  %41 = getelementptr float, ptr %arg26, i64 %1
  %42 = load float, ptr %41, align 4
  %43 = load float, ptr %arg27, align 16, !invariant.load !47
  %multiply.1493 = fmul float %42, %43
  %44 = getelementptr float, ptr %arg28, i64 %1
  %45 = load float, ptr %44, align 4
  %46 = load float, ptr %arg29, align 16, !invariant.load !47
  %multiply.1494 = fmul float %45, %46
  %47 = getelementptr float, ptr %arg30, i64 %1
  %48 = load float, ptr %47, align 4
  %49 = load float, ptr %arg31, align 16, !invariant.load !47
  %multiply.1495 = fmul float %48, %49
  %50 = getelementptr float, ptr %arg32, i64 %1
  %51 = load float, ptr %50, align 4
  %52 = load float, ptr %arg33, align 16, !invariant.load !47
  %multiply.1496 = fmul float %51, %52
  %53 = getelementptr float, ptr %arg34, i64 %1
  %54 = load float, ptr %53, align 4
  %55 = load float, ptr %arg35, align 16, !invariant.load !47
  %multiply.1497 = fmul float %54, %55
  %56 = getelementptr float, ptr %arg36, i64 %1
  %57 = load float, ptr %56, align 4
  %58 = load float, ptr %arg37, align 16, !invariant.load !47
  %multiply.1498 = fmul float %57, %58
  %59 = getelementptr float, ptr %arg38, i64 %1
  %60 = load float, ptr %59, align 4
  %61 = load float, ptr %arg39, align 16, !invariant.load !47
  %multiply.1499 = fmul float %60, %61
  %62 = getelementptr float, ptr %arg40, i64 %1
  %63 = load float, ptr %62, align 4
  %64 = load float, ptr %arg41, align 16, !invariant.load !47
  %multiply.1500 = fmul float %63, %64
  %65 = getelementptr float, ptr %arg42, i64 %1
  %66 = load float, ptr %65, align 4
  %67 = load float, ptr %arg43, align 16, !invariant.load !47
  %multiply.1501 = fmul float %66, %67
  %68 = getelementptr float, ptr %arg44, i64 %1
  %69 = load float, ptr %68, align 4
  %70 = load float, ptr %arg45, align 16, !invariant.load !47
  %multiply.1502 = fmul float %69, %70
  %71 = getelementptr float, ptr %arg46, i64 %1
  %72 = load float, ptr %71, align 4
  %73 = load float, ptr %arg47, align 16, !invariant.load !47
  %multiply.1503 = fmul float %72, %73
  %74 = getelementptr float, ptr %arg48, i64 %1
  %75 = load float, ptr %74, align 4
  %76 = load float, ptr %arg49, align 16, !invariant.load !47
  %multiply.1504 = fmul float %75, %76
  %77 = getelementptr float, ptr %arg50, i64 %1
  %78 = load float, ptr %77, align 4
  %79 = load float, ptr %arg51, align 16, !invariant.load !47
  %multiply.1505 = fmul float %78, %79
  %80 = getelementptr float, ptr %arg52, i64 %1
  %81 = load float, ptr %80, align 4
  %82 = load float, ptr %arg53, align 16, !invariant.load !47
  %multiply.1506 = fmul float %81, %82
  %83 = getelementptr float, ptr %arg54, i64 %1
  %84 = load float, ptr %83, align 4
  %85 = load float, ptr %arg55, align 16, !invariant.load !47
  %multiply.1507 = fmul float %84, %85
  %86 = getelementptr float, ptr %arg56, i64 %1
  %87 = load float, ptr %86, align 4
  %88 = load float, ptr %arg57, align 16, !invariant.load !47
  %multiply.1508 = fmul float %87, %88
  %89 = getelementptr float, ptr %arg58, i64 %1
  %90 = load float, ptr %89, align 4
  %91 = load float, ptr %arg59, align 16, !invariant.load !47
  %multiply.1509 = fmul float %90, %91
  %92 = getelementptr float, ptr %arg60, i64 %1
  %93 = load float, ptr %92, align 4
  %94 = load float, ptr %arg61, align 16, !invariant.load !47
  %multiply.1510 = fmul float %93, %94
  %95 = getelementptr float, ptr %arg62, i64 %1
  %96 = load float, ptr %95, align 4
  %97 = load float, ptr %arg63, align 16, !invariant.load !47
  %multiply.1511 = fmul float %96, %97
  store float %multiply.1480, ptr %2, align 4
  store float %multiply.1481, ptr %5, align 4
  store float %multiply.1482, ptr %8, align 4
  store float %multiply.1483, ptr %11, align 4
  store float %multiply.1484, ptr %14, align 4
  store float %multiply.1485, ptr %17, align 4
  store float %multiply.1486, ptr %20, align 4
  store float %multiply.1487, ptr %23, align 4
  store float %multiply.1488, ptr %26, align 4
  store float %multiply.1489, ptr %29, align 4
  store float %multiply.1490, ptr %32, align 4
  store float %multiply.1491, ptr %35, align 4
  store float %multiply.1492, ptr %38, align 4
  store float %multiply.1493, ptr %41, align 4
  store float %multiply.1494, ptr %44, align 4
  store float %multiply.1495, ptr %47, align 4
  store float %multiply.1496, ptr %50, align 4
  store float %multiply.1497, ptr %53, align 4
  store float %multiply.1498, ptr %56, align 4
  store float %multiply.1499, ptr %59, align 4
  store float %multiply.1500, ptr %62, align 4
  store float %multiply.1501, ptr %65, align 4
  store float %multiply.1502, ptr %68, align 4
  store float %multiply.1503, ptr %71, align 4
  store float %multiply.1504, ptr %74, align 4
  store float %multiply.1505, ptr %77, align 4
  store float %multiply.1506, ptr %80, align 4
  store float %multiply.1507, ptr %83, align 4
  store float %multiply.1508, ptr %86, align 4
  store float %multiply.1509, ptr %89, align 4
  store float %multiply.1510, ptr %92, align 4
  store float %multiply.1511, ptr %95, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn argmemonly
define void @loop_multiply_fusion_34(ptr noalias nocapture align 16 dereferenceable(2048) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture align 16 dereferenceable(2048) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg3, ptr noalias nocapture align 16 dereferenceable(2048) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg5, ptr noalias nocapture align 16 dereferenceable(2048) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg7, ptr noalias nocapture align 16 dereferenceable(2048) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg9, ptr noalias nocapture align 16 dereferenceable(2048) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg11, ptr noalias nocapture align 16 dereferenceable(2048) %arg12, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg13, ptr noalias nocapture align 16 dereferenceable(2048) %arg14, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg15, ptr noalias nocapture align 16 dereferenceable(2048) %arg16, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg17, ptr noalias nocapture align 16 dereferenceable(2048) %arg18, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg19, ptr noalias nocapture align 16 dereferenceable(2048) %arg20, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg21, ptr noalias nocapture align 16 dereferenceable(2048) %arg22, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg23, ptr noalias nocapture align 16 dereferenceable(2048) %arg24, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg25, ptr noalias nocapture align 16 dereferenceable(2048) %arg26, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg27, ptr noalias nocapture align 16 dereferenceable(2048) %arg28, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg29, ptr noalias nocapture align 16 dereferenceable(2048) %arg30, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg31, ptr noalias nocapture align 16 dereferenceable(2048) %arg32, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg33, ptr noalias nocapture align 16 dereferenceable(2048) %arg34, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg35, ptr noalias nocapture align 16 dereferenceable(2048) %arg36, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg37, ptr noalias nocapture align 16 dereferenceable(2048) %arg38, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg39, ptr noalias nocapture align 16 dereferenceable(2048) %arg40, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg41, ptr noalias nocapture align 16 dereferenceable(2048) %arg42, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg43, ptr noalias nocapture align 16 dereferenceable(2048) %arg44, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg45, ptr noalias nocapture align 16 dereferenceable(2048) %arg46, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg47, ptr noalias nocapture align 16 dereferenceable(2048) %arg48, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg49, ptr noalias nocapture align 16 dereferenceable(2048) %arg50, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg51, ptr noalias nocapture align 16 dereferenceable(2048) %arg52, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg53, ptr noalias nocapture align 16 dereferenceable(2048) %arg54, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg55, ptr noalias nocapture align 16 dereferenceable(2048) %arg56, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg57, ptr noalias nocapture align 16 dereferenceable(2048) %arg58, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg59, ptr noalias nocapture align 16 dereferenceable(2048) %arg60, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg61, ptr noalias nocapture align 16 dereferenceable(2048) %arg62, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg63) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !50
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr float, ptr %arg0, i64 %1
  %3 = load float, ptr %2, align 4
  %4 = load float, ptr %arg1, align 16, !invariant.load !47
  %multiply.1512 = fmul float %3, %4
  %5 = getelementptr float, ptr %arg2, i64 %1
  %6 = load float, ptr %5, align 4
  %7 = load float, ptr %arg3, align 16, !invariant.load !47
  %multiply.1513 = fmul float %6, %7
  %8 = getelementptr float, ptr %arg4, i64 %1
  %9 = load float, ptr %8, align 4
  %10 = load float, ptr %arg5, align 16, !invariant.load !47
  %multiply.1514 = fmul float %9, %10
  %11 = getelementptr float, ptr %arg6, i64 %1
  %12 = load float, ptr %11, align 4
  %13 = load float, ptr %arg7, align 16, !invariant.load !47
  %multiply.1515 = fmul float %12, %13
  %14 = getelementptr float, ptr %arg8, i64 %1
  %15 = load float, ptr %14, align 4
  %16 = load float, ptr %arg9, align 16, !invariant.load !47
  %multiply.1516 = fmul float %15, %16
  %17 = getelementptr float, ptr %arg10, i64 %1
  %18 = load float, ptr %17, align 4
  %19 = load float, ptr %arg11, align 16, !invariant.load !47
  %multiply.1517 = fmul float %18, %19
  %20 = getelementptr float, ptr %arg12, i64 %1
  %21 = load float, ptr %20, align 4
  %22 = load float, ptr %arg13, align 16, !invariant.load !47
  %multiply.1518 = fmul float %21, %22
  %23 = getelementptr float, ptr %arg14, i64 %1
  %24 = load float, ptr %23, align 4
  %25 = load float, ptr %arg15, align 16, !invariant.load !47
  %multiply.1519 = fmul float %24, %25
  %26 = getelementptr float, ptr %arg16, i64 %1
  %27 = load float, ptr %26, align 4
  %28 = load float, ptr %arg17, align 16, !invariant.load !47
  %multiply.1520 = fmul float %27, %28
  %29 = getelementptr float, ptr %arg18, i64 %1
  %30 = load float, ptr %29, align 4
  %31 = load float, ptr %arg19, align 16, !invariant.load !47
  %multiply.1521 = fmul float %30, %31
  %32 = getelementptr float, ptr %arg20, i64 %1
  %33 = load float, ptr %32, align 4
  %34 = load float, ptr %arg21, align 16, !invariant.load !47
  %multiply.1522 = fmul float %33, %34
  %35 = getelementptr float, ptr %arg22, i64 %1
  %36 = load float, ptr %35, align 4
  %37 = load float, ptr %arg23, align 16, !invariant.load !47
  %multiply.1523 = fmul float %36, %37
  %38 = getelementptr float, ptr %arg24, i64 %1
  %39 = load float, ptr %38, align 4
  %40 = load float, ptr %arg25, align 16, !invariant.load !47
  %multiply.1524 = fmul float %39, %40
  %41 = getelementptr float, ptr %arg26, i64 %1
  %42 = load float, ptr %41, align 4
  %43 = load float, ptr %arg27, align 16, !invariant.load !47
  %multiply.1525 = fmul float %42, %43
  %44 = getelementptr float, ptr %arg28, i64 %1
  %45 = load float, ptr %44, align 4
  %46 = load float, ptr %arg29, align 16, !invariant.load !47
  %multiply.1526 = fmul float %45, %46
  %47 = getelementptr float, ptr %arg30, i64 %1
  %48 = load float, ptr %47, align 4
  %49 = load float, ptr %arg31, align 16, !invariant.load !47
  %multiply.1527 = fmul float %48, %49
  %50 = getelementptr float, ptr %arg32, i64 %1
  %51 = load float, ptr %50, align 4
  %52 = load float, ptr %arg33, align 16, !invariant.load !47
  %multiply.1528 = fmul float %51, %52
  %53 = getelementptr float, ptr %arg34, i64 %1
  %54 = load float, ptr %53, align 4
  %55 = load float, ptr %arg35, align 16, !invariant.load !47
  %multiply.1529 = fmul float %54, %55
  %56 = getelementptr float, ptr %arg36, i64 %1
  %57 = load float, ptr %56, align 4
  %58 = load float, ptr %arg37, align 16, !invariant.load !47
  %multiply.1530 = fmul float %57, %58
  %59 = getelementptr float, ptr %arg38, i64 %1
  %60 = load float, ptr %59, align 4
  %61 = load float, ptr %arg39, align 16, !invariant.load !47
  %multiply.1531 = fmul float %60, %61
  %62 = getelementptr float, ptr %arg40, i64 %1
  %63 = load float, ptr %62, align 4
  %64 = load float, ptr %arg41, align 16, !invariant.load !47
  %multiply.1532 = fmul float %63, %64
  %65 = getelementptr float, ptr %arg42, i64 %1
  %66 = load float, ptr %65, align 4
  %67 = load float, ptr %arg43, align 16, !invariant.load !47
  %multiply.1533 = fmul float %66, %67
  %68 = getelementptr float, ptr %arg44, i64 %1
  %69 = load float, ptr %68, align 4
  %70 = load float, ptr %arg45, align 16, !invariant.load !47
  %multiply.1534 = fmul float %69, %70
  %71 = getelementptr float, ptr %arg46, i64 %1
  %72 = load float, ptr %71, align 4
  %73 = load float, ptr %arg47, align 16, !invariant.load !47
  %multiply.1535 = fmul float %72, %73
  %74 = getelementptr float, ptr %arg48, i64 %1
  %75 = load float, ptr %74, align 4
  %76 = load float, ptr %arg49, align 16, !invariant.load !47
  %multiply.1536 = fmul float %75, %76
  %77 = getelementptr float, ptr %arg50, i64 %1
  %78 = load float, ptr %77, align 4
  %79 = load float, ptr %arg51, align 16, !invariant.load !47
  %multiply.1537 = fmul float %78, %79
  %80 = getelementptr float, ptr %arg52, i64 %1
  %81 = load float, ptr %80, align 4
  %82 = load float, ptr %arg53, align 16, !invariant.load !47
  %multiply.1538 = fmul float %81, %82
  %83 = getelementptr float, ptr %arg54, i64 %1
  %84 = load float, ptr %83, align 4
  %85 = load float, ptr %arg55, align 16, !invariant.load !47
  %multiply.1539 = fmul float %84, %85
  %86 = getelementptr float, ptr %arg56, i64 %1
  %87 = load float, ptr %86, align 4
  %88 = load float, ptr %arg57, align 16, !invariant.load !47
  %multiply.1540 = fmul float %87, %88
  %89 = getelementptr float, ptr %arg58, i64 %1
  %90 = load float, ptr %89, align 4
  %91 = load float, ptr %arg59, align 16, !invariant.load !47
  %multiply.1541 = fmul float %90, %91
  %92 = getelementptr float, ptr %arg60, i64 %1
  %93 = load float, ptr %92, align 4
  %94 = load float, ptr %arg61, align 16, !invariant.load !47
  %multiply.1542 = fmul float %93, %94
  %95 = getelementptr float, ptr %arg62, i64 %1
  %96 = load float, ptr %95, align 4
  %97 = load float, ptr %arg63, align 16, !invariant.load !47
  %multiply.1543 = fmul float %96, %97
  store float %multiply.1512, ptr %2, align 4
  store float %multiply.1513, ptr %5, align 4
  store float %multiply.1514, ptr %8, align 4
  store float %multiply.1515, ptr %11, align 4
  store float %multiply.1516, ptr %14, align 4
  store float %multiply.1517, ptr %17, align 4
  store float %multiply.1518, ptr %20, align 4
  store float %multiply.1519, ptr %23, align 4
  store float %multiply.1520, ptr %26, align 4
  store float %multiply.1521, ptr %29, align 4
  store float %multiply.1522, ptr %32, align 4
  store float %multiply.1523, ptr %35, align 4
  store float %multiply.1524, ptr %38, align 4
  store float %multiply.1525, ptr %41, align 4
  store float %multiply.1526, ptr %44, align 4
  store float %multiply.1527, ptr %47, align 4
  store float %multiply.1528, ptr %50, align 4
  store float %multiply.1529, ptr %53, align 4
  store float %multiply.1530, ptr %56, align 4
  store float %multiply.1531, ptr %59, align 4
  store float %multiply.1532, ptr %62, align 4
  store float %multiply.1533, ptr %65, align 4
  store float %multiply.1534, ptr %68, align 4
  store float %multiply.1535, ptr %71, align 4
  store float %multiply.1536, ptr %74, align 4
  store float %multiply.1537, ptr %77, align 4
  store float %multiply.1538, ptr %80, align 4
  store float %multiply.1539, ptr %83, align 4
  store float %multiply.1540, ptr %86, align 4
  store float %multiply.1541, ptr %89, align 4
  store float %multiply.1542, ptr %92, align 4
  store float %multiply.1543, ptr %95, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn argmemonly
define void @loop_multiply_fusion_35(ptr noalias nocapture align 16 dereferenceable(4096) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture align 16 dereferenceable(4096) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg3, ptr noalias nocapture align 16 dereferenceable(4096) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg5, ptr noalias nocapture align 16 dereferenceable(4096) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg7, ptr noalias nocapture align 16 dereferenceable(4096) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg9, ptr noalias nocapture align 16 dereferenceable(4096) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg11, ptr noalias nocapture align 16 dereferenceable(4096) %arg12, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg13, ptr noalias nocapture align 16 dereferenceable(4096) %arg14, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg15, ptr noalias nocapture align 16 dereferenceable(4096) %arg16, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg17, ptr noalias nocapture align 16 dereferenceable(4096) %arg18, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg19, ptr noalias nocapture align 16 dereferenceable(4096) %arg20, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg21, ptr noalias nocapture align 16 dereferenceable(4096) %arg22, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg23, ptr noalias nocapture align 16 dereferenceable(4096) %arg24, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg25, ptr noalias nocapture align 16 dereferenceable(4096) %arg26, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg27, ptr noalias nocapture align 16 dereferenceable(4096) %arg28, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg29, ptr noalias nocapture align 16 dereferenceable(4096) %arg30, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg31, ptr noalias nocapture align 16 dereferenceable(4096) %arg32, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg33, ptr noalias nocapture align 16 dereferenceable(4096) %arg34, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg35, ptr noalias nocapture align 16 dereferenceable(4096) %arg36, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg37, ptr noalias nocapture align 16 dereferenceable(4096) %arg38, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg39, ptr noalias nocapture align 16 dereferenceable(4096) %arg40, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg41, ptr noalias nocapture align 16 dereferenceable(4096) %arg42, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg43, ptr noalias nocapture align 16 dereferenceable(4096) %arg44, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg45, ptr noalias nocapture align 16 dereferenceable(4096) %arg46, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg47, ptr noalias nocapture align 16 dereferenceable(4096) %arg48, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg49, ptr noalias nocapture align 16 dereferenceable(4096) %arg50, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg51, ptr noalias nocapture align 16 dereferenceable(4096) %arg52, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg53, ptr noalias nocapture align 16 dereferenceable(4096) %arg54, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg55) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !52
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr float, ptr %arg0, i64 %1
  %3 = load float, ptr %2, align 4
  %4 = load float, ptr %arg1, align 16, !invariant.load !47
  %multiply.1556 = fmul float %3, %4
  %5 = getelementptr float, ptr %arg2, i64 %1
  %6 = load float, ptr %5, align 4
  %7 = load float, ptr %arg3, align 16, !invariant.load !47
  %multiply.1557 = fmul float %6, %7
  %8 = getelementptr float, ptr %arg4, i64 %1
  %9 = load float, ptr %8, align 4
  %10 = load float, ptr %arg5, align 16, !invariant.load !47
  %multiply.1558 = fmul float %9, %10
  %11 = getelementptr float, ptr %arg6, i64 %1
  %12 = load float, ptr %11, align 4
  %13 = load float, ptr %arg7, align 16, !invariant.load !47
  %multiply.1559 = fmul float %12, %13
  %14 = getelementptr float, ptr %arg8, i64 %1
  %15 = load float, ptr %14, align 4
  %16 = load float, ptr %arg9, align 16, !invariant.load !47
  %multiply.1560 = fmul float %15, %16
  %17 = getelementptr float, ptr %arg10, i64 %1
  %18 = load float, ptr %17, align 4
  %19 = load float, ptr %arg11, align 16, !invariant.load !47
  %multiply.1561 = fmul float %18, %19
  %20 = getelementptr float, ptr %arg12, i64 %1
  %21 = load float, ptr %20, align 4
  %22 = load float, ptr %arg13, align 16, !invariant.load !47
  %multiply.1562 = fmul float %21, %22
  %23 = getelementptr float, ptr %arg14, i64 %1
  %24 = load float, ptr %23, align 4
  %25 = load float, ptr %arg15, align 16, !invariant.load !47
  %multiply.1563 = fmul float %24, %25
  %26 = getelementptr float, ptr %arg16, i64 %1
  %27 = load float, ptr %26, align 4
  %28 = load float, ptr %arg17, align 16, !invariant.load !47
  %multiply.1564 = fmul float %27, %28
  %29 = getelementptr float, ptr %arg18, i64 %1
  %30 = load float, ptr %29, align 4
  %31 = load float, ptr %arg19, align 16, !invariant.load !47
  %multiply.1565 = fmul float %30, %31
  %32 = getelementptr float, ptr %arg20, i64 %1
  %33 = load float, ptr %32, align 4
  %34 = load float, ptr %arg21, align 16, !invariant.load !47
  %multiply.1566 = fmul float %33, %34
  %35 = getelementptr float, ptr %arg22, i64 %1
  %36 = load float, ptr %35, align 4
  %37 = load float, ptr %arg23, align 16, !invariant.load !47
  %multiply.1567 = fmul float %36, %37
  %38 = getelementptr float, ptr %arg24, i64 %1
  %39 = load float, ptr %38, align 4
  %40 = load float, ptr %arg25, align 16, !invariant.load !47
  %multiply.1568 = fmul float %39, %40
  %41 = getelementptr float, ptr %arg26, i64 %1
  %42 = load float, ptr %41, align 4
  %43 = load float, ptr %arg27, align 16, !invariant.load !47
  %multiply.1569 = fmul float %42, %43
  %44 = getelementptr float, ptr %arg28, i64 %1
  %45 = load float, ptr %44, align 4
  %46 = load float, ptr %arg29, align 16, !invariant.load !47
  %multiply.1570 = fmul float %45, %46
  %47 = getelementptr float, ptr %arg30, i64 %1
  %48 = load float, ptr %47, align 4
  %49 = load float, ptr %arg31, align 16, !invariant.load !47
  %multiply.1571 = fmul float %48, %49
  %50 = getelementptr float, ptr %arg32, i64 %1
  %51 = load float, ptr %50, align 4
  %52 = load float, ptr %arg33, align 16, !invariant.load !47
  %multiply.1572 = fmul float %51, %52
  %53 = getelementptr float, ptr %arg34, i64 %1
  %54 = load float, ptr %53, align 4
  %55 = load float, ptr %arg35, align 16, !invariant.load !47
  %multiply.1573 = fmul float %54, %55
  %56 = getelementptr float, ptr %arg36, i64 %1
  %57 = load float, ptr %56, align 4
  %58 = load float, ptr %arg37, align 16, !invariant.load !47
  %multiply.1574 = fmul float %57, %58
  %59 = getelementptr float, ptr %arg38, i64 %1
  %60 = load float, ptr %59, align 4
  %61 = load float, ptr %arg39, align 16, !invariant.load !47
  %multiply.1575 = fmul float %60, %61
  %62 = getelementptr float, ptr %arg40, i64 %1
  %63 = load float, ptr %62, align 4
  %64 = load float, ptr %arg41, align 16, !invariant.load !47
  %multiply.1576 = fmul float %63, %64
  %65 = getelementptr float, ptr %arg42, i64 %1
  %66 = load float, ptr %65, align 4
  %67 = load float, ptr %arg43, align 16, !invariant.load !47
  %multiply.1577 = fmul float %66, %67
  %68 = getelementptr float, ptr %arg44, i64 %1
  %69 = load float, ptr %68, align 4
  %70 = load float, ptr %arg45, align 16, !invariant.load !47
  %multiply.1578 = fmul float %69, %70
  %71 = getelementptr float, ptr %arg46, i64 %1
  %72 = load float, ptr %71, align 4
  %73 = load float, ptr %arg47, align 16, !invariant.load !47
  %multiply.1579 = fmul float %72, %73
  %74 = getelementptr float, ptr %arg48, i64 %1
  %75 = load float, ptr %74, align 4
  %76 = load float, ptr %arg49, align 16, !invariant.load !47
  %multiply.1580 = fmul float %75, %76
  %77 = getelementptr float, ptr %arg50, i64 %1
  %78 = load float, ptr %77, align 4
  %79 = load float, ptr %arg51, align 16, !invariant.load !47
  %multiply.1581 = fmul float %78, %79
  %80 = getelementptr float, ptr %arg52, i64 %1
  %81 = load float, ptr %80, align 4
  %82 = load float, ptr %arg53, align 16, !invariant.load !47
  %multiply.1582 = fmul float %81, %82
  %83 = getelementptr float, ptr %arg54, i64 %1
  %84 = load float, ptr %83, align 4
  %85 = load float, ptr %arg55, align 16, !invariant.load !47
  %multiply.1583 = fmul float %84, %85
  store float %multiply.1556, ptr %2, align 4
  store float %multiply.1557, ptr %5, align 4
  store float %multiply.1558, ptr %8, align 4
  store float %multiply.1559, ptr %11, align 4
  store float %multiply.1560, ptr %14, align 4
  store float %multiply.1561, ptr %17, align 4
  store float %multiply.1562, ptr %20, align 4
  store float %multiply.1563, ptr %23, align 4
  store float %multiply.1564, ptr %26, align 4
  store float %multiply.1565, ptr %29, align 4
  store float %multiply.1566, ptr %32, align 4
  store float %multiply.1567, ptr %35, align 4
  store float %multiply.1568, ptr %38, align 4
  store float %multiply.1569, ptr %41, align 4
  store float %multiply.1570, ptr %44, align 4
  store float %multiply.1571, ptr %47, align 4
  store float %multiply.1572, ptr %50, align 4
  store float %multiply.1573, ptr %53, align 4
  store float %multiply.1574, ptr %56, align 4
  store float %multiply.1575, ptr %59, align 4
  store float %multiply.1576, ptr %62, align 4
  store float %multiply.1577, ptr %65, align 4
  store float %multiply.1578, ptr %68, align 4
  store float %multiply.1579, ptr %71, align 4
  store float %multiply.1580, ptr %74, align 4
  store float %multiply.1581, ptr %77, align 4
  store float %multiply.1582, ptr %80, align 4
  store float %multiply.1583, ptr %83, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn argmemonly
define void @loop_multiply_fusion_36(ptr noalias nocapture align 16 dereferenceable(8192) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture align 16 dereferenceable(8192) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg3, ptr noalias nocapture align 16 dereferenceable(8192) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg5, ptr noalias nocapture align 16 dereferenceable(8192) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg7, ptr noalias nocapture align 16 dereferenceable(8192) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg9, ptr noalias nocapture align 16 dereferenceable(8192) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg11, ptr noalias nocapture align 16 dereferenceable(8192) %arg12, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg13, ptr noalias nocapture align 16 dereferenceable(8192) %arg14, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg15, ptr noalias nocapture align 16 dereferenceable(8192) %arg16, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg17, ptr noalias nocapture align 16 dereferenceable(8192) %arg18, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg19, ptr noalias nocapture align 16 dereferenceable(8192) %arg20, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg21, ptr noalias nocapture align 16 dereferenceable(8192) %arg22, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg23, ptr noalias nocapture align 16 dereferenceable(8192) %arg24, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg25, ptr noalias nocapture align 16 dereferenceable(8192) %arg26, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg27, ptr noalias nocapture align 16 dereferenceable(8192) %arg28, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg29, ptr noalias nocapture align 16 dereferenceable(8192) %arg30, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg31) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !53
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !52
  %linear_index = or disjoint i32 %1, %2
  %3 = zext nneg i32 %linear_index to i64
  %4 = getelementptr float, ptr %arg0, i64 %3
  %5 = load float, ptr %4, align 4
  %6 = load float, ptr %arg1, align 16, !invariant.load !47
  %multiply.1584 = fmul float %5, %6
  %7 = getelementptr float, ptr %arg2, i64 %3
  %8 = load float, ptr %7, align 4
  %9 = load float, ptr %arg3, align 16, !invariant.load !47
  %multiply.1585 = fmul float %8, %9
  %10 = getelementptr float, ptr %arg4, i64 %3
  %11 = load float, ptr %10, align 4
  %12 = load float, ptr %arg5, align 16, !invariant.load !47
  %multiply.1586 = fmul float %11, %12
  %13 = getelementptr float, ptr %arg6, i64 %3
  %14 = load float, ptr %13, align 4
  %15 = load float, ptr %arg7, align 16, !invariant.load !47
  %multiply.1587 = fmul float %14, %15
  %16 = getelementptr float, ptr %arg8, i64 %3
  %17 = load float, ptr %16, align 4
  %18 = load float, ptr %arg9, align 16, !invariant.load !47
  %multiply.1588 = fmul float %17, %18
  %19 = getelementptr float, ptr %arg10, i64 %3
  %20 = load float, ptr %19, align 4
  %21 = load float, ptr %arg11, align 16, !invariant.load !47
  %multiply.1589 = fmul float %20, %21
  %22 = getelementptr float, ptr %arg12, i64 %3
  %23 = load float, ptr %22, align 4
  %24 = load float, ptr %arg13, align 16, !invariant.load !47
  %multiply.1590 = fmul float %23, %24
  %25 = getelementptr float, ptr %arg14, i64 %3
  %26 = load float, ptr %25, align 4
  %27 = load float, ptr %arg15, align 16, !invariant.load !47
  %multiply.1591 = fmul float %26, %27
  %28 = getelementptr float, ptr %arg16, i64 %3
  %29 = load float, ptr %28, align 4
  %30 = load float, ptr %arg17, align 16, !invariant.load !47
  %multiply.1592 = fmul float %29, %30
  %31 = getelementptr float, ptr %arg18, i64 %3
  %32 = load float, ptr %31, align 4
  %33 = load float, ptr %arg19, align 16, !invariant.load !47
  %multiply.1593 = fmul float %32, %33
  %34 = getelementptr float, ptr %arg20, i64 %3
  %35 = load float, ptr %34, align 4
  %36 = load float, ptr %arg21, align 16, !invariant.load !47
  %multiply.1594 = fmul float %35, %36
  %37 = getelementptr float, ptr %arg22, i64 %3
  %38 = load float, ptr %37, align 4
  %39 = load float, ptr %arg23, align 16, !invariant.load !47
  %multiply.1595 = fmul float %38, %39
  %40 = getelementptr float, ptr %arg24, i64 %3
  %41 = load float, ptr %40, align 4
  %42 = load float, ptr %arg25, align 16, !invariant.load !47
  %multiply.1596 = fmul float %41, %42
  %43 = getelementptr float, ptr %arg26, i64 %3
  %44 = load float, ptr %43, align 4
  %45 = load float, ptr %arg27, align 16, !invariant.load !47
  %multiply.1597 = fmul float %44, %45
  %46 = getelementptr float, ptr %arg28, i64 %3
  %47 = load float, ptr %46, align 4
  %48 = load float, ptr %arg29, align 16, !invariant.load !47
  %multiply.1598 = fmul float %47, %48
  %49 = getelementptr float, ptr %arg30, i64 %3
  %50 = load float, ptr %49, align 4
  %51 = load float, ptr %arg31, align 16, !invariant.load !47
  %multiply.1599 = fmul float %50, %51
  store float %multiply.1584, ptr %4, align 4
  store float %multiply.1585, ptr %7, align 4
  store float %multiply.1586, ptr %10, align 4
  store float %multiply.1587, ptr %13, align 4
  store float %multiply.1588, ptr %16, align 4
  store float %multiply.1589, ptr %19, align 4
  store float %multiply.1590, ptr %22, align 4
  store float %multiply.1591, ptr %25, align 4
  store float %multiply.1592, ptr %28, align 4
  store float %multiply.1593, ptr %31, align 4
  store float %multiply.1594, ptr %34, align 4
  store float %multiply.1595, ptr %37, align 4
  store float %multiply.1596, ptr %40, align 4
  store float %multiply.1597, ptr %43, align 4
  store float %multiply.1598, ptr %46, align 4
  store float %multiply.1599, ptr %49, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn argmemonly
define void @copy_fusion_4(ptr noalias nocapture align 16 dereferenceable(65536) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture align 16 dereferenceable(65536) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg3, ptr noalias nocapture align 16 dereferenceable(65536) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg5, ptr noalias nocapture align 16 dereferenceable(65536) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg7) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !54
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !52
  %linear_index = or disjoint i32 %1, %2
  %3 = zext nneg i32 %linear_index to i64
  %4 = getelementptr float, ptr %arg0, i64 %3
  %5 = load float, ptr %4, align 4
  %6 = load float, ptr %arg1, align 16, !invariant.load !47
  %multiply.1646 = fmul float %5, %6
  %7 = getelementptr float, ptr %arg2, i64 %3
  %8 = load float, ptr %7, align 4
  %9 = load float, ptr %arg3, align 16, !invariant.load !47
  %multiply.1647 = fmul float %8, %9
  %10 = getelementptr float, ptr %arg4, i64 %3
  %11 = load float, ptr %10, align 4
  %12 = load float, ptr %arg5, align 16, !invariant.load !47
  %multiply.1648 = fmul float %11, %12
  %13 = getelementptr float, ptr %arg6, i64 %3
  %14 = load float, ptr %13, align 4
  %15 = load float, ptr %arg7, align 16, !invariant.load !47
  %multiply.1649 = fmul float %14, %15
  store float %multiply.1646, ptr %4, align 4
  store float %multiply.1647, ptr %7, align 4
  store float %multiply.1648, ptr %10, align 4
  store float %multiply.1649, ptr %13, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn argmemonly
define void @loop_multiply_fusion_37(ptr noalias nocapture align 16 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture align 16 dereferenceable(147456) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg3, ptr noalias nocapture align 16 dereferenceable(147456) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg5) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !55
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !52
  %linear_index = or disjoint i32 %1, %2
  %3 = zext nneg i32 %linear_index to i64
  %4 = getelementptr float, ptr %arg0, i64 %3
  %5 = load float, ptr %4, align 4
  %6 = load float, ptr %arg1, align 16, !invariant.load !47
  %multiply.1604 = fmul float %5, %6
  %7 = getelementptr float, ptr %arg2, i64 %3
  %8 = load float, ptr %7, align 4
  %9 = load float, ptr %arg3, align 16, !invariant.load !47
  %multiply.1605 = fmul float %8, %9
  %10 = getelementptr float, ptr %arg4, i64 %3
  %11 = load float, ptr %10, align 4
  %12 = load float, ptr %arg5, align 16, !invariant.load !47
  %multiply.1606 = fmul float %11, %12
  store float %multiply.1604, ptr %4, align 4
  store float %multiply.1605, ptr %7, align 4
  store float %multiply.1606, ptr %10, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn argmemonly
define void @loop_multiply_fusion_38(ptr noalias nocapture align 16 dereferenceable(2097152) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !51
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !50
  %2 = shl nuw nsw i32 %1, 10
  %3 = shl nuw nsw i32 %0, 2
  %linear_index_base = or disjoint i32 %2, %3
  %4 = zext nneg i32 %linear_index_base to i64
  %5 = getelementptr float, ptr %arg0, i64 %4
  %6 = load float, ptr %5, align 16
  %7 = load float, ptr %arg1, align 16, !invariant.load !47
  %multiply.1258 = fmul float %6, %7
  store float %multiply.1258, ptr %5, align 16
  %8 = getelementptr inbounds i8, ptr %5, i64 4
  %9 = load float, ptr %8, align 4
  %multiply.12581 = fmul float %7, %9
  store float %multiply.12581, ptr %8, align 4
  %10 = getelementptr inbounds i8, ptr %5, i64 8
  %11 = load float, ptr %10, align 8
  %multiply.12582 = fmul float %7, %11
  store float %multiply.12582, ptr %10, align 8
  %12 = getelementptr inbounds i8, ptr %5, i64 12
  %13 = load float, ptr %12, align 4
  %multiply.12583 = fmul float %7, %13
  store float %multiply.12583, ptr %12, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn argmemonly
define void @loop_multiply_fusion_39(ptr noalias nocapture align 16 dereferenceable(2097152) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !51
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !50
  %2 = shl nuw nsw i32 %1, 10
  %3 = shl nuw nsw i32 %0, 2
  %linear_index_base = or disjoint i32 %2, %3
  %4 = zext nneg i32 %linear_index_base to i64
  %5 = getelementptr float, ptr %arg0, i64 %4
  %6 = load float, ptr %5, align 16
  %7 = load float, ptr %arg1, align 16, !invariant.load !47
  %multiply.1306 = fmul float %6, %7
  store float %multiply.1306, ptr %5, align 16
  %8 = getelementptr inbounds i8, ptr %5, i64 4
  %9 = load float, ptr %8, align 4
  %multiply.13061 = fmul float %7, %9
  store float %multiply.13061, ptr %8, align 4
  %10 = getelementptr inbounds i8, ptr %5, i64 8
  %11 = load float, ptr %10, align 8
  %multiply.13062 = fmul float %7, %11
  store float %multiply.13062, ptr %10, align 8
  %12 = getelementptr inbounds i8, ptr %5, i64 12
  %13 = load float, ptr %12, align 4
  %multiply.13063 = fmul float %7, %13
  store float %multiply.13063, ptr %12, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn argmemonly
define void @loop_multiply_fusion_40(ptr noalias nocapture align 16 dereferenceable(589824) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture align 16 dereferenceable(589824) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg3, ptr noalias nocapture align 16 dereferenceable(589824) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg5, ptr noalias nocapture align 16 dereferenceable(589824) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg7) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !51
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !56
  %2 = shl nuw nsw i32 %1, 10
  %3 = shl nuw nsw i32 %0, 2
  %linear_index_base = or disjoint i32 %2, %3
  %4 = zext nneg i32 %linear_index_base to i64
  %5 = getelementptr float, ptr %arg0, i64 %4
  %6 = load float, ptr %5, align 16
  %7 = load float, ptr %arg1, align 16, !invariant.load !47
  %multiply.1611 = fmul float %6, %7
  %8 = getelementptr float, ptr %arg2, i64 %4
  %9 = load float, ptr %8, align 16
  %10 = load float, ptr %arg3, align 16, !invariant.load !47
  %multiply.1612 = fmul float %9, %10
  %11 = getelementptr float, ptr %arg4, i64 %4
  %12 = load float, ptr %11, align 16
  %13 = load float, ptr %arg5, align 16, !invariant.load !47
  %multiply.1613 = fmul float %12, %13
  %14 = getelementptr float, ptr %arg6, i64 %4
  %15 = load float, ptr %14, align 16
  %16 = load float, ptr %arg7, align 16, !invariant.load !47
  %multiply.1614 = fmul float %15, %16
  store float %multiply.1611, ptr %5, align 16
  store float %multiply.1612, ptr %8, align 16
  store float %multiply.1613, ptr %11, align 16
  store float %multiply.1614, ptr %14, align 16
  %17 = getelementptr inbounds i8, ptr %5, i64 4
  %18 = load float, ptr %17, align 4
  %multiply.16111 = fmul float %7, %18
  %19 = getelementptr inbounds i8, ptr %8, i64 4
  %20 = load float, ptr %19, align 4
  %multiply.16122 = fmul float %10, %20
  %21 = getelementptr inbounds i8, ptr %11, i64 4
  %22 = load float, ptr %21, align 4
  %multiply.16133 = fmul float %13, %22
  %23 = getelementptr inbounds i8, ptr %14, i64 4
  %24 = load float, ptr %23, align 4
  %multiply.16144 = fmul float %16, %24
  store float %multiply.16111, ptr %17, align 4
  store float %multiply.16122, ptr %19, align 4
  store float %multiply.16133, ptr %21, align 4
  store float %multiply.16144, ptr %23, align 4
  %25 = getelementptr inbounds i8, ptr %5, i64 8
  %26 = load float, ptr %25, align 8
  %multiply.16115 = fmul float %7, %26
  %27 = getelementptr inbounds i8, ptr %8, i64 8
  %28 = load float, ptr %27, align 8
  %multiply.16126 = fmul float %10, %28
  %29 = getelementptr inbounds i8, ptr %11, i64 8
  %30 = load float, ptr %29, align 8
  %multiply.16137 = fmul float %13, %30
  %31 = getelementptr inbounds i8, ptr %14, i64 8
  %32 = load float, ptr %31, align 8
  %multiply.16148 = fmul float %16, %32
  store float %multiply.16115, ptr %25, align 8
  store float %multiply.16126, ptr %27, align 8
  store float %multiply.16137, ptr %29, align 8
  store float %multiply.16148, ptr %31, align 8
  %33 = getelementptr inbounds i8, ptr %5, i64 12
  %34 = load float, ptr %33, align 4
  %multiply.16119 = fmul float %7, %34
  %35 = getelementptr inbounds i8, ptr %8, i64 12
  %36 = load float, ptr %35, align 4
  %multiply.161210 = fmul float %10, %36
  %37 = getelementptr inbounds i8, ptr %11, i64 12
  %38 = load float, ptr %37, align 4
  %multiply.161311 = fmul float %13, %38
  %39 = getelementptr inbounds i8, ptr %14, i64 12
  %40 = load float, ptr %39, align 4
  %multiply.161412 = fmul float %16, %40
  store float %multiply.16119, ptr %33, align 4
  store float %multiply.161210, ptr %35, align 4
  store float %multiply.161311, ptr %37, align 4
  store float %multiply.161412, ptr %39, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn argmemonly
define void @loop_multiply_fusion_41(ptr noalias nocapture align 16 dereferenceable(4194304) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !51
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !52
  %2 = shl nuw nsw i32 %1, 10
  %3 = shl nuw nsw i32 %0, 2
  %linear_index_base = or disjoint i32 %2, %3
  %4 = zext nneg i32 %linear_index_base to i64
  %5 = getelementptr float, ptr %arg0, i64 %4
  %6 = load float, ptr %5, align 16
  %7 = load float, ptr %arg1, align 16, !invariant.load !47
  %multiply.1231 = fmul float %6, %7
  store float %multiply.1231, ptr %5, align 16
  %8 = getelementptr inbounds i8, ptr %5, i64 4
  %9 = load float, ptr %8, align 4
  %multiply.12311 = fmul float %7, %9
  store float %multiply.12311, ptr %8, align 4
  %10 = getelementptr inbounds i8, ptr %5, i64 8
  %11 = load float, ptr %10, align 8
  %multiply.12312 = fmul float %7, %11
  store float %multiply.12312, ptr %10, align 8
  %12 = getelementptr inbounds i8, ptr %5, i64 12
  %13 = load float, ptr %12, align 4
  %multiply.12313 = fmul float %7, %13
  store float %multiply.12313, ptr %12, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn argmemonly
define void @loop_multiply_fusion_42(ptr noalias nocapture align 16 dereferenceable(4194304) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !51
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !52
  %2 = shl nuw nsw i32 %1, 10
  %3 = shl nuw nsw i32 %0, 2
  %linear_index_base = or disjoint i32 %2, %3
  %4 = zext nneg i32 %linear_index_base to i64
  %5 = getelementptr float, ptr %arg0, i64 %4
  %6 = load float, ptr %5, align 16
  %7 = load float, ptr %arg1, align 16, !invariant.load !47
  %multiply.1237 = fmul float %6, %7
  store float %multiply.1237, ptr %5, align 16
  %8 = getelementptr inbounds i8, ptr %5, i64 4
  %9 = load float, ptr %8, align 4
  %multiply.12371 = fmul float %7, %9
  store float %multiply.12371, ptr %8, align 4
  %10 = getelementptr inbounds i8, ptr %5, i64 8
  %11 = load float, ptr %10, align 8
  %multiply.12372 = fmul float %7, %11
  store float %multiply.12372, ptr %10, align 8
  %12 = getelementptr inbounds i8, ptr %5, i64 12
  %13 = load float, ptr %12, align 4
  %multiply.12373 = fmul float %7, %13
  store float %multiply.12373, ptr %12, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn argmemonly
define void @copy_fusion_5(ptr noalias nocapture align 16 dereferenceable(1048576) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture align 16 dereferenceable(1048576) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg3, ptr noalias nocapture align 16 dereferenceable(1048576) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg5, ptr noalias nocapture align 16 dereferenceable(1048576) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg7) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !51
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !51
  %2 = shl nuw nsw i32 %1, 10
  %3 = shl nuw nsw i32 %0, 2
  %linear_index_base = or disjoint i32 %2, %3
  %4 = zext nneg i32 %linear_index_base to i64
  %5 = getelementptr float, ptr %arg0, i64 %4
  %6 = load float, ptr %5, align 16
  %7 = load float, ptr %arg1, align 16, !invariant.load !47
  %multiply.1650 = fmul float %6, %7
  %8 = getelementptr float, ptr %arg2, i64 %4
  %9 = load float, ptr %8, align 16
  %10 = load float, ptr %arg3, align 16, !invariant.load !47
  %multiply.1651 = fmul float %9, %10
  %11 = getelementptr float, ptr %arg4, i64 %4
  %12 = load float, ptr %11, align 16
  %13 = load float, ptr %arg5, align 16, !invariant.load !47
  %multiply.1652 = fmul float %12, %13
  %14 = getelementptr float, ptr %arg6, i64 %4
  %15 = load float, ptr %14, align 16
  %16 = load float, ptr %arg7, align 16, !invariant.load !47
  %multiply.1653 = fmul float %15, %16
  store float %multiply.1650, ptr %5, align 16
  store float %multiply.1651, ptr %8, align 16
  store float %multiply.1652, ptr %11, align 16
  store float %multiply.1653, ptr %14, align 16
  %17 = getelementptr inbounds i8, ptr %5, i64 4
  %18 = load float, ptr %17, align 4
  %multiply.16501 = fmul float %7, %18
  %19 = getelementptr inbounds i8, ptr %8, i64 4
  %20 = load float, ptr %19, align 4
  %multiply.16512 = fmul float %10, %20
  %21 = getelementptr inbounds i8, ptr %11, i64 4
  %22 = load float, ptr %21, align 4
  %multiply.16523 = fmul float %13, %22
  %23 = getelementptr inbounds i8, ptr %14, i64 4
  %24 = load float, ptr %23, align 4
  %multiply.16534 = fmul float %16, %24
  store float %multiply.16501, ptr %17, align 4
  store float %multiply.16512, ptr %19, align 4
  store float %multiply.16523, ptr %21, align 4
  store float %multiply.16534, ptr %23, align 4
  %25 = getelementptr inbounds i8, ptr %5, i64 8
  %26 = load float, ptr %25, align 8
  %multiply.16505 = fmul float %7, %26
  %27 = getelementptr inbounds i8, ptr %8, i64 8
  %28 = load float, ptr %27, align 8
  %multiply.16516 = fmul float %10, %28
  %29 = getelementptr inbounds i8, ptr %11, i64 8
  %30 = load float, ptr %29, align 8
  %multiply.16527 = fmul float %13, %30
  %31 = getelementptr inbounds i8, ptr %14, i64 8
  %32 = load float, ptr %31, align 8
  %multiply.16538 = fmul float %16, %32
  store float %multiply.16505, ptr %25, align 8
  store float %multiply.16516, ptr %27, align 8
  store float %multiply.16527, ptr %29, align 8
  store float %multiply.16538, ptr %31, align 8
  %33 = getelementptr inbounds i8, ptr %5, i64 12
  %34 = load float, ptr %33, align 4
  %multiply.16509 = fmul float %7, %34
  %35 = getelementptr inbounds i8, ptr %8, i64 12
  %36 = load float, ptr %35, align 4
  %multiply.165110 = fmul float %10, %36
  %37 = getelementptr inbounds i8, ptr %11, i64 12
  %38 = load float, ptr %37, align 4
  %multiply.165211 = fmul float %13, %38
  %39 = getelementptr inbounds i8, ptr %14, i64 12
  %40 = load float, ptr %39, align 4
  %multiply.165312 = fmul float %16, %40
  store float %multiply.16509, ptr %33, align 4
  store float %multiply.165110, ptr %35, align 4
  store float %multiply.165211, ptr %37, align 4
  store float %multiply.165312, ptr %39, align 4
  ret void
}

; CHECK-LABLE: copy_fusion_6
; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn 
define void @copy_fusion_6(ptr noalias nocapture align 16 dereferenceable(262144) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture align 16 dereferenceable(262144) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg3, ptr noalias nocapture align 16 dereferenceable(262144) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg5, ptr noalias nocapture align 16 dereferenceable(262144) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg7, ptr noalias nocapture align 16 dereferenceable(1048576) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg9, ptr noalias nocapture align 16 dereferenceable(1048576) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg11, ptr noalias nocapture align 16 dereferenceable(1048576) %arg12, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg13, ptr noalias nocapture align 16 dereferenceable(1048576) %arg14, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg15) local_unnamed_addr #2 {
entry:
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !57
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !49
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 131072
  br i1 %3, label %concatenate.pivot.65536., label %concatenate.pivot.393216.

copy_fusion.6.in_bounds-after:                    ; preds = %slice5-after, %slice6-true
  ret void

concatenate.pivot.65536.:                         ; preds = %entry
  %4 = icmp ult i32 %linear_index, 65536
  br i1 %4, label %concatenate.pivot.0., label %concatenate.pivot.65536.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.65536.
  %5 = and i32 %linear_index, 511
  %6 = lshr i32 %0, 2
  %7 = zext nneg i32 %6 to i64
  %8 = zext nneg i32 %5 to i64
  %9 = getelementptr inbounds [128 x [512 x [1 x [1 x float]]]], ptr %arg0, i64 0, i64 %7, i64 %8, i64 0, i64 0
  br label %concatenate.pivot.131072.8

concatenate.pivot.65536.1:                        ; preds = %concatenate.pivot.65536.
  %10 = add nsw i32 %2, -65536
  %11 = lshr exact i32 %10, 7
  %12 = zext nneg i32 %11 to i64
  %13 = zext nneg i32 %1 to i64
  %14 = getelementptr inbounds [512 x [128 x [1 x [1 x float]]]], ptr %arg4, i64 0, i64 %12, i64 %13, i64 0, i64 0
  br label %concatenate.pivot.131072.8

concatenate.pivot.393216.:                        ; preds = %entry
  %15 = icmp ult i32 %linear_index, 393216
  %16 = and i32 %linear_index, 255
  %17 = zext nneg i32 %16 to i64
  br i1 %15, label %concatenate.pivot.131072.2, label %concatenate.pivot.393216.3

concatenate.pivot.131072.2:                       ; preds = %concatenate.pivot.393216.
  %18 = add nsw i32 %2, -131072
  %19 = lshr i32 %18, 8
  %20 = zext nneg i32 %19 to i64
  %21 = getelementptr inbounds [1024 x [256 x [1 x [1 x float]]]], ptr %arg8, i64 0, i64 %20, i64 %17, i64 0, i64 0
  br label %concatenate.pivot.131072.8

concatenate.pivot.393216.3:                       ; preds = %concatenate.pivot.393216.
  %22 = add nsw i32 %2, -393216
  %23 = lshr i32 %22, 8
  %24 = zext nneg i32 %23 to i64
  %25 = getelementptr inbounds [1024 x [256 x [1 x [1 x float]]]], ptr %arg12, i64 0, i64 %24, i64 %17, i64 0, i64 0
  br label %concatenate.pivot.131072.8

concatenate.pivot.131072.8:                       ; preds = %concatenate.pivot.0., %concatenate.pivot.65536.1, %concatenate.pivot.131072.2, %concatenate.pivot.393216.3
  ; CHECK: %{{.+}} = phi i8* [ %{{.+}}, %concatenate.pivot.0. ], [ %{{.+}}, %concatenate.pivot.65536.1 ], [ %{{.+}}, %concatenate.pivot.131072.2 ], [ %{{.+}}, %concatenate.pivot.393216.3 ]
  %.sink112 = phi ptr [ %9, %concatenate.pivot.0. ], [ %14, %concatenate.pivot.65536.1 ], [ %21, %concatenate.pivot.131072.2 ], [ %25, %concatenate.pivot.393216.3 ]
  ; CHECK: %{{.+}} = phi i8* [ %{{.+}}, %concatenate.pivot.0. ], [ %{{.+}}, %concatenate.pivot.65536.1 ], [ %{{.+}}, %concatenate.pivot.131072.2 ], [ %{{.+}}, %concatenate.pivot.393216.3 ]
  %arg1.sink = phi ptr [ %arg1, %concatenate.pivot.0. ], [ %arg5, %concatenate.pivot.65536.1 ], [ %arg9, %concatenate.pivot.131072.2 ], [ %arg13, %concatenate.pivot.393216.3 ]
  %26 = load float, ptr %.sink112, align 4
  %27 = load float, ptr %arg1.sink, align 16, !invariant.load !47
  %multiply.1654 = fmul float %26, %27
  br i1 %3, label %concatenate.pivot.65536.9, label %concatenate.pivot.393216.12

concatenate.pivot.65536.9:                        ; preds = %concatenate.pivot.131072.8
  %28 = icmp ult i32 %linear_index, 65536
  br i1 %28, label %concatenate.pivot.0.10, label %concatenate.pivot.65536.11

concatenate.pivot.0.10:                           ; preds = %concatenate.pivot.65536.9
  %29 = and i32 %linear_index, 511
  %30 = lshr i32 %0, 2
  %31 = zext nneg i32 %30 to i64
  %32 = zext nneg i32 %29 to i64
  %33 = getelementptr inbounds [128 x [512 x [1 x [1 x float]]]], ptr %arg2, i64 0, i64 %31, i64 %32, i64 0, i64 0
  br label %concatenate.pivot.131072.24

concatenate.pivot.65536.11:                       ; preds = %concatenate.pivot.65536.9
  %34 = add nsw i32 %2, -65536
  %35 = lshr exact i32 %34, 7
  %36 = zext nneg i32 %35 to i64
  %37 = zext nneg i32 %1 to i64
  %38 = getelementptr inbounds [512 x [128 x [1 x [1 x float]]]], ptr %arg6, i64 0, i64 %36, i64 %37, i64 0, i64 0
  br label %concatenate.pivot.131072.24

concatenate.pivot.393216.12:                      ; preds = %concatenate.pivot.131072.8
  %39 = icmp ult i32 %linear_index, 393216
  %40 = and i32 %linear_index, 255
  %41 = zext nneg i32 %40 to i64
  br i1 %39, label %concatenate.pivot.131072.13, label %concatenate.pivot.393216.14

concatenate.pivot.131072.13:                      ; preds = %concatenate.pivot.393216.12
  %42 = add nsw i32 %2, -131072
  %43 = lshr i32 %42, 8
  %44 = zext nneg i32 %43 to i64
  %45 = getelementptr inbounds [1024 x [256 x [1 x [1 x float]]]], ptr %arg10, i64 0, i64 %44, i64 %41, i64 0, i64 0
  br label %concatenate.pivot.131072.24

concatenate.pivot.393216.14:                      ; preds = %concatenate.pivot.393216.12
  %46 = add nsw i32 %2, -393216
  %47 = lshr i32 %46, 8
  %48 = zext nneg i32 %47 to i64
  %49 = getelementptr inbounds [1024 x [256 x [1 x [1 x float]]]], ptr %arg14, i64 0, i64 %48, i64 %41, i64 0, i64 0
  br label %concatenate.pivot.131072.24

concatenate.pivot.131072.24:                      ; preds = %concatenate.pivot.0.10, %concatenate.pivot.65536.11, %concatenate.pivot.131072.13, %concatenate.pivot.393216.14
  %.sink114 = phi ptr [ %33, %concatenate.pivot.0.10 ], [ %38, %concatenate.pivot.65536.11 ], [ %45, %concatenate.pivot.131072.13 ], [ %49, %concatenate.pivot.393216.14 ]
  %arg3.sink = phi ptr [ %arg3, %concatenate.pivot.0.10 ], [ %arg7, %concatenate.pivot.65536.11 ], [ %arg11, %concatenate.pivot.131072.13 ], [ %arg15, %concatenate.pivot.393216.14 ]
  %50 = load float, ptr %.sink114, align 4
  %51 = load float, ptr %arg3.sink, align 16, !invariant.load !47
  %multiply.1655 = fmul float %50, %51
  br i1 %3, label %concatenate.pivot.65536.25, label %concatenate.pivot.393216.28

concatenate.pivot.65536.25:                       ; preds = %concatenate.pivot.131072.24
  %52 = icmp ult i32 %linear_index, 65536
  br i1 %52, label %concatenate.pivot.0.26, label %concatenate.pivot.65536.27

concatenate.pivot.0.26:                           ; preds = %concatenate.pivot.65536.25
  %53 = and i32 %linear_index, 511
  %54 = lshr i32 %0, 2
  %55 = zext nneg i32 %54 to i64
  %56 = zext nneg i32 %53 to i64
  %57 = getelementptr inbounds [128 x [512 x [1 x [1 x float]]]], ptr %arg0, i64 0, i64 %55, i64 %56, i64 0, i64 0
  br label %concatenate.pivot.131072.40

concatenate.pivot.65536.27:                       ; preds = %concatenate.pivot.65536.25
  %58 = add nsw i32 %2, -65536
  %59 = lshr exact i32 %58, 7
  %60 = zext nneg i32 %59 to i64
  %61 = zext nneg i32 %1 to i64
  %62 = getelementptr inbounds [512 x [128 x [1 x [1 x float]]]], ptr %arg4, i64 0, i64 %60, i64 %61, i64 0, i64 0
  br label %concatenate.pivot.131072.40

concatenate.pivot.393216.28:                      ; preds = %concatenate.pivot.131072.24
  %63 = icmp ult i32 %linear_index, 393216
  %64 = and i32 %linear_index, 255
  %65 = zext nneg i32 %64 to i64
  br i1 %63, label %concatenate.pivot.131072.29, label %concatenate.pivot.393216.30

concatenate.pivot.131072.29:                      ; preds = %concatenate.pivot.393216.28
  %66 = add nsw i32 %2, -131072
  %67 = lshr i32 %66, 8
  %68 = zext nneg i32 %67 to i64
  %69 = getelementptr inbounds [1024 x [256 x [1 x [1 x float]]]], ptr %arg8, i64 0, i64 %68, i64 %65, i64 0, i64 0
  br label %concatenate.pivot.131072.40

concatenate.pivot.393216.30:                      ; preds = %concatenate.pivot.393216.28
  %70 = add nsw i32 %2, -393216
  %71 = lshr i32 %70, 8
  %72 = zext nneg i32 %71 to i64
  %73 = getelementptr inbounds [1024 x [256 x [1 x [1 x float]]]], ptr %arg12, i64 0, i64 %72, i64 %65, i64 0, i64 0
  br label %concatenate.pivot.131072.40

concatenate.pivot.131072.40:                      ; preds = %concatenate.pivot.0.26, %concatenate.pivot.65536.27, %concatenate.pivot.131072.29, %concatenate.pivot.393216.30
  %.sink117 = phi ptr [ %57, %concatenate.pivot.0.26 ], [ %62, %concatenate.pivot.65536.27 ], [ %69, %concatenate.pivot.131072.29 ], [ %73, %concatenate.pivot.393216.30 ]
  %arg1.sink116 = phi ptr [ %arg1, %concatenate.pivot.0.26 ], [ %arg5, %concatenate.pivot.65536.27 ], [ %arg9, %concatenate.pivot.131072.29 ], [ %arg13, %concatenate.pivot.393216.30 ]
  %74 = load float, ptr %.sink117, align 4
  %75 = load float, ptr %arg1.sink116, align 16, !invariant.load !47
  %multiply.165417 = fmul float %74, %75
  br i1 %3, label %concatenate.pivot.65536.41, label %concatenate.pivot.393216.44

concatenate.pivot.65536.41:                       ; preds = %concatenate.pivot.131072.40
  %76 = icmp ult i32 %linear_index, 65536
  br i1 %76, label %concatenate.pivot.0.42, label %concatenate.pivot.65536.43

concatenate.pivot.0.42:                           ; preds = %concatenate.pivot.65536.41
  %77 = and i32 %linear_index, 511
  %78 = lshr i32 %0, 2
  %79 = zext nneg i32 %78 to i64
  %80 = zext nneg i32 %77 to i64
  %81 = getelementptr inbounds [128 x [512 x [1 x [1 x float]]]], ptr %arg2, i64 0, i64 %79, i64 %80, i64 0, i64 0
  br label %concatenate.pivot.131072.56

concatenate.pivot.65536.43:                       ; preds = %concatenate.pivot.65536.41
  %82 = add nsw i32 %2, -65536
  %83 = lshr exact i32 %82, 7
  %84 = zext nneg i32 %83 to i64
  %85 = zext nneg i32 %1 to i64
  %86 = getelementptr inbounds [512 x [128 x [1 x [1 x float]]]], ptr %arg6, i64 0, i64 %84, i64 %85, i64 0, i64 0
  br label %concatenate.pivot.131072.56

concatenate.pivot.393216.44:                      ; preds = %concatenate.pivot.131072.40
  %87 = icmp ult i32 %linear_index, 393216
  %88 = and i32 %linear_index, 255
  %89 = zext nneg i32 %88 to i64
  br i1 %87, label %concatenate.pivot.131072.45, label %concatenate.pivot.393216.46

concatenate.pivot.131072.45:                      ; preds = %concatenate.pivot.393216.44
  %90 = add nsw i32 %2, -131072
  %91 = lshr i32 %90, 8
  %92 = zext nneg i32 %91 to i64
  %93 = getelementptr inbounds [1024 x [256 x [1 x [1 x float]]]], ptr %arg10, i64 0, i64 %92, i64 %89, i64 0, i64 0
  br label %concatenate.pivot.131072.56

concatenate.pivot.393216.46:                      ; preds = %concatenate.pivot.393216.44
  %94 = add nsw i32 %2, -393216
  %95 = lshr i32 %94, 8
  %96 = zext nneg i32 %95 to i64
  %97 = getelementptr inbounds [1024 x [256 x [1 x [1 x float]]]], ptr %arg14, i64 0, i64 %96, i64 %89, i64 0, i64 0
  br label %concatenate.pivot.131072.56

concatenate.pivot.131072.56:                      ; preds = %concatenate.pivot.0.42, %concatenate.pivot.65536.43, %concatenate.pivot.131072.45, %concatenate.pivot.393216.46
  %.sink120 = phi ptr [ %81, %concatenate.pivot.0.42 ], [ %86, %concatenate.pivot.65536.43 ], [ %93, %concatenate.pivot.131072.45 ], [ %97, %concatenate.pivot.393216.46 ]
  %arg3.sink119 = phi ptr [ %arg3, %concatenate.pivot.0.42 ], [ %arg7, %concatenate.pivot.65536.43 ], [ %arg11, %concatenate.pivot.131072.45 ], [ %arg15, %concatenate.pivot.393216.46 ]
  %98 = load float, ptr %.sink120, align 4
  %99 = load float, ptr %arg3.sink119, align 16, !invariant.load !47
  %multiply.165533 = fmul float %98, %99
  br i1 %3, label %concatenate.pivot.65536.57, label %concatenate.pivot.393216.60

concatenate.pivot.65536.57:                       ; preds = %concatenate.pivot.131072.56
  %100 = icmp ult i32 %linear_index, 65536
  br i1 %100, label %concatenate.pivot.0.58, label %concatenate.pivot.65536.59

concatenate.pivot.0.58:                           ; preds = %concatenate.pivot.65536.57
  %101 = and i32 %linear_index, 511
  %102 = lshr i32 %0, 2
  %103 = zext nneg i32 %102 to i64
  %104 = zext nneg i32 %101 to i64
  %105 = getelementptr inbounds [128 x [512 x [1 x [1 x float]]]], ptr %arg0, i64 0, i64 %103, i64 %104, i64 0, i64 0
  br label %concatenate.pivot.131072.72

concatenate.pivot.65536.59:                       ; preds = %concatenate.pivot.65536.57
  %106 = add nsw i32 %2, -65536
  %107 = lshr exact i32 %106, 7
  %108 = zext nneg i32 %107 to i64
  %109 = zext nneg i32 %1 to i64
  %110 = getelementptr inbounds [512 x [128 x [1 x [1 x float]]]], ptr %arg4, i64 0, i64 %108, i64 %109, i64 0, i64 0
  br label %concatenate.pivot.131072.72

concatenate.pivot.393216.60:                      ; preds = %concatenate.pivot.131072.56
  %111 = icmp ult i32 %linear_index, 393216
  %112 = and i32 %linear_index, 255
  %113 = zext nneg i32 %112 to i64
  br i1 %111, label %concatenate.pivot.131072.61, label %concatenate.pivot.393216.62

concatenate.pivot.131072.61:                      ; preds = %concatenate.pivot.393216.60
  %114 = add nsw i32 %2, -131072
  %115 = lshr i32 %114, 8
  %116 = zext nneg i32 %115 to i64
  %117 = getelementptr inbounds [1024 x [256 x [1 x [1 x float]]]], ptr %arg8, i64 0, i64 %116, i64 %113, i64 0, i64 0
  br label %concatenate.pivot.131072.72

concatenate.pivot.393216.62:                      ; preds = %concatenate.pivot.393216.60
  %118 = add nsw i32 %2, -393216
  %119 = lshr i32 %118, 8
  %120 = zext nneg i32 %119 to i64
  %121 = getelementptr inbounds [1024 x [256 x [1 x [1 x float]]]], ptr %arg12, i64 0, i64 %120, i64 %113, i64 0, i64 0
  br label %concatenate.pivot.131072.72

concatenate.pivot.131072.72:                      ; preds = %concatenate.pivot.0.58, %concatenate.pivot.65536.59, %concatenate.pivot.131072.61, %concatenate.pivot.393216.62
  %.sink123 = phi ptr [ %105, %concatenate.pivot.0.58 ], [ %110, %concatenate.pivot.65536.59 ], [ %117, %concatenate.pivot.131072.61 ], [ %121, %concatenate.pivot.393216.62 ]
  %arg1.sink122 = phi ptr [ %arg1, %concatenate.pivot.0.58 ], [ %arg5, %concatenate.pivot.65536.59 ], [ %arg9, %concatenate.pivot.131072.61 ], [ %arg13, %concatenate.pivot.393216.62 ]
  %122 = load float, ptr %.sink123, align 4
  %123 = load float, ptr %arg1.sink122, align 16, !invariant.load !47
  %multiply.165449 = fmul float %122, %123
  br i1 %3, label %concatenate.pivot.65536.73, label %concatenate.pivot.393216.76

concatenate.pivot.65536.73:                       ; preds = %concatenate.pivot.131072.72
  %124 = icmp ult i32 %linear_index, 65536
  br i1 %124, label %concatenate.pivot.0.74, label %concatenate.pivot.65536.75

concatenate.pivot.0.74:                           ; preds = %concatenate.pivot.65536.73
  %125 = and i32 %linear_index, 511
  %126 = lshr i32 %0, 2
  %127 = zext nneg i32 %126 to i64
  %128 = zext nneg i32 %125 to i64
  %129 = getelementptr inbounds [128 x [512 x [1 x [1 x float]]]], ptr %arg2, i64 0, i64 %127, i64 %128, i64 0, i64 0
  br label %concatenate.pivot.131072.88

concatenate.pivot.65536.75:                       ; preds = %concatenate.pivot.65536.73
  %130 = add nsw i32 %2, -65536
  %131 = lshr exact i32 %130, 7
  %132 = zext nneg i32 %131 to i64
  %133 = zext nneg i32 %1 to i64
  %134 = getelementptr inbounds [512 x [128 x [1 x [1 x float]]]], ptr %arg6, i64 0, i64 %132, i64 %133, i64 0, i64 0
  br label %concatenate.pivot.131072.88

concatenate.pivot.393216.76:                      ; preds = %concatenate.pivot.131072.72
  %135 = icmp ult i32 %linear_index, 393216
  %136 = and i32 %linear_index, 255
  %137 = zext nneg i32 %136 to i64
  br i1 %135, label %concatenate.pivot.131072.77, label %concatenate.pivot.393216.78

concatenate.pivot.131072.77:                      ; preds = %concatenate.pivot.393216.76
  %138 = add nsw i32 %2, -131072
  %139 = lshr i32 %138, 8
  %140 = zext nneg i32 %139 to i64
  %141 = getelementptr inbounds [1024 x [256 x [1 x [1 x float]]]], ptr %arg10, i64 0, i64 %140, i64 %137, i64 0, i64 0
  br label %concatenate.pivot.131072.88

concatenate.pivot.393216.78:                      ; preds = %concatenate.pivot.393216.76
  %142 = add nsw i32 %2, -393216
  %143 = lshr i32 %142, 8
  %144 = zext nneg i32 %143 to i64
  %145 = getelementptr inbounds [1024 x [256 x [1 x [1 x float]]]], ptr %arg14, i64 0, i64 %144, i64 %137, i64 0, i64 0
  br label %concatenate.pivot.131072.88

concatenate.pivot.131072.88:                      ; preds = %concatenate.pivot.0.74, %concatenate.pivot.65536.75, %concatenate.pivot.131072.77, %concatenate.pivot.393216.78
  %.sink126 = phi ptr [ %129, %concatenate.pivot.0.74 ], [ %134, %concatenate.pivot.65536.75 ], [ %141, %concatenate.pivot.131072.77 ], [ %145, %concatenate.pivot.393216.78 ]
  %arg3.sink125 = phi ptr [ %arg3, %concatenate.pivot.0.74 ], [ %arg7, %concatenate.pivot.65536.75 ], [ %arg11, %concatenate.pivot.131072.77 ], [ %arg15, %concatenate.pivot.393216.78 ]
  %146 = load float, ptr %.sink126, align 4
  %147 = load float, ptr %arg3.sink125, align 16, !invariant.load !47
  %multiply.165565 = fmul float %146, %147
  br i1 %3, label %concatenate.pivot.65536.89, label %concatenate.pivot.393216.92

concatenate.pivot.65536.89:                       ; preds = %concatenate.pivot.131072.88
  %148 = icmp ult i32 %linear_index, 65536
  br i1 %148, label %concatenate.pivot.0.90, label %concatenate.pivot.65536.91

concatenate.pivot.0.90:                           ; preds = %concatenate.pivot.65536.89
  %149 = and i32 %linear_index, 511
  %150 = lshr i32 %0, 2
  %151 = zext nneg i32 %150 to i64
  %152 = zext nneg i32 %149 to i64
  %153 = getelementptr inbounds [128 x [512 x [1 x [1 x float]]]], ptr %arg0, i64 0, i64 %151, i64 %152, i64 0, i64 0
  br label %concatenate.pivot.131072.104

concatenate.pivot.65536.91:                       ; preds = %concatenate.pivot.65536.89
  %154 = add nsw i32 %2, -65536
  %155 = lshr exact i32 %154, 7
  %156 = zext nneg i32 %155 to i64
  %157 = zext nneg i32 %1 to i64
  %158 = getelementptr inbounds [512 x [128 x [1 x [1 x float]]]], ptr %arg4, i64 0, i64 %156, i64 %157, i64 0, i64 0
  br label %concatenate.pivot.131072.104

concatenate.pivot.393216.92:                      ; preds = %concatenate.pivot.131072.88
  %159 = icmp ult i32 %linear_index, 393216
  %160 = and i32 %linear_index, 255
  %161 = zext nneg i32 %160 to i64
  br i1 %159, label %concatenate.pivot.131072.93, label %concatenate.pivot.393216.94

concatenate.pivot.131072.93:                      ; preds = %concatenate.pivot.393216.92
  %162 = add nsw i32 %2, -131072
  %163 = lshr i32 %162, 8
  %164 = zext nneg i32 %163 to i64
  %165 = getelementptr inbounds [1024 x [256 x [1 x [1 x float]]]], ptr %arg8, i64 0, i64 %164, i64 %161, i64 0, i64 0
  br label %concatenate.pivot.131072.104

concatenate.pivot.393216.94:                      ; preds = %concatenate.pivot.393216.92
  %166 = add nsw i32 %2, -393216
  %167 = lshr i32 %166, 8
  %168 = zext nneg i32 %167 to i64
  %169 = getelementptr inbounds [1024 x [256 x [1 x [1 x float]]]], ptr %arg12, i64 0, i64 %168, i64 %161, i64 0, i64 0
  br label %concatenate.pivot.131072.104

concatenate.pivot.131072.104:                     ; preds = %concatenate.pivot.0.90, %concatenate.pivot.65536.91, %concatenate.pivot.131072.93, %concatenate.pivot.393216.94
  %.sink129 = phi ptr [ %153, %concatenate.pivot.0.90 ], [ %158, %concatenate.pivot.65536.91 ], [ %165, %concatenate.pivot.131072.93 ], [ %169, %concatenate.pivot.393216.94 ]
  %arg1.sink128 = phi ptr [ %arg1, %concatenate.pivot.0.90 ], [ %arg5, %concatenate.pivot.65536.91 ], [ %arg9, %concatenate.pivot.131072.93 ], [ %arg13, %concatenate.pivot.393216.94 ]
  %170 = load float, ptr %.sink129, align 4
  %171 = load float, ptr %arg1.sink128, align 16, !invariant.load !47
  %multiply.165481 = fmul float %170, %171
  br i1 %3, label %concatenate.pivot.65536.105, label %concatenate.pivot.393216.108

concatenate.pivot.65536.105:                      ; preds = %concatenate.pivot.131072.104
  %172 = icmp ult i32 %linear_index, 65536
  br i1 %172, label %concatenate.pivot.0.106, label %concatenate.pivot.65536.107

concatenate.pivot.0.106:                          ; preds = %concatenate.pivot.65536.105
  %173 = and i32 %linear_index, 511
  %174 = lshr i32 %0, 2
  %175 = zext nneg i32 %174 to i64
  %176 = zext nneg i32 %173 to i64
  %177 = getelementptr inbounds [128 x [512 x [1 x [1 x float]]]], ptr %arg2, i64 0, i64 %175, i64 %176, i64 0, i64 0
  br label %concatenate.2.merge95

concatenate.pivot.65536.107:                      ; preds = %concatenate.pivot.65536.105
  %178 = add nsw i32 %2, -65536
  %179 = lshr exact i32 %178, 7
  %180 = zext nneg i32 %179 to i64
  %181 = zext nneg i32 %1 to i64
  %182 = getelementptr inbounds [512 x [128 x [1 x [1 x float]]]], ptr %arg6, i64 0, i64 %180, i64 %181, i64 0, i64 0
  br label %concatenate.2.merge95

concatenate.pivot.393216.108:                     ; preds = %concatenate.pivot.131072.104
  %183 = icmp ult i32 %linear_index, 393216
  %184 = and i32 %linear_index, 255
  %185 = zext nneg i32 %184 to i64
  br i1 %183, label %concatenate.pivot.131072.109, label %concatenate.pivot.393216.110

concatenate.pivot.131072.109:                     ; preds = %concatenate.pivot.393216.108
  %186 = add nsw i32 %2, -131072
  %187 = lshr i32 %186, 8
  %188 = zext nneg i32 %187 to i64
  %189 = getelementptr inbounds [1024 x [256 x [1 x [1 x float]]]], ptr %arg10, i64 0, i64 %188, i64 %185, i64 0, i64 0
  br label %concatenate.2.merge95

concatenate.pivot.393216.110:                     ; preds = %concatenate.pivot.393216.108
  %190 = add nsw i32 %2, -393216
  %191 = lshr i32 %190, 8
  %192 = zext nneg i32 %191 to i64
  %193 = getelementptr inbounds [1024 x [256 x [1 x [1 x float]]]], ptr %arg14, i64 0, i64 %192, i64 %185, i64 0, i64 0
  br label %concatenate.2.merge95

concatenate.2.merge95:                            ; preds = %concatenate.pivot.393216.110, %concatenate.pivot.131072.109, %concatenate.pivot.65536.107, %concatenate.pivot.0.106
  %.sink131 = phi ptr [ %193, %concatenate.pivot.393216.110 ], [ %189, %concatenate.pivot.131072.109 ], [ %182, %concatenate.pivot.65536.107 ], [ %177, %concatenate.pivot.0.106 ]
  %arg15.sink = phi ptr [ %arg15, %concatenate.pivot.393216.110 ], [ %arg11, %concatenate.pivot.131072.109 ], [ %arg7, %concatenate.pivot.65536.107 ], [ %arg3, %concatenate.pivot.0.106 ]
  %194 = load float, ptr %.sink131, align 4
  %195 = load float, ptr %arg15.sink, align 16, !invariant.load !47
  %multiply.1661103 = fmul float %194, %195
  %196 = icmp ult i32 %linear_index, 65536
  br i1 %196, label %slice0-true, label %slice1-after

slice1-after:                                     ; preds = %concatenate.2.merge95, %slice0-true
  %197 = and i32 %0, 7680
  %198 = icmp eq i32 %197, 512
  br i1 %198, label %slice2-true, label %slice3-after

slice3-after:                                     ; preds = %slice1-after, %slice2-true
  %199 = add nsw i32 %2, -131072
  %200 = icmp ult i32 %199, 262144
  br i1 %200, label %slice4-true, label %slice5-after

slice5-after:                                     ; preds = %slice3-after, %slice4-true
  %201 = icmp ugt i32 %linear_index, 393215
  br i1 %201, label %slice6-true, label %copy_fusion.6.in_bounds-after

slice0-true:                                      ; preds = %concatenate.2.merge95
  %202 = zext nneg i32 %linear_index to i64
  %203 = getelementptr inbounds [65536 x float], ptr %arg2, i64 0, i64 %202
  %204 = getelementptr inbounds [65536 x float], ptr %arg0, i64 0, i64 %202
  store float %multiply.1654, ptr %204, align 4
  store float %multiply.1655, ptr %203, align 4
  br label %slice1-after

slice2-true:                                      ; preds = %slice1-after
  %205 = add nsw i32 %linear_index, -65536
  %206 = zext nneg i32 %205 to i64
  %207 = getelementptr inbounds [65536 x float], ptr %arg6, i64 0, i64 %206
  %208 = getelementptr inbounds [65536 x float], ptr %arg4, i64 0, i64 %206
  store float %multiply.165417, ptr %208, align 4
  store float %multiply.165533, ptr %207, align 4
  br label %slice3-after

slice4-true:                                      ; preds = %slice3-after
  %209 = add nsw i32 %linear_index, -131072
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds [262144 x float], ptr %arg10, i64 0, i64 %210
  %212 = getelementptr inbounds [262144 x float], ptr %arg8, i64 0, i64 %210
  store float %multiply.165449, ptr %212, align 4
  store float %multiply.165565, ptr %211, align 4
  br label %slice5-after

slice6-true:                                      ; preds = %slice5-after
  %213 = add nsw i32 %linear_index, -393216
  %214 = zext nneg i32 %213 to i64
  %215 = getelementptr inbounds [262144 x float], ptr %arg14, i64 0, i64 %214
  %216 = getelementptr inbounds [262144 x float], ptr %arg12, i64 0, i64 %214
  store float %multiply.165481, ptr %216, align 4
  store float %multiply.1661103, ptr %215, align 4
  br label %copy_fusion.6.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn 
define void @input_slice_fusion_1(ptr noalias nocapture align 16 dereferenceable(4000) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture align 16 dereferenceable(16384) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg3, ptr noalias nocapture align 16 dereferenceable(37632) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg5, ptr noalias nocapture align 16 dereferenceable(65536) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg7, ptr noalias nocapture align 16 dereferenceable(65536) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg9, ptr noalias nocapture align 16 dereferenceable(131072) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg11, ptr noalias nocapture align 16 dereferenceable(262144) %arg12, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg13, ptr noalias nocapture align 16 dereferenceable(262144) %arg14, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg15, ptr noalias nocapture align 16 dereferenceable(262144) %arg16, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg17, ptr noalias nocapture align 16 dereferenceable(524288) %arg18, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg19, ptr noalias nocapture align 16 dereferenceable(524288) %arg20, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg21, ptr noalias nocapture align 16 dereferenceable(1048576) %arg22, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg23, ptr noalias nocapture align 16 dereferenceable(1048576) %arg24, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg25, ptr noalias nocapture align 16 dereferenceable(1048576) %arg26, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg27) local_unnamed_addr #2 {
entry:
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !58
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !49
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 1325224
  br i1 %3, label %concatenate.pivot.145576., label %input_slice_fusion.1.in_bounds-after

input_slice_fusion.1.in_bounds-after:             ; preds = %slice12-after, %slice13-true, %entry
  ret void

concatenate.pivot.145576.:                        ; preds = %entry
  %4 = icmp ult i32 %linear_index, 145576
  br i1 %4, label %concatenate.pivot.14504., label %concatenate.pivot.407720.

concatenate.pivot.14504.:                         ; preds = %concatenate.pivot.145576.
  %5 = icmp ult i32 %linear_index, 14504
  br i1 %5, label %concatenate.pivot.1000., label %concatenate.pivot.47272.

concatenate.pivot.1000.:                          ; preds = %concatenate.pivot.14504.
  %6 = icmp ult i32 %linear_index, 1000
  br i1 %6, label %concatenate.pivot.0., label %concatenate.pivot.5096.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.1000.
  %7 = zext nneg i32 %linear_index to i64
  %8 = getelementptr inbounds [1000 x float], ptr %arg0, i64 0, i64 %7
  br label %concatenate.merge

concatenate.pivot.5096.:                          ; preds = %concatenate.pivot.1000.
  %9 = icmp ult i32 %linear_index, 5096
  br i1 %9, label %concatenate.pivot.1000.1, label %concatenate.pivot.5096.2

concatenate.pivot.1000.1:                         ; preds = %concatenate.pivot.5096.
  %10 = add nsw i32 %linear_index, -1000
  %11 = and i32 %10, 63
  %12 = lshr i32 %10, 6
  %13 = zext nneg i32 %12 to i64
  %14 = zext nneg i32 %11 to i64
  %15 = getelementptr inbounds [64 x [64 x [1 x [1 x float]]]], ptr %arg2, i64 0, i64 %13, i64 %14, i64 0, i64 0
  br label %concatenate.merge

concatenate.pivot.5096.2:                         ; preds = %concatenate.pivot.5096.
  %16 = trunc i32 %linear_index to i16
  %.lhs.trunc = add nsw i16 %16, -5096
  %.lhs.trunc.frozen = freeze i16 %.lhs.trunc
  %17 = udiv i16 %.lhs.trunc.frozen, 7
  %18 = mul i16 %17, 7
  %.decomposed = sub i16 %.lhs.trunc.frozen, %18
  %19 = urem i16 %17, 7
  %20 = udiv i16 %.lhs.trunc, 49
  %.lhs.trunc20 = trunc i16 %20 to i8
  %21 = urem i8 %.lhs.trunc20, 3
  %22 = udiv i16 %.lhs.trunc, 147
  %23 = zext nneg i16 %22 to i64
  %24 = zext nneg i8 %21 to i64
  %25 = zext nneg i16 %19 to i64
  %26 = zext nneg i16 %.decomposed to i64
  %27 = getelementptr inbounds [64 x [3 x [7 x [7 x float]]]], ptr %arg4, i64 0, i64 %23, i64 %24, i64 %25, i64 %26
  br label %concatenate.merge

concatenate.pivot.47272.:                         ; preds = %concatenate.pivot.14504.
  %28 = icmp ult i32 %linear_index, 47272
  br i1 %28, label %concatenate.pivot.30888., label %concatenate.pivot.80040.

concatenate.pivot.30888.:                         ; preds = %concatenate.pivot.47272.
  %29 = icmp ult i32 %linear_index, 30888
  br i1 %29, label %concatenate.pivot.14504.3, label %concatenate.pivot.30888.4

concatenate.pivot.14504.3:                        ; preds = %concatenate.pivot.30888.
  %30 = add nsw i32 %linear_index, -14504
  %31 = and i32 %30, 255
  %32 = lshr i32 %30, 8
  %33 = zext nneg i32 %32 to i64
  %34 = zext nneg i32 %31 to i64
  %35 = getelementptr inbounds [64 x [256 x [1 x [1 x float]]]], ptr %arg6, i64 0, i64 %33, i64 %34, i64 0, i64 0
  br label %concatenate.merge

concatenate.pivot.30888.4:                        ; preds = %concatenate.pivot.30888.
  %36 = add nsw i32 %linear_index, -30888
  %37 = and i32 %36, 255
  %38 = lshr i32 %36, 8
  %39 = zext nneg i32 %38 to i64
  %40 = zext nneg i32 %37 to i64
  %41 = getelementptr inbounds [64 x [256 x [1 x [1 x float]]]], ptr %arg8, i64 0, i64 %39, i64 %40, i64 0, i64 0
  br label %concatenate.merge

concatenate.pivot.80040.:                         ; preds = %concatenate.pivot.47272.
  %42 = icmp ult i32 %linear_index, 80040
  br i1 %42, label %concatenate.pivot.47272.5, label %concatenate.pivot.80040.6

concatenate.pivot.47272.5:                        ; preds = %concatenate.pivot.80040.
  %43 = add nsw i32 %linear_index, -47272
  %44 = and i32 %43, 255
  %45 = lshr i32 %43, 8
  %46 = zext nneg i32 %45 to i64
  %47 = zext nneg i32 %44 to i64
  %48 = getelementptr inbounds [128 x [256 x [1 x [1 x float]]]], ptr %arg10, i64 0, i64 %46, i64 %47, i64 0, i64 0
  br label %concatenate.merge

concatenate.pivot.80040.6:                        ; preds = %concatenate.pivot.80040.
  %49 = add nsw i32 %linear_index, -80040
  %50 = and i32 %49, 127
  %51 = lshr i32 %49, 7
  %52 = zext nneg i32 %51 to i64
  %53 = zext nneg i32 %50 to i64
  %54 = getelementptr inbounds [512 x [128 x [1 x [1 x float]]]], ptr %arg12, i64 0, i64 %52, i64 %53, i64 0, i64 0
  br label %concatenate.merge

concatenate.pivot.407720.:                        ; preds = %concatenate.pivot.145576.
  %55 = icmp ult i32 %linear_index, 407720
  br i1 %55, label %concatenate.pivot.211112., label %concatenate.pivot.800936.

concatenate.pivot.211112.:                        ; preds = %concatenate.pivot.407720.
  %56 = icmp ult i32 %linear_index, 211112
  br i1 %56, label %concatenate.pivot.145576.7, label %concatenate.pivot.276648.

concatenate.pivot.145576.7:                       ; preds = %concatenate.pivot.211112.
  %57 = add nsw i32 %linear_index, -145576
  %58 = and i32 %57, 127
  %59 = lshr i32 %57, 7
  %60 = zext nneg i32 %59 to i64
  %61 = zext nneg i32 %58 to i64
  %62 = getelementptr inbounds [512 x [128 x [1 x [1 x float]]]], ptr %arg14, i64 0, i64 %60, i64 %61, i64 0, i64 0
  br label %concatenate.merge

concatenate.pivot.276648.:                        ; preds = %concatenate.pivot.211112.
  %63 = icmp ult i32 %linear_index, 276648
  br i1 %63, label %concatenate.pivot.211112.8, label %concatenate.pivot.276648.9

concatenate.pivot.211112.8:                       ; preds = %concatenate.pivot.276648.
  %64 = add nsw i32 %linear_index, -211112
  %65 = and i32 %64, 511
  %66 = lshr i32 %64, 9
  %67 = zext nneg i32 %66 to i64
  %68 = zext nneg i32 %65 to i64
  %69 = getelementptr inbounds [128 x [512 x [1 x [1 x float]]]], ptr %arg16, i64 0, i64 %67, i64 %68, i64 0, i64 0
  br label %concatenate.merge

concatenate.pivot.276648.9:                       ; preds = %concatenate.pivot.276648.
  %70 = add nsw i32 %linear_index, -276648
  %71 = and i32 %70, 255
  %72 = lshr i32 %70, 8
  %73 = zext nneg i32 %72 to i64
  %74 = zext nneg i32 %71 to i64
  %75 = getelementptr inbounds [512 x [256 x [1 x [1 x float]]]], ptr %arg18, i64 0, i64 %73, i64 %74, i64 0, i64 0
  br label %concatenate.merge

concatenate.pivot.800936.:                        ; preds = %concatenate.pivot.407720.
  %76 = icmp ult i32 %linear_index, 800936
  br i1 %76, label %concatenate.pivot.538792., label %concatenate.pivot.1063080.

concatenate.pivot.538792.:                        ; preds = %concatenate.pivot.800936.
  %77 = icmp ult i32 %linear_index, 538792
  br i1 %77, label %concatenate.pivot.407720.10, label %concatenate.pivot.538792.11

concatenate.pivot.407720.10:                      ; preds = %concatenate.pivot.538792.
  %78 = add nsw i32 %linear_index, -407720
  %79 = and i32 %78, 511
  %80 = lshr i32 %78, 9
  %81 = zext nneg i32 %80 to i64
  %82 = zext nneg i32 %79 to i64
  %83 = getelementptr inbounds [256 x [512 x [1 x [1 x float]]]], ptr %arg20, i64 0, i64 %81, i64 %82, i64 0, i64 0
  br label %concatenate.merge

concatenate.pivot.538792.11:                      ; preds = %concatenate.pivot.538792.
  %84 = add nsw i32 %linear_index, -538792
  %85 = and i32 %84, 255
  %86 = lshr i32 %84, 8
  %87 = zext nneg i32 %86 to i64
  %88 = zext nneg i32 %85 to i64
  %89 = getelementptr inbounds [1024 x [256 x [1 x [1 x float]]]], ptr %arg22, i64 0, i64 %87, i64 %88, i64 0, i64 0
  br label %concatenate.merge

concatenate.pivot.1063080.:                       ; preds = %concatenate.pivot.800936.
  %90 = icmp ult i32 %linear_index, 1063080
  br i1 %90, label %concatenate.pivot.800936.12, label %concatenate.pivot.1063080.13

concatenate.pivot.800936.12:                      ; preds = %concatenate.pivot.1063080.
  %91 = add nsw i32 %linear_index, -800936
  %92 = and i32 %91, 1023
  %93 = lshr i32 %91, 10
  %94 = zext nneg i32 %93 to i64
  %95 = zext nneg i32 %92 to i64
  %96 = getelementptr inbounds [256 x [1024 x [1 x [1 x float]]]], ptr %arg24, i64 0, i64 %94, i64 %95, i64 0, i64 0
  br label %concatenate.merge

concatenate.pivot.1063080.13:                     ; preds = %concatenate.pivot.1063080.
  %97 = add nsw i32 %linear_index, -1063080
  %98 = and i32 %97, 255
  %99 = lshr i32 %97, 8
  %100 = zext nneg i32 %99 to i64
  %101 = zext nneg i32 %98 to i64
  %102 = getelementptr inbounds [1024 x [256 x [1 x [1 x float]]]], ptr %arg26, i64 0, i64 %100, i64 %101, i64 0, i64 0
  br label %concatenate.merge

concatenate.merge:                                ; preds = %concatenate.pivot.1063080.13, %concatenate.pivot.800936.12, %concatenate.pivot.538792.11, %concatenate.pivot.407720.10, %concatenate.pivot.276648.9, %concatenate.pivot.211112.8, %concatenate.pivot.145576.7, %concatenate.pivot.80040.6, %concatenate.pivot.47272.5, %concatenate.pivot.30888.4, %concatenate.pivot.14504.3, %concatenate.pivot.5096.2, %concatenate.pivot.1000.1, %concatenate.pivot.0.
  %.sink25 = phi ptr [ %102, %concatenate.pivot.1063080.13 ], [ %96, %concatenate.pivot.800936.12 ], [ %89, %concatenate.pivot.538792.11 ], [ %83, %concatenate.pivot.407720.10 ], [ %75, %concatenate.pivot.276648.9 ], [ %69, %concatenate.pivot.211112.8 ], [ %62, %concatenate.pivot.145576.7 ], [ %54, %concatenate.pivot.80040.6 ], [ %48, %concatenate.pivot.47272.5 ], [ %41, %concatenate.pivot.30888.4 ], [ %35, %concatenate.pivot.14504.3 ], [ %27, %concatenate.pivot.5096.2 ], [ %15, %concatenate.pivot.1000.1 ], [ %8, %concatenate.pivot.0. ]
  %arg27.sink = phi ptr [ %arg27, %concatenate.pivot.1063080.13 ], [ %arg25, %concatenate.pivot.800936.12 ], [ %arg23, %concatenate.pivot.538792.11 ], [ %arg21, %concatenate.pivot.407720.10 ], [ %arg19, %concatenate.pivot.276648.9 ], [ %arg17, %concatenate.pivot.211112.8 ], [ %arg15, %concatenate.pivot.145576.7 ], [ %arg13, %concatenate.pivot.80040.6 ], [ %arg11, %concatenate.pivot.47272.5 ], [ %arg9, %concatenate.pivot.30888.4 ], [ %arg7, %concatenate.pivot.14504.3 ], [ %arg5, %concatenate.pivot.5096.2 ], [ %arg3, %concatenate.pivot.1000.1 ], [ %arg1, %concatenate.pivot.0. ]
  %103 = load float, ptr %.sink25, align 4
  %104 = load float, ptr %arg27.sink, align 16, !invariant.load !47
  %multiply.1645 = fmul float %103, %104
  %105 = icmp ult i32 %linear_index, 1000
  br i1 %105, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.merge
  %106 = add nsw i32 %linear_index, -1000
  %107 = icmp ult i32 %106, 4096
  br i1 %107, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  %108 = add nsw i32 %linear_index, -5096
  %109 = icmp ult i32 %108, 9408
  br i1 %109, label %slice2-true, label %slice2-after

slice2-after:                                     ; preds = %slice2-true, %slice1-after
  %110 = add nsw i32 %linear_index, -14504
  %111 = icmp ult i32 %110, 16384
  br i1 %111, label %slice3-true, label %slice3-after

slice3-after:                                     ; preds = %slice3-true, %slice2-after
  %112 = add nsw i32 %linear_index, -30888
  %113 = icmp ult i32 %112, 16384
  br i1 %113, label %slice4-true, label %slice4-after

slice4-after:                                     ; preds = %slice4-true, %slice3-after
  %114 = add nsw i32 %linear_index, -47272
  %115 = icmp ult i32 %114, 32768
  br i1 %115, label %slice5-true, label %slice5-after

slice5-after:                                     ; preds = %slice5-true, %slice4-after
  %116 = add nsw i32 %linear_index, -80040
  %117 = icmp ult i32 %116, 65536
  br i1 %117, label %slice6-true, label %slice6-after

slice6-after:                                     ; preds = %slice6-true, %slice5-after
  %118 = add nsw i32 %linear_index, -145576
  %119 = icmp ult i32 %118, 65536
  br i1 %119, label %slice7-true, label %slice7-after

slice7-after:                                     ; preds = %slice7-true, %slice6-after
  %120 = add nsw i32 %linear_index, -211112
  %121 = icmp ult i32 %120, 65536
  br i1 %121, label %slice8-true, label %slice8-after

slice8-after:                                     ; preds = %slice8-true, %slice7-after
  %122 = add nsw i32 %linear_index, -276648
  %123 = icmp ult i32 %122, 131072
  br i1 %123, label %slice9-true, label %slice9-after

slice9-after:                                     ; preds = %slice9-true, %slice8-after
  %124 = add nsw i32 %linear_index, -407720
  %125 = icmp ult i32 %124, 131072
  br i1 %125, label %slice10-true, label %slice10-after

slice10-after:                                    ; preds = %slice10-true, %slice9-after
  %126 = add nsw i32 %linear_index, -538792
  %127 = icmp ult i32 %126, 262144
  br i1 %127, label %slice11-true, label %slice11-after

slice11-after:                                    ; preds = %slice11-true, %slice10-after
  %128 = add nsw i32 %linear_index, -800936
  %129 = icmp ult i32 %128, 262144
  br i1 %129, label %slice12-true, label %slice12-after

slice12-after:                                    ; preds = %slice12-true, %slice11-after
  %130 = icmp ugt i32 %linear_index, 1063079
  br i1 %130, label %slice13-true, label %input_slice_fusion.1.in_bounds-after

slice0-true:                                      ; preds = %concatenate.merge
  %131 = zext nneg i32 %linear_index to i64
  %132 = getelementptr inbounds [1000 x float], ptr %arg0, i64 0, i64 %131
  store float %multiply.1645, ptr %132, align 4
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %133 = zext nneg i32 %106 to i64
  %134 = getelementptr inbounds [4096 x float], ptr %arg2, i64 0, i64 %133
  store float %multiply.1645, ptr %134, align 4
  br label %slice1-after

slice2-true:                                      ; preds = %slice1-after
  %135 = zext nneg i32 %108 to i64
  %136 = getelementptr inbounds [9408 x float], ptr %arg4, i64 0, i64 %135
  store float %multiply.1645, ptr %136, align 4
  br label %slice2-after

slice3-true:                                      ; preds = %slice2-after
  %137 = zext nneg i32 %110 to i64
  %138 = getelementptr inbounds [16384 x float], ptr %arg6, i64 0, i64 %137
  store float %multiply.1645, ptr %138, align 4
  br label %slice3-after

slice4-true:                                      ; preds = %slice3-after
  %139 = zext nneg i32 %112 to i64
  %140 = getelementptr inbounds [16384 x float], ptr %arg8, i64 0, i64 %139
  store float %multiply.1645, ptr %140, align 4
  br label %slice4-after

slice5-true:                                      ; preds = %slice4-after
  %141 = zext nneg i32 %114 to i64
  %142 = getelementptr inbounds [32768 x float], ptr %arg10, i64 0, i64 %141
  store float %multiply.1645, ptr %142, align 4
  br label %slice5-after

slice6-true:                                      ; preds = %slice5-after
  %143 = zext nneg i32 %116 to i64
  %144 = getelementptr inbounds [65536 x float], ptr %arg12, i64 0, i64 %143
  store float %multiply.1645, ptr %144, align 4
  br label %slice6-after

slice7-true:                                      ; preds = %slice6-after
  %145 = zext nneg i32 %118 to i64
  %146 = getelementptr inbounds [65536 x float], ptr %arg14, i64 0, i64 %145
  store float %multiply.1645, ptr %146, align 4
  br label %slice7-after

slice8-true:                                      ; preds = %slice7-after
  %147 = zext nneg i32 %120 to i64
  %148 = getelementptr inbounds [65536 x float], ptr %arg16, i64 0, i64 %147
  store float %multiply.1645, ptr %148, align 4
  br label %slice8-after

slice9-true:                                      ; preds = %slice8-after
  %149 = zext nneg i32 %122 to i64
  %150 = getelementptr inbounds [131072 x float], ptr %arg18, i64 0, i64 %149
  store float %multiply.1645, ptr %150, align 4
  br label %slice9-after

slice10-true:                                     ; preds = %slice9-after
  %151 = zext nneg i32 %124 to i64
  %152 = getelementptr inbounds [131072 x float], ptr %arg20, i64 0, i64 %151
  store float %multiply.1645, ptr %152, align 4
  br label %slice10-after

slice11-true:                                     ; preds = %slice10-after
  %153 = zext nneg i32 %126 to i64
  %154 = getelementptr inbounds [262144 x float], ptr %arg22, i64 0, i64 %153
  store float %multiply.1645, ptr %154, align 4
  br label %slice11-after

slice12-true:                                     ; preds = %slice11-after
  %155 = zext nneg i32 %128 to i64
  %156 = getelementptr inbounds [262144 x float], ptr %arg24, i64 0, i64 %155
  store float %multiply.1645, ptr %156, align 4
  br label %slice12-after

slice13-true:                                     ; preds = %slice12-after
  %157 = add nsw i32 %linear_index, -1063080
  %158 = zext nneg i32 %157 to i64
  %159 = getelementptr inbounds [262144 x float], ptr %arg26, i64 0, i64 %158
  store float %multiply.1645, ptr %159, align 4
  br label %input_slice_fusion.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn argmemonly
define void @loop_multiply_fusion_46(ptr noalias nocapture align 16 dereferenceable(8192000) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !59
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !49
  %2 = shl nuw nsw i32 %0, 9
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or disjoint i32 %2, %3
  %4 = load float, ptr %arg1, align 16
  %5 = zext nneg i32 %linear_index_base to i64
  %6 = getelementptr float, ptr %arg0, i64 %5
  %7 = load float, ptr %6, align 16
  %multiply.1227 = fmul float %7, %4
  store float %multiply.1227, ptr %6, align 16
  %8 = getelementptr inbounds i8, ptr %6, i64 4
  %9 = load float, ptr %8, align 4
  %multiply.12271 = fmul float %4, %9
  store float %multiply.12271, ptr %8, align 4
  %10 = getelementptr inbounds i8, ptr %6, i64 8
  %11 = load float, ptr %10, align 8
  %multiply.12272 = fmul float %4, %11
  store float %multiply.12272, ptr %10, align 8
  %12 = getelementptr inbounds i8, ptr %6, i64 12
  %13 = load float, ptr %12, align 4
  %multiply.12273 = fmul float %4, %13
  store float %multiply.12273, ptr %12, align 4
  %14 = zext nneg i32 %linear_index_base to i64
  %15 = getelementptr float, ptr %arg0, i64 %14
  %16 = getelementptr i8, ptr %15, i64 2359296
  %17 = load float, ptr %16, align 16
  %multiply.1227.1 = fmul float %17, %4
  store float %multiply.1227.1, ptr %16, align 16
  %18 = getelementptr i8, ptr %15, i64 2359300
  %19 = load float, ptr %18, align 4
  %multiply.12271.1 = fmul float %4, %19
  store float %multiply.12271.1, ptr %18, align 4
  %20 = getelementptr i8, ptr %15, i64 2359304
  %21 = load float, ptr %20, align 8
  %multiply.12272.1 = fmul float %4, %21
  store float %multiply.12272.1, ptr %20, align 8
  %22 = getelementptr i8, ptr %15, i64 2359308
  %23 = load float, ptr %22, align 4
  %multiply.12273.1 = fmul float %4, %23
  store float %multiply.12273.1, ptr %22, align 4
  %24 = icmp ult i32 %linear_index_base, 868352
  br i1 %24, label %loop_multiply_fusion.46.in_bounds-true.2, label %loop_multiply_fusion.46.in_bounds-after.2

loop_multiply_fusion.46.in_bounds-true.2:         ; preds = %entry
  %25 = zext nneg i32 %linear_index_base to i64
  %26 = getelementptr float, ptr %arg0, i64 %25
  %27 = getelementptr i8, ptr %26, i64 4718592
  %28 = load float, ptr %27, align 16
  %multiply.1227.2 = fmul float %28, %4
  store float %multiply.1227.2, ptr %27, align 16
  %29 = getelementptr i8, ptr %26, i64 4718596
  %30 = load float, ptr %29, align 4
  %multiply.12271.2 = fmul float %4, %30
  store float %multiply.12271.2, ptr %29, align 4
  %31 = getelementptr i8, ptr %26, i64 4718600
  %32 = load float, ptr %31, align 8
  %multiply.12272.2 = fmul float %4, %32
  store float %multiply.12272.2, ptr %31, align 8
  %33 = getelementptr i8, ptr %26, i64 4718604
  %34 = load float, ptr %33, align 4
  %multiply.12273.2 = fmul float %4, %34
  store float %multiply.12273.2, ptr %33, align 4
  br label %loop_multiply_fusion.46.in_bounds-after.2

loop_multiply_fusion.46.in_bounds-after.2:        ; preds = %loop_multiply_fusion.46.in_bounds-true.2, %entry
  %35 = icmp ult i32 %linear_index_base, 278528
  br i1 %35, label %loop_multiply_fusion.46.in_bounds-true.3, label %loop_multiply_fusion.46.in_bounds-after.3

loop_multiply_fusion.46.in_bounds-true.3:         ; preds = %loop_multiply_fusion.46.in_bounds-after.2
  %36 = zext nneg i32 %linear_index_base to i64
  %37 = getelementptr float, ptr %arg0, i64 %36
  %38 = getelementptr i8, ptr %37, i64 7077888
  %39 = load float, ptr %38, align 16
  %multiply.1227.3 = fmul float %39, %4
  store float %multiply.1227.3, ptr %38, align 16
  %40 = getelementptr i8, ptr %37, i64 7077892
  %41 = load float, ptr %40, align 4
  %multiply.12271.3 = fmul float %4, %41
  store float %multiply.12271.3, ptr %40, align 4
  %42 = getelementptr i8, ptr %37, i64 7077896
  %43 = load float, ptr %42, align 8
  %multiply.12272.3 = fmul float %4, %43
  store float %multiply.12272.3, ptr %42, align 8
  %44 = getelementptr i8, ptr %37, i64 7077900
  %45 = load float, ptr %44, align 4
  %multiply.12273.3 = fmul float %4, %45
  store float %multiply.12273.3, ptr %44, align 4
  br label %loop_multiply_fusion.46.in_bounds-after.3

loop_multiply_fusion.46.in_bounds-after.3:        ; preds = %loop_multiply_fusion.46.in_bounds-true.3, %loop_multiply_fusion.46.in_bounds-after.2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn argmemonly
define void @loop_multiply_fusion_47(ptr noalias nocapture align 16 dereferenceable(8388608) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !59
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !49
  %2 = shl nuw nsw i32 %0, 9
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or disjoint i32 %2, %3
  %4 = load float, ptr %arg1, align 16
  %5 = zext nneg i32 %linear_index_base to i64
  %6 = getelementptr float, ptr %arg0, i64 %5
  %7 = load float, ptr %6, align 16
  %multiply.1249 = fmul float %7, %4
  store float %multiply.1249, ptr %6, align 16
  %8 = getelementptr inbounds i8, ptr %6, i64 4
  %9 = load float, ptr %8, align 4
  %multiply.12491 = fmul float %4, %9
  store float %multiply.12491, ptr %8, align 4
  %10 = getelementptr inbounds i8, ptr %6, i64 8
  %11 = load float, ptr %10, align 8
  %multiply.12492 = fmul float %4, %11
  store float %multiply.12492, ptr %10, align 8
  %12 = getelementptr inbounds i8, ptr %6, i64 12
  %13 = load float, ptr %12, align 4
  %multiply.12493 = fmul float %4, %13
  store float %multiply.12493, ptr %12, align 4
  %14 = zext nneg i32 %linear_index_base to i64
  %15 = getelementptr float, ptr %arg0, i64 %14
  %16 = getelementptr i8, ptr %15, i64 2359296
  %17 = load float, ptr %16, align 16
  %multiply.1249.1 = fmul float %17, %4
  store float %multiply.1249.1, ptr %16, align 16
  %18 = getelementptr i8, ptr %15, i64 2359300
  %19 = load float, ptr %18, align 4
  %multiply.12491.1 = fmul float %4, %19
  store float %multiply.12491.1, ptr %18, align 4
  %20 = getelementptr i8, ptr %15, i64 2359304
  %21 = load float, ptr %20, align 8
  %multiply.12492.1 = fmul float %4, %21
  store float %multiply.12492.1, ptr %20, align 8
  %22 = getelementptr i8, ptr %15, i64 2359308
  %23 = load float, ptr %22, align 4
  %multiply.12493.1 = fmul float %4, %23
  store float %multiply.12493.1, ptr %22, align 4
  %24 = icmp ult i32 %linear_index_base, 917504
  br i1 %24, label %loop_multiply_fusion.47.in_bounds-true.2, label %loop_multiply_fusion.47.in_bounds-after.2

loop_multiply_fusion.47.in_bounds-true.2:         ; preds = %entry
  %25 = zext nneg i32 %linear_index_base to i64
  %26 = getelementptr float, ptr %arg0, i64 %25
  %27 = getelementptr i8, ptr %26, i64 4718592
  %28 = load float, ptr %27, align 16
  %multiply.1249.2 = fmul float %28, %4
  store float %multiply.1249.2, ptr %27, align 16
  %29 = getelementptr i8, ptr %26, i64 4718596
  %30 = load float, ptr %29, align 4
  %multiply.12491.2 = fmul float %4, %30
  store float %multiply.12491.2, ptr %29, align 4
  %31 = getelementptr i8, ptr %26, i64 4718600
  %32 = load float, ptr %31, align 8
  %multiply.12492.2 = fmul float %4, %32
  store float %multiply.12492.2, ptr %31, align 8
  %33 = getelementptr i8, ptr %26, i64 4718604
  %34 = load float, ptr %33, align 4
  %multiply.12493.2 = fmul float %4, %34
  store float %multiply.12493.2, ptr %33, align 4
  br label %loop_multiply_fusion.47.in_bounds-after.2

loop_multiply_fusion.47.in_bounds-after.2:        ; preds = %loop_multiply_fusion.47.in_bounds-true.2, %entry
  %35 = icmp ult i32 %linear_index_base, 327680
  br i1 %35, label %loop_multiply_fusion.47.in_bounds-true.3, label %loop_multiply_fusion.47.in_bounds-after.3

loop_multiply_fusion.47.in_bounds-true.3:         ; preds = %loop_multiply_fusion.47.in_bounds-after.2
  %36 = zext nneg i32 %linear_index_base to i64
  %37 = getelementptr float, ptr %arg0, i64 %36
  %38 = getelementptr i8, ptr %37, i64 7077888
  %39 = load float, ptr %38, align 16
  %multiply.1249.3 = fmul float %39, %4
  store float %multiply.1249.3, ptr %38, align 16
  %40 = getelementptr i8, ptr %37, i64 7077892
  %41 = load float, ptr %40, align 4
  %multiply.12491.3 = fmul float %4, %41
  store float %multiply.12491.3, ptr %40, align 4
  %42 = getelementptr i8, ptr %37, i64 7077896
  %43 = load float, ptr %42, align 8
  %multiply.12492.3 = fmul float %4, %43
  store float %multiply.12492.3, ptr %42, align 8
  %44 = getelementptr i8, ptr %37, i64 7077900
  %45 = load float, ptr %44, align 4
  %multiply.12493.3 = fmul float %4, %45
  store float %multiply.12493.3, ptr %44, align 4
  br label %loop_multiply_fusion.47.in_bounds-after.3

loop_multiply_fusion.47.in_bounds-after.3:        ; preds = %loop_multiply_fusion.47.in_bounds-true.3, %loop_multiply_fusion.47.in_bounds-after.2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn argmemonly
define void @loop_multiply_fusion_48(ptr noalias nocapture align 16 dereferenceable(2359296) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture align 16 dereferenceable(2359296) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg3, ptr noalias nocapture align 16 dereferenceable(2359296) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg5, ptr noalias nocapture align 16 dereferenceable(2359296) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg7, ptr noalias nocapture align 16 dereferenceable(2359296) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg9, ptr noalias nocapture align 16 dereferenceable(2359296) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg11) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !51
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !60
  %2 = shl nuw nsw i32 %1, 10
  %3 = shl nuw nsw i32 %0, 2
  %linear_index_base = or disjoint i32 %2, %3
  %4 = zext nneg i32 %linear_index_base to i64
  %5 = getelementptr float, ptr %arg0, i64 %4
  %6 = load float, ptr %5, align 16
  %7 = load float, ptr %arg1, align 16, !invariant.load !47
  %multiply.1623 = fmul float %6, %7
  %8 = getelementptr float, ptr %arg2, i64 %4
  %9 = load float, ptr %8, align 16
  %10 = load float, ptr %arg3, align 16, !invariant.load !47
  %multiply.1624 = fmul float %9, %10
  %11 = getelementptr float, ptr %arg4, i64 %4
  %12 = load float, ptr %11, align 16
  %13 = load float, ptr %arg5, align 16, !invariant.load !47
  %multiply.1625 = fmul float %12, %13
  %14 = getelementptr float, ptr %arg6, i64 %4
  %15 = load float, ptr %14, align 16
  %16 = load float, ptr %arg7, align 16, !invariant.load !47
  %multiply.1626 = fmul float %15, %16
  %17 = getelementptr float, ptr %arg8, i64 %4
  %18 = load float, ptr %17, align 16
  %19 = load float, ptr %arg9, align 16, !invariant.load !47
  %multiply.1627 = fmul float %18, %19
  %20 = getelementptr float, ptr %arg10, i64 %4
  %21 = load float, ptr %20, align 16
  %22 = load float, ptr %arg11, align 16, !invariant.load !47
  %multiply.1628 = fmul float %21, %22
  store float %multiply.1623, ptr %5, align 16
  store float %multiply.1624, ptr %8, align 16
  store float %multiply.1625, ptr %11, align 16
  store float %multiply.1626, ptr %14, align 16
  store float %multiply.1627, ptr %17, align 16
  store float %multiply.1628, ptr %20, align 16
  %23 = getelementptr inbounds i8, ptr %5, i64 4
  %24 = load float, ptr %23, align 4
  %multiply.16231 = fmul float %7, %24
  %25 = getelementptr inbounds i8, ptr %8, i64 4
  %26 = load float, ptr %25, align 4
  %multiply.16242 = fmul float %10, %26
  %27 = getelementptr inbounds i8, ptr %11, i64 4
  %28 = load float, ptr %27, align 4
  %multiply.16253 = fmul float %13, %28
  %29 = getelementptr inbounds i8, ptr %14, i64 4
  %30 = load float, ptr %29, align 4
  %multiply.16264 = fmul float %16, %30
  %31 = getelementptr inbounds i8, ptr %17, i64 4
  %32 = load float, ptr %31, align 4
  %multiply.16275 = fmul float %19, %32
  %33 = getelementptr inbounds i8, ptr %20, i64 4
  %34 = load float, ptr %33, align 4
  %multiply.16286 = fmul float %22, %34
  store float %multiply.16231, ptr %23, align 4
  store float %multiply.16242, ptr %25, align 4
  store float %multiply.16253, ptr %27, align 4
  store float %multiply.16264, ptr %29, align 4
  store float %multiply.16275, ptr %31, align 4
  store float %multiply.16286, ptr %33, align 4
  %35 = getelementptr inbounds i8, ptr %5, i64 8
  %36 = load float, ptr %35, align 8
  %multiply.16237 = fmul float %7, %36
  %37 = getelementptr inbounds i8, ptr %8, i64 8
  %38 = load float, ptr %37, align 8
  %multiply.16248 = fmul float %10, %38
  %39 = getelementptr inbounds i8, ptr %11, i64 8
  %40 = load float, ptr %39, align 8
  %multiply.16259 = fmul float %13, %40
  %41 = getelementptr inbounds i8, ptr %14, i64 8
  %42 = load float, ptr %41, align 8
  %multiply.162610 = fmul float %16, %42
  %43 = getelementptr inbounds i8, ptr %17, i64 8
  %44 = load float, ptr %43, align 8
  %multiply.162711 = fmul float %19, %44
  %45 = getelementptr inbounds i8, ptr %20, i64 8
  %46 = load float, ptr %45, align 8
  %multiply.162812 = fmul float %22, %46
  store float %multiply.16237, ptr %35, align 8
  store float %multiply.16248, ptr %37, align 8
  store float %multiply.16259, ptr %39, align 8
  store float %multiply.162610, ptr %41, align 8
  store float %multiply.162711, ptr %43, align 8
  store float %multiply.162812, ptr %45, align 8
  %47 = getelementptr inbounds i8, ptr %5, i64 12
  %48 = load float, ptr %47, align 4
  %multiply.162313 = fmul float %7, %48
  %49 = getelementptr inbounds i8, ptr %8, i64 12
  %50 = load float, ptr %49, align 4
  %multiply.162414 = fmul float %10, %50
  %51 = getelementptr inbounds i8, ptr %11, i64 12
  %52 = load float, ptr %51, align 4
  %multiply.162515 = fmul float %13, %52
  %53 = getelementptr inbounds i8, ptr %14, i64 12
  %54 = load float, ptr %53, align 4
  %multiply.162616 = fmul float %16, %54
  %55 = getelementptr inbounds i8, ptr %17, i64 12
  %56 = load float, ptr %55, align 4
  %multiply.162717 = fmul float %19, %56
  %57 = getelementptr inbounds i8, ptr %20, i64 12
  %58 = load float, ptr %57, align 4
  %multiply.162818 = fmul float %22, %58
  store float %multiply.162313, ptr %47, align 4
  store float %multiply.162414, ptr %49, align 4
  store float %multiply.162515, ptr %51, align 4
  store float %multiply.162616, ptr %53, align 4
  store float %multiply.162717, ptr %55, align 4
  store float %multiply.162818, ptr %57, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn argmemonly
define void @loop_multiply_fusion_49(ptr noalias nocapture align 16 dereferenceable(9437184) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture align 16 dereferenceable(9437184) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg3, ptr noalias nocapture align 16 dereferenceable(9437184) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg5) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !59
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !49
  %2 = shl nuw nsw i32 %0, 9
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or disjoint i32 %2, %3
  %4 = load float, ptr %arg1, align 16
  %5 = load float, ptr %arg3, align 16
  %6 = load float, ptr %arg5, align 16
  %7 = zext nneg i32 %linear_index_base to i64
  %8 = getelementptr float, ptr %arg0, i64 %7
  %9 = load float, ptr %8, align 16
  %multiply.1629 = fmul float %9, %4
  %10 = getelementptr float, ptr %arg2, i64 %7
  %11 = load float, ptr %10, align 16
  %multiply.1630 = fmul float %11, %5
  %12 = getelementptr float, ptr %arg4, i64 %7
  %13 = load float, ptr %12, align 16
  %multiply.1631 = fmul float %13, %6
  store float %multiply.1629, ptr %8, align 16
  store float %multiply.1630, ptr %10, align 16
  store float %multiply.1631, ptr %12, align 16
  %14 = getelementptr inbounds i8, ptr %8, i64 4
  %15 = load float, ptr %14, align 4
  %multiply.16291 = fmul float %4, %15
  %16 = getelementptr inbounds i8, ptr %10, i64 4
  %17 = load float, ptr %16, align 4
  %multiply.16302 = fmul float %5, %17
  %18 = getelementptr inbounds i8, ptr %12, i64 4
  %19 = load float, ptr %18, align 4
  %multiply.16313 = fmul float %6, %19
  store float %multiply.16291, ptr %14, align 4
  store float %multiply.16302, ptr %16, align 4
  store float %multiply.16313, ptr %18, align 4
  %20 = getelementptr inbounds i8, ptr %8, i64 8
  %21 = load float, ptr %20, align 8
  %multiply.16294 = fmul float %4, %21
  %22 = getelementptr inbounds i8, ptr %10, i64 8
  %23 = load float, ptr %22, align 8
  %multiply.16305 = fmul float %5, %23
  %24 = getelementptr inbounds i8, ptr %12, i64 8
  %25 = load float, ptr %24, align 8
  %multiply.16316 = fmul float %6, %25
  store float %multiply.16294, ptr %20, align 8
  store float %multiply.16305, ptr %22, align 8
  store float %multiply.16316, ptr %24, align 8
  %26 = getelementptr inbounds i8, ptr %8, i64 12
  %27 = load float, ptr %26, align 4
  %multiply.16297 = fmul float %4, %27
  %28 = getelementptr inbounds i8, ptr %10, i64 12
  %29 = load float, ptr %28, align 4
  %multiply.16308 = fmul float %5, %29
  %30 = getelementptr inbounds i8, ptr %12, i64 12
  %31 = load float, ptr %30, align 4
  %multiply.16319 = fmul float %6, %31
  store float %multiply.16297, ptr %26, align 4
  store float %multiply.16308, ptr %28, align 4
  store float %multiply.16319, ptr %30, align 4
  %linear_index_plus_base.1 = add nuw nsw i32 %linear_index_base, 589824
  %32 = zext nneg i32 %linear_index_plus_base.1 to i64
  %33 = getelementptr float, ptr %arg0, i64 %32
  %34 = load float, ptr %33, align 16
  %multiply.1629.1 = fmul float %34, %4
  %35 = getelementptr float, ptr %arg2, i64 %32
  %36 = load float, ptr %35, align 16
  %multiply.1630.1 = fmul float %36, %5
  %37 = getelementptr float, ptr %arg4, i64 %32
  %38 = load float, ptr %37, align 16
  %multiply.1631.1 = fmul float %38, %6
  store float %multiply.1629.1, ptr %33, align 16
  store float %multiply.1630.1, ptr %35, align 16
  store float %multiply.1631.1, ptr %37, align 16
  %39 = getelementptr inbounds i8, ptr %33, i64 4
  %40 = load float, ptr %39, align 4
  %multiply.16291.1 = fmul float %4, %40
  %41 = getelementptr inbounds i8, ptr %35, i64 4
  %42 = load float, ptr %41, align 4
  %multiply.16302.1 = fmul float %5, %42
  %43 = getelementptr inbounds i8, ptr %37, i64 4
  %44 = load float, ptr %43, align 4
  %multiply.16313.1 = fmul float %6, %44
  store float %multiply.16291.1, ptr %39, align 4
  store float %multiply.16302.1, ptr %41, align 4
  store float %multiply.16313.1, ptr %43, align 4
  %45 = getelementptr inbounds i8, ptr %33, i64 8
  %46 = load float, ptr %45, align 8
  %multiply.16294.1 = fmul float %4, %46
  %47 = getelementptr inbounds i8, ptr %35, i64 8
  %48 = load float, ptr %47, align 8
  %multiply.16305.1 = fmul float %5, %48
  %49 = getelementptr inbounds i8, ptr %37, i64 8
  %50 = load float, ptr %49, align 8
  %multiply.16316.1 = fmul float %6, %50
  store float %multiply.16294.1, ptr %45, align 8
  store float %multiply.16305.1, ptr %47, align 8
  store float %multiply.16316.1, ptr %49, align 8
  %51 = getelementptr inbounds i8, ptr %33, i64 12
  %52 = load float, ptr %51, align 4
  %multiply.16297.1 = fmul float %4, %52
  %53 = getelementptr inbounds i8, ptr %35, i64 12
  %54 = load float, ptr %53, align 4
  %multiply.16308.1 = fmul float %5, %54
  %55 = getelementptr inbounds i8, ptr %37, i64 12
  %56 = load float, ptr %55, align 4
  %multiply.16319.1 = fmul float %6, %56
  store float %multiply.16297.1, ptr %51, align 4
  store float %multiply.16308.1, ptr %53, align 4
  store float %multiply.16319.1, ptr %55, align 4
  %linear_index_plus_base.2 = add nuw nsw i32 %linear_index_base, 1179648
  %57 = zext nneg i32 %linear_index_plus_base.2 to i64
  %58 = getelementptr float, ptr %arg0, i64 %57
  %59 = load float, ptr %58, align 16
  %multiply.1629.2 = fmul float %59, %4
  %60 = getelementptr float, ptr %arg2, i64 %57
  %61 = load float, ptr %60, align 16
  %multiply.1630.2 = fmul float %61, %5
  %62 = getelementptr float, ptr %arg4, i64 %57
  %63 = load float, ptr %62, align 16
  %multiply.1631.2 = fmul float %63, %6
  store float %multiply.1629.2, ptr %58, align 16
  store float %multiply.1630.2, ptr %60, align 16
  store float %multiply.1631.2, ptr %62, align 16
  %64 = getelementptr inbounds i8, ptr %58, i64 4
  %65 = load float, ptr %64, align 4
  %multiply.16291.2 = fmul float %4, %65
  %66 = getelementptr inbounds i8, ptr %60, i64 4
  %67 = load float, ptr %66, align 4
  %multiply.16302.2 = fmul float %5, %67
  %68 = getelementptr inbounds i8, ptr %62, i64 4
  %69 = load float, ptr %68, align 4
  %multiply.16313.2 = fmul float %6, %69
  store float %multiply.16291.2, ptr %64, align 4
  store float %multiply.16302.2, ptr %66, align 4
  store float %multiply.16313.2, ptr %68, align 4
  %70 = getelementptr inbounds i8, ptr %58, i64 8
  %71 = load float, ptr %70, align 8
  %multiply.16294.2 = fmul float %4, %71
  %72 = getelementptr inbounds i8, ptr %60, i64 8
  %73 = load float, ptr %72, align 8
  %multiply.16305.2 = fmul float %5, %73
  %74 = getelementptr inbounds i8, ptr %62, i64 8
  %75 = load float, ptr %74, align 8
  %multiply.16316.2 = fmul float %6, %75
  store float %multiply.16294.2, ptr %70, align 8
  store float %multiply.16305.2, ptr %72, align 8
  store float %multiply.16316.2, ptr %74, align 8
  %76 = getelementptr inbounds i8, ptr %58, i64 12
  %77 = load float, ptr %76, align 4
  %multiply.16297.2 = fmul float %4, %77
  %78 = getelementptr inbounds i8, ptr %60, i64 12
  %79 = load float, ptr %78, align 4
  %multiply.16308.2 = fmul float %5, %79
  %80 = getelementptr inbounds i8, ptr %62, i64 12
  %81 = load float, ptr %80, align 4
  %multiply.16319.2 = fmul float %6, %81
  store float %multiply.16297.2, ptr %76, align 4
  store float %multiply.16308.2, ptr %78, align 4
  store float %multiply.16319.2, ptr %80, align 4
  %linear_index_plus_base.3 = add nuw nsw i32 %linear_index_base, 1769472
  %82 = zext nneg i32 %linear_index_plus_base.3 to i64
  %83 = getelementptr float, ptr %arg0, i64 %82
  %84 = load float, ptr %83, align 16
  %multiply.1629.3 = fmul float %84, %4
  %85 = getelementptr float, ptr %arg2, i64 %82
  %86 = load float, ptr %85, align 16
  %multiply.1630.3 = fmul float %86, %5
  %87 = getelementptr float, ptr %arg4, i64 %82
  %88 = load float, ptr %87, align 16
  %multiply.1631.3 = fmul float %88, %6
  store float %multiply.1629.3, ptr %83, align 16
  store float %multiply.1630.3, ptr %85, align 16
  store float %multiply.1631.3, ptr %87, align 16
  %89 = getelementptr inbounds i8, ptr %83, i64 4
  %90 = load float, ptr %89, align 4
  %multiply.16291.3 = fmul float %4, %90
  %91 = getelementptr inbounds i8, ptr %85, i64 4
  %92 = load float, ptr %91, align 4
  %multiply.16302.3 = fmul float %5, %92
  %93 = getelementptr inbounds i8, ptr %87, i64 4
  %94 = load float, ptr %93, align 4
  %multiply.16313.3 = fmul float %6, %94
  store float %multiply.16291.3, ptr %89, align 4
  store float %multiply.16302.3, ptr %91, align 4
  store float %multiply.16313.3, ptr %93, align 4
  %95 = getelementptr inbounds i8, ptr %83, i64 8
  %96 = load float, ptr %95, align 8
  %multiply.16294.3 = fmul float %4, %96
  %97 = getelementptr inbounds i8, ptr %85, i64 8
  %98 = load float, ptr %97, align 8
  %multiply.16305.3 = fmul float %5, %98
  %99 = getelementptr inbounds i8, ptr %87, i64 8
  %100 = load float, ptr %99, align 8
  %multiply.16316.3 = fmul float %6, %100
  store float %multiply.16294.3, ptr %95, align 8
  store float %multiply.16305.3, ptr %97, align 8
  store float %multiply.16316.3, ptr %99, align 8
  %101 = getelementptr inbounds i8, ptr %83, i64 12
  %102 = load float, ptr %101, align 4
  %multiply.16297.3 = fmul float %4, %102
  %103 = getelementptr inbounds i8, ptr %85, i64 12
  %104 = load float, ptr %103, align 4
  %multiply.16308.3 = fmul float %5, %104
  %105 = getelementptr inbounds i8, ptr %87, i64 12
  %106 = load float, ptr %105, align 4
  %multiply.16319.3 = fmul float %6, %106
  store float %multiply.16297.3, ptr %101, align 4
  store float %multiply.16308.3, ptr %103, align 4
  store float %multiply.16319.3, ptr %105, align 4
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn argmemonly }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn readnone }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn  }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45}
!llvm.module.flags = !{!46}

!0 = !{ptr @copy_fusion_3, !"kernel", i32 1}
!1 = !{ptr @copy_fusion_3, !"reqntidx", i32 1}
!2 = !{ptr @wrapped_convert_1, !"kernel", i32 1}
!3 = !{ptr @wrapped_convert_1, !"reqntidx", i32 1}
!4 = !{ptr @loop_multiply_fusion_29, !"kernel", i32 1}
!5 = !{ptr @loop_multiply_fusion_29, !"reqntidx", i32 64}
!6 = !{ptr @loop_multiply_fusion_30, !"kernel", i32 1}
!7 = !{ptr @loop_multiply_fusion_30, !"reqntidx", i32 128}
!8 = !{ptr @loop_multiply_fusion_31, !"kernel", i32 1}
!9 = !{ptr @loop_multiply_fusion_31, !"reqntidx", i32 512}
!10 = !{ptr @loop_multiply_fusion_32, !"kernel", i32 1}
!11 = !{ptr @loop_multiply_fusion_32, !"reqntidx", i32 256}
!12 = !{ptr @loop_multiply_fusion_34, !"kernel", i32 1}
!13 = !{ptr @loop_multiply_fusion_34, !"reqntidx", i32 512}
!14 = !{ptr @loop_multiply_fusion_35, !"kernel", i32 1}
!15 = !{ptr @loop_multiply_fusion_35, !"reqntidx", i32 1024}
!16 = !{ptr @loop_multiply_fusion_36, !"kernel", i32 1}
!17 = !{ptr @loop_multiply_fusion_36, !"reqntidx", i32 1024}
!18 = !{ptr @copy_fusion_4, !"kernel", i32 1}
!19 = !{ptr @copy_fusion_4, !"reqntidx", i32 1024}
!20 = !{ptr @loop_multiply_fusion_37, !"kernel", i32 1}
!21 = !{ptr @loop_multiply_fusion_37, !"reqntidx", i32 1024}
!22 = !{ptr @loop_multiply_fusion_38, !"kernel", i32 1}
!23 = !{ptr @loop_multiply_fusion_38, !"reqntidx", i32 256}
!24 = !{ptr @loop_multiply_fusion_39, !"kernel", i32 1}
!25 = !{ptr @loop_multiply_fusion_39, !"reqntidx", i32 256}
!26 = !{ptr @loop_multiply_fusion_40, !"kernel", i32 1}
!27 = !{ptr @loop_multiply_fusion_40, !"reqntidx", i32 256}
!28 = !{ptr @loop_multiply_fusion_41, !"kernel", i32 1}
!29 = !{ptr @loop_multiply_fusion_41, !"reqntidx", i32 256}
!30 = !{ptr @loop_multiply_fusion_42, !"kernel", i32 1}
!31 = !{ptr @loop_multiply_fusion_42, !"reqntidx", i32 256}
!32 = !{ptr @copy_fusion_5, !"kernel", i32 1}
!33 = !{ptr @copy_fusion_5, !"reqntidx", i32 256}
!34 = !{ptr @copy_fusion_6, !"kernel", i32 1}
!35 = !{ptr @copy_fusion_6, !"reqntidx", i32 128}
!36 = !{ptr @input_slice_fusion_1, !"kernel", i32 1}
!37 = !{ptr @input_slice_fusion_1, !"reqntidx", i32 128}
!38 = !{ptr @loop_multiply_fusion_46, !"kernel", i32 1}
!39 = !{ptr @loop_multiply_fusion_46, !"reqntidx", i32 128}
!40 = !{ptr @loop_multiply_fusion_47, !"kernel", i32 1}
!41 = !{ptr @loop_multiply_fusion_47, !"reqntidx", i32 128}
!42 = !{ptr @loop_multiply_fusion_48, !"kernel", i32 1}
!43 = !{ptr @loop_multiply_fusion_48, !"reqntidx", i32 256}
!44 = !{ptr @loop_multiply_fusion_49, !"kernel", i32 1}
!45 = !{ptr @loop_multiply_fusion_49, !"reqntidx", i32 128}
!46 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!47 = !{}
!48 = !{i32 0, i32 64}
!49 = !{i32 0, i32 128}
!50 = !{i32 0, i32 512}
!51 = !{i32 0, i32 256}
!52 = !{i32 0, i32 1024}
!53 = !{i32 0, i32 2}
!54 = !{i32 0, i32 16}
!55 = !{i32 0, i32 36}
!56 = !{i32 0, i32 144}
!57 = !{i32 0, i32 5120}
!58 = !{i32 0, i32 10354}
!59 = !{i32 0, i32 1152}
!60 = !{i32 0, i32 576}
