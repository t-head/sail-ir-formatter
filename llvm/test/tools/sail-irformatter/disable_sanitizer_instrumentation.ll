; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-p3:32:32-p4:32:32-p5:32:32-p6:32:32-p7:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"

%struct.nvshmemi_device_host_state_v1 = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i8, i8, ptr, i64, ptr, ptr, i8, i8, i32, ptr, ptr, ptr, ptr, ptr, %struct.gpu_coll_env_params_v2, ptr, ptr, ptr, ptr, i64, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i64, i32, ptr, ptr, i8, i8, i8 }
%struct.gpu_coll_env_params_v2 = type { i32, i32, i32, i32, i32, i32, i32, i64, i64, i64, i32, i64, i32, i32, i64, i64, [416 x i8] }
%struct.nvshmemi_version_t = type { i32, i32, i32 }
%"struct.heapallocator::ScatterConfig" = type { i32, i16, i16, i16, i8, i32, i32, i32 }
%struct.int4 = type { i32, i32, i32, i32 }

$nvshmemx_int8_broadcast_block = comdat any

$_Z28nvshmemi_barrier_threadgroupIL13threadgroup_t0EEvi = comdat any

$_Z27nvshmemi_memcpy_threadgroupIL13threadgroup_t2EEvPvPKvm = comdat any

$_Z35nvshmemi_proxy_amo_nonfetch_with_epImEvPvT_i14nvshmemi_amo_ti = comdat any

$_Z27nvshmemi_memcpy_threadgroupIL13threadgroup_t0EEvPvPKvm = comdat any

$_Z33nvshmemi_transfer_rma_nbi_with_epIL13threadgroup_t2EL13nvshmemi_op_t1EEvPvS2_mii = comdat any

$_Z28nvshmemi_barrier_threadgroupIL13threadgroup_t2EEvi = comdat any

$_ZNSt17integral_constantIbLb0EE5valueE = comdat any

$_ZNSt17integral_constantIbLb1EE5valueE = comdat any

$_ZNSt5ratioILl1ELl1000000000EE3numE = comdat any

$_ZNSt5ratioILl1ELl1000000000EE3denE = comdat any

$_ZNSt5ratioILl1ELl1EE3numE = comdat any

$_ZNSt5ratioILl1ELl1EE3denE = comdat any

$_ZN4hggc3std3__417integral_constantIbLb0EE5valueE = comdat any

$_ZN4hggc3std3__417integral_constantIbLb1EE5valueE = comdat any

@_ZNSt17integral_constantIbLb0EE5valueE = linkonce_odr dso_local addrspace(4) constant i8 0, comdat, align 1 #0
@_ZNSt17integral_constantIbLb1EE5valueE = linkonce_odr dso_local addrspace(4) constant i8 1, comdat, align 1 #0
@_ZNSt5ratioILl1ELl1000000000EE3numE = linkonce_odr dso_local addrspace(4) constant i64 1, comdat, align 8 #0
@_ZNSt5ratioILl1ELl1000000000EE3denE = linkonce_odr dso_local addrspace(4) constant i64 1000000000, comdat, align 8 #0
@_ZNSt5ratioILl1ELl1EE3numE = linkonce_odr dso_local addrspace(4) constant i64 1, comdat, align 8 #0
@_ZNSt5ratioILl1ELl1EE3denE = linkonce_odr dso_local addrspace(4) constant i64 1, comdat, align 8 #0
@_ZN4hggc3std3__417integral_constantIbLb0EE5valueE = linkonce_odr dso_local addrspace(4) constant i8 0, comdat, align 1 #0
@_ZN4hggc3std3__417integral_constantIbLb1EE5valueE = linkonce_odr dso_local addrspace(4) constant i8 1, comdat, align 1 #0
@nvshmemi_device_state_d = dso_local addrspace(4) externally_initialized global %struct.nvshmemi_device_host_state_v1 zeroinitializer, align 8
@.str.2 = private unnamed_addr addrspace(4) constant [74 x i8] c"%s:%d :%s : block: [%d,%d,%d], thread: [%d,%d,%d] Assertion `%s` failed.\0A\00", align 1
@.str.8 = private unnamed_addr addrspace(4) constant [80 x i8] c"src_pe_world >= src_teami->start && src_pe_world < nvshmemi_device_state_d.npes\00", align 1
@.str.9 = private unnamed_addr addrspace(4) constant [110 x i8] c"/ppuswhome/wensuyang.wsy/workspace/docker/sailSHMEM/src/include/non_abi/device/team/nvshmemi_team_defines.cuh\00", align 1
@__PRETTY_FUNCTION__._Z26nvshmemi_team_translate_peiii = private unnamed_addr addrspace(4) constant [72 x i8] c"int nvshmemi_team_translate_pe(::nvshmem_team_t, int, ::nvshmem_team_t)\00", align 1
@.str.13 = private unnamed_addr addrspace(4) constant [2 x i8] c"0\00", align 1
@nvshmemi_device_lib_version_d = dso_local addrspace(4) externally_initialized global %struct.nvshmemi_version_t { i32 2, i32 0, i32 0 }, align 4
@.str.204 = private unnamed_addr addrspace(4) constant [52 x i8] c"Specified bcast algo:%d not supported, aborting...\0A\00", align 1
@.str.205 = private unnamed_addr addrspace(4) constant [98 x i8] c"/ppuswhome/wensuyang.wsy/workspace/docker/sailSHMEM/src/include/non_abi/device/coll/broadcast.cuh\00", align 1
@__PRETTY_FUNCTION__._Z30nvshmemi_broadcast_threadgroupIaL13threadgroup_t2EEviPT_PKS1_mi = private unnamed_addr addrspace(4) constant [141 x i8] c"void nvshmemi_broadcast_threadgroup(::nvshmem_team_t, T *, const T *, ::size_t, int) [T = signed char, SCOPE = ::nvshmemi_threadgroup_block]\00", align 1
@.str.43.237 = private unnamed_addr addrspace(4) constant [16 x i8] c"__PPU_STRICTFTZ\00", align 1
@.str.61.247 = private unnamed_addr addrspace(4) constant [10 x i8] c"__PPU_FTZ\00", align 1
@.str.1.250 = private unnamed_addr addrspace(4) constant [14 x i8] c"__PPU_PRECDIV\00", align 1
@.str.65.240 = private unnamed_addr addrspace(4) constant [14 x i8] c"__PPU_PRECDIV\00", align 1
@.str.174.227 = private unnamed_addr addrspace(4) constant [10 x i8] c"__PPU_FTZ\00", align 1
@.str.1.175 = private unnamed_addr addrspace(4) constant [14 x i8] c"__PPU_PRECDIV\00", align 1
@.str.1.3.7 = private unnamed_addr addrspace(4) constant [14 x i8] c"__PPU_PRECDIV\00", align 1
@.str.8.236 = private unnamed_addr addrspace(4) constant [12 x i8] c"__HGGC_ARCH\00", align 1
@.str.1.9 = private unnamed_addr addrspace(4) constant [22 x i8] c"__PPU_MATH_CUSTOM_CFG\00", align 1
@.str.2.10 = private unnamed_addr addrspace(4) constant [14 x i8] c"__PPU_PRECDIV\00", align 1
@_ZN13heapallocatorL8heapPropE = internal addrspace(1) global %"struct.heapallocator::ScatterConfig" { i32 4096, i16 8, i16 16, i16 2, i8 0, i32 16, i32 16, i32 128 }, align 8
@_ZN13heapallocatorL8hashPropE = internal addrspace(1) global %struct.int4 { i32 38183, i32 17497, i32 1, i32 1 }, align 8
@llvm.compiler.used = appending global [34 x ptr] [ptr addrspacecast (ptr addrspace(1) @_ZN13heapallocatorL8hashPropE to ptr), ptr addrspacecast (ptr addrspace(1) @_ZN13heapallocatorL8heapPropE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZN4hggc3std3__417integral_constantIbLb0EE5valueE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZN4hggc3std3__417integral_constantIbLb1EE5valueE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZNSt17integral_constantIbLb0EE5valueE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZNSt17integral_constantIbLb1EE5valueE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZNSt5ratioILl1ELl1000000000EE3denE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZNSt5ratioILl1ELl1000000000EE3numE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZNSt5ratioILl1ELl1EE3denE to ptr), ptr addrspacecast (ptr addrspace(4) @_ZNSt5ratioILl1ELl1EE3numE to ptr), ptr @__ppukernel_assert_void, ptr @__ppumathpriv_cnvt_f32_s128_rn_s128, ptr @__ppumathpriv_cnvt_f32_u128_rn_u128, ptr @__ppumathpriv_cnvt_f64_s128_rn_s128, ptr @__ppumathpriv_cnvt_f64_u128_rn_u128, ptr @__ppumathpriv_cnvt_s128_f32_rz_s128, ptr @__ppumathpriv_cnvt_s128_f64_rz_s128, ptr @__ppumathpriv_cnvt_u128_f32_rz_u128, ptr @__ppumathpriv_cnvt_u128_f64_rz_u128, ptr @__ppumathpriv_ddiv_rte_f64, ptr @__ppumathpriv_div_default_f32, ptr @__ppumathpriv_div_f16, ptr @__ppumathpriv_div_s128, ptr @__ppumathpriv_div_u128, ptr @__ppumathpriv_drcp_rte_f64, ptr @__ppumathpriv_rcp_default_f32, ptr @__ppumathpriv_rem_s128, ptr @__ppumathpriv_rem_u128, ptr @__ppupriv_tsm_cas_b32, ptr @__ppupriv_tsm_cas_b32_rtn, ptr @__ppupriv_tsm_cas_b64, ptr @__ppupriv_tsm_cas_b64_rtn, ptr addrspacecast (ptr addrspace(4) @nvshmemi_device_lib_version_d to ptr), ptr addrspacecast (ptr addrspace(4) @nvshmemi_device_state_d to ptr)], section "llvm.metadata"

; Function Attrs: nounwind
define ptx_kernel void @_nvshmem_broadcast(ptr addrspace(1) %0, ptr addrspace(1) %1, i32 %2, ptr addrspace(1) readnone captures(none) %3) local_unnamed_addr #1 !dbg !21 {
  %5 = sext i32 %2 to i64, !dbg !24
  %6 = addrspacecast ptr addrspace(1) %0 to ptr, !dbg !24
  %7 = addrspacecast ptr addrspace(1) %1 to ptr, !dbg !24
  tail call fastcc void @nvshmemx_int8_broadcast_block(ptr %6, ptr %7, i64 %5), !dbg !24
  ret void, !dbg !25
}

; Function Attrs: mustprogress nofree nosync nounwind null_pointer_is_valid willreturn memory(none)
define internal float @__ppumathpriv_cnvt_f32_s128_rn_s128(i128 %0) #2 {
  %2 = trunc i128 %0 to i32
  %3 = lshr i128 %0, 32
  %4 = trunc i128 %3 to i32
  %5 = lshr i128 %0, 64
  %6 = trunc i128 %5 to i32
  %7 = lshr i128 %0, 96
  %8 = trunc nuw i128 %7 to i32
  %9 = and i32 %8, -2147483648
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %16, label %11

11:                                               ; preds = %1
  %12 = tail call i32 @llvm.ppu.sub.co.u32(i32 0, i32 %2) #17
  %13 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 0, i32 %4) #17
  %14 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 0, i32 %6) #17
  %15 = tail call i32 @llvm.ppu.sub.ci.u32(i32 0, i32 %8) #17
  br label %16

16:                                               ; preds = %11, %1
  %17 = phi i32 [ %12, %11 ], [ %2, %1 ]
  %18 = phi i32 [ %13, %11 ], [ %4, %1 ]
  %19 = phi i32 [ %14, %11 ], [ %6, %1 ]
  %20 = phi i32 [ %15, %11 ], [ %8, %1 ]
  %21 = or i32 %20, %19
  %22 = icmp eq i32 %21, 0
  %23 = select i1 %22, i32 %18, i32 %20
  %24 = select i1 %22, i32 %17, i32 %19
  %25 = select i1 %22, i32 0, i32 %18
  %26 = select i1 %22, i32 0, i32 %17
  %27 = select i1 %22, i32 64, i32 0
  %28 = icmp eq i32 %23, 0
  %29 = select i1 %28, i32 0, i32 %26
  %30 = select i1 %28, i32 32, i32 0
  %31 = select i1 %28, i32 %26, i32 %25
  %32 = select i1 %28, i32 %24, i32 %23
  %33 = select i1 %28, i32 %25, i32 %24
  %34 = or disjoint i32 %30, %27
  %35 = tail call i32 @llvm.ctlz.i32(i32 %32, i1 zeroext false) #17, !range !26
  %36 = add nuw nsw i32 %34, %35
  %37 = tail call i32 @llvm.fshl.i32(i32 %32, i32 %33, i32 %35) #17
  %38 = and i32 %35, 31
  %39 = shl i32 %29, %38
  %40 = or i32 %33, %31
  %41 = or i32 %31, %29
  %42 = tail call i32 @llvm.fshl.i32(i32 %40, i32 %41, i32 %35)
  %43 = or i32 %42, %39
  %44 = icmp ne i32 %43, 0
  %45 = zext i1 %44 to i32
  %spec.select = or i32 %37, %45
  %46 = uitofp i32 %spec.select to float
  %47 = bitcast float %46 to i32
  %48 = shl nuw nsw i32 %36, 23
  %reass.sub6 = sub nsw i32 %47, %48
  %49 = add i32 %reass.sub6, 805306368
  %50 = icmp eq i32 %36, 128
  %51 = select i1 %50, i32 0, i32 %49
  %52 = or i32 %51, %9
  %53 = bitcast i32 %52 to float
  ret float %53
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind null_pointer_is_valid willreturn memory(none)
define internal float @__ppumathpriv_cnvt_f32_u128_rn_u128(i128 %0) #3 {
  %.sroa.02.0.extract.trunc = trunc i128 %0 to i32
  %.sroa.43.0.extract.shift = lshr i128 %0, 32
  %.sroa.43.0.extract.trunc = trunc i128 %.sroa.43.0.extract.shift to i32
  %.sroa.5.0.extract.shift = lshr i128 %0, 64
  %.sroa.5.0.extract.trunc = trunc i128 %.sroa.5.0.extract.shift to i32
  %.sroa.64.0.extract.shift = lshr i128 %0, 96
  %.sroa.64.0.extract.trunc = trunc nuw i128 %.sroa.64.0.extract.shift to i32
  %2 = or i32 %.sroa.5.0.extract.trunc, %.sroa.64.0.extract.trunc
  %3 = icmp eq i32 %2, 0
  %4 = select i1 %3, i32 %.sroa.43.0.extract.trunc, i32 %.sroa.64.0.extract.trunc
  %5 = select i1 %3, i32 %.sroa.02.0.extract.trunc, i32 %.sroa.5.0.extract.trunc
  %6 = select i1 %3, i32 0, i32 %.sroa.43.0.extract.trunc
  %7 = select i1 %3, i32 0, i32 %.sroa.02.0.extract.trunc
  %8 = select i1 %3, i32 64, i32 0
  %9 = icmp eq i32 %4, 0
  %10 = select i1 %9, i32 0, i32 %7
  %11 = select i1 %9, i32 32, i32 0
  %12 = select i1 %9, i32 %7, i32 %6
  %13 = select i1 %9, i32 %5, i32 %4
  %14 = select i1 %9, i32 %6, i32 %5
  %15 = or disjoint i32 %11, %8
  %16 = tail call i32 @llvm.ctlz.i32(i32 %13, i1 zeroext false) #17, !range !26
  %17 = add nuw nsw i32 %15, %16
  %18 = tail call i32 @llvm.fshl.i32(i32 %13, i32 %14, i32 %16) #17
  %19 = and i32 %16, 31
  %20 = shl i32 %10, %19
  %21 = or i32 %14, %12
  %22 = or i32 %12, %10
  %23 = tail call i32 @llvm.fshl.i32(i32 %21, i32 %22, i32 %16)
  %24 = or i32 %23, %20
  %25 = icmp ne i32 %24, 0
  %26 = zext i1 %25 to i32
  %spec.select = or i32 %18, %26
  %27 = uitofp i32 %spec.select to float
  %28 = bitcast float %27 to i32
  %29 = shl nuw nsw i32 %17, 23
  %reass.sub6 = sub nsw i32 %28, %29
  %30 = add i32 %reass.sub6, 805306368
  %31 = bitcast i32 %30 to float
  %32 = icmp eq i32 %17, 128
  %33 = select contract i1 %32, float 0.000000e+00, float %31
  ret float %33
}

; Function Attrs: mustprogress nofree nosync nounwind null_pointer_is_valid willreturn memory(none)
define internal double @__ppumathpriv_cnvt_f64_s128_rn_s128(i128 %0) #2 {
  %2 = trunc i128 %0 to i32
  %3 = lshr i128 %0, 32
  %4 = trunc i128 %3 to i32
  %5 = lshr i128 %0, 64
  %6 = trunc i128 %5 to i32
  %7 = lshr i128 %0, 96
  %8 = trunc nuw i128 %7 to i32
  %9 = and i32 %8, -2147483648
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %16, label %11

11:                                               ; preds = %1
  %12 = tail call i32 @llvm.ppu.sub.co.u32(i32 0, i32 %2) #17
  %13 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 0, i32 %4) #17
  %14 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 0, i32 %6) #17
  %15 = tail call i32 @llvm.ppu.sub.ci.u32(i32 0, i32 %8) #17
  br label %16

16:                                               ; preds = %11, %1
  %17 = phi i32 [ %12, %11 ], [ %2, %1 ]
  %18 = phi i32 [ %13, %11 ], [ %4, %1 ]
  %19 = phi i32 [ %14, %11 ], [ %6, %1 ]
  %20 = phi i32 [ %15, %11 ], [ %8, %1 ]
  %21 = or i32 %20, %19
  %22 = icmp eq i32 %21, 0
  %23 = select i1 %22, i32 %18, i32 %20
  %24 = select i1 %22, i32 %17, i32 %19
  %25 = select i1 %22, i32 0, i32 %18
  %26 = select i1 %22, i32 0, i32 %17
  %27 = select i1 %22, i32 64, i32 0
  %28 = icmp eq i32 %23, 0
  %29 = select i1 %28, i32 0, i32 %26
  %30 = select i1 %28, i32 32, i32 0
  %31 = select i1 %28, i32 %26, i32 %25
  %32 = select i1 %28, i32 %24, i32 %23
  %33 = select i1 %28, i32 %25, i32 %24
  %34 = or disjoint i32 %30, %27
  %35 = tail call i32 @llvm.ctlz.i32(i32 %32, i1 zeroext false) #17, !range !26
  %36 = add nuw nsw i32 %34, %35
  %37 = tail call i32 @llvm.fshl.i32(i32 %32, i32 %33, i32 %35) #17
  %38 = tail call i32 @llvm.fshl.i32(i32 %33, i32 %31, i32 %35) #17
  %39 = tail call i32 @llvm.fshl.i32(i32 %31, i32 %29, i32 %35) #17
  %40 = and i32 %35, 31
  %41 = shl i32 %29, %40
  %42 = or i32 %41, %39
  %43 = icmp ne i32 %42, 0
  %44 = zext i1 %43 to i32
  %spec.select = or i32 %38, %44
  %45 = zext i32 %37 to i64
  %46 = shl nuw i64 %45, 32
  %47 = zext i32 %spec.select to i64
  %48 = or disjoint i64 %46, %47
  %49 = uitofp i64 %48 to double
  %50 = bitcast double %49 to i64
  %51 = lshr i64 %50, 32
  %52 = trunc nuw nsw i64 %51 to i32
  %53 = shl nuw nsw i32 %36, 20
  %reass.sub6 = sub nsw i32 %52, %53
  %54 = add i32 %reass.sub6, 67108864
  %55 = zext i32 %54 to i64
  %56 = shl nuw i64 %55, 32
  %57 = and i64 %50, 4294967295
  %58 = or disjoint i64 %56, %57
  %59 = icmp eq i32 %36, 128
  %60 = select i1 %59, i64 0, i64 %58
  %61 = lshr i64 %60, 32
  %62 = trunc nuw i64 %61 to i32
  %63 = or i32 %9, %62
  %64 = zext i32 %63 to i64
  %65 = shl nuw i64 %64, 32
  %66 = and i64 %60, 4294967295
  %67 = or disjoint i64 %65, %66
  %68 = bitcast i64 %67 to double
  ret double %68
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind null_pointer_is_valid willreturn memory(none)
define internal double @__ppumathpriv_cnvt_f64_u128_rn_u128(i128 %0) #3 {
  %.sroa.02.0.extract.trunc = trunc i128 %0 to i32
  %.sroa.43.0.extract.shift = lshr i128 %0, 32
  %.sroa.43.0.extract.trunc = trunc i128 %.sroa.43.0.extract.shift to i32
  %.sroa.5.0.extract.shift = lshr i128 %0, 64
  %.sroa.5.0.extract.trunc = trunc i128 %.sroa.5.0.extract.shift to i32
  %.sroa.64.0.extract.shift = lshr i128 %0, 96
  %.sroa.64.0.extract.trunc = trunc nuw i128 %.sroa.64.0.extract.shift to i32
  %2 = or i32 %.sroa.5.0.extract.trunc, %.sroa.64.0.extract.trunc
  %3 = icmp eq i32 %2, 0
  %4 = select i1 %3, i32 %.sroa.43.0.extract.trunc, i32 %.sroa.64.0.extract.trunc
  %5 = select i1 %3, i32 %.sroa.02.0.extract.trunc, i32 %.sroa.5.0.extract.trunc
  %6 = select i1 %3, i32 0, i32 %.sroa.43.0.extract.trunc
  %7 = select i1 %3, i32 0, i32 %.sroa.02.0.extract.trunc
  %8 = select i1 %3, i32 64, i32 0
  %9 = icmp eq i32 %4, 0
  %10 = select i1 %9, i32 0, i32 %7
  %11 = select i1 %9, i32 32, i32 0
  %12 = select i1 %9, i32 %7, i32 %6
  %13 = select i1 %9, i32 %5, i32 %4
  %14 = select i1 %9, i32 %6, i32 %5
  %15 = or disjoint i32 %11, %8
  %16 = tail call i32 @llvm.ctlz.i32(i32 %13, i1 zeroext false) #17, !range !26
  %17 = add nuw nsw i32 %15, %16
  %18 = tail call i32 @llvm.fshl.i32(i32 %13, i32 %14, i32 %16) #17
  %19 = tail call i32 @llvm.fshl.i32(i32 %14, i32 %12, i32 %16) #17
  %20 = tail call i32 @llvm.fshl.i32(i32 %12, i32 %10, i32 %16) #17
  %21 = and i32 %16, 31
  %22 = shl i32 %10, %21
  %23 = or i32 %22, %20
  %24 = icmp ne i32 %23, 0
  %25 = zext i1 %24 to i32
  %spec.select = or i32 %19, %25
  %26 = zext i32 %18 to i64
  %27 = shl nuw i64 %26, 32
  %28 = zext i32 %spec.select to i64
  %29 = or disjoint i64 %27, %28
  %30 = uitofp i64 %29 to double
  %31 = bitcast double %30 to i64
  %32 = lshr i64 %31, 32
  %33 = trunc nuw nsw i64 %32 to i32
  %34 = shl nuw nsw i32 %17, 20
  %reass.sub6 = sub nsw i32 %33, %34
  %35 = add i32 %reass.sub6, 67108864
  %36 = zext i32 %35 to i64
  %37 = shl nuw i64 %36, 32
  %38 = and i64 %31, 4294967295
  %39 = or disjoint i64 %37, %38
  %40 = bitcast i64 %39 to double
  %41 = icmp eq i32 %17, 128
  %42 = select contract i1 %41, double 0.000000e+00, double %40
  ret double %42
}

; Function Attrs: mustprogress nofree nosync nounwind null_pointer_is_valid willreturn memory(none)
define internal i128 @__ppumathpriv_cnvt_s128_f32_rz_s128(float %0) #2 {
  %2 = bitcast float %0 to i32
  %3 = lshr i32 %2, 23
  %4 = and i32 %2, 2139095040
  %5 = icmp eq i32 %4, 2130706432
  %6 = add nuw nsw i32 %3, 1
  %7 = shl i32 %6, 23
  %8 = select i1 %5, i32 %7, i32 %2
  %9 = select i1 %5, i32 %6, i32 %3
  %10 = and i32 %9, 255
  %11 = sub nsw i32 254, %10
  %12 = shl i32 %8, 8
  %13 = or i32 %12, -2147483648
  %14 = icmp ugt i32 %11, 64
  %15 = sub nsw i32 190, %10
  %16 = select i1 %14, i32 0, i32 %13
  %17 = select i1 %14, i32 %13, i32 0
  %18 = select i1 %14, i32 %15, i32 %11
  %19 = icmp ugt i32 %18, 32
  %20 = add nsw i32 %18, -32
  %21 = select i1 %19, i32 0, i32 %16
  %22 = select i1 %19, i32 %16, i32 0
  %23 = select i1 %19, i32 0, i32 %17
  %24 = select i1 %19, i32 %17, i32 0
  %25 = select i1 %19, i32 %20, i32 %18
  %26 = tail call i32 @llvm.umin.i32(i32 range(i32 -3041, 1151) %25, i32 32)
  %27 = sub nuw nsw i32 32, %26
  %28 = shl i32 %23, %27
  %29 = lshr i32 %24, %26
  %30 = or disjoint i32 %28, %29
  %31 = shl i32 %22, %27
  %32 = lshr i32 %23, %26
  %33 = or disjoint i32 %31, %32
  %34 = shl i32 %21, %27
  %35 = lshr i32 %22, %26
  %36 = or disjoint i32 %34, %35
  %37 = lshr i32 %21, %26
  %38 = icmp samesign ugt i32 %9, 255
  br i1 %38, label %39, label %44

39:                                               ; preds = %1
  %40 = tail call i32 @llvm.ppu.sub.co.u32(i32 0, i32 %30) #17
  %41 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 0, i32 %33) #17
  %42 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 0, i32 %36) #17
  %43 = tail call i32 @llvm.ppu.sub.ci.u32(i32 0, i32 %37) #17
  br label %44

44:                                               ; preds = %39, %1
  %45 = phi i32 [ %40, %39 ], [ %30, %1 ]
  %46 = phi i32 [ %41, %39 ], [ %33, %1 ]
  %47 = phi i32 [ %42, %39 ], [ %36, %1 ]
  %48 = phi i32 [ %43, %39 ], [ %37, %1 ]
  %49 = icmp eq i32 %10, 255
  %50 = select i1 %49, i32 -2147483648, i32 %48
  %51 = icmp eq i32 %8, 2139095040
  %52 = select i1 %51, i32 -1, i32 %45
  %53 = select i1 %51, i32 -1, i32 %46
  %54 = select i1 %51, i32 -1, i32 %47
  %55 = select i1 %51, i32 2147483647, i32 %50
  %56 = zext i32 %55 to i128
  %57 = shl nuw i128 %56, 96
  %58 = zext i32 %54 to i128
  %59 = shl nuw nsw i128 %58, 64
  %60 = or disjoint i128 %57, %59
  %61 = zext i32 %53 to i128
  %62 = shl nuw nsw i128 %61, 32
  %63 = or disjoint i128 %60, %62
  %64 = zext i32 %52 to i128
  %65 = or disjoint i128 %63, %64
  ret i128 %65
}

; Function Attrs: mustprogress nofree nosync nounwind null_pointer_is_valid willreturn memory(none)
define internal i128 @__ppumathpriv_cnvt_s128_f64_rz_s128(double %0) #2 {
  %2 = bitcast double %0 to i64
  %3 = lshr i64 %2, 32
  %4 = trunc nuw i64 %3 to i32
  %5 = trunc i64 %2 to i32
  %6 = lshr i64 %2, 52
  %7 = trunc nuw nsw i64 %6 to i32
  %8 = and i32 %7, 2047
  %9 = icmp samesign ugt i32 %8, 1149
  %10 = icmp ne i32 %8, 2047
  %11 = and i1 %9, %10
  br i1 %11, label %12, label %15

12:                                               ; preds = %1
  %13 = or i32 %7, 2047
  %14 = shl nuw i32 %13, 20
  br label %15

15:                                               ; preds = %12, %1
  %16 = phi i32 [ 2047, %12 ], [ %8, %1 ]
  %17 = phi i32 [ %13, %12 ], [ %7, %1 ]
  %18 = phi i32 [ %14, %12 ], [ %4, %1 ]
  %19 = phi i32 [ 0, %12 ], [ %5, %1 ]
  %20 = sub nsw i32 1150, %16
  %21 = shl i32 %19, 11
  %22 = tail call i32 @llvm.fshl.i32(i32 %18, i32 %19, i32 11)
  %23 = or i32 %22, -2147483648
  %24 = icmp ugt i32 %20, 64
  %25 = sub nsw i32 1086, %16
  %26 = select i1 %24, i32 0, i32 %23
  %27 = select i1 %24, i32 0, i32 %21
  %28 = select i1 %24, i32 %23, i32 0
  %29 = select i1 %24, i32 %21, i32 0
  %30 = select i1 %24, i32 %25, i32 %20
  %31 = icmp ugt i32 %30, 32
  %32 = add nsw i32 %30, -32
  %33 = select i1 %31, i32 0, i32 %26
  %34 = select i1 %31, i32 %26, i32 %27
  %35 = select i1 %31, i32 %27, i32 %28
  %36 = select i1 %31, i32 %28, i32 %29
  %37 = select i1 %31, i32 %32, i32 %30
  %38 = tail call i32 @llvm.umin.i32(i32 range(i32 -3041, 1151) %37, i32 32)
  %39 = sub nuw nsw i32 32, %38
  %40 = shl i32 %35, %39
  %41 = lshr i32 %36, %38
  %42 = or disjoint i32 %40, %41
  %43 = shl i32 %34, %39
  %44 = lshr i32 %35, %38
  %45 = or disjoint i32 %43, %44
  %46 = shl i32 %33, %39
  %47 = lshr i32 %34, %38
  %48 = or disjoint i32 %46, %47
  %49 = lshr i32 %33, %38
  %50 = icmp samesign ugt i32 %17, 2047
  br i1 %50, label %51, label %56

51:                                               ; preds = %15
  %52 = tail call i32 @llvm.ppu.sub.co.u32(i32 0, i32 %42) #17
  %53 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 0, i32 %45) #17
  %54 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 0, i32 %48) #17
  %55 = tail call i32 @llvm.ppu.sub.ci.u32(i32 0, i32 %49) #17
  br label %56

56:                                               ; preds = %51, %15
  %57 = phi i32 [ %52, %51 ], [ %42, %15 ]
  %58 = phi i32 [ %53, %51 ], [ %45, %15 ]
  %59 = phi i32 [ %54, %51 ], [ %48, %15 ]
  %60 = phi i32 [ %55, %51 ], [ %49, %15 ]
  %61 = icmp eq i32 %16, 2047
  %62 = select i1 %61, i32 -2147483648, i32 %60
  %63 = icmp eq i32 %19, 0
  %64 = icmp eq i32 %18, 2146435072
  %65 = and i1 %64, %63
  %66 = zext i32 %62 to i128
  %67 = shl nuw i128 %66, 96
  %68 = zext i32 %59 to i128
  %69 = shl nuw nsw i128 %68, 64
  %70 = or disjoint i128 %67, %69
  %71 = zext i32 %58 to i128
  %72 = shl nuw nsw i128 %71, 32
  %73 = or disjoint i128 %70, %72
  %74 = zext i32 %57 to i128
  %75 = or disjoint i128 %73, %74
  %76 = select i1 %65, i128 170141183460469231731687303715884105727, i128 %75
  ret i128 %76
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind null_pointer_is_valid willreturn memory(none)
define internal i128 @__ppumathpriv_cnvt_u128_f32_rz_u128(float %0) #3 {
  %2 = bitcast float %0 to i32
  %3 = lshr i32 %2, 23
  %4 = sub nsw i32 254, %3
  %5 = shl i32 %2, 8
  %6 = or i32 %5, -2147483648
  %7 = icmp ugt i32 %4, 64
  %8 = sub nsw i32 190, %3
  %9 = select i1 %7, i32 0, i32 %6
  %10 = select i1 %7, i32 %6, i32 0
  %11 = select i1 %7, i32 %8, i32 %4
  %12 = icmp ugt i32 %11, 32
  %13 = add nsw i32 %11, -32
  %14 = select i1 %12, i32 0, i32 %9
  %15 = select i1 %12, i32 %9, i32 0
  %16 = select i1 %12, i32 0, i32 %10
  %17 = select i1 %12, i32 %10, i32 0
  %18 = select i1 %12, i32 %13, i32 %11
  %19 = tail call i32 @llvm.umin.i32(i32 range(i32 -3041, 1151) %18, i32 32)
  %20 = sub nuw nsw i32 32, %19
  %21 = shl i32 %16, %20
  %22 = lshr i32 %17, %19
  %23 = or disjoint i32 %21, %22
  %24 = shl i32 %15, %20
  %25 = lshr i32 %16, %19
  %26 = or disjoint i32 %24, %25
  %27 = shl i32 %14, %20
  %28 = lshr i32 %15, %19
  %29 = or disjoint i32 %27, %28
  %30 = lshr i32 %14, %19
  %31 = and i32 %2, 2139095040
  %32 = icmp eq i32 %31, 2139095040
  %33 = icmp ne i32 %2, -8388608
  %34 = and i1 %33, %32
  %35 = select i1 %34, i32 -2147483648, i32 %30
  %36 = icmp eq i32 %2, 2139095040
  %37 = select i1 %36, i32 -1, i32 %23
  %38 = select i1 %36, i32 -1, i32 %26
  %39 = select i1 %36, i32 -1, i32 %29
  %40 = select i1 %36, i32 -1, i32 %35
  %41 = zext i32 %40 to i128
  %42 = shl nuw i128 %41, 96
  %43 = zext i32 %39 to i128
  %44 = shl nuw nsw i128 %43, 64
  %45 = or disjoint i128 %44, %42
  %46 = zext i32 %38 to i128
  %47 = shl nuw nsw i128 %46, 32
  %48 = or disjoint i128 %45, %47
  %49 = zext i32 %37 to i128
  %50 = or disjoint i128 %48, %49
  ret i128 %50
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind null_pointer_is_valid willreturn memory(none)
define internal i128 @__ppumathpriv_cnvt_u128_f64_rz_u128(double %0) #3 {
  %2 = bitcast double %0 to i64
  %3 = lshr i64 %2, 32
  %4 = trunc nuw i64 %3 to i32
  %5 = trunc i64 %2 to i32
  %6 = lshr i64 %2, 52
  %7 = trunc nuw nsw i64 %6 to i32
  %8 = add nsw i32 %7, -1151
  %9 = icmp ult i32 %8, 896
  %10 = select i1 %9, i32 2146435072, i32 %4
  %11 = select i1 %9, i32 0, i32 %5
  %12 = sub nsw i32 1150, %7
  %13 = shl i32 %11, 11
  %14 = tail call i32 @llvm.fshl.i32(i32 %10, i32 %11, i32 11)
  %15 = or i32 %14, -2147483648
  %16 = icmp ugt i32 %12, 64
  %17 = sub nsw i32 1086, %7
  %18 = select i1 %16, i32 0, i32 %15
  %19 = select i1 %16, i32 0, i32 %13
  %20 = select i1 %16, i32 %15, i32 0
  %21 = select i1 %16, i32 %13, i32 0
  %22 = select i1 %16, i32 %17, i32 %12
  %23 = icmp ugt i32 %22, 32
  %24 = add nsw i32 %22, -32
  %25 = select i1 %23, i32 0, i32 %18
  %26 = select i1 %23, i32 %18, i32 %19
  %27 = select i1 %23, i32 %19, i32 %20
  %28 = select i1 %23, i32 %20, i32 %21
  %29 = select i1 %23, i32 %24, i32 %22
  %30 = tail call i32 @llvm.umin.i32(i32 range(i32 -3041, 1151) %29, i32 32)
  %31 = sub nuw nsw i32 32, %30
  %32 = shl i32 %27, %31
  %33 = lshr i32 %28, %30
  %34 = or disjoint i32 %32, %33
  %35 = shl i32 %26, %31
  %36 = lshr i32 %27, %30
  %37 = or disjoint i32 %35, %36
  %38 = shl i32 %25, %31
  %39 = lshr i32 %26, %30
  %40 = or disjoint i32 %38, %39
  %41 = lshr i32 %25, %30
  %42 = and i32 %7, 2047
  %43 = icmp eq i32 %42, 2047
  %44 = icmp ne i32 %11, 0
  %45 = icmp ne i32 %10, -1048576
  %46 = or i1 %44, %45
  %47 = select i1 %43, i1 %46, i1 false
  %48 = icmp eq i32 %11, 0
  %49 = icmp eq i32 %10, 2146435072
  %50 = and i1 %48, %49
  %51 = zext i32 %41 to i128
  %52 = shl nuw i128 %51, 96
  %53 = select i1 %47, i128 -170141183460469231731687303715884105728, i128 %52
  %54 = zext i32 %40 to i128
  %55 = shl nuw nsw i128 %54, 64
  %56 = or disjoint i128 %53, %55
  %57 = zext i32 %37 to i128
  %58 = shl nuw nsw i128 %57, 32
  %59 = or disjoint i128 %56, %58
  %60 = zext i32 %34 to i128
  %61 = or disjoint i128 %59, %60
  %62 = select i1 %50, i128 -1, i128 %61
  ret i128 %62
}

; Function Attrs: convergent mustprogress nofree nounwind null_pointer_is_valid willreturn memory(none)
define internal double @__ppumathpriv_ddiv_rte_f64(double %0, double %1) #4 {
  %3 = tail call i32 @__hggc_reflect(ptr addrspacecast (ptr addrspace(4) @.str.43.237 to ptr)) #22
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %__builtin_ppu_ftz_off_start.exit, label %5

5:                                                ; preds = %2
  tail call void @llvm.ppu.ftz.off.start() #22
  br label %__builtin_ppu_ftz_off_start.exit

__builtin_ppu_ftz_off_start.exit:                 ; preds = %2, %5
  %6 = tail call contract fastcc double @_ZL36__ppumathpriv_ddiv_rte_slow_path_f64dd(double %0, double %1) #42
  %7 = tail call i32 @__hggc_reflect(ptr addrspacecast (ptr addrspace(4) @.str.43.237 to ptr)) #22
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %__builtin_ppu_ftz_off_end.exit, label %9

9:                                                ; preds = %__builtin_ppu_ftz_off_start.exit
  tail call void @llvm.ppu.ftz.off.end() #22
  br label %__builtin_ppu_ftz_off_end.exit

__builtin_ppu_ftz_off_end.exit:                   ; preds = %__builtin_ppu_ftz_off_start.exit, %9
  ret double %6
}

; Function Attrs: convergent mustprogress nofree nounwind null_pointer_is_valid willreturn memory(none)
define internal float @__ppumathpriv_div_default_f32(float %0, float %1) #5 {
  %3 = tail call i32 @__hggc_reflect(ptr addrspacecast (ptr addrspace(4) @.str.61.247 to ptr)) #22
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %101, label %5

5:                                                ; preds = %2
  %6 = tail call i32 @__hggc_reflect(ptr addrspacecast (ptr addrspace(4) @.str.1.3.7 to ptr)) #22
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %11

8:                                                ; preds = %5
  %9 = tail call contract float @llvm.ppu.rcp.f32(float %1) #17
  %10 = fmul contract float %0, %9
  br label %__ppumath_div_default_ftz_f32.exit

11:                                               ; preds = %5
  %12 = tail call i32 @llvm.ppu.get.mode.fp.den() #22
  tail call void @llvm.ppu.set.mode.fp.den(i32 0) #22
  %13 = tail call zeroext i1 @llvm.ppu.fdiv.chk(float %0, float %1) #17
  br i1 %13, label %14, label %16

14:                                               ; preds = %11
  %15 = tail call contract float @llvm.ppu.fdiv.fast.after.chk(float %0, float %1) #17
  tail call void @llvm.ppu.set.mode.fp.den(i32 %12) #22
  br label %__ppumath_div_default_ftz_f32.exit

16:                                               ; preds = %11
  tail call void @llvm.ppu.set.mode.fp.den(i32 %12) #22
  %17 = tail call i32 @llvm.ppu.get.mode.fp.den() #22
  %18 = bitcast float %0 to i32
  %19 = lshr i32 %18, 23
  %20 = and i32 %19, 255
  %21 = bitcast float %1 to i32
  %22 = lshr i32 %21, 23
  %23 = and i32 %22, 255
  tail call void @llvm.ppu.set.mode.fp.den(i32 3) #22
  %24 = add nsw i32 %20, -255
  %25 = icmp ult i32 %24, -254
  %26 = add nsw i32 %23, -255
  %27 = icmp ult i32 %26, -254
  %28 = or i1 %25, %27
  br i1 %28, label %29, label %57

29:                                               ; preds = %16
  %30 = tail call contract float @llvm.fabs.f32(float %0) #17
  %31 = tail call contract float @llvm.fabs.f32(float %1) #17
  %32 = fcmp uno float %0, %1
  %33 = insertelement <4 x float> poison, float %0, i64 0
  %34 = insertelement <4 x float> %33, float %1, i64 1
  %35 = insertelement <4 x float> %34, float %30, i64 2
  %36 = insertelement <4 x float> %35, float %31, i64 3
  %37 = fcmp contract oeq <4 x float> %36, <float 0.000000e+00, float 0.000000e+00, float 0x7FF0000000000000, float 0x7FF0000000000000>
  %38 = bitcast <4 x i1> %37 to i4
  %39 = icmp ne i4 %38, 0
  %op.rdx = or i1 %39, %32
  br i1 %op.rdx, label %40, label %57

40:                                               ; preds = %29
  tail call void @llvm.ppu.set.mode.fp.den(i32 3) #22
  %41 = extractelement <4 x i1> %37, i64 0
  %42 = extractelement <4 x i1> %37, i64 1
  %43 = and i1 %41, %42
  %44 = extractelement <4 x i1> %37, i64 2
  %45 = extractelement <4 x i1> %37, i64 3
  %46 = and i1 %44, %45
  %47 = or i1 %43, %46
  %48 = or i1 %32, %47
  br i1 %48, label %.thread.i, label %49

49:                                               ; preds = %40
  %50 = or i1 %41, %45
  %51 = xor i32 %21, %18
  %52 = and i32 %51, -2147483648
  %53 = or disjoint i32 %52, 2139095040
  %54 = select i1 %50, i32 %52, i32 %53
  %55 = bitcast i32 %54 to float
  br label %.thread.i

.thread.i:                                        ; preds = %49, %40
  %56 = phi float [ 0x7FF8000000000000, %40 ], [ %55, %49 ]
  tail call void @llvm.ppu.set.mode.fp.den(i32 %17) #22
  br label %99

57:                                               ; preds = %29, %16
  tail call void @llvm.ppu.set.mode.fp.den(i32 0) #22
  %.neg1.i = add i32 %18, 1065353216
  %58 = shl nuw nsw i32 %20, 23
  %59 = sub i32 %.neg1.i, %58
  %60 = bitcast i32 %59 to float
  %.neg3.i = add i32 %21, 1065353216
  %61 = shl nuw nsw i32 %23, 23
  %62 = sub i32 %.neg3.i, %61
  %63 = bitcast i32 %62 to float
  %64 = tail call contract float @llvm.ppu.rcp.f32(float %63) #17
  %65 = fmul contract float %64, %63
  %66 = fsub contract float 1.000000e+00, %65
  %67 = fmul contract float %64, %66
  %68 = fadd contract float %64, %67
  %69 = fmul contract float %68, %60
  %70 = fmul contract float %69, %63
  %71 = fsub contract float %60, %70
  %72 = fmul contract float %68, %71
  %73 = fadd contract float %69, %72
  %74 = fmul contract float %73, %63
  %75 = fsub contract float %60, %74
  tail call void @llvm.ppu.set.mode.fp.den(i32 3) #22
  %76 = fmul contract float %68, %75
  %77 = fadd contract float %73, %76
  tail call void @llvm.ppu.set.mode.fp.den(i32 0) #22
  %78 = bitcast float %77 to i32
  %79 = lshr i32 %78, 23
  %80 = and i32 %79, 255
  %81 = sub nsw i32 %20, %23
  %82 = add nsw i32 %80, %81
  %83 = add nsw i32 %82, -1
  %84 = icmp ult i32 %83, 254
  br i1 %84, label %85, label %89

85:                                               ; preds = %57
  %86 = shl nsw i32 %81, 23
  %87 = add nsw i32 %86, %78
  %88 = bitcast i32 %87 to float
  tail call void @llvm.ppu.set.mode.fp.den(i32 %17) #22
  br label %99

89:                                               ; preds = %57
  %90 = and i32 %78, -2147483648
  %91 = bitcast i32 %90 to float
  %92 = icmp sgt i32 %82, 254
  br i1 %92, label %93, label %95

93:                                               ; preds = %89
  %94 = tail call float @llvm.copysign.f32(float 0x7FF0000000000000, float %77)
  tail call void @llvm.ppu.set.mode.fp.den(i32 %17) #22
  br label %99

95:                                               ; preds = %89
  %96 = icmp sgt i32 %82, 0
  br i1 %96, label %97, label %98

97:                                               ; preds = %95
  tail call void @llvm.ppu.set.mode.fp.den(i32 %17) #22
  br label %99

98:                                               ; preds = %95
  tail call void @llvm.ppu.set.mode.fp.den(i32 %17) #22
  br label %99

99:                                               ; preds = %98, %97, %93, %85, %.thread.i
  %100 = phi float [ %88, %85 ], [ %94, %93 ], [ %77, %97 ], [ %91, %98 ], [ %56, %.thread.i ]
  tail call void @llvm.ppu.set.mode.fp.den(i32 %12) #22
  br label %__ppumath_div_default_ftz_f32.exit

101:                                              ; preds = %2
  %102 = tail call i32 @__hggc_reflect(ptr addrspacecast (ptr addrspace(4) @.str.1.250 to ptr)) #22
  %103 = icmp eq i32 %102, 0
  br i1 %103, label %104, label %118

104:                                              ; preds = %101
  %105 = tail call contract float @llvm.fabs.f32(float %1) #17
  %106 = fcmp contract ogt float %105, 0x47D0000000000000
  %107 = fmul contract float %0, 2.500000e-01
  %108 = fmul contract float %1, 2.500000e-01
  %109 = select i1 %106, float %108, float %1
  %110 = select i1 %106, float %107, float %0
  %111 = fcmp contract olt float %105, 0x3810000000000000
  %112 = fmul contract float %110, 0x4170000000000000
  %113 = fmul contract float %109, 0x4170000000000000
  %114 = select i1 %111, float %113, float %109
  %115 = select i1 %111, float %112, float %110
  %116 = tail call contract float @llvm.ppu.rcp.f32(float %114) #17
  %117 = fmul contract float %115, %116
  br label %__ppumath_div_default_ftz_f32.exit

118:                                              ; preds = %101
  %119 = tail call zeroext i1 @llvm.ppu.fdiv.chk(float %0, float %1) #17
  br i1 %119, label %120, label %122

120:                                              ; preds = %118
  %121 = tail call contract float @llvm.ppu.fdiv.fast.after.chk(float %0, float %1) #17
  br label %__ppumath_div_default_ftz_f32.exit

122:                                              ; preds = %118
  %123 = tail call contract fastcc float @_ZL35__ppumathpriv_div_rte_slow_path_f32ff(float %0, float %1) #43
  br label %__ppumath_div_default_ftz_f32.exit

__ppumath_div_default_ftz_f32.exit:               ; preds = %99, %14, %8, %122, %120, %104
  %124 = phi float [ %117, %104 ], [ %121, %120 ], [ %123, %122 ], [ %10, %8 ], [ %15, %14 ], [ %100, %99 ]
  ret float %124
}

; Function Attrs: convergent mustprogress nofree nounwind null_pointer_is_valid willreturn memory(none)
define internal float @__ppumathpriv_div_f16(float %0, float %1) #5 {
  %3 = tail call contract float @llvm.ppu.rcp.f32(float %1) #17
  %4 = fmul contract float %0, %3
  %5 = tail call i32 @__hggc_reflect(ptr addrspacecast (ptr addrspace(4) @.str.65.240 to ptr)) #22
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %17, label %7

7:                                                ; preds = %2
  %8 = fptrunc float %4 to half
  %9 = tail call half @llvm.fabs.f16(half %8)
  %10 = tail call fastcc zeroext i1 @__llvm_ppu_fcmp_olt_f16(half %9, half 0xH008F) #17
  %11 = fcmp une half %8, 0xH0000
  %or.cond.not = select i1 %10, i1 %11, i1 false
  br i1 %or.cond.not, label %12, label %17

12:                                               ; preds = %7
  %13 = fmul contract float %1, %4
  %14 = fsub contract float %0, %13
  %15 = fmul contract float %3, %14
  %16 = fadd contract float %4, %15
  br label %17

17:                                               ; preds = %7, %12, %2
  %18 = phi float [ %4, %2 ], [ %16, %12 ], [ %4, %7 ]
  ret float %18
}

; Function Attrs: mustprogress nofree nosync nounwind null_pointer_is_valid willreturn memory(none)
define internal i128 @__ppumathpriv_div_s128(i128 %0, i128 %1) #2 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.int4, align 16
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %3) #17
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4) #17
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %5) #17
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %6) #17
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %7) #17
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %8) #17
  %9 = trunc i128 %0 to i32
  %10 = lshr i128 %0, 32
  %11 = trunc i128 %10 to i32
  %12 = lshr i128 %0, 64
  %13 = trunc i128 %12 to i32
  %14 = lshr i128 %0, 96
  %15 = trunc nuw i128 %14 to i32
  %16 = icmp slt i128 %0, 0
  %17 = tail call i32 @llvm.ppu.sub.co.u32(i32 0, i32 %9) #17
  %18 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 0, i32 %11) #17
  %19 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 0, i32 %13) #17
  %20 = tail call i32 @llvm.ppu.sub.ci.u32(i32 0, i32 %15) #17
  %21 = select i1 %16, i32 %17, i32 %9
  %22 = select i1 %16, i32 %18, i32 %11
  %23 = select i1 %16, i32 %19, i32 %13
  %24 = select i1 %16, i32 %20, i32 %15
  %25 = trunc i128 %1 to i32
  %26 = lshr i128 %1, 32
  %27 = trunc i128 %26 to i32
  %28 = lshr i128 %1, 64
  %29 = trunc i128 %28 to i32
  %30 = lshr i128 %1, 96
  %31 = trunc nuw i128 %30 to i32
  %32 = icmp slt i128 %1, 0
  %33 = tail call i32 @llvm.ppu.sub.co.u32(i32 0, i32 %25) #17
  %34 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 0, i32 %27) #17
  %35 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 0, i32 %29) #17
  %36 = tail call i32 @llvm.ppu.sub.ci.u32(i32 0, i32 %31) #17
  %37 = select i1 %32, i32 %33, i32 %25
  %38 = select i1 %32, i32 %34, i32 %27
  %39 = select i1 %32, i32 %35, i32 %29
  %40 = select i1 %32, i32 %36, i32 %31
  %41 = or i32 %40, %39
  %42 = icmp eq i32 %41, 0
  %43 = select i1 %42, i32 %38, i32 %40
  %44 = getelementptr inbounds nuw i8, ptr %8, i64 12
  %45 = select i1 %42, i32 %37, i32 %39
  %46 = getelementptr inbounds nuw i8, ptr %8, i64 8
  %47 = select i1 %42, i32 0, i32 %38
  %48 = getelementptr inbounds nuw i8, ptr %8, i64 4
  %49 = select i1 %42, i32 0, i32 %37
  %50 = select i1 %42, i32 64, i32 0
  %51 = icmp eq i32 %43, 0
  %52 = select i1 %51, i32 0, i32 %49
  %53 = select i1 %51, i32 32, i32 0
  %54 = select i1 %51, i32 %49, i32 %47
  %55 = select i1 %51, i32 %45, i32 %43
  %56 = select i1 %51, i32 %47, i32 %45
  %57 = or disjoint i32 %53, %50
  %58 = tail call i32 @llvm.ctlz.i32(i32 %55, i1 zeroext false) #17, !range !26
  %59 = add nuw nsw i32 %57, %58
  %60 = tail call i32 @llvm.fshl.i32(i32 %55, i32 %56, i32 %58) #17
  store i32 %60, ptr %44, align 4, !tbaa !27
  %61 = tail call i32 @llvm.fshl.i32(i32 %56, i32 %54, i32 %58) #17
  store i32 %61, ptr %46, align 8, !tbaa !32
  %62 = tail call i32 @llvm.fshl.i32(i32 %54, i32 %52, i32 %58) #17
  store i32 %62, ptr %48, align 4, !tbaa !33
  %63 = and i32 %58, 31
  %64 = shl i32 %52, %63
  store i32 %64, ptr %8, align 16, !tbaa !34
  %65 = shl i32 %21, %63
  store i32 %65, ptr %3, align 4, !tbaa !35
  %66 = tail call i32 @llvm.fshl.i32(i32 %22, i32 %21, i32 range(i32 0, 160) %58)
  store i32 %66, ptr %4, align 4, !tbaa !35
  %67 = tail call i32 @llvm.fshl.i32(i32 %23, i32 %22, i32 range(i32 0, 160) %58)
  store i32 %67, ptr %5, align 4, !tbaa !35
  %68 = tail call i32 @llvm.fshl.i32(i32 %24, i32 %23, i32 range(i32 0, 160) %58)
  store i32 %68, ptr %6, align 4, !tbaa !35
  %69 = tail call i32 @llvm.fshl.i32(i32 0, i32 %24, i32 range(i32 0, 160) %58)
  store i32 %69, ptr %7, align 4, !tbaa !35
  %70 = zext i32 %60 to i64
  %71 = zext i32 %61 to i64
  %72 = tail call i32 @llvm.ppu.prmt(i32 %60, i32 63, i32 17185) #17
  %73 = bitcast i32 %72 to float
  %74 = tail call contract float @llvm.ppu.rcp.f32(float %73) #17
  %75 = bitcast float %74 to i32
  %76 = tail call i32 @llvm.ppu.mul.u32(i32 %75, i32 512) #17
  %77 = tail call i32 @llvm.ppu.add.u32(i32 %76, i32 -512) #17
  %78 = zext i32 %77 to i64
  %79 = mul nuw i64 %78, %71
  %80 = ashr i64 %79, 32
  %81 = sub nuw nsw i64 -4294967296, %78
  %82 = mul i64 %81, %70
  %83 = add nsw i64 %80, %71
  %84 = sub i64 %82, %83
  %85 = lshr i64 %84, 32
  %86 = trunc nuw i64 %85 to i32
  %87 = trunc i64 %84 to i32
  %88 = icmp sgt i64 %84, -1
  %89 = select i1 %88, i32 %77, i32 0
  %90 = lshr i64 %84, 63
  %91 = trunc nuw nsw i64 %90 to i32
  %92 = xor i32 %91, 1
  %93 = and i64 %84, 4294967295
  %94 = mul nuw i64 %93, %78
  %95 = lshr i64 %94, 32
  %96 = trunc nuw i64 %95 to i32
  %97 = tail call i32 @llvm.ppu.add.co.u32(i32 %96, i32 -2147483648) #17
  %98 = tail call i32 @llvm.ppu.add.ci.u32(i32 0, i32 0) #17
  %99 = mul i32 %77, %86
  %100 = tail call i32 @llvm.ppu.add.co.u32(i32 %99, i32 %97) #17
  %101 = mul nuw i64 %85, %78
  %102 = lshr i64 %101, 32
  %103 = trunc nuw i64 %102 to i32
  %104 = tail call i32 @llvm.ppu.add.ci.u32(i32 %103, i32 %98) #17
  %105 = tail call i32 @llvm.ppu.add.co.u32(i32 %100, i32 %87) #17
  %106 = tail call i32 @llvm.ppu.add.co.ci.u32(i32 %104, i32 %86) #17
  %107 = tail call i32 @llvm.ppu.add.ci.u32(i32 0, i32 0) #17
  %108 = tail call i32 @llvm.ppu.add.co.u32(i32 %106, i32 %89) #17
  %109 = tail call i32 @llvm.ppu.add.ci.u32(i32 %107, i32 %92) #17
  %110 = icmp eq i32 %109, 2
  %111 = select i1 %110, i32 -1, i32 %108
  %112 = zext i32 %111 to i64
  %113 = mul nuw i64 %112, %71
  %114 = ashr i64 %113, 32
  %115 = mul nuw i64 %112, %70
  %116 = add i64 %114, %115
  %117 = trunc i64 %116 to i32
  %118 = lshr i64 %116, 32
  %119 = trunc nuw i64 %118 to i32
  %120 = tail call i32 @llvm.ppu.add.co.u32(i32 %117, i32 %61) #17
  %121 = tail call i32 @llvm.ppu.add.co.ci.u32(i32 %119, i32 %60) #17
  %122 = tail call i32 @llvm.ppu.add.ci.u32(i32 0, i32 0) #17
  %123 = icmp eq i32 %122, 0
  %124 = icmp ne i32 %111, -1
  %125 = and i1 %124, %123
  %126 = zext i1 %125 to i32
  %127 = add i32 %111, %126
  br label %130

128:                                              ; preds = %130
  %129 = xor i1 %16, %32
  br i1 %129, label %138, label %143

130:                                              ; preds = %130, %2
  %131 = phi i32 [ 0, %2 ], [ %132, %130 ]
  %132 = phi i32 [ 0, %2 ], [ %134, %130 ]
  %133 = phi i32 [ 0, %2 ], [ %136, %130 ]
  %134 = phi i32 [ 0, %2 ], [ %135, %130 ]
  %135 = call fastcc i32 @__ppumathpriv_div_full_qs_u128(ptr nonnull %3, ptr nonnull %4, ptr nonnull %5, ptr nonnull %6, ptr nonnull %7, ptr nonnull byval(%struct.int4) align 16 %8, i32 %127) #17
  %136 = add nuw nsw i32 %133, 32
  %137 = icmp samesign ugt i32 %136, %59
  br i1 %137, label %128, label %130, !llvm.loop !36

138:                                              ; preds = %128
  %139 = tail call i32 @llvm.ppu.sub.co.u32(i32 0, i32 %135) #17
  %140 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 0, i32 %134) #17
  %141 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 0, i32 %132) #17
  %142 = tail call i32 @llvm.ppu.sub.ci.u32(i32 0, i32 %131) #17
  br label %143

143:                                              ; preds = %138, %128
  %144 = phi i32 [ %139, %138 ], [ %135, %128 ]
  %145 = phi i32 [ %140, %138 ], [ %134, %128 ]
  %146 = phi i32 [ %141, %138 ], [ %132, %128 ]
  %147 = phi i32 [ %142, %138 ], [ %131, %128 ]
  %148 = icmp eq i32 %59, 128
  %149 = select i1 %148, i32 -1, i32 %147
  %150 = select i1 %148, i32 -1, i32 %146
  %151 = select i1 %148, i32 -1, i32 %145
  %152 = select i1 %148, i32 -1, i32 %144
  %153 = zext i32 %149 to i128
  %154 = shl nuw i128 %153, 96
  %155 = zext i32 %150 to i128
  %156 = shl nuw nsw i128 %155, 64
  %157 = or disjoint i128 %154, %156
  %158 = zext i32 %151 to i128
  %159 = shl nuw nsw i128 %158, 32
  %160 = or disjoint i128 %157, %159
  %161 = zext i32 %152 to i128
  %162 = or disjoint i128 %160, %161
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %8) #17
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %7) #17
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %6) #17
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %5) #17
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #17
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %3) #17
  ret i128 %162
}

; Function Attrs: mustprogress nofree nosync nounwind null_pointer_is_valid willreturn memory(none)
define internal i128 @__ppumathpriv_div_u128(i128 %0, i128 %1) #2 {
  %3 = trunc i128 %0 to i32
  %4 = lshr i128 %0, 32
  %5 = trunc i128 %4 to i32
  %6 = lshr i128 %0, 64
  %7 = trunc i128 %6 to i32
  %8 = lshr i128 %0, 96
  %9 = trunc nuw i128 %8 to i32
  %.sroa.05.0.extract.trunc = trunc i128 %1 to i32
  %.sroa.46.0.extract.shift = lshr i128 %1, 32
  %.sroa.46.0.extract.trunc = trunc i128 %.sroa.46.0.extract.shift to i32
  %.sroa.5.0.extract.shift = lshr i128 %1, 64
  %.sroa.5.0.extract.trunc = trunc i128 %.sroa.5.0.extract.shift to i32
  %.sroa.67.0.extract.shift = lshr i128 %1, 96
  %.sroa.67.0.extract.trunc = trunc nuw i128 %.sroa.67.0.extract.shift to i32
  %10 = or i32 %.sroa.5.0.extract.trunc, %.sroa.67.0.extract.trunc
  %11 = icmp eq i32 %10, 0
  %12 = select i1 %11, i32 %.sroa.46.0.extract.trunc, i32 %.sroa.67.0.extract.trunc
  %13 = select i1 %11, i32 %.sroa.05.0.extract.trunc, i32 %.sroa.5.0.extract.trunc
  %14 = select i1 %11, i32 0, i32 %.sroa.46.0.extract.trunc
  %15 = select i1 %11, i32 0, i32 %.sroa.05.0.extract.trunc
  %16 = select i1 %11, i32 64, i32 0
  %17 = icmp eq i32 %12, 0
  %18 = select i1 %17, i32 0, i32 %15
  %19 = select i1 %17, i32 32, i32 0
  %20 = select i1 %17, i32 %15, i32 %14
  %21 = select i1 %17, i32 %13, i32 %12
  %22 = select i1 %17, i32 %14, i32 %13
  %23 = or disjoint i32 %19, %16
  %24 = tail call i32 @llvm.ctlz.i32(i32 %21, i1 zeroext false) #17, !range !26
  %25 = add nuw nsw i32 %23, %24
  %26 = tail call i32 @llvm.fshl.i32(i32 %21, i32 %22, i32 %24) #17
  %27 = tail call i32 @llvm.fshl.i32(i32 %22, i32 %20, i32 %24) #17
  %28 = tail call i32 @llvm.fshl.i32(i32 %20, i32 %18, i32 %24) #17
  %29 = and i32 %24, 31
  %30 = shl i32 %18, %29
  %31 = shl i32 %3, %29
  %32 = tail call i32 @llvm.fshl.i32(i32 %5, i32 %3, i32 range(i32 0, 160) %24)
  %33 = tail call i32 @llvm.fshl.i32(i32 %7, i32 %5, i32 range(i32 0, 160) %24)
  %34 = tail call i32 @llvm.fshl.i32(i32 %9, i32 %7, i32 range(i32 0, 160) %24)
  %35 = tail call i32 @llvm.fshl.i32(i32 0, i32 %9, i32 range(i32 0, 160) %24)
  %36 = zext i32 %26 to i64
  %37 = zext i32 %27 to i64
  %38 = tail call i32 @llvm.ppu.prmt(i32 %26, i32 63, i32 17185) #17
  %39 = bitcast i32 %38 to float
  %40 = tail call contract float @llvm.ppu.rcp.f32(float %39) #17
  %41 = bitcast float %40 to i32
  %42 = tail call i32 @llvm.ppu.mul.u32(i32 %41, i32 512) #17
  %43 = tail call i32 @llvm.ppu.add.u32(i32 %42, i32 -512) #17
  %44 = zext i32 %43 to i64
  %45 = mul nuw i64 %44, %37
  %46 = ashr i64 %45, 32
  %47 = sub nuw nsw i64 -4294967296, %44
  %48 = mul i64 %47, %36
  %49 = add nsw i64 %46, %37
  %50 = sub i64 %48, %49
  %51 = lshr i64 %50, 32
  %52 = trunc nuw i64 %51 to i32
  %53 = trunc i64 %50 to i32
  %54 = icmp sgt i64 %50, -1
  %55 = select i1 %54, i32 %43, i32 0
  %56 = lshr i64 %50, 63
  %57 = trunc nuw nsw i64 %56 to i32
  %58 = xor i32 %57, 1
  %59 = and i64 %50, 4294967295
  %60 = mul nuw i64 %59, %44
  %61 = lshr i64 %60, 32
  %62 = trunc nuw i64 %61 to i32
  %63 = tail call i32 @llvm.ppu.add.co.u32(i32 %62, i32 -2147483648) #17
  %64 = tail call i32 @llvm.ppu.add.ci.u32(i32 0, i32 0) #17
  %65 = mul i32 %43, %52
  %66 = tail call i32 @llvm.ppu.add.co.u32(i32 %65, i32 %63) #17
  %67 = mul nuw i64 %51, %44
  %68 = lshr i64 %67, 32
  %69 = trunc nuw i64 %68 to i32
  %70 = tail call i32 @llvm.ppu.add.ci.u32(i32 %69, i32 %64) #17
  %71 = tail call i32 @llvm.ppu.add.co.u32(i32 %66, i32 %53) #17
  %72 = tail call i32 @llvm.ppu.add.co.ci.u32(i32 %70, i32 %52) #17
  %73 = tail call i32 @llvm.ppu.add.ci.u32(i32 0, i32 0) #17
  %74 = tail call i32 @llvm.ppu.add.co.u32(i32 %72, i32 %55) #17
  %75 = tail call i32 @llvm.ppu.add.ci.u32(i32 %73, i32 %58) #17
  %76 = icmp eq i32 %75, 2
  %77 = select i1 %76, i32 -1, i32 %74
  %78 = zext i32 %77 to i64
  %79 = mul nuw i64 %78, %37
  %80 = ashr i64 %79, 32
  %81 = mul nuw i64 %78, %36
  %82 = add i64 %80, %81
  %83 = trunc i64 %82 to i32
  %84 = lshr i64 %82, 32
  %85 = trunc nuw i64 %84 to i32
  %86 = tail call i32 @llvm.ppu.add.co.u32(i32 %83, i32 %27) #17
  %87 = tail call i32 @llvm.ppu.add.co.ci.u32(i32 %85, i32 %26) #17
  %88 = tail call i32 @llvm.ppu.add.ci.u32(i32 0, i32 0) #17
  %89 = icmp eq i32 %88, 0
  %90 = icmp ne i32 %77, -1
  %91 = and i1 %90, %89
  %92 = zext i1 %91 to i32
  %93 = add i32 %77, %92
  %94 = zext i32 %93 to i64
  %95 = zext i32 %30 to i64
  %96 = zext i32 %28 to i64
  br label %113

97:                                               ; preds = %193
  %98 = icmp eq i32 %25, 128
  %99 = select i1 %98, i32 -1, i32 %114
  %100 = select i1 %98, i32 -1, i32 %115
  %101 = select i1 %98, i32 -1, i32 %117
  %102 = select i1 %98, i32 -1, i32 %198
  %103 = zext i32 %99 to i128
  %104 = shl nuw i128 %103, 96
  %105 = zext i32 %100 to i128
  %106 = shl nuw nsw i128 %105, 64
  %107 = or disjoint i128 %106, %104
  %108 = zext i32 %101 to i128
  %109 = shl nuw nsw i128 %108, 32
  %110 = or disjoint i128 %109, %107
  %111 = zext i32 %102 to i128
  %112 = or disjoint i128 %110, %111
  ret i128 %112

113:                                              ; preds = %193, %2
  %114 = phi i32 [ 0, %2 ], [ %115, %193 ]
  %115 = phi i32 [ 0, %2 ], [ %117, %193 ]
  %116 = phi i32 [ 0, %2 ], [ %199, %193 ]
  %117 = phi i32 [ 0, %2 ], [ %198, %193 ]
  %118 = phi i32 [ %35, %2 ], [ %197, %193 ]
  %119 = phi i32 [ %34, %2 ], [ %196, %193 ]
  %120 = phi i32 [ %33, %2 ], [ %195, %193 ]
  %121 = phi i32 [ %32, %2 ], [ %194, %193 ]
  %122 = phi i32 [ %31, %2 ], [ 0, %193 ]
  %123 = tail call i32 @llvm.ppu.sub.co.u32(i32 %120, i32 %27) #17
  %124 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 %119, i32 %26) #17
  %125 = tail call i32 @llvm.ppu.sub.ci.u32(i32 %118, i32 -2) #17
  %126 = zext i32 %118 to i64
  %127 = mul nuw i64 %126, %94
  %128 = lshr i64 %127, 32
  %129 = trunc nuw i64 %128 to i32
  %130 = add i32 %125, %129
  %131 = icmp ult i32 %130, %118
  %132 = select i1 %131, i32 -1, i32 %130
  %133 = mul i32 %132, %27
  %134 = tail call i32 @llvm.ppu.add.co.u32(i32 %133, i32 0) #17
  %135 = zext i32 %132 to i64
  %136 = mul nuw i64 %135, %37
  %137 = lshr i64 %136, 32
  %138 = trunc nuw i64 %137 to i32
  %139 = tail call i32 @llvm.ppu.add.ci.u32(i32 %138, i32 0) #17
  %140 = mul i32 %132, %26
  %141 = tail call i32 @llvm.ppu.add.co.u32(i32 %140, i32 %139) #17
  %142 = mul nuw i64 %135, %36
  %143 = lshr i64 %142, 32
  %144 = trunc nuw i64 %143 to i32
  %145 = tail call i32 @llvm.ppu.add.ci.u32(i32 %144, i32 0) #17
  %146 = tail call i32 @llvm.ppu.sub.co.u32(i32 %120, i32 %134) #17
  %147 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 %119, i32 %141) #17
  %148 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 %118, i32 %145) #17
  %149 = tail call i32 @llvm.ppu.add.ci.u32(i32 0, i32 0) #17
  %150 = icmp eq i32 %149, 0
  br i1 %150, label %151, label %.thread

151:                                              ; preds = %113
  %152 = tail call i32 @llvm.ppu.add.co.u32(i32 %146, i32 %27) #17
  %153 = tail call i32 @llvm.ppu.add.co.ci.u32(i32 %147, i32 %26) #17
  %154 = tail call i32 @llvm.ppu.add.co.ci.u32(i32 %148, i32 0) #17
  %155 = tail call i32 @llvm.ppu.add.ci.u32(i32 0, i32 0) #17
  %156 = add i32 %132, -1
  %157 = icmp eq i32 %155, 0
  br i1 %157, label %158, label %.thread

158:                                              ; preds = %151
  %159 = tail call i32 @llvm.ppu.add.co.u32(i32 %152, i32 %27) #17
  %160 = tail call i32 @llvm.ppu.add.co.ci.u32(i32 %153, i32 %26) #17
  %161 = tail call i32 @llvm.ppu.add.ci.u32(i32 %154, i32 0) #17
  %162 = add i32 %132, -2
  br label %.thread

.thread:                                          ; preds = %113, %158, %151
  %163 = phi i32 [ %161, %158 ], [ %154, %151 ], [ %148, %113 ]
  %164 = phi i32 [ %160, %158 ], [ %153, %151 ], [ %147, %113 ]
  %165 = phi i32 [ %159, %158 ], [ %152, %151 ], [ %146, %113 ]
  %166 = phi i32 [ %162, %158 ], [ %156, %151 ], [ %132, %113 ]
  %167 = mul i32 %166, %30
  %168 = tail call i32 @llvm.ppu.add.co.u32(i32 %167, i32 0) #17
  %169 = zext i32 %166 to i64
  %170 = mul nuw i64 %169, %95
  %171 = lshr i64 %170, 32
  %172 = trunc nuw i64 %171 to i32
  %173 = tail call i32 @llvm.ppu.add.ci.u32(i32 %172, i32 0) #17
  %174 = mul i32 %166, %28
  %175 = tail call i32 @llvm.ppu.add.co.u32(i32 %174, i32 %173) #17
  %176 = mul nuw i64 %169, %96
  %177 = lshr i64 %176, 32
  %178 = trunc nuw i64 %177 to i32
  %179 = tail call i32 @llvm.ppu.add.ci.u32(i32 %178, i32 0) #17
  %180 = tail call i32 @llvm.ppu.sub.co.u32(i32 %122, i32 %168) #17
  %181 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 %121, i32 %175) #17
  %182 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 %165, i32 %179) #17
  %183 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 %164, i32 0) #17
  %184 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 %163, i32 0) #17
  %185 = tail call i32 @llvm.ppu.sub.ci.u32(i32 0, i32 0) #17
  %186 = icmp eq i32 %185, -1
  br i1 %186, label %187, label %193

187:                                              ; preds = %.thread
  %188 = add i32 %166, -1
  %189 = tail call i32 @llvm.ppu.add.co.u32(i32 %180, i32 %30) #17
  %190 = tail call i32 @llvm.ppu.add.co.ci.u32(i32 %181, i32 %28) #17
  %191 = tail call i32 @llvm.ppu.add.co.ci.u32(i32 %182, i32 %27) #17
  %192 = tail call i32 @llvm.ppu.add.ci.u32(i32 %183, i32 %26) #17
  br label %193

193:                                              ; preds = %187, %.thread
  %194 = phi i32 [ %189, %187 ], [ %180, %.thread ]
  %195 = phi i32 [ %190, %187 ], [ %181, %.thread ]
  %196 = phi i32 [ %191, %187 ], [ %182, %.thread ]
  %197 = phi i32 [ %192, %187 ], [ %183, %.thread ]
  %198 = phi i32 [ %188, %187 ], [ %166, %.thread ]
  %199 = add nuw nsw i32 %116, 32
  %200 = icmp samesign ugt i32 %199, %25
  br i1 %200, label %97, label %113, !llvm.loop !39
}

; Function Attrs: convergent mustprogress nofree nounwind null_pointer_is_valid willreturn memory(none)
define internal double @__ppumathpriv_drcp_rte_f64(double %0) #4 {
  %2 = tail call i32 @__hggc_reflect(ptr addrspacecast (ptr addrspace(4) @.str.43.237 to ptr)) #22
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %__builtin_ppu_ftz_off_start.exit, label %4

4:                                                ; preds = %1
  tail call void @llvm.ppu.ftz.off.start() #22
  br label %__builtin_ppu_ftz_off_start.exit

__builtin_ppu_ftz_off_start.exit:                 ; preds = %1, %4
  %5 = bitcast double %0 to i64
  %6 = lshr i64 %5, 32
  %7 = trunc nuw i64 %6 to i32
  %8 = add nsw i32 %7, 3146754
  %9 = bitcast i32 %8 to float
  %10 = tail call contract float @llvm.fabs.f32(float %9)
  %11 = fcmp contract oge float %10, 0x3800010080000000
  %12 = fcmp contract uno float %9, 0.000000e+00
  %13 = or i1 %12, %11
  br i1 %13, label %14, label %67

14:                                               ; preds = %__builtin_ppu_ftz_off_start.exit
  %15 = tail call i32 @__hggc_reflect(ptr addrspacecast (ptr addrspace(4) @.str.43.237 to ptr)) #22
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %__builtin_ppu_ftz_off_start.exit8, label %17

17:                                               ; preds = %14
  tail call void @llvm.ppu.ftz.off.start() #22
  br label %__builtin_ppu_ftz_off_start.exit8

__builtin_ppu_ftz_off_start.exit8:                ; preds = %14, %17
  %18 = fcmp contract ord double %0, 0.000000e+00
  %19 = and i64 %5, 4503595332403200
  %20 = icmp eq i64 %19, 0
  %21 = or i1 %18, %20
  br i1 %21, label %22, label %49

22:                                               ; preds = %__builtin_ppu_ftz_off_start.exit8
  %23 = and i64 %5, -9223372036854775808
  %24 = tail call contract double @llvm.fabs.f64(double %0) #17
  %25 = bitcast double %24 to i64
  %26 = lshr i64 %25, 52
  %27 = trunc nuw nsw i64 %26 to i32
  switch i32 %27, label %30 [
    i32 0, label %28
    i32 2047, label %49
  ]

28:                                               ; preds = %22
  %29 = or disjoint i64 %23, 9218868437227405312
  br label %49

30:                                               ; preds = %22
  %31 = lshr i64 %25, 29
  %32 = trunc i64 %31 to i32
  %33 = and i32 %32, 8388600
  %34 = or disjoint i32 %33, 1065353216
  %35 = bitcast i32 %34 to float
  %36 = tail call contract float @llvm.ppu.rcp.f32(float %35) #17
  %37 = bitcast float %36 to i32
  %38 = ashr i32 %37, 23
  %reass.sub7 = sub nsw i32 %38, %27
  %39 = icmp slt i32 %reass.sub7, -1919
  br i1 %39, label %49, label %40

40:                                               ; preds = %30
  %41 = shl nsw i32 %reass.sub7, 20
  %42 = add i32 %41, 2012217344
  %43 = lshr i32 %37, 3
  %44 = and i32 %43, 1048575
  %45 = or disjoint i32 %42, %44
  %46 = zext i32 %45 to i64
  %47 = shl nuw i64 %46, 32
  %48 = or i64 %47, %23
  br label %49

49:                                               ; preds = %40, %30, %28, %22, %__builtin_ppu_ftz_off_start.exit8
  %50 = phi i64 [ 9221120237041090560, %__builtin_ppu_ftz_off_start.exit8 ], [ %29, %28 ], [ %23, %22 ], [ %48, %40 ], [ %23, %30 ]
  %51 = tail call i32 @__hggc_reflect(ptr addrspacecast (ptr addrspace(4) @.str.43.237 to ptr)) #22
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %__builtin_ppu_ftz_off_end.exit, label %53

53:                                               ; preds = %49
  tail call void @llvm.ppu.ftz.off.end() #22
  br label %__builtin_ppu_ftz_off_end.exit

__builtin_ppu_ftz_off_end.exit:                   ; preds = %49, %53
  %54 = zext i32 %8 to i64
  %55 = or i64 %50, %54
  %56 = bitcast i64 %55 to double
  %57 = fmul contract double %0, %56
  %58 = fsub contract double 1.000000e+00, %57
  %59 = fmul contract double %58, %58
  %60 = fadd contract double %58, %59
  %61 = fmul contract double %60, %56
  %62 = fadd contract double %61, %56
  %63 = fmul contract double %0, %62
  %64 = fsub contract double 1.000000e+00, %63
  %65 = fmul contract double %62, %64
  %66 = fadd contract double %62, %65
  br label %193

67:                                               ; preds = %__builtin_ppu_ftz_off_start.exit
  %68 = fcmp contract uno double %0, 0.000000e+00
  br i1 %68, label %193, label %69

69:                                               ; preds = %67
  %70 = and i32 %7, 2147483647
  %71 = add nsw i32 %70, -1
  %72 = icmp ugt i32 %71, 2146435070
  br i1 %72, label %73, label %77

73:                                               ; preds = %69
  %74 = and i64 %5, -4294967296
  %75 = xor i64 %74, 9218868437227405312
  %76 = bitcast i64 %75 to double
  br label %193

77:                                               ; preds = %69
  %78 = add nsw i32 %70, -1048576
  %79 = icmp samesign ult i32 %71, 16777217
  br i1 %79, label %80, label %131

80:                                               ; preds = %77
  %81 = fmul contract double %0, 0x4690000000000000
  %82 = tail call i32 @__hggc_reflect(ptr addrspacecast (ptr addrspace(4) @.str.43.237 to ptr)) #22
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %__builtin_ppu_ftz_off_start.exit9, label %84

84:                                               ; preds = %80
  tail call void @llvm.ppu.ftz.off.start() #22
  br label %__builtin_ppu_ftz_off_start.exit9

__builtin_ppu_ftz_off_start.exit9:                ; preds = %80, %84
  %85 = bitcast double %81 to i64
  %86 = and i64 %85, -9223372036854775808
  %87 = tail call contract double @llvm.fabs.f64(double %81) #17
  %88 = bitcast double %87 to i64
  %89 = lshr i64 %88, 52
  %90 = trunc nuw nsw i64 %89 to i32
  switch i32 %90, label %93 [
    i32 0, label %91
    i32 2047, label %112
  ]

91:                                               ; preds = %__builtin_ppu_ftz_off_start.exit9
  %92 = or disjoint i64 %86, 9218868437227405312
  br label %112

93:                                               ; preds = %__builtin_ppu_ftz_off_start.exit9
  %94 = lshr i64 %88, 29
  %95 = trunc i64 %94 to i32
  %96 = and i32 %95, 8388600
  %97 = or disjoint i32 %96, 1065353216
  %98 = bitcast i32 %97 to float
  %99 = tail call contract float @llvm.ppu.rcp.f32(float %98) #17
  %100 = bitcast float %99 to i32
  %101 = ashr i32 %100, 23
  %reass.sub6 = sub nsw i32 %101, %90
  %102 = icmp slt i32 %reass.sub6, -1919
  br i1 %102, label %112, label %103

103:                                              ; preds = %93
  %104 = shl nsw i32 %reass.sub6, 20
  %105 = add i32 %104, 2012217344
  %106 = lshr i32 %100, 3
  %107 = and i32 %106, 1048575
  %108 = or disjoint i32 %105, %107
  %109 = zext i32 %108 to i64
  %110 = shl nuw i64 %109, 32
  %111 = or i64 %110, %86
  br label %112

112:                                              ; preds = %103, %93, %91, %__builtin_ppu_ftz_off_start.exit9
  %113 = phi i64 [ %92, %91 ], [ %86, %__builtin_ppu_ftz_off_start.exit9 ], [ %111, %103 ], [ %86, %93 ]
  %114 = tail call i32 @__hggc_reflect(ptr addrspacecast (ptr addrspace(4) @.str.43.237 to ptr)) #22
  %115 = icmp eq i32 %114, 0
  br i1 %115, label %__builtin_ppu_ftz_off_end.exit10, label %116

116:                                              ; preds = %112
  tail call void @llvm.ppu.ftz.off.end() #22
  br label %__builtin_ppu_ftz_off_end.exit10

__builtin_ppu_ftz_off_end.exit10:                 ; preds = %112, %116
  %117 = zext i32 %78 to i64
  %118 = or i64 %113, %117
  %119 = bitcast i64 %118 to double
  %120 = fmul contract double %81, %119
  %121 = fsub contract double 1.000000e+00, %120
  %122 = fmul contract double %121, %121
  %123 = fadd contract double %121, %122
  %124 = fmul contract double %123, %119
  %125 = fadd contract double %124, %119
  %126 = fmul contract double %81, %125
  %127 = fsub contract double 1.000000e+00, %126
  %128 = fmul contract double %125, %127
  %129 = fadd contract double %125, %128
  %130 = fmul contract double %129, 0x4690000000000000
  br label %193

131:                                              ; preds = %77
  %132 = add i64 %5, -4602678819172646912
  %133 = bitcast i64 %132 to double
  %134 = tail call i32 @__hggc_reflect(ptr addrspacecast (ptr addrspace(4) @.str.43.237 to ptr)) #22
  %135 = icmp eq i32 %134, 0
  br i1 %135, label %__builtin_ppu_ftz_off_start.exit11, label %136

136:                                              ; preds = %131
  tail call void @llvm.ppu.ftz.off.start() #22
  br label %__builtin_ppu_ftz_off_start.exit11

__builtin_ppu_ftz_off_start.exit11:               ; preds = %131, %136
  %137 = fcmp contract ord double %133, 0.000000e+00
  %138 = and i64 %5, 4503595332403200
  %139 = icmp eq i64 %138, 0
  %140 = or i1 %139, %137
  br i1 %140, label %141, label %168

141:                                              ; preds = %__builtin_ppu_ftz_off_start.exit11
  %142 = and i64 %132, -9223372036854775808
  %143 = tail call contract double @llvm.fabs.f64(double %133) #17
  %144 = bitcast double %143 to i64
  %145 = lshr i64 %144, 52
  %146 = trunc nuw nsw i64 %145 to i32
  switch i32 %146, label %149 [
    i32 0, label %147
    i32 2047, label %168
  ]

147:                                              ; preds = %141
  %148 = or disjoint i64 %142, 9218868437227405312
  br label %168

149:                                              ; preds = %141
  %150 = lshr i64 %144, 29
  %151 = trunc i64 %150 to i32
  %152 = and i32 %151, 8388600
  %153 = or disjoint i32 %152, 1065353216
  %154 = bitcast i32 %153 to float
  %155 = tail call contract float @llvm.ppu.rcp.f32(float %154) #17
  %156 = bitcast float %155 to i32
  %157 = ashr i32 %156, 23
  %reass.sub = sub nsw i32 %157, %146
  %158 = icmp slt i32 %reass.sub, -1919
  br i1 %158, label %168, label %159

159:                                              ; preds = %149
  %160 = shl nsw i32 %reass.sub, 20
  %161 = add i32 %160, 2012217344
  %162 = lshr i32 %156, 3
  %163 = and i32 %162, 1048575
  %164 = or disjoint i32 %161, %163
  %165 = zext i32 %164 to i64
  %166 = shl nuw i64 %165, 32
  %167 = or i64 %166, %142
  br label %168

168:                                              ; preds = %159, %149, %147, %141, %__builtin_ppu_ftz_off_start.exit11
  %169 = phi i64 [ 9221120237041090560, %__builtin_ppu_ftz_off_start.exit11 ], [ %148, %147 ], [ %142, %141 ], [ %167, %159 ], [ %142, %149 ]
  %170 = tail call i32 @__hggc_reflect(ptr addrspacecast (ptr addrspace(4) @.str.43.237 to ptr)) #22
  %171 = icmp eq i32 %170, 0
  br i1 %171, label %__builtin_ppu_ftz_off_end.exit12, label %172

172:                                              ; preds = %168
  tail call void @llvm.ppu.ftz.off.end() #22
  br label %__builtin_ppu_ftz_off_end.exit12

__builtin_ppu_ftz_off_end.exit12:                 ; preds = %168, %172
  %173 = zext i32 %78 to i64
  %174 = or i64 %169, %173
  %175 = bitcast i64 %174 to double
  %176 = fmul contract double %133, %175
  %177 = fsub contract double 1.000000e+00, %176
  %178 = fmul contract double %177, %177
  %179 = fadd contract double %177, %178
  %180 = fmul contract double %179, %175
  %181 = fadd contract double %180, %175
  %182 = fmul contract double %181, %133
  %183 = fsub contract double 1.000000e+00, %182
  %184 = fmul contract double %181, %183
  %185 = fadd contract double %181, %184
  %186 = fmul contract double %185, 0x10000000000000
  %187 = fmul contract double %0, %186
  %188 = fsub contract double 1.000000e+00, %187
  %189 = fmul contract double %188, %188
  %190 = fadd contract double %188, %189
  %191 = fmul contract double %186, %190
  %192 = fadd contract double %186, %191
  br label %193

193:                                              ; preds = %__builtin_ppu_ftz_off_end.exit12, %__builtin_ppu_ftz_off_end.exit10, %73, %67, %__builtin_ppu_ftz_off_end.exit
  %194 = phi double [ %66, %__builtin_ppu_ftz_off_end.exit ], [ 0x7FF8000000000000, %67 ], [ %76, %73 ], [ %130, %__builtin_ppu_ftz_off_end.exit10 ], [ %192, %__builtin_ppu_ftz_off_end.exit12 ]
  %195 = tail call i32 @__hggc_reflect(ptr addrspacecast (ptr addrspace(4) @.str.43.237 to ptr)) #22
  %196 = icmp eq i32 %195, 0
  br i1 %196, label %__builtin_ppu_ftz_off_end.exit13, label %197

197:                                              ; preds = %193
  tail call void @llvm.ppu.ftz.off.end() #22
  br label %__builtin_ppu_ftz_off_end.exit13

__builtin_ppu_ftz_off_end.exit13:                 ; preds = %193, %197
  ret double %194
}

; Function Attrs: convergent mustprogress nofree nounwind null_pointer_is_valid willreturn memory(none)
define internal float @__ppumathpriv_rcp_default_f32(float %0) #5 {
  %2 = tail call i32 @__hggc_reflect(ptr addrspacecast (ptr addrspace(4) @.str.174.227 to ptr)) #22
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %39, label %4

4:                                                ; preds = %1
  %5 = tail call i32 @__hggc_reflect(ptr addrspacecast (ptr addrspace(4) @.str.2.10 to ptr)) #22
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %9

7:                                                ; preds = %4
  %8 = tail call contract fastcc float @__ppumathpriv_rcp_approx_ftz_f32(float %0) #42
  br label %__ppumath_rcp_default_ftz_f32.exit

9:                                                ; preds = %4
  %10 = tail call i32 @llvm.ppu.get.mode.fp.den() #22
  tail call void @llvm.ppu.set.mode.fp.den(i32 0) #22
  %11 = bitcast float %0 to i32
  %12 = add nsw i32 %11, 25165824
  %13 = and i32 %12, 2139095040
  %14 = icmp samesign ugt i32 %13, 33554431
  br i1 %14, label %15, label %20

15:                                               ; preds = %9
  %16 = tail call contract float @llvm.ppu.rcp.f32(float %0) #17
  %17 = tail call contract float @llvm.ppu.fma.rn.f32(float %0, float %16, float -1.000000e+00) #17
  tail call void @llvm.ppu.set.mode.fp.den(i32 3) #22
  %18 = fneg contract float %17
  tail call void @llvm.ppu.set.mode.fp.den(i32 0) #22
  %19 = tail call contract float @llvm.ppu.fma.rn.f32(float %16, float %18, float %16) #17
  tail call void @llvm.ppu.set.mode.fp.den(i32 %10) #22
  br label %__ppumath_rcp_default_ftz_f32.exit

20:                                               ; preds = %9
  switch i32 %13, label %30 [
    i32 0, label %21
    i32 8388608, label %21
  ]

21:                                               ; preds = %20, %20
  %22 = and i32 %11, 8388607
  %23 = or disjoint i32 %13, %22
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %27

25:                                               ; preds = %21
  tail call void @llvm.ppu.set.mode.fp.den(i32 %10) #22
  %26 = tail call float @llvm.copysign.f32(float 0x3810000000000000, float %0)
  br label %__ppumath_rcp_default_ftz_f32.exit

27:                                               ; preds = %21
  tail call void @llvm.ppu.set.mode.fp.den(i32 %10) #22
  %28 = and i32 %11, -2147483648
  %29 = bitcast i32 %28 to float
  br label %__ppumath_rcp_default_ftz_f32.exit

30:                                               ; preds = %20
  %31 = and i32 %11, 2139095040
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %37

33:                                               ; preds = %30
  %34 = and i32 %11, -2147483648
  %35 = bitcast i32 %34 to float
  tail call void @llvm.ppu.set.mode.fp.den(i32 %10) #22
  %36 = tail call contract float @llvm.ppu.rcp.f32(float %35) #17
  br label %__ppumath_rcp_default_ftz_f32.exit

37:                                               ; preds = %30
  tail call void @llvm.ppu.set.mode.fp.den(i32 %10) #22
  %38 = tail call contract float @llvm.ppu.rcp.f32(float %0) #17
  br label %__ppumath_rcp_default_ftz_f32.exit

39:                                               ; preds = %1
  %40 = tail call i32 @__hggc_reflect(ptr addrspacecast (ptr addrspace(4) @.str.1.175 to ptr)) #22
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %42, label %55

42:                                               ; preds = %39
  %43 = tail call contract float @llvm.fabs.f32(float %0) #17
  %44 = fcmp contract ogt float %43, 0x47D0000000000000
  %45 = fmul contract float %0, 2.500000e-01
  %46 = select i1 %44, float 2.500000e-01, float 1.000000e+00
  %47 = select i1 %44, float %45, float %0
  %48 = fpext float %43 to double
  %49 = fcmp contract olt double %48, 0x380FFFFFFFFFBB88
  %50 = fmul contract float %47, 0x4170000000000000
  %51 = select i1 %49, float 0x4170000000000000, float %46
  %52 = select i1 %49, float %50, float %47
  %53 = tail call contract float @llvm.ppu.rcp.f32(float %52) #17
  %54 = fmul contract float %51, %53
  br label %__ppumath_rcp_default_ftz_f32.exit

55:                                               ; preds = %39
  %56 = bitcast float %0 to i32
  %57 = add nsw i32 %56, 23068671
  %58 = and i32 %57, 2147483647
  %59 = icmp samesign ugt i32 %58, 25165823
  br i1 %59, label %60, label %66

60:                                               ; preds = %55
  %61 = tail call contract float @llvm.ppu.rcp.f32(float %0) #17
  %62 = fmul contract float %0, %61
  %63 = fadd contract float %62, -1.000000e+00
  %64 = fmul contract float %61, %63
  %65 = fsub contract float %61, %64
  br label %__ppumath_rcp_default_ftz_f32.exit

66:                                               ; preds = %55
  %67 = icmp samesign ugt i32 %58, 14680062
  br i1 %67, label %68, label %70

68:                                               ; preds = %66
  %69 = tail call contract float @llvm.ppu.rcp.f32(float %0) #17
  br label %__ppumath_rcp_default_ftz_f32.exit

70:                                               ; preds = %66
  %71 = and i32 %56, 8388607
  %72 = and i32 %56, 2139095040
  %73 = or disjoint i32 %71, 1065353216
  %74 = bitcast i32 %73 to float
  %75 = tail call contract float @llvm.ppu.rcp.f32(float %74) #17
  %76 = fmul contract float %75, %74
  %77 = fadd contract float %76, -1.000000e+00
  %78 = fneg contract float %77
  %79 = tail call contract float @llvm.ppu.fma.rd.f32(float %75, float %78, float %75) #17
  %80 = tail call contract float @llvm.ppu.fma.ru.f32(float %75, float %78, float %75) #17
  %81 = bitcast float %79 to i32
  %82 = and i32 %81, 8388607
  %83 = or disjoint i32 %82, 8388608
  %84 = icmp eq i32 %72, 2130706432
  %85 = icmp ne i32 %71, 0
  %86 = and i1 %84, %85
  %87 = zext i1 %86 to i32
  %88 = fcmp contract une float %79, %80
  %89 = zext i1 %88 to i32
  %90 = and i32 %81, %87
  %91 = or i32 %90, %89
  %92 = lshr i32 %83, %87
  %93 = lshr i32 %92, 1
  %94 = and i32 %93, 1
  %95 = or i32 %91, %94
  %96 = and i32 %95, %92
  %97 = add nuw nsw i32 %96, %93
  %98 = bitcast i32 %97 to float
  %99 = tail call float @llvm.copysign.f32(float %98, float %0)
  br label %__ppumath_rcp_default_ftz_f32.exit

__ppumath_rcp_default_ftz_f32.exit:               ; preds = %37, %33, %27, %25, %15, %7, %70, %68, %60, %42
  %100 = phi float [ %54, %42 ], [ %65, %60 ], [ %69, %68 ], [ %99, %70 ], [ %8, %7 ], [ %19, %15 ], [ %36, %33 ], [ %38, %37 ], [ %26, %25 ], [ %29, %27 ]
  ret float %100
}

; Function Attrs: mustprogress nofree nosync nounwind null_pointer_is_valid willreturn memory(none)
define internal i128 @__ppumathpriv_rem_s128(i128 %0, i128 %1) #2 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.int4, align 16
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %3) #17
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4) #17
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %5) #17
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %6) #17
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %7) #17
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %8) #17
  %.sroa.013.0.extract.trunc = trunc i128 %0 to i32
  %.sroa.414.0.extract.shift = lshr i128 %0, 32
  %.sroa.414.0.extract.trunc = trunc i128 %.sroa.414.0.extract.shift to i32
  %.sroa.515.0.extract.shift = lshr i128 %0, 64
  %.sroa.515.0.extract.trunc = trunc i128 %.sroa.515.0.extract.shift to i32
  %.sroa.616.0.extract.shift = lshr i128 %0, 96
  %.sroa.616.0.extract.trunc = trunc nuw i128 %.sroa.616.0.extract.shift to i32
  %9 = icmp slt i128 %0, 0
  %10 = tail call i32 @llvm.ppu.sub.co.u32(i32 0, i32 %.sroa.013.0.extract.trunc) #17
  %11 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 0, i32 %.sroa.414.0.extract.trunc) #17
  %12 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 0, i32 %.sroa.515.0.extract.trunc) #17
  %13 = tail call i32 @llvm.ppu.sub.ci.u32(i32 0, i32 %.sroa.616.0.extract.trunc) #17
  %14 = select i1 %9, i32 %10, i32 %.sroa.013.0.extract.trunc
  %15 = select i1 %9, i32 %11, i32 %.sroa.414.0.extract.trunc
  %16 = select i1 %9, i32 %12, i32 %.sroa.515.0.extract.trunc
  %17 = select i1 %9, i32 %13, i32 %.sroa.616.0.extract.trunc
  %.sroa.017.0.extract.trunc = trunc i128 %1 to i32
  %.sroa.418.0.extract.shift = lshr i128 %1, 32
  %.sroa.418.0.extract.trunc = trunc i128 %.sroa.418.0.extract.shift to i32
  %.sroa.519.0.extract.shift = lshr i128 %1, 64
  %.sroa.519.0.extract.trunc = trunc i128 %.sroa.519.0.extract.shift to i32
  %.sroa.620.0.extract.shift = lshr i128 %1, 96
  %.sroa.620.0.extract.trunc = trunc nuw i128 %.sroa.620.0.extract.shift to i32
  %18 = icmp slt i128 %1, 0
  %19 = tail call i32 @llvm.ppu.sub.co.u32(i32 0, i32 %.sroa.017.0.extract.trunc) #17
  %20 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 0, i32 %.sroa.418.0.extract.trunc) #17
  %21 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 0, i32 %.sroa.519.0.extract.trunc) #17
  %22 = tail call i32 @llvm.ppu.sub.ci.u32(i32 0, i32 %.sroa.620.0.extract.trunc) #17
  %23 = select i1 %18, i32 %19, i32 %.sroa.017.0.extract.trunc
  %24 = select i1 %18, i32 %20, i32 %.sroa.418.0.extract.trunc
  %25 = select i1 %18, i32 %21, i32 %.sroa.519.0.extract.trunc
  %26 = select i1 %18, i32 %22, i32 %.sroa.620.0.extract.trunc
  %27 = or i32 %26, %25
  %28 = icmp eq i32 %27, 0
  %29 = select i1 %28, i32 %24, i32 %26
  %30 = getelementptr inbounds nuw i8, ptr %8, i64 12
  %31 = select i1 %28, i32 %23, i32 %25
  %32 = getelementptr inbounds nuw i8, ptr %8, i64 8
  %33 = select i1 %28, i32 0, i32 %24
  %34 = getelementptr inbounds nuw i8, ptr %8, i64 4
  %35 = select i1 %28, i32 0, i32 %23
  %36 = select i1 %28, i32 64, i32 0
  %37 = icmp eq i32 %29, 0
  %38 = select i1 %37, i32 0, i32 %35
  %39 = select i1 %37, i32 32, i32 0
  %40 = select i1 %37, i32 %35, i32 %33
  %41 = select i1 %37, i32 %31, i32 %29
  %42 = select i1 %37, i32 %33, i32 %31
  %43 = or disjoint i32 %39, %36
  %44 = tail call i32 @llvm.ctlz.i32(i32 %41, i1 zeroext false) #17, !range !26
  %45 = add nuw nsw i32 %43, %44
  %46 = tail call i32 @llvm.fshl.i32(i32 %41, i32 %42, i32 %44) #17
  store i32 %46, ptr %30, align 4, !tbaa !27
  %47 = tail call i32 @llvm.fshl.i32(i32 %42, i32 %40, i32 %44) #17
  store i32 %47, ptr %32, align 8, !tbaa !32
  %48 = tail call i32 @llvm.fshl.i32(i32 %40, i32 %38, i32 %44) #17
  store i32 %48, ptr %34, align 4, !tbaa !33
  %49 = and i32 %44, 31
  %50 = shl i32 %38, %49
  store i32 %50, ptr %8, align 16, !tbaa !34
  %51 = shl i32 %14, %49
  store i32 %51, ptr %3, align 4, !tbaa !35
  %52 = tail call i32 @llvm.fshl.i32(i32 %15, i32 %14, i32 range(i32 0, 160) %44)
  store i32 %52, ptr %4, align 4, !tbaa !35
  %53 = tail call i32 @llvm.fshl.i32(i32 %16, i32 %15, i32 range(i32 0, 160) %44)
  store i32 %53, ptr %5, align 4, !tbaa !35
  %54 = tail call i32 @llvm.fshl.i32(i32 %17, i32 %16, i32 range(i32 0, 160) %44)
  store i32 %54, ptr %6, align 4, !tbaa !35
  %55 = tail call i32 @llvm.fshl.i32(i32 0, i32 %17, i32 range(i32 0, 160) %44)
  store i32 %55, ptr %7, align 4, !tbaa !35
  %56 = zext i32 %46 to i64
  %57 = zext i32 %47 to i64
  %58 = tail call i32 @llvm.ppu.prmt(i32 %46, i32 63, i32 17185) #17
  %59 = bitcast i32 %58 to float
  %60 = tail call contract float @llvm.ppu.rcp.f32(float %59) #17
  %61 = bitcast float %60 to i32
  %62 = tail call i32 @llvm.ppu.mul.u32(i32 %61, i32 512) #17
  %63 = tail call i32 @llvm.ppu.add.u32(i32 %62, i32 -512) #17
  %64 = zext i32 %63 to i64
  %65 = mul nuw i64 %64, %57
  %66 = ashr i64 %65, 32
  %67 = sub nuw nsw i64 -4294967296, %64
  %68 = mul i64 %67, %56
  %69 = add nsw i64 %66, %57
  %70 = sub i64 %68, %69
  %71 = lshr i64 %70, 32
  %72 = trunc nuw i64 %71 to i32
  %73 = trunc i64 %70 to i32
  %74 = icmp sgt i64 %70, -1
  %75 = select i1 %74, i32 %63, i32 0
  %76 = lshr i64 %70, 63
  %77 = trunc nuw nsw i64 %76 to i32
  %78 = xor i32 %77, 1
  %79 = and i64 %70, 4294967295
  %80 = mul nuw i64 %79, %64
  %81 = lshr i64 %80, 32
  %82 = trunc nuw i64 %81 to i32
  %83 = tail call i32 @llvm.ppu.add.co.u32(i32 %82, i32 -2147483648) #17
  %84 = tail call i32 @llvm.ppu.add.ci.u32(i32 0, i32 0) #17
  %85 = mul i32 %63, %72
  %86 = tail call i32 @llvm.ppu.add.co.u32(i32 %85, i32 %83) #17
  %87 = mul nuw i64 %71, %64
  %88 = lshr i64 %87, 32
  %89 = trunc nuw i64 %88 to i32
  %90 = tail call i32 @llvm.ppu.add.ci.u32(i32 %89, i32 %84) #17
  %91 = tail call i32 @llvm.ppu.add.co.u32(i32 %86, i32 %73) #17
  %92 = tail call i32 @llvm.ppu.add.co.ci.u32(i32 %90, i32 %72) #17
  %93 = tail call i32 @llvm.ppu.add.ci.u32(i32 0, i32 0) #17
  %94 = tail call i32 @llvm.ppu.add.co.u32(i32 %92, i32 %75) #17
  %95 = tail call i32 @llvm.ppu.add.ci.u32(i32 %93, i32 %78) #17
  %96 = icmp eq i32 %95, 2
  %97 = select i1 %96, i32 -1, i32 %94
  %98 = zext i32 %97 to i64
  %99 = mul nuw i64 %98, %57
  %100 = ashr i64 %99, 32
  %101 = mul nuw i64 %98, %56
  %102 = add i64 %100, %101
  %103 = trunc i64 %102 to i32
  %104 = lshr i64 %102, 32
  %105 = trunc nuw i64 %104 to i32
  %106 = tail call i32 @llvm.ppu.add.co.u32(i32 %103, i32 %47) #17
  %107 = tail call i32 @llvm.ppu.add.co.ci.u32(i32 %105, i32 %46) #17
  %108 = tail call i32 @llvm.ppu.add.ci.u32(i32 0, i32 0) #17
  %109 = icmp eq i32 %108, 0
  %110 = icmp ne i32 %97, -1
  %111 = and i1 %110, %109
  %112 = zext i1 %111 to i32
  %113 = add i32 %97, %112
  br label %135

114:                                              ; preds = %135
  %115 = load i32, ptr %4, align 4, !tbaa !35
  %116 = load i32, ptr %5, align 4, !tbaa !35
  %117 = load i32, ptr %6, align 4, !tbaa !35
  %118 = load i32, ptr %7, align 4, !tbaa !35
  %119 = tail call i32 @llvm.fshr.i32(i32 %116, i32 %115, i32 range(i32 0, 160) %44)
  %120 = tail call i32 @llvm.fshr.i32(i32 %117, i32 %116, i32 range(i32 0, 160) %44)
  %121 = tail call i32 @llvm.fshr.i32(i32 %118, i32 %117, i32 range(i32 0, 160) %44)
  %122 = tail call i32 @llvm.fshr.i32(i32 0, i32 %118, i32 range(i32 0, 160) %44)
  %123 = and i32 %45, 32
  %124 = icmp eq i32 %123, 0
  %125 = select i1 %124, i32 %119, i32 %120
  %126 = select i1 %124, i32 %120, i32 %121
  %127 = select i1 %124, i32 %121, i32 %122
  %128 = select i1 %124, i32 %122, i32 0
  %129 = and i32 %45, 64
  %130 = icmp eq i32 %129, 0
  %131 = select i1 %130, i32 %125, i32 %127
  %132 = select i1 %130, i32 %126, i32 %128
  %133 = select i1 %130, i32 %127, i32 0
  %134 = select i1 %130, i32 %128, i32 0
  br i1 %9, label %140, label %145

135:                                              ; preds = %135, %2
  %136 = phi i32 [ 0, %2 ], [ %138, %135 ]
  %137 = call fastcc i32 @__ppumathpriv_div_full_qs_u128(ptr nonnull %3, ptr nonnull %4, ptr nonnull %5, ptr nonnull %6, ptr nonnull %7, ptr nonnull byval(%struct.int4) align 16 %8, i32 %113) #17
  %138 = add nuw nsw i32 %136, 32
  %139 = icmp samesign ugt i32 %138, %45
  br i1 %139, label %114, label %135, !llvm.loop !40

140:                                              ; preds = %114
  %141 = tail call i32 @llvm.ppu.sub.co.u32(i32 0, i32 %131) #17
  %142 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 0, i32 %132) #17
  %143 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 0, i32 %133) #17
  %144 = tail call i32 @llvm.ppu.sub.ci.u32(i32 0, i32 %134) #17
  br label %145

145:                                              ; preds = %140, %114
  %.sroa.8.0 = phi i32 [ %142, %140 ], [ %132, %114 ]
  %.sroa.0.0 = phi i32 [ %141, %140 ], [ %131, %114 ]
  %.sroa.13.0 = phi i32 [ %143, %140 ], [ %133, %114 ]
  %.sroa.18.0 = phi i32 [ %144, %140 ], [ %134, %114 ]
  %146 = icmp eq i32 %45, 128
  %147 = select i1 %146, i32 -1, i32 %.sroa.18.0
  %148 = select i1 %146, i32 -1, i32 %.sroa.13.0
  %149 = select i1 %146, i32 -1, i32 %.sroa.8.0
  %150 = select i1 %146, i32 -1, i32 %.sroa.0.0
  %.sroa.18.0.insert.ext = zext i32 %147 to i128
  %.sroa.18.0.insert.shift = shl nuw i128 %.sroa.18.0.insert.ext, 96
  %.sroa.13.0.insert.ext = zext i32 %148 to i128
  %.sroa.13.0.insert.shift = shl nuw nsw i128 %.sroa.13.0.insert.ext, 64
  %.sroa.13.0.insert.insert = or disjoint i128 %.sroa.18.0.insert.shift, %.sroa.13.0.insert.shift
  %.sroa.8.0.insert.ext = zext i32 %149 to i128
  %.sroa.8.0.insert.shift = shl nuw nsw i128 %.sroa.8.0.insert.ext, 32
  %.sroa.8.0.insert.insert = or disjoint i128 %.sroa.13.0.insert.insert, %.sroa.8.0.insert.shift
  %.sroa.0.0.insert.ext = zext i32 %150 to i128
  %.sroa.0.0.insert.insert = or disjoint i128 %.sroa.8.0.insert.insert, %.sroa.0.0.insert.ext
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %8) #17
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %7) #17
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %6) #17
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %5) #17
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #17
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %3) #17
  ret i128 %.sroa.0.0.insert.insert
}

; Function Attrs: mustprogress nofree nosync nounwind null_pointer_is_valid willreturn memory(none)
define internal i128 @__ppumathpriv_rem_u128(i128 %0, i128 %1) #2 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.int4, align 16
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %3) #17
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4) #17
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %5) #17
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %6) #17
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %7) #17
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %8) #17
  %9 = trunc i128 %0 to i32
  %10 = lshr i128 %0, 32
  %11 = trunc i128 %10 to i32
  %12 = lshr i128 %0, 64
  %13 = trunc i128 %12 to i32
  %14 = lshr i128 %0, 96
  %15 = trunc nuw i128 %14 to i32
  %.sroa.0.0.extract.trunc = trunc i128 %1 to i32
  %.sroa.4.0.extract.shift = lshr i128 %1, 32
  %.sroa.4.0.extract.trunc = trunc i128 %.sroa.4.0.extract.shift to i32
  %.sroa.5.0.extract.shift = lshr i128 %1, 64
  %.sroa.5.0.extract.trunc = trunc i128 %.sroa.5.0.extract.shift to i32
  %.sroa.6.0.extract.shift = lshr i128 %1, 96
  %.sroa.6.0.extract.trunc = trunc nuw i128 %.sroa.6.0.extract.shift to i32
  %16 = or i32 %.sroa.5.0.extract.trunc, %.sroa.6.0.extract.trunc
  %17 = icmp eq i32 %16, 0
  %18 = select i1 %17, i32 %.sroa.4.0.extract.trunc, i32 %.sroa.6.0.extract.trunc
  %19 = getelementptr inbounds nuw i8, ptr %8, i64 12
  %20 = select i1 %17, i32 %.sroa.0.0.extract.trunc, i32 %.sroa.5.0.extract.trunc
  %21 = getelementptr inbounds nuw i8, ptr %8, i64 8
  %22 = select i1 %17, i32 0, i32 %.sroa.4.0.extract.trunc
  %23 = getelementptr inbounds nuw i8, ptr %8, i64 4
  %24 = select i1 %17, i32 0, i32 %.sroa.0.0.extract.trunc
  %25 = select i1 %17, i32 64, i32 0
  %26 = icmp eq i32 %18, 0
  %27 = select i1 %26, i32 0, i32 %24
  %28 = select i1 %26, i32 32, i32 0
  %29 = select i1 %26, i32 %24, i32 %22
  %30 = select i1 %26, i32 %20, i32 %18
  %31 = select i1 %26, i32 %22, i32 %20
  %32 = or disjoint i32 %28, %25
  %33 = tail call i32 @llvm.ctlz.i32(i32 %30, i1 zeroext false) #17, !range !26
  %34 = add nuw nsw i32 %32, %33
  %35 = tail call i32 @llvm.fshl.i32(i32 %30, i32 %31, i32 %33) #17
  store i32 %35, ptr %19, align 4, !tbaa !27
  %36 = tail call i32 @llvm.fshl.i32(i32 %31, i32 %29, i32 %33) #17
  store i32 %36, ptr %21, align 8, !tbaa !32
  %37 = tail call i32 @llvm.fshl.i32(i32 %29, i32 %27, i32 %33) #17
  store i32 %37, ptr %23, align 4, !tbaa !33
  %38 = and i32 %33, 31
  %39 = shl i32 %27, %38
  store i32 %39, ptr %8, align 16, !tbaa !34
  %40 = shl i32 %9, %38
  store i32 %40, ptr %3, align 4, !tbaa !35
  %41 = tail call i32 @llvm.fshl.i32(i32 %11, i32 %9, i32 range(i32 0, 160) %33)
  store i32 %41, ptr %4, align 4, !tbaa !35
  %42 = tail call i32 @llvm.fshl.i32(i32 %13, i32 %11, i32 range(i32 0, 160) %33)
  store i32 %42, ptr %5, align 4, !tbaa !35
  %43 = tail call i32 @llvm.fshl.i32(i32 %15, i32 %13, i32 range(i32 0, 160) %33)
  store i32 %43, ptr %6, align 4, !tbaa !35
  %44 = tail call i32 @llvm.fshl.i32(i32 0, i32 %15, i32 range(i32 0, 160) %33)
  store i32 %44, ptr %7, align 4, !tbaa !35
  %45 = zext i32 %35 to i64
  %46 = zext i32 %36 to i64
  %47 = tail call i32 @llvm.ppu.prmt(i32 %35, i32 63, i32 17185) #17
  %48 = bitcast i32 %47 to float
  %49 = tail call contract float @llvm.ppu.rcp.f32(float %48) #17
  %50 = bitcast float %49 to i32
  %51 = tail call i32 @llvm.ppu.mul.u32(i32 %50, i32 512) #17
  %52 = tail call i32 @llvm.ppu.add.u32(i32 %51, i32 -512) #17
  %53 = zext i32 %52 to i64
  %54 = mul nuw i64 %53, %46
  %55 = ashr i64 %54, 32
  %56 = sub nuw nsw i64 -4294967296, %53
  %57 = mul i64 %56, %45
  %58 = add nsw i64 %55, %46
  %59 = sub i64 %57, %58
  %60 = lshr i64 %59, 32
  %61 = trunc nuw i64 %60 to i32
  %62 = trunc i64 %59 to i32
  %63 = icmp sgt i64 %59, -1
  %64 = select i1 %63, i32 %52, i32 0
  %65 = lshr i64 %59, 63
  %66 = trunc nuw nsw i64 %65 to i32
  %67 = xor i32 %66, 1
  %68 = and i64 %59, 4294967295
  %69 = mul nuw i64 %68, %53
  %70 = lshr i64 %69, 32
  %71 = trunc nuw i64 %70 to i32
  %72 = tail call i32 @llvm.ppu.add.co.u32(i32 %71, i32 -2147483648) #17
  %73 = tail call i32 @llvm.ppu.add.ci.u32(i32 0, i32 0) #17
  %74 = mul i32 %52, %61
  %75 = tail call i32 @llvm.ppu.add.co.u32(i32 %74, i32 %72) #17
  %76 = mul nuw i64 %60, %53
  %77 = lshr i64 %76, 32
  %78 = trunc nuw i64 %77 to i32
  %79 = tail call i32 @llvm.ppu.add.ci.u32(i32 %78, i32 %73) #17
  %80 = tail call i32 @llvm.ppu.add.co.u32(i32 %75, i32 %62) #17
  %81 = tail call i32 @llvm.ppu.add.co.ci.u32(i32 %79, i32 %61) #17
  %82 = tail call i32 @llvm.ppu.add.ci.u32(i32 0, i32 0) #17
  %83 = tail call i32 @llvm.ppu.add.co.u32(i32 %81, i32 %64) #17
  %84 = tail call i32 @llvm.ppu.add.ci.u32(i32 %82, i32 %67) #17
  %85 = icmp eq i32 %84, 2
  %86 = select i1 %85, i32 -1, i32 %83
  %87 = zext i32 %86 to i64
  %88 = mul nuw i64 %87, %46
  %89 = ashr i64 %88, 32
  %90 = mul nuw i64 %87, %45
  %91 = add i64 %89, %90
  %92 = trunc i64 %91 to i32
  %93 = lshr i64 %91, 32
  %94 = trunc nuw i64 %93 to i32
  %95 = tail call i32 @llvm.ppu.add.co.u32(i32 %92, i32 %36) #17
  %96 = tail call i32 @llvm.ppu.add.co.ci.u32(i32 %94, i32 %35) #17
  %97 = tail call i32 @llvm.ppu.add.ci.u32(i32 0, i32 0) #17
  %98 = icmp eq i32 %97, 0
  %99 = icmp ne i32 %86, -1
  %100 = and i1 %99, %98
  %101 = zext i1 %100 to i32
  %102 = add i32 %86, %101
  br label %139

103:                                              ; preds = %139
  %104 = load i32, ptr %4, align 4, !tbaa !35
  %105 = load i32, ptr %5, align 4, !tbaa !35
  %106 = load i32, ptr %6, align 4, !tbaa !35
  %107 = load i32, ptr %7, align 4, !tbaa !35
  %108 = tail call i32 @llvm.fshr.i32(i32 %105, i32 %104, i32 range(i32 0, 160) %33)
  %109 = tail call i32 @llvm.fshr.i32(i32 %106, i32 %105, i32 range(i32 0, 160) %33)
  %110 = tail call i32 @llvm.fshr.i32(i32 %107, i32 %106, i32 range(i32 0, 160) %33)
  %111 = tail call i32 @llvm.fshr.i32(i32 0, i32 %107, i32 range(i32 0, 160) %33)
  %112 = and i32 %34, 32
  %113 = icmp eq i32 %112, 0
  %114 = select i1 %113, i32 %108, i32 %109
  %115 = select i1 %113, i32 %109, i32 %110
  %116 = select i1 %113, i32 %110, i32 %111
  %117 = select i1 %113, i32 %111, i32 0
  %118 = and i32 %34, 64
  %119 = icmp eq i32 %118, 0
  %120 = select i1 %119, i32 %114, i32 %116
  %121 = select i1 %119, i32 %115, i32 %117
  %122 = select i1 %119, i32 %116, i32 0
  %123 = select i1 %119, i32 %117, i32 0
  %124 = icmp eq i32 %34, 128
  %125 = select i1 %124, i32 -1, i32 %123
  %126 = select i1 %124, i32 -1, i32 %122
  %127 = select i1 %124, i32 -1, i32 %121
  %128 = select i1 %124, i32 -1, i32 %120
  %129 = zext i32 %125 to i128
  %130 = shl nuw i128 %129, 96
  %131 = zext i32 %126 to i128
  %132 = shl nuw nsw i128 %131, 64
  %133 = or disjoint i128 %130, %132
  %134 = zext i32 %127 to i128
  %135 = shl nuw nsw i128 %134, 32
  %136 = or disjoint i128 %133, %135
  %137 = zext i32 %128 to i128
  %138 = or disjoint i128 %136, %137
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %8) #17
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %7) #17
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %6) #17
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %5) #17
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #17
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %3) #17
  ret i128 %138

139:                                              ; preds = %139, %2
  %140 = phi i32 [ 0, %2 ], [ %142, %139 ]
  %141 = call fastcc i32 @__ppumathpriv_div_full_qs_u128(ptr nonnull %3, ptr nonnull %4, ptr nonnull %5, ptr nonnull %6, ptr nonnull %7, ptr nonnull byval(%struct.int4) align 16 %8, i32 %102) #17
  %142 = add nuw nsw i32 %140, 32
  %143 = icmp samesign ugt i32 %142, %34
  br i1 %143, label %103, label %139, !llvm.loop !41
}

; Function Attrs: alwaysinline mustprogress nounwind null_pointer_is_valid
define internal void @__ppukernel_assert_void() #6 {
  tail call void @llvm.ppu.assert() #17
  ret void
}

; Function Attrs: convergent mustprogress noinline nounwind null_pointer_is_valid
define internal void @__ppupriv_tsm_cas_b32(ptr addrspace(3) %0, i32 %1, i32 %2) #7 {
  %4 = ptrtoint ptr addrspace(3) %0 to i32
  %5 = tail call i32 @llvm.ppu.change.emsk(i32 -1) #22
  %6 = tail call i32 @llvm.ppu.read.ltid() #17
  %7 = add i32 %6, 1
  %8 = tail call i32 @llvm.ppu.bfe(i32 %5, i32 0, i32 16) #17
  %9 = tail call range(i32 0, 33) i32 @llvm.ctpop.i32(i32 %8) #17, !range !26
  %10 = icmp ugt i32 %7, %9
  %11 = select i1 %10, i32 %9, i32 0
  %12 = sub i32 %7, %11
  %13 = select i1 %10, i32 16, i32 0
  %14 = tail call i32 @llvm.ppu.bfe(i32 %5, i32 %13, i32 8) #17
  %15 = tail call range(i32 0, 33) i32 @llvm.ctpop.i32(i32 %14) #17, !range !26
  %16 = icmp ugt i32 %12, %15
  %17 = or disjoint i32 %13, 8
  %18 = select i1 %16, i32 %15, i32 0
  %19 = sub i32 %12, %18
  %20 = select i1 %16, i32 %17, i32 %13
  %21 = tail call i32 @llvm.ppu.bfe(i32 %5, i32 %20, i32 4) #17
  %22 = tail call range(i32 0, 33) i32 @llvm.ctpop.i32(i32 %21) #17, !range !26
  %23 = icmp ugt i32 %19, %22
  %24 = or disjoint i32 %20, 4
  %25 = select i1 %23, i32 %22, i32 0
  %26 = sub i32 %19, %25
  %27 = select i1 %23, i32 %24, i32 %20
  %28 = tail call i32 @llvm.ppu.bfe(i32 %5, i32 %27, i32 2) #17
  %29 = tail call range(i32 0, 33) i32 @llvm.ctpop.i32(i32 %28) #17, !range !26
  %30 = icmp ugt i32 %26, %29
  %31 = or disjoint i32 %27, 2
  %32 = select i1 %30, i32 %31, i32 %27
  %33 = tail call i32 @llvm.ppu.bfe(i32 %5, i32 %32, i32 1) #17
  %34 = icmp eq i32 %5, 0
  br i1 %34, label %.loopexit, label %35

35:                                               ; preds = %3
  %36 = select i1 %30, i32 %29, i32 0
  %37 = sub i32 %26, %36
  %38 = tail call range(i32 0, 33) i32 @llvm.ctpop.i32(i32 %33) #17, !range !26
  %39 = icmp ugt i32 %37, %38
  %40 = zext i1 %39 to i32
  %41 = add nuw nsw i32 %32, %40
  %42 = tail call range(i32 1, 33) i32 @llvm.ctpop.i32(i32 %5) #17, !range !26
  %43 = select i1 %39, i32 %38, i32 0
  %44 = sub i32 %37, %43
  %45 = icmp sgt i32 %44, 1
  %46 = tail call i32 @llvm.ppu.bfe(i32 %5, i32 %41, i32 1) #17
  %47 = icmp eq i32 %46, 0
  %48 = or i1 %45, %47
  %49 = select i1 %48, i32 -1, i32 %41
  br label %51

.loopexit:                                        ; preds = %51, %3
  %50 = tail call i32 @llvm.ppu.change.emsk(i32 %5) #22
  ret void

51:                                               ; preds = %51, %35
  %52 = phi i32 [ %77, %51 ], [ %49, %35 ]
  %53 = phi i32 [ %78, %51 ], [ %42, %35 ]
  %54 = tail call i32 @llvm.ppu.icmp.i32.i32(i32 %6, i32 %53, i32 40) #22
  %55 = and i32 %54, 63
  %56 = mul nuw nsw i32 %55, 17043521
  %57 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %4, i32 %52) #22
  %58 = tail call fastcc i32 @__ppustub_shfl_up_b32(i32 %57, i32 6) #22
  %59 = tail call i32 @llvm.ppu.mov.w.msk(i32 %58, i32 4032, i32 %57) #17
  %60 = tail call fastcc i32 @__ppustub_shfl_up_b32(i32 %59, i32 12) #22
  %61 = tail call i32 @llvm.ppu.mov.w.msk(i32 %60, i32 16773120, i32 %59) #17
  %62 = tail call fastcc i32 @__ppustub_shfl_up_b32(i32 %61, i32 24) #22
  %63 = tail call i32 @llvm.ppu.mov.w.msk(i32 %62, i32 -16777216, i32 %61) #17
  %64 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %1, i32 %52) #22
  %65 = tail call fastcc i32 @__ppustub_shfl_up_b32(i32 %64, i32 24) #22
  %66 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %2, i32 %52) #22
  %67 = tail call fastcc i32 @__ppustub_shfl_up_b32(i32 %66, i32 24) #22
  %68 = and i32 %63, 255
  %69 = tail call i32 @llvm.ppu.mov.w.msk(i32 %68, i32 16777215, i32 %63) #17
  %70 = tail call i32 @llvm.ppu.mov.w.msk(i32 1, i32 16777215, i32 %65) #17
  %71 = tail call i32 @llvm.ppu.mov.w.msk(i32 1, i32 16777215, i32 %67) #17
  %72 = tail call i32 @llvm.ppu.change.emsk(i32 %56) #22
  %73 = inttoptr i32 %69 to ptr addrspace(3)
  %74 = addrspacecast ptr addrspace(3) %73 to ptr
  %75 = tail call fastcc i32 @__ppukernelstub_atomic_cas_u32(ptr %74, i32 %70, i32 %71) #17
  %76 = tail call i32 @llvm.ppu.change.emsk(i32 -1) #22
  %77 = tail call fastcc i32 @__ppustub_shfl_down_b32(i32 %52, i32 6) #22
  %78 = add nsw i32 %53, -6
  %79 = icmp samesign ugt i32 %53, 6
  br i1 %79, label %51, label %.loopexit, !llvm.loop !42
}

; Function Attrs: convergent mustprogress noinline nounwind null_pointer_is_valid
define internal i32 @__ppupriv_tsm_cas_b32_rtn(ptr addrspace(3) %0, i32 %1, i32 %2) #7 {
  %4 = ptrtoint ptr addrspace(3) %0 to i32
  %5 = tail call i32 @llvm.ppu.change.emsk(i32 -1) #22
  %6 = tail call i32 @llvm.ppu.read.ltid() #17
  %7 = add i32 %6, 1
  %8 = tail call i32 @llvm.ppu.bfe(i32 %5, i32 0, i32 16) #17
  %9 = tail call range(i32 0, 33) i32 @llvm.ctpop.i32(i32 %8) #17, !range !26
  %10 = icmp ugt i32 %7, %9
  %11 = select i1 %10, i32 %9, i32 0
  %12 = sub i32 %7, %11
  %13 = select i1 %10, i32 16, i32 0
  %14 = tail call i32 @llvm.ppu.bfe(i32 %5, i32 %13, i32 8) #17
  %15 = tail call range(i32 0, 33) i32 @llvm.ctpop.i32(i32 %14) #17, !range !26
  %16 = icmp ugt i32 %12, %15
  %17 = or disjoint i32 %13, 8
  %18 = select i1 %16, i32 %15, i32 0
  %19 = sub i32 %12, %18
  %20 = select i1 %16, i32 %17, i32 %13
  %21 = tail call i32 @llvm.ppu.bfe(i32 %5, i32 %20, i32 4) #17
  %22 = tail call range(i32 0, 33) i32 @llvm.ctpop.i32(i32 %21) #17, !range !26
  %23 = icmp ugt i32 %19, %22
  %24 = or disjoint i32 %20, 4
  %25 = select i1 %23, i32 %22, i32 0
  %26 = sub i32 %19, %25
  %27 = select i1 %23, i32 %24, i32 %20
  %28 = tail call i32 @llvm.ppu.bfe(i32 %5, i32 %27, i32 2) #17
  %29 = tail call range(i32 0, 33) i32 @llvm.ctpop.i32(i32 %28) #17, !range !26
  %30 = icmp ugt i32 %26, %29
  %31 = or disjoint i32 %27, 2
  %32 = select i1 %30, i32 %31, i32 %27
  %33 = tail call i32 @llvm.ppu.bfe(i32 %5, i32 %32, i32 1) #17
  %34 = icmp eq i32 %5, 0
  br i1 %34, label %.loopexit, label %35

35:                                               ; preds = %3
  %36 = select i1 %30, i32 %29, i32 0
  %37 = sub i32 %26, %36
  %38 = tail call range(i32 0, 33) i32 @llvm.ctpop.i32(i32 %33) #17, !range !26
  %39 = icmp ugt i32 %37, %38
  %40 = zext i1 %39 to i32
  %41 = add nuw nsw i32 %32, %40
  %42 = tail call range(i32 1, 33) i32 @llvm.ctpop.i32(i32 %5) #17, !range !26
  %43 = select i1 %39, i32 %38, i32 0
  %44 = sub i32 %37, %43
  %45 = icmp sgt i32 %44, 1
  %46 = tail call i32 @llvm.ppu.bfe(i32 %5, i32 %41, i32 1) #17
  %47 = icmp eq i32 %46, 0
  %48 = or i1 %45, %47
  %49 = select i1 %48, i32 -1, i32 %41
  br label %56

.loopexit:                                        ; preds = %56, %3
  %50 = phi i32 [ 0, %3 ], [ %87, %56 ]
  %51 = tail call i32 @llvm.ppu.bfe(i32 %5, i32 0, i32 %6) #17
  %52 = tail call range(i32 0, 33) i32 @llvm.ctpop.i32(i32 %51) #17, !range !26
  %53 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %50, i32 %52) #22
  %54 = tail call i32 @llvm.ppu.change.emsk(i32 %5) #22
  %55 = tail call i32 @llvm.ppu.clobber.copy(i32 %53) #17
  ret i32 %55

56:                                               ; preds = %56, %35
  %57 = phi i32 [ %88, %56 ], [ %49, %35 ]
  %58 = phi i32 [ %89, %56 ], [ %42, %35 ]
  %59 = phi i32 [ %87, %56 ], [ 0, %35 ]
  %60 = phi i32 [ %90, %56 ], [ 0, %35 ]
  %61 = tail call i32 @llvm.ppu.icmp.i32.i32(i32 %6, i32 %58, i32 40) #22
  %62 = and i32 %61, 63
  %63 = mul nuw nsw i32 %62, 17043521
  %64 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %4, i32 %57) #22
  %65 = tail call fastcc i32 @__ppustub_shfl_up_b32(i32 %64, i32 6) #22
  %66 = tail call i32 @llvm.ppu.mov.w.msk(i32 %65, i32 4032, i32 %64) #17
  %67 = tail call fastcc i32 @__ppustub_shfl_up_b32(i32 %66, i32 12) #22
  %68 = tail call i32 @llvm.ppu.mov.w.msk(i32 %67, i32 16773120, i32 %66) #17
  %69 = tail call fastcc i32 @__ppustub_shfl_up_b32(i32 %68, i32 24) #22
  %70 = tail call i32 @llvm.ppu.mov.w.msk(i32 %69, i32 -16777216, i32 %68) #17
  %71 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %1, i32 %57) #22
  %72 = tail call fastcc i32 @__ppustub_shfl_up_b32(i32 %71, i32 24) #22
  %73 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %2, i32 %57) #22
  %74 = tail call fastcc i32 @__ppustub_shfl_up_b32(i32 %73, i32 24) #22
  %75 = and i32 %70, 255
  %76 = tail call i32 @llvm.ppu.mov.w.msk(i32 %75, i32 16777215, i32 %70) #17
  %77 = tail call i32 @llvm.ppu.mov.w.msk(i32 1, i32 16777215, i32 %72) #17
  %78 = tail call i32 @llvm.ppu.mov.w.msk(i32 1, i32 16777215, i32 %74) #17
  %79 = tail call i32 @llvm.ppu.change.emsk(i32 %63) #22
  %80 = inttoptr i32 %76 to ptr addrspace(3)
  %81 = addrspacecast ptr addrspace(3) %80 to ptr
  %82 = tail call fastcc i32 @__ppukernelstub_atomic_cas_u32(ptr %81, i32 %77, i32 %78) #17
  %83 = tail call i32 @llvm.ppu.change.emsk(i32 -1) #22
  %84 = tail call fastcc i32 @__ppustub_shfl_down_b32(i32 %82, i32 24) #22
  %85 = tail call fastcc i32 @__ppustub_shfl_up_b32(i32 %84, i32 %60) #22
  %86 = shl i32 63, %60
  %87 = tail call i32 @llvm.ppu.mov.w.msk(i32 %85, i32 %86, i32 %59) #17
  %88 = tail call fastcc i32 @__ppustub_shfl_down_b32(i32 %57, i32 6) #22
  %89 = add nsw i32 %58, -6
  %90 = add nuw nsw i32 %60, 6
  %91 = icmp samesign ugt i32 %58, 6
  br i1 %91, label %56, label %.loopexit, !llvm.loop !43
}

; Function Attrs: convergent mustprogress noinline nounwind null_pointer_is_valid
define internal void @__ppupriv_tsm_cas_b64(ptr addrspace(3) %0, i64 %1, i64 %2) #7 {
  %4 = ptrtoint ptr addrspace(3) %0 to i32
  %5 = tail call i32 @llvm.ppu.change.emsk(i32 -1) #22
  %6 = tail call i32 @llvm.ppu.read.ltid() #17
  %7 = add i32 %6, 1
  %8 = tail call i32 @llvm.ppu.bfe(i32 %5, i32 0, i32 16) #17
  %9 = tail call range(i32 0, 33) i32 @llvm.ctpop.i32(i32 %8) #17, !range !26
  %10 = icmp ugt i32 %7, %9
  %11 = select i1 %10, i32 %9, i32 0
  %12 = sub i32 %7, %11
  %13 = select i1 %10, i32 16, i32 0
  %14 = tail call i32 @llvm.ppu.bfe(i32 %5, i32 %13, i32 8) #17
  %15 = tail call range(i32 0, 33) i32 @llvm.ctpop.i32(i32 %14) #17, !range !26
  %16 = icmp ugt i32 %12, %15
  %17 = or disjoint i32 %13, 8
  %18 = select i1 %16, i32 %15, i32 0
  %19 = sub i32 %12, %18
  %20 = select i1 %16, i32 %17, i32 %13
  %21 = tail call i32 @llvm.ppu.bfe(i32 %5, i32 %20, i32 4) #17
  %22 = tail call range(i32 0, 33) i32 @llvm.ctpop.i32(i32 %21) #17, !range !26
  %23 = icmp ugt i32 %19, %22
  %24 = or disjoint i32 %20, 4
  %25 = select i1 %23, i32 %22, i32 0
  %26 = sub i32 %19, %25
  %27 = select i1 %23, i32 %24, i32 %20
  %28 = tail call i32 @llvm.ppu.bfe(i32 %5, i32 %27, i32 2) #17
  %29 = tail call range(i32 0, 33) i32 @llvm.ctpop.i32(i32 %28) #17, !range !26
  %30 = icmp ugt i32 %26, %29
  %31 = or disjoint i32 %27, 2
  %32 = select i1 %30, i32 %31, i32 %27
  %33 = tail call i32 @llvm.ppu.bfe(i32 %5, i32 %32, i32 1) #17
  %34 = tail call fastcc i32 @__ppustub_shfl_up_b32(i32 %6, i32 13) #22
  %35 = tail call i32 @llvm.ppu.mov.w.msk(i32 %34, i32 458752, i32 %6) #17
  %36 = tail call fastcc i32 @__ppustub_shfl_up_b32(i32 %35, i32 12) #22
  %37 = icmp eq i32 %5, 0
  br i1 %37, label %.loopexit, label %38

38:                                               ; preds = %3
  %39 = select i1 %30, i32 %29, i32 0
  %40 = sub i32 %26, %39
  %41 = tail call range(i32 0, 33) i32 @llvm.ctpop.i32(i32 %33) #17, !range !26
  %42 = icmp ugt i32 %40, %41
  %43 = zext i1 %42 to i32
  %44 = add nuw nsw i32 %32, %43
  %45 = tail call range(i32 1, 33) i32 @llvm.ctpop.i32(i32 %5) #17, !range !26
  %46 = select i1 %42, i32 %41, i32 0
  %47 = sub i32 %40, %46
  %48 = icmp sgt i32 %47, 1
  %49 = tail call i32 @llvm.ppu.bfe(i32 %5, i32 %44, i32 1) #17
  %50 = icmp eq i32 %49, 0
  %51 = or i1 %48, %50
  %52 = select i1 %51, i32 -1, i32 %44
  %53 = trunc i64 %1 to i32
  %54 = lshr i64 %1, 32
  %55 = trunc nuw i64 %54 to i32
  %56 = trunc i64 %2 to i32
  %57 = lshr i64 %2, 32
  %58 = trunc nuw i64 %57 to i32
  br label %60

.loopexit:                                        ; preds = %60, %3
  %59 = tail call i32 @llvm.ppu.change.emsk(i32 %5) #22
  ret void

60:                                               ; preds = %60, %38
  %61 = phi i32 [ %52, %38 ], [ %109, %60 ]
  %62 = phi i32 [ %45, %38 ], [ %110, %60 ]
  %63 = tail call i32 @llvm.ppu.icmp.i32.i32(i32 %6, i32 %62, i32 40) #22
  %64 = shl i32 %63, 13
  %65 = and i32 %64, 458752
  %66 = and i32 %63, 7
  %67 = or disjoint i32 %65, %66
  %68 = mul nuw nsw i32 %67, 4681
  %69 = icmp samesign ult i32 %62, 4
  %70 = or i32 %68, 2031616
  %71 = select i1 %69, i32 %70, i32 %68
  %72 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %4, i32 %61) #22
  %73 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %72, i32 %35) #22
  %74 = tail call fastcc i32 @__ppustub_shfl_up_b32(i32 %73, i32 3) #22
  %75 = tail call i32 @llvm.ppu.mov.w.msk(i32 %74, i32 3670072, i32 %73) #17
  %76 = tail call fastcc i32 @__ppustub_shfl_up_b32(i32 %75, i32 6) #22
  %77 = tail call i32 @llvm.ppu.mov.w.msk(i32 %76, i32 264245184, i32 %75) #17
  %78 = tail call fastcc i32 @__ppustub_shfl_up_b32(i32 %77, i32 12) #22
  %79 = tail call i32 @llvm.ppu.mov.w.msk(i32 %78, i32 1879076864, i32 %77) #17
  %80 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %53, i32 %61) #22
  %81 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %55, i32 %61) #22
  %82 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %80, i32 %36) #22
  %83 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %81, i32 %36) #22
  %84 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %56, i32 %61) #22
  %85 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %58, i32 %61) #22
  %86 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %84, i32 %36) #22
  %87 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %85, i32 %36) #22
  %88 = and i32 %79, 255
  %89 = tail call i32 @llvm.ppu.mov.w.msk(i32 %88, i32 268374015, i32 %79) #17
  %90 = tail call i32 @llvm.ppu.mov.w.msk(i32 0, i32 2031616, i32 %89) #17
  %91 = select i1 %69, i32 %90, i32 %89
  %92 = tail call i32 @llvm.ppu.mov.w.msk(i32 1, i32 268374015, i32 %82) #17
  %93 = tail call i32 @llvm.ppu.mov.w.msk(i32 0, i32 268374015, i32 %83) #17
  %94 = zext i32 %93 to i64
  %95 = shl nuw i64 %94, 32
  %96 = zext i32 %92 to i64
  %97 = or disjoint i64 %95, %96
  %98 = tail call i32 @llvm.ppu.mov.w.msk(i32 1, i32 268374015, i32 %86) #17
  %99 = tail call i32 @llvm.ppu.mov.w.msk(i32 0, i32 268374015, i32 %87) #17
  %100 = zext i32 %99 to i64
  %101 = shl nuw i64 %100, 32
  %102 = zext i32 %98 to i64
  %103 = or disjoint i64 %101, %102
  %104 = tail call i32 @llvm.ppu.change.emsk(i32 %71) #22
  %105 = inttoptr i32 %91 to ptr addrspace(3)
  %106 = addrspacecast ptr addrspace(3) %105 to ptr
  %107 = tail call fastcc i64 @__ppukernelstub_atomic_cas_u64(ptr %106, i64 %97, i64 %103) #17
  %108 = tail call i32 @llvm.ppu.change.emsk(i32 -1) #22
  %109 = tail call fastcc i32 @__ppustub_shfl_down_b32(i32 %61, i32 6) #22
  %110 = add nsw i32 %62, -6
  %111 = icmp samesign ugt i32 %62, 6
  br i1 %111, label %60, label %.loopexit, !llvm.loop !44
}

; Function Attrs: convergent mustprogress noinline nounwind null_pointer_is_valid
define internal i64 @__ppupriv_tsm_cas_b64_rtn(ptr addrspace(3) %0, i64 %1, i64 %2) #7 {
  %4 = ptrtoint ptr addrspace(3) %0 to i32
  %5 = tail call i32 @llvm.ppu.change.emsk(i32 -1) #22
  %6 = tail call i32 @llvm.ppu.read.ltid() #17
  %7 = add i32 %6, 1
  %8 = tail call i32 @llvm.ppu.bfe(i32 %5, i32 0, i32 16) #17
  %9 = tail call range(i32 0, 33) i32 @llvm.ctpop.i32(i32 %8) #17, !range !26
  %10 = icmp ugt i32 %7, %9
  %11 = select i1 %10, i32 %9, i32 0
  %12 = sub i32 %7, %11
  %13 = select i1 %10, i32 16, i32 0
  %14 = tail call i32 @llvm.ppu.bfe(i32 %5, i32 %13, i32 8) #17
  %15 = tail call range(i32 0, 33) i32 @llvm.ctpop.i32(i32 %14) #17, !range !26
  %16 = icmp ugt i32 %12, %15
  %17 = or disjoint i32 %13, 8
  %18 = select i1 %16, i32 %15, i32 0
  %19 = sub i32 %12, %18
  %20 = select i1 %16, i32 %17, i32 %13
  %21 = tail call i32 @llvm.ppu.bfe(i32 %5, i32 %20, i32 4) #17
  %22 = tail call range(i32 0, 33) i32 @llvm.ctpop.i32(i32 %21) #17, !range !26
  %23 = icmp ugt i32 %19, %22
  %24 = or disjoint i32 %20, 4
  %25 = select i1 %23, i32 %22, i32 0
  %26 = sub i32 %19, %25
  %27 = select i1 %23, i32 %24, i32 %20
  %28 = tail call i32 @llvm.ppu.bfe(i32 %5, i32 %27, i32 2) #17
  %29 = tail call range(i32 0, 33) i32 @llvm.ctpop.i32(i32 %28) #17, !range !26
  %30 = icmp ugt i32 %26, %29
  %31 = or disjoint i32 %27, 2
  %32 = select i1 %30, i32 %31, i32 %27
  %33 = tail call i32 @llvm.ppu.bfe(i32 %5, i32 %32, i32 1) #17
  %34 = tail call fastcc i32 @__ppustub_shfl_up_b32(i32 %6, i32 13) #22
  %35 = tail call i32 @llvm.ppu.mov.w.msk(i32 %34, i32 458752, i32 %6) #17
  %36 = tail call fastcc i32 @__ppustub_shfl_up_b32(i32 %35, i32 12) #22
  %37 = add nsw i32 %6, 12
  %38 = tail call fastcc i32 @__ppustub_shfl_down_b32(i32 %37, i32 13) #22
  %39 = tail call i32 @llvm.ppu.mov.w.msk(i32 %38, i32 56, i32 %37) #17
  %40 = icmp eq i32 %5, 0
  br i1 %40, label %.loopexit, label %41

41:                                               ; preds = %3
  %42 = select i1 %30, i32 %29, i32 0
  %43 = sub i32 %26, %42
  %44 = tail call range(i32 0, 33) i32 @llvm.ctpop.i32(i32 %33) #17, !range !26
  %45 = icmp ugt i32 %43, %44
  %46 = zext i1 %45 to i32
  %47 = add nuw nsw i32 %32, %46
  %48 = tail call range(i32 1, 33) i32 @llvm.ctpop.i32(i32 %5) #17, !range !26
  %49 = select i1 %45, i32 %44, i32 0
  %50 = sub i32 %43, %49
  %51 = icmp sgt i32 %50, 1
  %52 = tail call i32 @llvm.ppu.bfe(i32 %5, i32 %47, i32 1) #17
  %53 = icmp eq i32 %52, 0
  %54 = or i1 %51, %53
  %55 = select i1 %54, i32 -1, i32 %47
  %56 = trunc i64 %1 to i32
  %57 = lshr i64 %1, 32
  %58 = trunc nuw i64 %57 to i32
  %59 = trunc i64 %2 to i32
  %60 = lshr i64 %2, 32
  %61 = trunc nuw i64 %60 to i32
  br label %77

.loopexit:                                        ; preds = %77, %3
  %62 = phi i64 [ 0, %3 ], [ %144, %77 ]
  %63 = tail call i32 @llvm.ppu.bfe(i32 %5, i32 0, i32 %6) #17
  %64 = tail call range(i32 0, 33) i32 @llvm.ctpop.i32(i32 %63) #17, !range !26
  %65 = trunc i64 %62 to i32
  %66 = lshr i64 %62, 32
  %67 = trunc nuw i64 %66 to i32
  %68 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %65, i32 %64) #22
  %69 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %67, i32 %64) #22
  %70 = tail call i32 @llvm.ppu.change.emsk(i32 %5) #22
  %71 = tail call i32 @llvm.ppu.clobber.copy(i32 %68) #17
  %72 = tail call i32 @llvm.ppu.clobber.copy(i32 %69) #17
  %73 = zext i32 %72 to i64
  %74 = shl nuw i64 %73, 32
  %75 = zext i32 %71 to i64
  %76 = or disjoint i64 %74, %75
  ret i64 %76

77:                                               ; preds = %77, %41
  %78 = phi i32 [ %55, %41 ], [ %145, %77 ]
  %79 = phi i32 [ %48, %41 ], [ %146, %77 ]
  %80 = phi i64 [ 0, %41 ], [ %144, %77 ]
  %81 = phi i32 [ 0, %41 ], [ %147, %77 ]
  %82 = tail call i32 @llvm.ppu.icmp.i32.i32(i32 %6, i32 %79, i32 40) #22
  %83 = shl i32 %82, 13
  %84 = and i32 %83, 458752
  %85 = and i32 %82, 7
  %86 = or disjoint i32 %84, %85
  %87 = mul nuw nsw i32 %86, 4681
  %88 = icmp samesign ult i32 %79, 4
  %89 = or i32 %87, 2031616
  %90 = select i1 %88, i32 %89, i32 %87
  %91 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %4, i32 %78) #22
  %92 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %91, i32 %35) #22
  %93 = tail call fastcc i32 @__ppustub_shfl_up_b32(i32 %92, i32 3) #22
  %94 = tail call i32 @llvm.ppu.mov.w.msk(i32 %93, i32 3670072, i32 %92) #17
  %95 = tail call fastcc i32 @__ppustub_shfl_up_b32(i32 %94, i32 6) #22
  %96 = tail call i32 @llvm.ppu.mov.w.msk(i32 %95, i32 264245184, i32 %94) #17
  %97 = tail call fastcc i32 @__ppustub_shfl_up_b32(i32 %96, i32 12) #22
  %98 = tail call i32 @llvm.ppu.mov.w.msk(i32 %97, i32 1879076864, i32 %96) #17
  %99 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %56, i32 %78) #22
  %100 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %58, i32 %78) #22
  %101 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %99, i32 %36) #22
  %102 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %100, i32 %36) #22
  %103 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %59, i32 %78) #22
  %104 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %61, i32 %78) #22
  %105 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %103, i32 %36) #22
  %106 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %104, i32 %36) #22
  %107 = and i32 %98, 255
  %108 = tail call i32 @llvm.ppu.mov.w.msk(i32 %107, i32 268374015, i32 %98) #17
  %109 = tail call i32 @llvm.ppu.mov.w.msk(i32 0, i32 2031616, i32 %108) #17
  %110 = select i1 %88, i32 %109, i32 %108
  %111 = tail call i32 @llvm.ppu.mov.w.msk(i32 1, i32 268374015, i32 %101) #17
  %112 = tail call i32 @llvm.ppu.mov.w.msk(i32 0, i32 268374015, i32 %102) #17
  %113 = zext i32 %112 to i64
  %114 = shl nuw i64 %113, 32
  %115 = zext i32 %111 to i64
  %116 = or disjoint i64 %114, %115
  %117 = tail call i32 @llvm.ppu.mov.w.msk(i32 1, i32 268374015, i32 %105) #17
  %118 = tail call i32 @llvm.ppu.mov.w.msk(i32 0, i32 268374015, i32 %106) #17
  %119 = zext i32 %118 to i64
  %120 = shl nuw i64 %119, 32
  %121 = zext i32 %117 to i64
  %122 = or disjoint i64 %120, %121
  %123 = tail call i32 @llvm.ppu.change.emsk(i32 %90) #22
  %124 = inttoptr i32 %110 to ptr addrspace(3)
  %125 = addrspacecast ptr addrspace(3) %124 to ptr
  %126 = tail call fastcc i64 @__ppukernelstub_atomic_cas_u64(ptr %125, i64 %116, i64 %122) #17
  %127 = tail call i32 @llvm.ppu.change.emsk(i32 -1) #22
  %128 = trunc i64 %126 to i32
  %129 = lshr i64 %126, 32
  %130 = trunc nuw i64 %129 to i32
  %131 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %128, i32 %39) #22
  %132 = tail call fastcc i32 @__ppustub_shfl_idx_b32(i32 %130, i32 %39) #22
  %133 = tail call fastcc i32 @__ppustub_shfl_up_b32(i32 %131, i32 %81) #22
  %134 = tail call fastcc i32 @__ppustub_shfl_up_b32(i32 %132, i32 %81) #22
  %135 = shl i32 63, %81
  %136 = trunc i64 %80 to i32
  %137 = lshr i64 %80, 32
  %138 = trunc nuw i64 %137 to i32
  %139 = tail call i32 @llvm.ppu.mov.w.msk(i32 %133, i32 %135, i32 %136) #17
  %140 = tail call i32 @llvm.ppu.mov.w.msk(i32 %134, i32 %135, i32 %138) #17
  %141 = zext i32 %140 to i64
  %142 = shl nuw i64 %141, 32
  %143 = zext i32 %139 to i64
  %144 = or disjoint i64 %142, %143
  %145 = tail call fastcc i32 @__ppustub_shfl_down_b32(i32 %78, i32 6) #22
  %146 = add nsw i32 %79, -6
  %147 = add nuw nsw i32 %81, 6
  %148 = icmp samesign ugt i32 %79, 6
  br i1 %148, label %77, label %.loopexit, !llvm.loop !45
}

; Function Attrs: convergent nomerge nounwind
declare dso_local i32 @llvm.ppu.change.emsk(i32) #8

; Function Attrs: nofree nosync nounwind speculatable memory(none)
declare dso_local i32 @llvm.ppu.read.ltid() #9

; Function Attrs: nofree nosync nounwind speculatable memory(none)
declare dso_local i32 @llvm.ppu.bfe(i32, i32, i32) #9

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare dso_local i32 @llvm.ctpop.i32(i32) #10

; Function Attrs: convergent nounwind null_pointer_is_valid memory(inaccessiblemem: readwrite)
define internal fastcc i32 @__ppustub_shfl_up_b32(i32 %0, i32 %1) unnamed_addr #11 {
  %3 = tail call { i32, i1 } @llvm.ppu.shuffle.up.pred(i32 %0, i32 %1, i32 0)
  %4 = extractvalue { i32, i1 } %3, 0
  ret i32 %4
}

; Function Attrs: nofree nosync nounwind speculatable memory(none)
declare dso_local i32 @llvm.ppu.mov.w.msk(i32, i32, i32) #9

; Function Attrs: convergent nounwind null_pointer_is_valid memory(inaccessiblemem: readwrite)
define internal fastcc i32 @__ppustub_shfl_down_b32(i32 %0, i32 range(i32 6, 25) %1) unnamed_addr #11 {
  %3 = tail call { i32, i1 } @llvm.ppu.shuffle.down.pred(i32 %0, i32 %1, i32 992)
  %4 = extractvalue { i32, i1 } %3, 0
  ret i32 %4
}

; Function Attrs: convergent nounwind null_pointer_is_valid memory(inaccessiblemem: readwrite)
define internal fastcc i32 @__ppustub_shfl_idx_b32(i32 %0, i32 %1) unnamed_addr #11 {
  %3 = tail call { i32, i1 } @llvm.ppu.shuffle.idx.pred(i32 %0, i32 %1, i32 992)
  %4 = extractvalue { i32, i1 } %3, 0
  ret i32 %4
}

; Function Attrs: nofree nosync nounwind memory(none)
declare dso_local i32 @llvm.ppu.clobber.copy(i32) #12

; Function Attrs: convergent nofree nounwind memory(none)
declare dso_local i32 @llvm.ppu.icmp.i32.i32(i32, i32, i32 immarg) #13

; Function Attrs: mustprogress nofree norecurse nounwind null_pointer_is_valid willreturn memory(argmem: readwrite)
define internal fastcc i64 @__ppukernel_atomicCAS_u64(ptr captures(none) %0, i64 %1, i64 %2) unnamed_addr #14 {
  %4 = tail call fastcc i64 @__ppukernelstub_atomic_cas_u64(ptr %0, i64 %1, i64 %2) #17
  ret i64 %4
}

; Function Attrs: mustprogress nofree norecurse nounwind null_pointer_is_valid willreturn memory(argmem: readwrite)
define internal fastcc i64 @__ppukernelstub_atomic_cas_u64(ptr captures(none) %0, i64 %1, i64 %2) unnamed_addr #15 {
  %4 = cmpxchg ptr %0, i64 %1, i64 %2 monotonic monotonic, align 8
  %5 = extractvalue { i64, i1 } %4, 0
  ret i64 %5
}

; Function Attrs: convergent nomerge nounwind memory(inaccessiblemem: readwrite)
declare { i32, i1 } @llvm.ppu.shuffle.idx.pred(i32, i32, i32) #16

; Function Attrs: convergent nomerge nounwind memory(inaccessiblemem: readwrite)
declare { i32, i1 } @llvm.ppu.shuffle.down.pred(i32, i32, i32) #16

; Function Attrs: convergent nomerge nounwind memory(inaccessiblemem: readwrite)
declare { i32, i1 } @llvm.ppu.shuffle.up.pred(i32, i32, i32) #16

; Function Attrs: mustprogress nofree norecurse nounwind null_pointer_is_valid willreturn memory(argmem: readwrite)
define internal fastcc i32 @__ppukernelstub_atomic_cas_u32(ptr captures(none) %0, i32 %1, i32 %2) unnamed_addr #15 {
  %4 = cmpxchg ptr %0, i32 %1, i32 %2 monotonic monotonic, align 4
  %5 = extractvalue { i32, i1 } %4, 0
  ret i32 %5
}

; Function Attrs: nounwind
declare void @llvm.ppu.assert() #17

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr captures(none)) #18

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr captures(none)) #18

; Function Attrs: mustprogress norecurse nounwind null_pointer_is_valid
define internal fastcc i32 @__ppumathpriv_div_full_qs_u128(ptr captures(none) %0, ptr captures(none) %1, ptr captures(none) %2, ptr captures(none) %3, ptr captures(none) %4, ptr readonly byval(%struct.int4) align 16 captures(none) %5, i32 %6) unnamed_addr #19 {
  %8 = load i32, ptr %2, align 4, !tbaa !35
  %9 = load i32, ptr %3, align 4, !tbaa !35
  %10 = load i32, ptr %4, align 4, !tbaa !35
  %11 = getelementptr inbounds nuw i8, ptr %5, i64 8
  %12 = load i32, ptr %11, align 8, !tbaa !32
  %13 = getelementptr inbounds nuw i8, ptr %5, i64 12
  %14 = load i32, ptr %13, align 4, !tbaa !27
  %15 = tail call i32 @llvm.ppu.sub.co.u32(i32 %8, i32 %12) #17
  %16 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 %9, i32 %14) #17
  %17 = tail call i32 @llvm.ppu.sub.ci.u32(i32 %10, i32 -2) #17
  %18 = zext i32 %10 to i64
  %19 = zext i32 %6 to i64
  %20 = mul nuw i64 %18, %19
  %21 = lshr i64 %20, 32
  %22 = trunc nuw i64 %21 to i32
  %23 = add i32 %17, %22
  %24 = icmp ult i32 %23, %10
  %25 = select i1 %24, i32 -1, i32 %23
  %26 = mul i32 %25, %12
  %27 = tail call i32 @llvm.ppu.add.co.u32(i32 %26, i32 0) #17
  %28 = zext i32 %25 to i64
  %29 = zext i32 %12 to i64
  %30 = mul nuw i64 %28, %29
  %31 = lshr i64 %30, 32
  %32 = trunc nuw i64 %31 to i32
  %33 = tail call i32 @llvm.ppu.add.ci.u32(i32 %32, i32 0) #17
  %34 = mul i32 %25, %14
  %35 = tail call i32 @llvm.ppu.add.co.u32(i32 %34, i32 %33) #17
  %36 = zext i32 %14 to i64
  %37 = mul nuw i64 %28, %36
  %38 = lshr i64 %37, 32
  %39 = trunc nuw i64 %38 to i32
  %40 = tail call i32 @llvm.ppu.add.ci.u32(i32 %39, i32 0) #17
  %41 = tail call i32 @llvm.ppu.sub.co.u32(i32 %8, i32 %27) #17
  %42 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 %9, i32 %35) #17
  %43 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 %10, i32 %40) #17
  %44 = tail call i32 @llvm.ppu.add.ci.u32(i32 0, i32 0) #17
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %46, label %.thread

46:                                               ; preds = %7
  %47 = tail call i32 @llvm.ppu.add.co.u32(i32 %41, i32 %12) #17
  %48 = tail call i32 @llvm.ppu.add.co.ci.u32(i32 %42, i32 %14) #17
  %49 = tail call i32 @llvm.ppu.add.co.ci.u32(i32 %43, i32 0) #17
  %50 = tail call i32 @llvm.ppu.add.ci.u32(i32 0, i32 0) #17
  %51 = add i32 %25, -1
  %52 = icmp eq i32 %50, 0
  br i1 %52, label %53, label %.thread

53:                                               ; preds = %46
  %54 = tail call i32 @llvm.ppu.add.co.u32(i32 %47, i32 %12) #17
  %55 = tail call i32 @llvm.ppu.add.co.ci.u32(i32 %48, i32 %14) #17
  %56 = tail call i32 @llvm.ppu.add.ci.u32(i32 %49, i32 0) #17
  %57 = add i32 %25, -2
  br label %.thread

.thread:                                          ; preds = %7, %53, %46
  %58 = phi i32 [ %56, %53 ], [ %49, %46 ], [ %43, %7 ]
  %59 = phi i32 [ %55, %53 ], [ %48, %46 ], [ %42, %7 ]
  %60 = phi i32 [ %54, %53 ], [ %47, %46 ], [ %41, %7 ]
  %61 = phi i32 [ %57, %53 ], [ %51, %46 ], [ %25, %7 ]
  %62 = load i32, ptr %5, align 16, !tbaa !34
  %63 = mul i32 %62, %61
  %64 = tail call i32 @llvm.ppu.add.co.u32(i32 %63, i32 0) #17
  %65 = zext i32 %61 to i64
  %66 = zext i32 %62 to i64
  %67 = mul nuw i64 %66, %65
  %68 = lshr i64 %67, 32
  %69 = trunc nuw i64 %68 to i32
  %70 = tail call i32 @llvm.ppu.add.ci.u32(i32 %69, i32 0) #17
  %71 = getelementptr inbounds nuw i8, ptr %5, i64 4
  %72 = load i32, ptr %71, align 4, !tbaa !33
  %73 = mul i32 %72, %61
  %74 = tail call i32 @llvm.ppu.add.co.u32(i32 %73, i32 %70) #17
  %75 = zext i32 %72 to i64
  %76 = mul nuw i64 %75, %65
  %77 = lshr i64 %76, 32
  %78 = trunc nuw i64 %77 to i32
  %79 = tail call i32 @llvm.ppu.add.ci.u32(i32 %78, i32 0) #17
  %80 = load i32, ptr %0, align 4, !tbaa !35
  %81 = load i32, ptr %1, align 4, !tbaa !35
  store i32 0, ptr %0, align 4, !tbaa !35
  %82 = tail call i32 @llvm.ppu.sub.co.u32(i32 %80, i32 %64) #17
  store i32 %82, ptr %1, align 4, !tbaa !35
  %83 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 %81, i32 %74) #17
  store i32 %83, ptr %2, align 4, !tbaa !35
  %84 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 %60, i32 %79) #17
  store i32 %84, ptr %3, align 4, !tbaa !35
  %85 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 %59, i32 0) #17
  store i32 %85, ptr %4, align 4, !tbaa !35
  %86 = tail call i32 @llvm.ppu.sub.co.ci.u32(i32 %58, i32 0) #17
  %87 = tail call i32 @llvm.ppu.sub.ci.u32(i32 0, i32 0) #17
  %88 = icmp eq i32 %87, -1
  br i1 %88, label %89, label %99

89:                                               ; preds = %.thread
  %90 = add i32 %61, -1
  %91 = load i32, ptr %1, align 4, !tbaa !35
  %92 = tail call i32 @llvm.ppu.add.co.u32(i32 %91, i32 %62) #17
  store i32 %92, ptr %1, align 4, !tbaa !35
  %93 = load i32, ptr %2, align 4, !tbaa !35
  %94 = tail call i32 @llvm.ppu.add.co.ci.u32(i32 %93, i32 %72) #17
  store i32 %94, ptr %2, align 4, !tbaa !35
  %95 = load i32, ptr %3, align 4, !tbaa !35
  %96 = tail call i32 @llvm.ppu.add.co.ci.u32(i32 %95, i32 %12) #17
  store i32 %96, ptr %3, align 4, !tbaa !35
  %97 = load i32, ptr %4, align 4, !tbaa !35
  %98 = tail call i32 @llvm.ppu.add.ci.u32(i32 %97, i32 %14) #17
  store i32 %98, ptr %4, align 4, !tbaa !35
  br label %99

99:                                               ; preds = %89, %.thread
  %100 = phi i32 [ %90, %89 ], [ %61, %.thread ]
  ret i32 %100
}

; Function Attrs: nounwind
declare dso_local i32 @llvm.ppu.sub.co.u32(i32, i32) #17

; Function Attrs: nounwind
declare dso_local i32 @llvm.ppu.sub.co.ci.u32(i32, i32) #17

; Function Attrs: nounwind
declare dso_local i32 @llvm.ppu.sub.ci.u32(i32, i32) #17

; Function Attrs: nounwind
declare dso_local i32 @llvm.ppu.add.co.u32(i32, i32) #17

; Function Attrs: nounwind
declare dso_local i32 @llvm.ppu.add.ci.u32(i32, i32) #17

; Function Attrs: nounwind
declare dso_local i32 @llvm.ppu.add.co.ci.u32(i32, i32) #17

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fshr.i32(i32, i32, i32) #10

; Function Attrs: nofree nosync nounwind speculatable memory(none)
declare i32 @llvm.ppu.prmt(i32, i32, i32) #9

; Function Attrs: nofree nosync nounwind speculatable memory(none)
declare i32 @llvm.ppu.mul.u32(i32, i32) #9

; Function Attrs: nofree nosync nounwind speculatable memory(none)
declare i32 @llvm.ppu.add.u32(i32, i32) #9

; Function Attrs: nofree nosync nounwind speculatable memory(none)
declare float @llvm.ppu.rcp.f32(float) #9

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fshl.i32(i32, i32, i32) #10

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #10

; Function Attrs: convergent nounwind null_pointer_is_valid
declare dso_local i32 @__hggc_reflect(ptr) local_unnamed_addr #20

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #10

; Function Attrs: nofree nosync nounwind speculatable memory(none)
declare float @llvm.ppu.fma.ru.f32(float, float, float) #9

; Function Attrs: nofree nosync nounwind speculatable memory(none)
declare float @llvm.ppu.fma.rd.f32(float, float, float) #9

; Function Attrs: convergent mustprogress nofree noinline norecurse nounwind null_pointer_is_valid willreturn memory(none)
define internal fastcc float @__ppumathpriv_rcp_approx_ftz_f32(float %0) unnamed_addr #21 {
  %2 = tail call i32 @__hggc_reflect(ptr addrspacecast (ptr addrspace(4) @.str.8.236 to ptr)) #22
  %3 = icmp sgt i32 %2, 169
  br i1 %3, label %4, label %6

4:                                                ; preds = %1
  %5 = tail call contract float @llvm.ppu.rcp.ftz.f32(float %0) #17
  br label %28

6:                                                ; preds = %1
  %7 = tail call i32 @__hggc_reflect(ptr addrspacecast (ptr addrspace(4) @.str.1.9 to ptr)) #22
  %8 = and i32 %7, 32
  %9 = icmp eq i32 %8, 0
  %10 = tail call contract float @llvm.fabs.f32(float %0)
  %11 = fcmp contract olt float %10, 0x3810000000000000
  %12 = and i1 %11, %9
  %13 = bitcast float %0 to i32
  %14 = and i32 %13, -2147483648
  %15 = bitcast i32 %14 to float
  %16 = select i1 %12, float %15, float %0
  %17 = tail call contract float @llvm.ppu.rcp.f32(float %16) #17
  %18 = tail call i32 @__hggc_reflect(ptr addrspacecast (ptr addrspace(4) @.str.1.9 to ptr)) #22
  %19 = and i32 %18, 32
  %20 = icmp eq i32 %19, 0
  %21 = tail call contract float @llvm.fabs.f32(float %17)
  %22 = fcmp contract olt float %21, 0x3810000000000000
  %23 = and i1 %22, %20
  br i1 %23, label %24, label %28

24:                                               ; preds = %6
  %25 = bitcast float %17 to i32
  %26 = and i32 %25, -2147483648
  %27 = bitcast i32 %26 to float
  br label %28

28:                                               ; preds = %24, %6, %4
  %29 = phi float [ %5, %4 ], [ %17, %6 ], [ %27, %24 ]
  ret float %29
}

; Function Attrs: convergent nomerge nounwind
declare i32 @llvm.ppu.get.mode.fp.den() #8

; Function Attrs: convergent nomerge nounwind
declare dso_local void @llvm.ppu.set.mode.fp.den(i32) #8

; Function Attrs: nofree nosync nounwind speculatable memory(none)
declare float @llvm.ppu.fma.rn.f32(float, float, float) #9

; Function Attrs: nofree nosync nounwind speculatable memory(none)
declare float @llvm.ppu.rcp.ftz.f32(float) #9

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #10

; Function Attrs: convergent nounwind
declare void @llvm.ppu.ftz.off.end() #22

; Function Attrs: convergent nounwind
declare void @llvm.ppu.ftz.off.start() #22

; Function Attrs: mustprogress nofree norecurse nosync nounwind null_pointer_is_valid willreturn memory(none)
define internal fastcc i1 @__llvm_ppu_fcmp_olt_f16(half %0, half %1) unnamed_addr #23 {
  %3 = fcmp olt half %0, %1
  ret i1 %3
}

; Function Attrs: nofree nosync nounwind speculatable memory(none)
declare i1 @llvm.ppu.fdiv.chk(float, float) #9

; Function Attrs: nofree nosync nounwind speculatable memory(none)
declare float @llvm.ppu.fdiv.fast.after.chk(float, float) #9

; Function Attrs: mustprogress nofree noinline nosync nounwind null_pointer_is_valid willreturn memory(none)
define internal fastcc float @_ZL35__ppumathpriv_div_rte_slow_path_f32ff(float %0, float %1) unnamed_addr #24 {
  %3 = bitcast float %0 to i32
  %4 = lshr i32 %3, 23
  %5 = and i32 %4, 255
  %6 = bitcast float %1 to i32
  %7 = lshr i32 %6, 23
  %8 = and i32 %7, 255
  %9 = tail call contract float @llvm.fabs.f32(float %0)
  %10 = tail call contract float @llvm.fabs.f32(float %1)
  %11 = fcmp contract oeq float %9, 0x7FF0000000000000
  %12 = fcmp contract oeq float %10, 0x7FF0000000000000
  %13 = add nsw i32 %5, -255
  %14 = icmp ult i32 %13, -254
  %15 = add nsw i32 %8, -255
  %16 = icmp ult i32 %15, -254
  %17 = or i1 %14, %16
  br i1 %17, label %18, label %47

18:                                               ; preds = %2
  %19 = fcmp uno float %0, %1
  %20 = fcmp contract oeq float %0, 0.000000e+00
  %21 = or i1 %20, %19
  %22 = fcmp contract oeq float %1, 0.000000e+00
  %23 = or i1 %22, %21
  %24 = or i1 %11, %23
  %25 = or i1 %12, %24
  br i1 %25, label %26, label %38

26:                                               ; preds = %18
  %27 = and i1 %20, %22
  %28 = and i1 %11, %12
  %29 = or i1 %27, %28
  %30 = or i1 %19, %29
  br i1 %30, label %118, label %31

31:                                               ; preds = %26
  %32 = or i1 %20, %12
  %33 = xor i32 %6, %3
  %34 = and i32 %33, -2147483648
  %35 = or disjoint i32 %34, 2139095040
  %36 = select i1 %32, i32 %34, i32 %35
  %37 = bitcast i32 %36 to float
  br label %118

38:                                               ; preds = %18
  %39 = icmp eq i32 %5, 0
  %40 = fmul contract float %0, 0x43F0000000000000
  %41 = select i1 %39, i32 -64, i32 0
  %42 = select i1 %39, float %40, float %0
  %43 = icmp eq i32 %8, 0
  br i1 %43, label %44, label %47

44:                                               ; preds = %38
  %45 = fmul contract float %1, 0x43F0000000000000
  %46 = add nsw i32 %41, 64
  %.pre = bitcast float %45 to i32
  br label %47

47:                                               ; preds = %44, %38, %2
  %.pre-phi = phi i32 [ %.pre, %44 ], [ %6, %38 ], [ %6, %2 ]
  %48 = phi i32 [ %46, %44 ], [ %41, %38 ], [ 0, %2 ]
  %49 = phi float [ %42, %44 ], [ %42, %38 ], [ %0, %2 ]
  %50 = bitcast float %49 to i32
  %51 = shl nuw nsw i32 %5, 23
  %reass.sub5 = sub i32 %50, %51
  %52 = add i32 %reass.sub5, 1065353216
  %53 = bitcast i32 %52 to float
  %54 = shl nuw nsw i32 %8, 23
  %reass.sub6 = sub i32 %.pre-phi, %54
  %55 = add i32 %reass.sub6, 1065353216
  %56 = bitcast i32 %55 to float
  %57 = tail call contract float @llvm.ppu.rcp.f32(float %56) #17
  %58 = fmul contract float %57, %56
  %59 = fsub contract float 1.000000e+00, %58
  %60 = fmul contract float %57, %59
  %61 = fadd contract float %57, %60
  %62 = fmul contract float %61, %53
  %63 = fmul contract float %62, %56
  %64 = fsub contract float %53, %63
  %65 = fmul contract float %61, %64
  %66 = fadd contract float %62, %65
  %67 = fmul contract float %66, %56
  %68 = fsub contract float %53, %67
  %69 = fmul contract float %61, %68
  %70 = fadd contract float %66, %69
  %71 = bitcast float %70 to i32
  %72 = lshr i32 %71, 23
  %73 = and i32 %72, 255
  %74 = sub nsw i32 %5, %8
  %75 = add nsw i32 %48, %74
  %76 = add nsw i32 %73, %75
  %77 = add nsw i32 %76, -1
  %78 = icmp ult i32 %77, 254
  br i1 %78, label %79, label %83

79:                                               ; preds = %47
  %80 = shl i32 %75, 23
  %81 = add nsw i32 %80, %71
  %82 = bitcast i32 %81 to float
  br label %118

83:                                               ; preds = %47
  %84 = icmp sgt i32 %76, 254
  br i1 %84, label %85, label %87

85:                                               ; preds = %83
  %86 = tail call float @llvm.copysign.f32(float 0x7FF0000000000000, float %70)
  br label %118

87:                                               ; preds = %83
  %88 = icmp sgt i32 %76, 0
  br i1 %88, label %118, label %89

89:                                               ; preds = %87
  %90 = icmp slt i32 %76, -24
  br i1 %90, label %91, label %94

91:                                               ; preds = %89
  %92 = and i32 %71, -2147483648
  %93 = bitcast i32 %92 to float
  br label %118

94:                                               ; preds = %89
  %95 = tail call contract float @llvm.ppu.fma.ru.f32(float %61, float %68, float %66) #17
  %96 = tail call contract float @llvm.ppu.fma.rd.f32(float %61, float %68, float %66) #17
  %97 = fcmp une float %96, %95
  %98 = tail call contract float @llvm.ppu.fma.rz.f32(float %61, float %68, float %66) #17
  %99 = bitcast float %98 to i32
  %100 = and i32 %99, 8388607
  %101 = or disjoint i32 %100, 8388608
  %102 = add nsw i32 %76, 32
  %103 = shl i32 %101, %102
  %104 = icmp ne i32 %103, 0
  %105 = sub nsw i32 0, %76
  %106 = lshr i32 %101, %105
  %107 = icmp ne i32 %76, 0
  %108 = and i1 %107, %104
  %109 = or i1 %97, %108
  %110 = zext i1 %109 to i32
  %111 = lshr i32 %106, 1
  %112 = and i32 %111, 1
  %113 = or i32 %112, %110
  %114 = and i32 %113, %106
  %115 = add nuw nsw i32 %114, %111
  %116 = bitcast i32 %115 to float
  %117 = tail call float @llvm.copysign.f32(float %116, float %70)
  br label %118

118:                                              ; preds = %94, %91, %87, %85, %79, %31, %26
  %119 = phi float [ %82, %79 ], [ %86, %85 ], [ %93, %91 ], [ %117, %94 ], [ %70, %87 ], [ 0x7FFFFFFFE0000000, %26 ], [ %37, %31 ]
  ret float %119
}

; Function Attrs: nofree nosync nounwind speculatable memory(none)
declare float @llvm.ppu.fma.rz.f32(float, float, float) #9

; Function Attrs: convergent mustprogress nofree noinline nounwind null_pointer_is_valid willreturn memory(none)
define internal fastcc double @_ZL36__ppumathpriv_ddiv_rte_slow_path_f64dd(double %0, double %1) unnamed_addr #25 {
  %3 = tail call i32 @__hggc_reflect(ptr addrspacecast (ptr addrspace(4) @.str.43.237 to ptr)) #22
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %__builtin_ppu_ftz_off_start.exit, label %5

5:                                                ; preds = %2
  tail call void @llvm.ppu.ftz.off.start() #22
  br label %__builtin_ppu_ftz_off_start.exit

__builtin_ppu_ftz_off_start.exit:                 ; preds = %2, %5
  %6 = tail call i32 @__hggc_reflect(ptr addrspacecast (ptr addrspace(4) @.str.43.237 to ptr)) #22
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %__builtin_ppu_ftz_off_start.exit.i, label %8

8:                                                ; preds = %__builtin_ppu_ftz_off_start.exit
  tail call void @llvm.ppu.ftz.off.start() #22
  br label %__builtin_ppu_ftz_off_start.exit.i

__builtin_ppu_ftz_off_start.exit.i:               ; preds = %8, %__builtin_ppu_ftz_off_start.exit
  %9 = fcmp contract ord double %1, 0.000000e+00
  %10 = bitcast double %1 to i64
  %11 = and i64 %10, 4503595332403200
  %12 = icmp eq i64 %11, 0
  %or.cond.i = select i1 %9, i1 true, i1 %12
  br i1 %or.cond.i, label %__builtin_ppu_ftz_off_start.exit._crit_edge.i, label %42

__builtin_ppu_ftz_off_start.exit._crit_edge.i:    ; preds = %__builtin_ppu_ftz_off_start.exit.i
  %13 = and i64 %10, -9223372036854775808
  %14 = tail call contract double @llvm.fabs.f64(double %1)
  %15 = bitcast double %14 to i64
  %16 = lshr i64 %15, 52
  %17 = trunc nuw nsw i64 %16 to i32
  switch i32 %17, label %20 [
    i32 0, label %18
    i32 2047, label %39
  ]

18:                                               ; preds = %__builtin_ppu_ftz_off_start.exit._crit_edge.i
  %19 = or disjoint i64 %13, 9218868437227405312
  br label %39

20:                                               ; preds = %__builtin_ppu_ftz_off_start.exit._crit_edge.i
  %21 = lshr i64 %15, 29
  %22 = trunc i64 %21 to i32
  %23 = and i32 %22, 8388600
  %24 = or disjoint i32 %23, 1065353216
  %25 = bitcast i32 %24 to float
  %26 = tail call contract float @llvm.ppu.rcp.f32(float %25) #17
  %27 = bitcast float %26 to i32
  %28 = ashr i32 %27, 23
  %reass.sub.i = sub nsw i32 %28, %17
  %29 = icmp slt i32 %reass.sub.i, -1919
  br i1 %29, label %39, label %30

30:                                               ; preds = %20
  %31 = shl nsw i32 %reass.sub.i, 20
  %32 = add i32 %31, 2012217344
  %33 = lshr i32 %27, 3
  %34 = and i32 %33, 1048575
  %35 = or disjoint i32 %32, %34
  %36 = zext i32 %35 to i64
  %37 = shl nuw i64 %36, 32
  %38 = or i64 %37, %13
  br label %39

39:                                               ; preds = %30, %20, %18, %__builtin_ppu_ftz_off_start.exit._crit_edge.i
  %40 = phi i64 [ %19, %18 ], [ %13, %__builtin_ppu_ftz_off_start.exit._crit_edge.i ], [ %38, %30 ], [ %13, %20 ]
  %41 = bitcast i64 %40 to double
  br label %42

42:                                               ; preds = %39, %__builtin_ppu_ftz_off_start.exit.i
  %43 = phi double [ %41, %39 ], [ 0x7FF8000000000000, %__builtin_ppu_ftz_off_start.exit.i ]
  %44 = tail call i32 @__hggc_reflect(ptr addrspacecast (ptr addrspace(4) @.str.43.237 to ptr)) #22
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %__ppumath_drcp_f64.exit, label %46

46:                                               ; preds = %42
  tail call void @llvm.ppu.ftz.off.end() #22
  br label %__ppumath_drcp_f64.exit

__ppumath_drcp_f64.exit:                          ; preds = %42, %46
  %47 = bitcast double %0 to i64
  %48 = lshr i64 %47, 32
  %49 = trunc nuw i64 %48 to i32
  %50 = bitcast i32 %49 to float
  %51 = tail call contract float @llvm.fabs.f32(float %50)
  %52 = fcmp contract ogt float %51, 0x386B6E6660000000
  br i1 %52, label %53, label %80

53:                                               ; preds = %__ppumath_drcp_f64.exit
  %54 = bitcast double %43 to i64
  %55 = or i64 %54, 1
  %56 = bitcast i64 %55 to double
  %57 = fmul contract double %1, %56
  %58 = fsub contract double 1.000000e+00, %57
  %59 = fmul contract double %58, %58
  %60 = fadd contract double %58, %59
  %61 = fmul contract double %60, %56
  %62 = fadd contract double %61, %56
  %63 = fmul contract double %0, %62
  %64 = fmul contract double %1, %63
  %65 = fsub contract double %0, %64
  %66 = fmul contract double %62, %65
  %67 = fadd contract double %63, %66
  %68 = lshr i64 %10, 32
  %69 = trunc nuw i64 %68 to i32
  %70 = bitcast double %67 to i64
  %71 = lshr i64 %70, 32
  %72 = trunc nuw i64 %71 to i32
  %73 = bitcast i32 %72 to float
  %74 = tail call contract float @llvm.fabs.f32(float %73)
  %75 = fpext float %74 to double
  %76 = fcmp contract ule double %75, 0x37C5555400000000
  %77 = bitcast i32 %69 to float
  %78 = fcmp contract uno float %77, 0.000000e+00
  %79 = or i1 %78, %76
  br i1 %79, label %80, label %243

80:                                               ; preds = %53, %__ppumath_drcp_f64.exit
  %81 = and i32 %49, 2139095040
  %82 = icmp samesign ult i32 %81, 1048576000
  %83 = and i64 %10, 4611686018427387904
  %84 = xor i64 %83, 6913025428013711360
  %85 = bitcast i64 %84 to double
  %86 = fmul contract double %1, %85
  %87 = select i1 %82, double 0x5FF0000000000000, double 0x1FF0000000000000
  %88 = fmul contract double %0, %87
  %89 = bitcast double %86 to i64
  %90 = and i64 %89, -4294967296
  %91 = bitcast i64 %90 to double
  %92 = tail call i32 @__hggc_reflect(ptr addrspacecast (ptr addrspace(4) @.str.43.237 to ptr)) #22
  %93 = icmp eq i32 %92, 0
  br i1 %93, label %__builtin_ppu_ftz_off_start.exit.i1, label %94

94:                                               ; preds = %80
  tail call void @llvm.ppu.ftz.off.start() #22
  br label %__builtin_ppu_ftz_off_start.exit.i1

__builtin_ppu_ftz_off_start.exit.i1:              ; preds = %94, %80
  %95 = fcmp contract ord double %91, 0.000000e+00
  %96 = and i64 %89, 4503595332403200
  %97 = icmp eq i64 %96, 0
  %or.cond.i2 = select i1 %95, i1 true, i1 %97
  br i1 %or.cond.i2, label %__builtin_ppu_ftz_off_start.exit._crit_edge.i3, label %128

__builtin_ppu_ftz_off_start.exit._crit_edge.i3:   ; preds = %__builtin_ppu_ftz_off_start.exit.i1
  %98 = and i64 %89, -9223372036854775808
  %99 = tail call contract double @llvm.fabs.f64(double %91)
  %100 = bitcast double %99 to i64
  %101 = lshr i64 %100, 52
  %102 = trunc nuw nsw i64 %101 to i32
  switch i32 %102, label %105 [
    i32 0, label %103
    i32 2047, label %124
  ]

103:                                              ; preds = %__builtin_ppu_ftz_off_start.exit._crit_edge.i3
  %104 = or disjoint i64 %98, 9218868437227405312
  br label %124

105:                                              ; preds = %__builtin_ppu_ftz_off_start.exit._crit_edge.i3
  %106 = lshr i64 %100, 29
  %107 = trunc i64 %106 to i32
  %108 = and i32 %107, 8388600
  %109 = or disjoint i32 %108, 1065353216
  %110 = bitcast i32 %109 to float
  %111 = tail call contract float @llvm.ppu.rcp.f32(float %110) #17
  %112 = bitcast float %111 to i32
  %113 = ashr i32 %112, 23
  %reass.sub.i4 = sub nsw i32 %113, %102
  %114 = icmp slt i32 %reass.sub.i4, -1919
  br i1 %114, label %124, label %115

115:                                              ; preds = %105
  %116 = shl nsw i32 %reass.sub.i4, 20
  %117 = add i32 %116, 2012217344
  %118 = lshr i32 %112, 3
  %119 = and i32 %118, 1048575
  %120 = or disjoint i32 %117, %119
  %121 = zext i32 %120 to i64
  %122 = shl nuw i64 %121, 32
  %123 = or i64 %122, %98
  br label %124

124:                                              ; preds = %115, %105, %103, %__builtin_ppu_ftz_off_start.exit._crit_edge.i3
  %125 = phi i64 [ %104, %103 ], [ %98, %__builtin_ppu_ftz_off_start.exit._crit_edge.i3 ], [ %123, %115 ], [ %98, %105 ]
  %126 = or disjoint i64 %125, 1
  %127 = bitcast i64 %126 to double
  br label %128

128:                                              ; preds = %124, %__builtin_ppu_ftz_off_start.exit.i1
  %129 = phi double [ %127, %124 ], [ 0x7FF8000000000001, %__builtin_ppu_ftz_off_start.exit.i1 ]
  %130 = tail call i32 @__hggc_reflect(ptr addrspacecast (ptr addrspace(4) @.str.43.237 to ptr)) #22
  %131 = icmp eq i32 %130, 0
  br i1 %131, label %__ppumath_drcp_f64.exit5, label %132

132:                                              ; preds = %128
  tail call void @llvm.ppu.ftz.off.end() #22
  br label %__ppumath_drcp_f64.exit5

__ppumath_drcp_f64.exit5:                         ; preds = %128, %132
  %133 = fmul contract double %86, %129
  %134 = fsub contract double 1.000000e+00, %133
  %135 = fmul contract double %134, %134
  %136 = fadd contract double %134, %135
  %137 = fmul contract double %129, %136
  %138 = fadd contract double %129, %137
  %139 = fmul contract double %88, %138
  %140 = fmul contract double %86, %139
  %141 = fsub contract double %88, %140
  %142 = fmul contract double %138, %141
  %143 = fadd contract double %139, %142
  %144 = fcmp contract oeq double %143, 0.000000e+00
  br i1 %144, label %145, label %147

145:                                              ; preds = %__ppumath_drcp_f64.exit5
  %146 = fmul contract double %0, %1
  br label %243

147:                                              ; preds = %__ppumath_drcp_f64.exit5
  %148 = fcmp contract uno double %143, 0.000000e+00
  br i1 %148, label %149, label %156

149:                                              ; preds = %147
  %150 = fcmp contract one double %43, 0.000000e+00
  %151 = tail call contract double @llvm.fabs.f64(double %1) #44
  %152 = fcmp contract oeq double %151, 0x7FF0000000000000
  %153 = or i1 %152, %150
  %154 = select i1 %153, double %43, double %1
  %155 = fmul contract double %0, %154
  br label %243

156:                                              ; preds = %147
  %157 = icmp samesign ugt i32 %81, 1048575999
  %158 = fmul contract double %143, %85
  %159 = select i1 %157, double 0x5FF0000000000000, double 0x1FF0000000000000
  %160 = fmul contract double %159, %158
  %161 = fmul contract double %159, %143
  %162 = fmul contract double %161, %85
  %163 = fmul contract double %1, %160
  %164 = fsub contract double %163, %0
  %165 = fmul contract double %1, %162
  %166 = fsub contract double %165, %0
  %167 = tail call contract double @llvm.fabs.f64(double %164)
  %168 = tail call contract double @llvm.fabs.f64(double %166)
  %169 = fcmp contract ogt double %167, %168
  %170 = select i1 %169, double %162, double %160
  %171 = bitcast double %170 to i64
  %172 = lshr i64 %171, 32
  %173 = trunc nuw i64 %172 to i32
  %174 = bitcast i32 %173 to float
  %175 = tail call contract float @llvm.fabs.f32(float %174)
  %176 = fcmp contract ogt float %175, 0x37E0000000000000
  %177 = fcmp contract uno float %174, 0.000000e+00
  %178 = or i1 %177, %176
  br i1 %178, label %243, label %179

179:                                              ; preds = %156
  %180 = trunc i64 %171 to i32
  %181 = and i32 %180, -2
  %182 = or i32 %180, 1
  %183 = fcmp contract olt float %51, 0x3880000000000000
  %184 = select i1 %183, double 0x5850000000000000, double 1.000000e+00
  %185 = fmul contract double %1, %184
  %186 = fmul contract double %0, %184
  %187 = and i64 %171, -4294967296
  %188 = and i64 %171, -2
  %189 = bitcast i64 %188 to double
  %190 = fmul contract double %185, %189
  %191 = fsub contract double %190, %186
  %192 = zext i32 %182 to i64
  %193 = or disjoint i64 %187, %192
  %194 = bitcast i64 %193 to double
  %195 = fmul contract double %185, %194
  %196 = fsub contract double %195, %186
  %197 = tail call contract double @llvm.fabs.f64(double %191)
  %198 = tail call contract double @llvm.fabs.f64(double %196)
  %199 = fcmp contract ogt double %197, %198
  %200 = select i1 %199, i32 %182, i32 %181
  %201 = and i32 %200, 1
  %202 = icmp eq i32 %201, 0
  %203 = xor i1 %202, true
  %204 = zext i1 %203 to i32
  %205 = add nsw i32 %200, %204
  %206 = icmp ne i32 %205, 0
  %207 = or i1 %202, %206
  %208 = xor i1 %207, true
  %209 = zext i1 %208 to i32
  %210 = add nsw i32 %209, %173
  %211 = sext i1 %202 to i32
  %212 = add nsw i32 %200, %211
  %213 = icmp eq i32 %212, -1
  %214 = and i1 %202, %213
  %215 = sext i1 %214 to i32
  %216 = add nsw i32 %215, %173
  %217 = zext i32 %210 to i64
  %218 = shl nuw i64 %217, 32
  %219 = zext i32 %205 to i64
  %220 = or disjoint i64 %218, %219
  %221 = bitcast i64 %220 to double
  %222 = fmul contract double %185, %221
  %223 = fsub contract double %222, %186
  %224 = zext i32 %216 to i64
  %225 = shl nuw i64 %224, 32
  %226 = zext i32 %212 to i64
  %227 = or disjoint i64 %225, %226
  %228 = bitcast i64 %227 to double
  %229 = fmul contract double %185, %228
  %230 = fsub contract double %229, %186
  %231 = tail call contract double @llvm.fabs.f64(double %223)
  %232 = tail call contract double @llvm.fabs.f64(double %230)
  %233 = fcmp contract ogt double %231, %232
  %234 = fcmp contract ord double %230, %223
  %235 = and i1 %234, %233
  %236 = select i1 %235, i32 %216, i32 %210
  %237 = select i1 %235, i32 %212, i32 %205
  %238 = zext i32 %236 to i64
  %239 = shl nuw i64 %238, 32
  %240 = zext i32 %237 to i64
  %241 = or disjoint i64 %239, %240
  %242 = bitcast i64 %241 to double
  br label %243

243:                                              ; preds = %156, %179, %149, %145, %53
  %244 = phi double [ %67, %53 ], [ %146, %145 ], [ %155, %149 ], [ %242, %179 ], [ %170, %156 ]
  %245 = tail call i32 @__hggc_reflect(ptr addrspacecast (ptr addrspace(4) @.str.43.237 to ptr)) #22
  %246 = icmp eq i32 %245, 0
  br i1 %246, label %__builtin_ppu_ftz_off_end.exit, label %247

247:                                              ; preds = %243
  tail call void @llvm.ppu.ftz.off.end() #22
  br label %__builtin_ppu_ftz_off_end.exit

__builtin_ppu_ftz_off_end.exit:                   ; preds = %243, %247
  ret double %244
}

; Function Attrs: convergent inlinehint mustprogress nounwind null_pointer_is_valid
define internal fastcc void @nvshmemx_int8_broadcast_block(ptr %0, ptr %1, i64 range(i64 -2147483648, 2147483648) %2) unnamed_addr #26 comdat {
  %4 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 140), align 4
  switch i32 %4, label %.thread.i [
    i32 0, label %.thread93.i
    i32 1, label %.thread91.i
    i32 2, label %.thread91.i
    i32 3, label %.thread91.i
    i32 4, label %.thread91.i
  ]

.thread.i:                                        ; preds = %3
  %constexpr.i = icmp eq ptr addrspacecast (ptr addrspace(4) @.str.204 to ptr), null
  %5 = and i32 sub (i32 ptrtoint (ptr getelementptr (i8, ptr addrspacecast (ptr addrspace(4) @.str.204 to ptr), i64 51) to i32), i32 ptrtoint (ptr addrspacecast (ptr addrspace(4) @.str.204 to ptr) to i32)), -8
  %6 = add i32 %5, 32
  %.sink.i = select i1 %constexpr.i, i32 24, i32 %6
  %7 = select i1 %constexpr.i, i32 0, i32 add (i32 ptrtoint (ptr getelementptr (i8, ptr addrspacecast (ptr addrspace(4) @.str.204 to ptr), i64 51) to i32), i32 add (i32 sub (i32 0, i32 ptrtoint (ptr addrspacecast (ptr addrspace(4) @.str.204 to ptr) to i32)), i32 1))
  %8 = tail call fastcc i64 @__ppu_printf_begin(i32 %.sink.i)
  %9 = tail call fastcc i64 @__ppu_printf_append_string_n(i64 %8, ptr addrspacecast (ptr addrspace(4) @.str.204 to ptr), i32 %7, i32 0)
  %10 = zext i32 %4 to i64
  %11 = tail call fastcc i64 @__ppu_printf_append_args(i64 %8, i64 %10, i32 1)
  tail call fastcc void @_ZL13__assert_failPKcS0_jS0_(ptr addrspacecast (ptr addrspace(4) @.str.13 to ptr), ptr addrspacecast (ptr addrspace(4) @.str.205 to ptr), i32 386, ptr addrspacecast (ptr addrspace(4) @__PRETTY_FUNCTION__._Z30nvshmemi_broadcast_threadgroupIaL13threadgroup_t2EEviPT_PKS1_mi to ptr)) #17
  tail call fastcc void @_ZL13__assert_failPKcS0_jS0_(ptr addrspacecast (ptr addrspace(4) @.str.13 to ptr), ptr addrspacecast (ptr addrspace(4) @.str.205 to ptr), i32 412, ptr addrspacecast (ptr addrspace(4) @__PRETTY_FUNCTION__._Z30nvshmemi_broadcast_threadgroupIaL13threadgroup_t2EEviPT_PKS1_mi to ptr)) #17
  br label %_Z30nvshmemi_broadcast_threadgroupIaL13threadgroup_t2EEviPT_PKS1_mi.exit

.thread91.i:                                      ; preds = %3, %3, %3, %3
  %12 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 32), align 8
  %13 = icmp slt i32 %12, 5
  %14 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 96), align 8
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds nuw i8, ptr %15, i64 8
  %17 = load i32, ptr %16, align 8
  %18 = getelementptr inbounds nuw i8, ptr %15, i64 12
  %19 = load i32, ptr %18, align 4
  %20 = getelementptr inbounds nuw i8, ptr %15, i64 16
  %21 = load i32, ptr %20, align 8
  %22 = icmp slt i32 %21, 0
  br i1 %13, label %23, label %57

23:                                               ; preds = %.thread91.i
  br i1 %22, label %_Z26nvshmemi_team_translate_peiii.exit.i.i, label %24

24:                                               ; preds = %23
  %25 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 8), align 8
  %26 = icmp slt i32 %17, %25
  br i1 %26, label %.thread.i.i, label %27

27:                                               ; preds = %24
  tail call fastcc void @_ZL13__assert_failPKcS0_jS0_(ptr addrspacecast (ptr addrspace(4) @.str.8 to ptr), ptr addrspacecast (ptr addrspace(4) @.str.9 to ptr), i32 94, ptr addrspacecast (ptr addrspace(4) @__PRETTY_FUNCTION__._Z26nvshmemi_team_translate_peiii to ptr)) #17
  %.pre.i.i = load i32, ptr %16, align 8
  %28 = icmp slt i32 %17, %.pre.i.i
  br i1 %28, label %_Z26nvshmemi_team_translate_peiii.exit.i.i, label %..thread.i_crit_edge.i

..thread.i_crit_edge.i:                           ; preds = %27
  %.pre98.i = load i32, ptr %20, align 8
  %.pre99.i = load i32, ptr %18, align 4
  br label %.thread.i.i

.thread.i.i:                                      ; preds = %..thread.i_crit_edge.i, %24
  %29 = phi i32 [ %.pre99.i, %..thread.i_crit_edge.i ], [ %19, %24 ]
  %30 = phi i32 [ %.pre98.i, %..thread.i_crit_edge.i ], [ %21, %24 ]
  %31 = phi i32 [ %.pre.i.i, %..thread.i_crit_edge.i ], [ %17, %24 ]
  %32 = sub nsw i32 %17, %31
  %.frozen = freeze i32 %32
  %.frozen1 = freeze i32 %29
  %33 = sdiv i32 %.frozen, %.frozen1
  %34 = mul i32 %33, %.frozen1
  %.decomposed = sub i32 %.frozen, %34
  %.not.i.i.i.i = icmp eq i32 %.decomposed, 0
  %.not22.i.i.i.i = icmp slt i32 %33, %30
  %or.cond.i.i.i.i = select i1 %.not.i.i.i.i, i1 %.not22.i.i.i.i, i1 false
  %spec.select.i.i.i.i = select i1 %or.cond.i.i.i.i, i32 %33, i32 -1
  br label %_Z26nvshmemi_team_translate_peiii.exit.i.i

_Z26nvshmemi_team_translate_peiii.exit.i.i:       ; preds = %.thread.i.i, %27, %23
  %.1.i.i.i = phi i32 [ -1, %23 ], [ -1, %27 ], [ %spec.select.i.i.i.i, %.thread.i.i ]
  %35 = mul nsw i32 %21, %19
  %36 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 4), align 4
  %37 = icmp eq i32 %.1.i.i.i, %36
  %38 = icmp sgt i32 %35, 0
  %or.cond.i.i = select i1 %37, i1 %38, i1 false
  br i1 %or.cond.i.i, label %.lr.ph.i.i, label %_Z41nvshmemi_bcast_put2all_direct_threadgroupIaL13threadgroup_t2EEviPT_PKS1_mi.exit.i

.lr.ph.i.i:                                       ; preds = %_Z26nvshmemi_team_translate_peiii.exit.i.i
  %39 = add nsw i32 %35, %17
  %40 = ptrtoint ptr %0 to i64
  %41 = sext i32 %17 to i64
  %42 = sext i32 %19 to i64
  %43 = sext i32 %39 to i64
  br label %44

44:                                               ; preds = %_Z12nvshmemi_ptrPKvi.exit.i.i, %.lr.ph.i.i
  %indvars.iv.i.i = phi i64 [ %41, %.lr.ph.i.i ], [ %indvars.iv.next.i.i, %_Z12nvshmemi_ptrPKvi.exit.i.i ]
  %45 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 40), align 8
  %46 = ptrtoint ptr %45 to i64
  %47 = sub i64 %40, %46
  %.not.i.i.i = icmp uge ptr %0, %45
  %48 = load i64, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 48), align 8
  %49 = icmp ult i64 %47, %48
  %or.cond.i.i.i = select i1 %.not.i.i.i, i1 %49, i1 false
  br i1 %or.cond.i.i.i, label %50, label %_Z12nvshmemi_ptrPKvi.exit.i.i

50:                                               ; preds = %44
  %51 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 56), align 8
  %52 = getelementptr inbounds i64, ptr %51, i64 %indvars.iv.i.i
  %53 = tail call fastcc i64 @__ppukernel_ldg_ulonglong(ptr %52) #17
  %.not20.i.i.i = icmp eq i64 %53, 0
  %54 = inttoptr i64 %53 to ptr
  %55 = getelementptr inbounds i8, ptr %54, i64 %47
  %.017.i.i.i = select i1 %.not20.i.i.i, ptr null, ptr %55
  br label %_Z12nvshmemi_ptrPKvi.exit.i.i

_Z12nvshmemi_ptrPKvi.exit.i.i:                    ; preds = %50, %44
  %.0.i.i.i = phi ptr [ %.017.i.i.i, %50 ], [ null, %44 ]
  tail call fastcc void @_Z27nvshmemi_memcpy_threadgroupIL13threadgroup_t2EEvPvPKvm(ptr %.0.i.i.i, ptr %1, i64 range(i64 -2147483648, 2147483648) %2) #22
  %indvars.iv.next.i.i = add nsw i64 %indvars.iv.i.i, %42
  %56 = icmp slt i64 %indvars.iv.next.i.i, %43
  br i1 %56, label %44, label %_Z41nvshmemi_bcast_put2all_direct_threadgroupIaL13threadgroup_t2EEviPT_PKS1_mi.exit.i, !llvm.loop !46

_Z41nvshmemi_bcast_put2all_direct_threadgroupIaL13threadgroup_t2EEviPT_PKS1_mi.exit.i: ; preds = %_Z12nvshmemi_ptrPKvi.exit.i.i, %_Z26nvshmemi_team_translate_peiii.exit.i.i
  tail call fastcc void @_Z28nvshmemi_barrier_threadgroupIL13threadgroup_t2EEvi() #22
  br label %_Z30nvshmemi_broadcast_threadgroupIaL13threadgroup_t2EEviPT_PKS1_mi.exit

57:                                               ; preds = %.thread91.i
  br i1 %22, label %_Z26nvshmemi_team_translate_peiii.exit.i48.i, label %58

58:                                               ; preds = %57
  %59 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 8), align 8
  %60 = icmp slt i32 %17, %59
  br i1 %60, label %.thread.i43.i, label %61

61:                                               ; preds = %58
  tail call fastcc void @_ZL13__assert_failPKcS0_jS0_(ptr addrspacecast (ptr addrspace(4) @.str.8 to ptr), ptr addrspacecast (ptr addrspace(4) @.str.9 to ptr), i32 94, ptr addrspacecast (ptr addrspace(4) @__PRETTY_FUNCTION__._Z26nvshmemi_team_translate_peiii to ptr)) #17
  %.pre.i42.i = load i32, ptr %16, align 8
  %62 = icmp slt i32 %17, %.pre.i42.i
  br i1 %62, label %_Z26nvshmemi_team_translate_peiii.exit.i48.i, label %..thread.i43_crit_edge.i

..thread.i43_crit_edge.i:                         ; preds = %61
  %.pre.i = load i32, ptr %20, align 8
  %.pre97.i = load i32, ptr %18, align 4
  br label %.thread.i43.i

.thread.i43.i:                                    ; preds = %..thread.i43_crit_edge.i, %58
  %63 = phi i32 [ %.pre97.i, %..thread.i43_crit_edge.i ], [ %19, %58 ]
  %64 = phi i32 [ %.pre.i, %..thread.i43_crit_edge.i ], [ %21, %58 ]
  %65 = phi i32 [ %.pre.i42.i, %..thread.i43_crit_edge.i ], [ %17, %58 ]
  %66 = sub nsw i32 %17, %65
  %.frozen2 = freeze i32 %66
  %.frozen3 = freeze i32 %63
  %67 = sdiv i32 %.frozen2, %.frozen3
  %68 = mul i32 %67, %.frozen3
  %.decomposed4 = sub i32 %.frozen2, %68
  %.not.i.i.i44.i = icmp eq i32 %.decomposed4, 0
  %.not22.i.i.i45.i = icmp slt i32 %67, %64
  %or.cond.i.i.i46.i = select i1 %.not.i.i.i44.i, i1 %.not22.i.i.i45.i, i1 false
  %spec.select.i.i.i47.i = select i1 %or.cond.i.i.i46.i, i32 %67, i32 -1
  br label %_Z26nvshmemi_team_translate_peiii.exit.i48.i

_Z26nvshmemi_team_translate_peiii.exit.i48.i:     ; preds = %.thread.i43.i, %61, %57
  %.1.i.i49.i = phi i32 [ -1, %57 ], [ -1, %61 ], [ %spec.select.i.i.i47.i, %.thread.i43.i ]
  %69 = mul nsw i32 %21, %19
  %70 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 4), align 4
  %71 = icmp eq i32 %.1.i.i49.i, %70
  %72 = icmp sgt i32 %69, 0
  %or.cond.i50.i = select i1 %71, i1 %72, i1 false
  br i1 %or.cond.i50.i, label %.lr.ph.i51.i, label %_Z34nvshmemi_bcast_put2all_threadgroupIaL13threadgroup_t2EEviPT_PKS1_mi.exit.i

.lr.ph.i51.i:                                     ; preds = %_Z26nvshmemi_team_translate_peiii.exit.i48.i
  %73 = add nsw i32 %69, %17
  %74 = ptrtoint ptr %0 to i64
  %75 = sext i32 %17 to i64
  %76 = sext i32 %19 to i64
  %77 = sext i32 %73 to i64
  br label %78

78:                                               ; preds = %_Z28nvshmemi_put_nbi_threadgroupIaL13threadgroup_t2ELb0EEvPT_PKS1_mi.exit.i.i, %.lr.ph.i51.i
  %indvars.iv.i52.i = phi i64 [ %75, %.lr.ph.i51.i ], [ %indvars.iv.next.i53.i, %_Z28nvshmemi_put_nbi_threadgroupIaL13threadgroup_t2ELb0EEvPT_PKS1_mi.exit.i.i ]
  tail call fastcc void @__ppukernel_syncthreads_void() #22
  %79 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 56), align 8
  %80 = getelementptr inbounds i64, ptr %79, i64 %indvars.iv.i52.i
  %81 = tail call fastcc i64 @__ppukernel_ldg_ulonglong(ptr %80) #17
  %.not.i.i.i.i.i = icmp eq i64 %81, 0
  br i1 %.not.i.i.i.i.i, label %88, label %82

82:                                               ; preds = %78
  %83 = inttoptr i64 %81 to ptr
  %84 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 40), align 8
  %85 = ptrtoint ptr %84 to i64
  %86 = sub i64 %74, %85
  %87 = getelementptr inbounds i8, ptr %83, i64 %86
  tail call fastcc void @_Z27nvshmemi_memcpy_threadgroupIL13threadgroup_t2EEvPvPKvm(ptr %87, ptr %1, i64 range(i64 -2147483648, 2147483648) %2) #22
  br label %_Z28nvshmemi_put_nbi_threadgroupIaL13threadgroup_t2ELb0EEvPT_PKS1_mi.exit.i.i

88:                                               ; preds = %78
  %89 = trunc nsw i64 %indvars.iv.i52.i to i32
  notail call fastcc void @_Z33nvshmemi_transfer_rma_nbi_with_epIL13threadgroup_t2EL13nvshmemi_op_t1EEvPvS2_mii(ptr %0, ptr %1, i64 range(i64 -2147483648, 2147483648) %2, i32 %89) #17
  br label %_Z28nvshmemi_put_nbi_threadgroupIaL13threadgroup_t2ELb0EEvPT_PKS1_mi.exit.i.i

_Z28nvshmemi_put_nbi_threadgroupIaL13threadgroup_t2ELb0EEvPT_PKS1_mi.exit.i.i: ; preds = %88, %82
  tail call fastcc void @__ppukernel_syncthreads_void() #22
  %indvars.iv.next.i53.i = add nsw i64 %indvars.iv.i52.i, %76
  %90 = icmp slt i64 %indvars.iv.next.i53.i, %77
  br i1 %90, label %78, label %_Z34nvshmemi_bcast_put2all_threadgroupIaL13threadgroup_t2EEviPT_PKS1_mi.exit.i, !llvm.loop !47

_Z34nvshmemi_bcast_put2all_threadgroupIaL13threadgroup_t2EEviPT_PKS1_mi.exit.i: ; preds = %_Z28nvshmemi_put_nbi_threadgroupIaL13threadgroup_t2ELb0EEvPT_PKS1_mi.exit.i.i, %_Z26nvshmemi_team_translate_peiii.exit.i48.i
  tail call fastcc void @_Z28nvshmemi_barrier_threadgroupIL13threadgroup_t2EEvi() #22
  br label %_Z30nvshmemi_broadcast_threadgroupIaL13threadgroup_t2EEviPT_PKS1_mi.exit

.thread93.i:                                      ; preds = %3
  %91 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 8), align 8
  %92 = add nsw i32 %91, -1
  %93 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 96), align 8
  %94 = load ptr, ptr %93, align 8
  %95 = tail call i32 @llvm.ppu.read.tix.sreg.tid.x()
  %96 = tail call i32 @llvm.ppu.read.tix.sreg.tid.y()
  %97 = tail call i32 @llvm.ppu.read.tix.sreg.tid.z()
  %98 = tail call i32 @llvm.ppu.read.tix.sreg.ntid.x()
  %99 = tail call i32 @llvm.ppu.read.tix.sreg.ntid.y()
  %100 = mul i32 %98, %96
  %101 = add i32 %100, %95
  %102 = mul i32 %99, %98
  %103 = mul i32 %102, %97
  %104 = add i32 %103, %101
  %105 = tail call i32 @llvm.ppu.read.tix.sreg.ntid.z()
  %106 = mul i32 %102, %105
  %.not.i69.i = icmp eq i32 %104, 0
  br i1 %.not.i69.i, label %107, label %119

107:                                              ; preds = %.thread93.i
  %108 = getelementptr inbounds nuw i8, ptr %94, i64 176
  %109 = load i32, ptr %108, align 8
  %110 = add i32 %109, 1
  store i32 %110, ptr %108, align 8
  %111 = getelementptr inbounds nuw i8, ptr %94, i64 208
  %112 = load i64, ptr %111, align 8
  %113 = add i64 %112, 1
  store i64 %113, ptr %111, align 8
  %114 = getelementptr inbounds nuw i8, ptr %94, i64 216
  %115 = load i64, ptr %114, align 8
  %116 = add i64 %115, -2211833
  %117 = icmp ult i64 %116, -2211841
  br i1 %117, label %118, label %119

118:                                              ; preds = %107
  tail call fastcc void @_Z28nvshmemi_barrier_threadgroupIL13threadgroup_t0EEvi(i32 0) #17
  store i64 0, ptr %114, align 8
  br label %119

119:                                              ; preds = %118, %107, %.thread93.i
  tail call fastcc void @__ppukernel_syncthreads_void() #22
  %120 = getelementptr inbounds nuw i8, ptr %94, i64 176
  %121 = load i32, ptr %120, align 8
  %122 = load i64, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 152), align 8
  %123 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 8), align 8
  %124 = shl nsw i32 %123, 2
  %125 = sext i32 %124 to i64
  %126 = mul i64 %122, %125
  %127 = lshr i64 %126, 3
  %128 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 104), align 8
  %129 = getelementptr inbounds nuw i8, ptr %94, i64 20
  %130 = load i32, ptr %129, align 4
  %131 = sext i32 %130 to i64
  %132 = load i64, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 200), align 8
  %133 = add i64 %132, 119
  %134 = udiv i64 %133, 120
  %135 = sext i32 %123 to i64
  %136 = shl nsw i64 %135, 8
  %137 = mul i64 %136, %134
  %138 = lshr exact i64 %137, 3
  %139 = load i64, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 168), align 8
  %140 = lshr i64 %139, 3
  %141 = add nuw nsw i64 %127, 442368
  %142 = add nuw nsw i64 %141, %140
  %143 = add nuw nsw i64 %142, %138
  %144 = mul i64 %143, %131
  %145 = getelementptr inbounds i64, ptr %128, i64 %144
  %146 = getelementptr inbounds nuw i64, ptr %145, i64 %140
  %147 = getelementptr inbounds nuw i8, ptr %146, i64 884736
  %148 = getelementptr inbounds nuw i8, ptr %94, i64 216
  %149 = load i64, ptr %148, align 8
  %150 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 4), align 4
  %.not106.i.i = icmp eq i32 %150, 0
  br i1 %.not106.i.i, label %_Z19nvshmemi_wait_untilImEvPVT_iS0_.exit.i.i, label %151

151:                                              ; preds = %119
  %152 = getelementptr inbounds i8, ptr %147, i64 %149
  %153 = zext i32 %121 to i64
  br label %154

154:                                              ; preds = %154, %151
  %155 = load volatile i64, ptr %152, align 8
  %.not.i.i.i70.i = icmp eq i64 %155, %153
  br i1 %.not.i.i.i70.i, label %_Z19nvshmemi_wait_untilImEvPVT_iS0_.exit.i.i, label %154, !llvm.loop !48

_Z19nvshmemi_wait_untilImEvPVT_iS0_.exit.i.i:     ; preds = %154, %119
  tail call fastcc void @__ppukernel_syncthreads_void() #22
  %156 = getelementptr inbounds nuw i8, ptr %94, i64 16
  %157 = icmp slt i32 %104, %92
  br i1 %157, label %.lr.ph.i77.i, label %.critedge.i71.i

.lr.ph.i77.i:                                     ; preds = %_Z19nvshmemi_wait_untilImEvPVT_iS0_.exit.i.i
  %158 = ptrtoint ptr %147 to i64
  %159 = select i1 %.not106.i.i, ptr %1, ptr %0
  %160 = getelementptr inbounds i8, ptr %147, i64 %149
  %161 = zext i32 %121 to i64
  %162 = ptrtoint ptr %0 to i64
  %163 = ptrtoint ptr %160 to i64
  br label %164

164:                                              ; preds = %_Z31nvshmemi_put_signal_threadgroupIaL13threadgroup_t0ELb0EEvPT_PKS1_mPmmiib.exit.i.i, %.lr.ph.i77.i
  %.0132.i.i = phi i32 [ %104, %.lr.ph.i77.i ], [ %237, %_Z31nvshmemi_put_signal_threadgroupIaL13threadgroup_t0ELb0EEvPT_PKS1_mPmmiib.exit.i.i ]
  %165 = load i32, ptr %156, align 8
  %166 = add nsw i32 %165, %150
  %167 = srem i32 %166, %165
  %168 = mul nsw i32 %167, %92
  %169 = add nsw i32 %.0132.i.i, 1
  %170 = add i32 %169, %168
  %.not107.i.i = icmp slt i32 %170, %165
  br i1 %.not107.i.i, label %171, label %.critedge.i71.i

171:                                              ; preds = %164
  %172 = srem i32 %170, %165
  %173 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 96), align 8
  %174 = load ptr, ptr %173, align 8
  %175 = getelementptr inbounds nuw i8, ptr %174, i64 16
  %176 = load i32, ptr %175, align 8
  %177 = icmp sgt i32 %172, %176
  br i1 %177, label %_Z26nvshmemi_team_translate_peiii.exit.i82.i, label %178

178:                                              ; preds = %171
  %179 = getelementptr inbounds nuw i8, ptr %174, i64 8
  %180 = load i32, ptr %179, align 8
  %181 = getelementptr inbounds nuw i8, ptr %174, i64 12
  %182 = load i32, ptr %181, align 4
  %183 = mul nsw i32 %182, %172
  %184 = add nsw i32 %183, %180
  %185 = icmp sgt i32 %183, -1
  %186 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 8), align 8
  %187 = icmp slt i32 %184, %186
  %188 = select i1 %185, i1 %187, i1 false
  br i1 %188, label %190, label %189

189:                                              ; preds = %178
  tail call fastcc void @_ZL13__assert_failPKcS0_jS0_(ptr addrspacecast (ptr addrspace(4) @.str.8 to ptr), ptr addrspacecast (ptr addrspace(4) @.str.9 to ptr), i32 94, ptr addrspacecast (ptr addrspace(4) @__PRETTY_FUNCTION__._Z26nvshmemi_team_translate_peiii to ptr)) #17
  %.pre.i78.i = load i32, ptr %179, align 8
  br label %190

190:                                              ; preds = %189, %178
  %191 = phi i32 [ %.pre.i78.i, %189 ], [ %180, %178 ]
  %192 = icmp slt i32 %184, %191
  br i1 %192, label %_Z26nvshmemi_team_translate_peiii.exit.i82.i, label %193

193:                                              ; preds = %190
  %194 = load i32, ptr %175, align 8
  %195 = load i32, ptr %181, align 4
  %196 = sub nsw i32 %184, %191
  %.frozen5 = freeze i32 %196
  %.frozen6 = freeze i32 %195
  %197 = sdiv i32 %.frozen5, %.frozen6
  %198 = mul i32 %197, %.frozen6
  %.decomposed7 = sub i32 %.frozen5, %198
  %.not.i.i112.i.i = icmp eq i32 %.decomposed7, 0
  %.not22.i.i.i79.i = icmp slt i32 %197, %194
  %or.cond.i.i.i80.i = select i1 %.not.i.i112.i.i, i1 %.not22.i.i.i79.i, i1 false
  %spec.select.i.i.i81.i = select i1 %or.cond.i.i.i80.i, i32 %197, i32 -1
  br label %_Z26nvshmemi_team_translate_peiii.exit.i82.i

_Z26nvshmemi_team_translate_peiii.exit.i82.i:     ; preds = %193, %190, %171
  %.1.i.i83.i = phi i32 [ -1, %171 ], [ -1, %190 ], [ %spec.select.i.i.i81.i, %193 ]
  %199 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 40), align 8
  %200 = ptrtoint ptr %199 to i64
  %201 = sub i64 %158, %200
  %.not.i.i84.i = icmp uge ptr %147, %199
  %202 = load i64, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 48), align 8
  %203 = icmp ult i64 %201, %202
  %or.cond.i.i85.i = select i1 %.not.i.i84.i, i1 %203, i1 false
  %.pre137.i86.i = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 56), align 8
  %204 = sext i32 %.1.i.i83.i to i64
  br i1 %or.cond.i.i85.i, label %205, label %_Z12nvshmemi_ptrPKvi.exit.thread.i87.i

205:                                              ; preds = %_Z26nvshmemi_team_translate_peiii.exit.i82.i
  %206 = getelementptr inbounds i64, ptr %.pre137.i86.i, i64 %204
  %207 = tail call fastcc i64 @__ppukernel_ldg_ulonglong(ptr %206) #17
  %.not20.i.i89.i = icmp eq i64 %207, 0
  %208 = inttoptr i64 %207 to ptr
  %209 = getelementptr inbounds i8, ptr %208, i64 %201
  %210 = icmp eq ptr %209, null
  %or.cond130.i90.i = select i1 %.not20.i.i89.i, i1 true, i1 %210
  br i1 %or.cond130.i90.i, label %_Z12nvshmemi_ptrPKvi.exit.thread.i87.i, label %_Z31nvshmemi_put_signal_threadgroupIaL13threadgroup_t0ELb0EEvPT_PKS1_mPmmiib.exit.i.i

_Z12nvshmemi_ptrPKvi.exit.thread.i87.i:           ; preds = %205, %_Z26nvshmemi_team_translate_peiii.exit.i82.i
  %211 = getelementptr inbounds i64, ptr %.pre137.i86.i, i64 %204
  %212 = tail call fastcc i64 @__ppukernel_ldg_ulonglong(ptr %211) #17
  %.not.i.i113.i88.i = icmp eq i64 %212, 0
  br i1 %.not.i.i113.i88.i, label %236, label %213

213:                                              ; preds = %_Z12nvshmemi_ptrPKvi.exit.thread.i87.i
  %214 = inttoptr i64 %212 to ptr
  %215 = sub i64 %162, %200
  %216 = getelementptr inbounds i8, ptr %214, i64 %215
  tail call fastcc void @_Z27nvshmemi_memcpy_threadgroupIL13threadgroup_t0EEvPvPKvm(ptr %216, ptr %159, i64 range(i64 -2147483648, 2147483648) %2) #22
  tail call fastcc void @__ppukernel_threadfence_system_void() #17
  %217 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 56), align 8
  %218 = getelementptr inbounds i64, ptr %217, i64 %204
  %219 = tail call fastcc i64 @__ppukernel_ldg_ulonglong(ptr %218) #17
  %220 = inttoptr i64 %219 to ptr
  %.not.i.i.i.i.i.i = icmp eq i64 %219, 0
  br i1 %.not.i.i.i.i.i.i, label %226, label %221

221:                                              ; preds = %213
  %222 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 40), align 8
  %223 = ptrtoint ptr %222 to i64
  %224 = sub i64 %163, %223
  %225 = getelementptr inbounds i8, ptr %220, i64 %224
  store volatile i64 %161, ptr %225, align 8
  br label %_Z31nvshmemi_put_signal_threadgroupIaL13threadgroup_t0ELb0EEvPT_PKS1_mPmmiib.exit.i.i

226:                                              ; preds = %213
  %227 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 32), align 8
  %228 = icmp slt i32 %227, 3
  br i1 %228, label %229, label %235

229:                                              ; preds = %226
  %230 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 40), align 8
  %231 = ptrtoint ptr %230 to i64
  %232 = sub i64 %163, %231
  %233 = getelementptr inbounds i8, ptr %220, i64 %232
  %234 = tail call fastcc i64 @__ppukernel_atomicAdd_u64(ptr %233, i64 range(i64 0, 4294967296) %161) #17
  br label %_Z31nvshmemi_put_signal_threadgroupIaL13threadgroup_t0ELb0EEvPT_PKS1_mPmmiib.exit.i.i

235:                                              ; preds = %226
  notail call fastcc void @_Z38nvshmemi_transfer_amo_nonfetch_with_epImEvPvT_i14nvshmemi_amo_ti(ptr %160, i64 range(i64 0, 4294967296) %161, i32 %.1.i.i83.i) #17
  br label %_Z31nvshmemi_put_signal_threadgroupIaL13threadgroup_t0ELb0EEvPT_PKS1_mPmmiib.exit.i.i

236:                                              ; preds = %_Z12nvshmemi_ptrPKvi.exit.thread.i87.i
  notail call fastcc void @_Z28nvshmemi_transfer_put_signalIL13threadgroup_t0EEvPvS1_mS1_m14nvshmemi_amo_tib(ptr %0, ptr %159, i64 range(i64 -2147483648, 2147483648) %2, ptr %160, i64 range(i64 0, 4294967296) %161, i32 %.1.i.i83.i) #17
  br label %_Z31nvshmemi_put_signal_threadgroupIaL13threadgroup_t0ELb0EEvPT_PKS1_mPmmiib.exit.i.i

_Z31nvshmemi_put_signal_threadgroupIaL13threadgroup_t0ELb0EEvPT_PKS1_mPmmiib.exit.i.i: ; preds = %236, %235, %229, %221, %205
  %237 = add nsw i32 %.0132.i.i, %106
  %238 = icmp slt i32 %237, %92
  br i1 %238, label %164, label %.critedge.i71.i, !llvm.loop !49

.critedge.i71.i:                                  ; preds = %_Z31nvshmemi_put_signal_threadgroupIaL13threadgroup_t0ELb0EEvPT_PKS1_mPmmiib.exit.i.i, %164, %_Z19nvshmemi_wait_untilImEvPVT_iS0_.exit.i.i
  %239 = icmp sgt i32 %91, 1
  br i1 %239, label %.lr.ph135.i.i, label %.critedge111.i.i

.lr.ph135.i.i:                                    ; preds = %.critedge.i71.i
  %240 = ptrtoint ptr %147 to i64
  %241 = select i1 %.not106.i.i, ptr %1, ptr %0
  %242 = getelementptr inbounds i8, ptr %147, i64 %149
  %243 = zext i32 %121 to i64
  %244 = ptrtoint ptr %0 to i64
  %245 = sub i32 0, %103
  %.not28.i.i.i = icmp eq i32 %101, %245
  %246 = ptrtoint ptr %242 to i64
  br label %247

247:                                              ; preds = %_Z32nvshmemii_put_signal_threadgroupIaL13threadgroup_t2ELb0EEvPT_PKS1_mPmmiib.exit.i.i, %.lr.ph135.i.i
  %.097134.i.i = phi i32 [ 0, %.lr.ph135.i.i ], [ %252, %_Z32nvshmemii_put_signal_threadgroupIaL13threadgroup_t2ELb0EEvPT_PKS1_mPmmiib.exit.i.i ]
  %248 = load i32, ptr %156, align 8
  %249 = add nsw i32 %248, %150
  %250 = srem i32 %249, %248
  %251 = mul nsw i32 %250, %92
  %252 = add nuw nsw i32 %.097134.i.i, 1
  %253 = add i32 %251, %252
  %.not108.i74.i = icmp slt i32 %253, %248
  br i1 %.not108.i74.i, label %254, label %.critedge111.i.i

254:                                              ; preds = %247
  %255 = srem i32 %253, %248
  %256 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 96), align 8
  %257 = load ptr, ptr %256, align 8
  %258 = getelementptr inbounds nuw i8, ptr %257, i64 16
  %259 = load i32, ptr %258, align 8
  %260 = icmp sgt i32 %255, %259
  br i1 %260, label %_Z26nvshmemi_team_translate_peiii.exit119.i.i, label %261

261:                                              ; preds = %254
  %262 = getelementptr inbounds nuw i8, ptr %257, i64 8
  %263 = load i32, ptr %262, align 8
  %264 = getelementptr inbounds nuw i8, ptr %257, i64 12
  %265 = load i32, ptr %264, align 4
  %266 = mul nsw i32 %265, %255
  %267 = add nsw i32 %266, %263
  %268 = icmp sgt i32 %266, -1
  %269 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 8), align 8
  %270 = icmp slt i32 %267, %269
  %271 = select i1 %268, i1 %270, i1 false
  br i1 %271, label %273, label %272

272:                                              ; preds = %261
  tail call fastcc void @_ZL13__assert_failPKcS0_jS0_(ptr addrspacecast (ptr addrspace(4) @.str.8 to ptr), ptr addrspacecast (ptr addrspace(4) @.str.9 to ptr), i32 94, ptr addrspacecast (ptr addrspace(4) @__PRETTY_FUNCTION__._Z26nvshmemi_team_translate_peiii to ptr)) #17
  %.pre138.i.i = load i32, ptr %262, align 8
  br label %273

273:                                              ; preds = %272, %261
  %274 = phi i32 [ %.pre138.i.i, %272 ], [ %263, %261 ]
  %275 = icmp slt i32 %267, %274
  br i1 %275, label %_Z26nvshmemi_team_translate_peiii.exit119.i.i, label %276

276:                                              ; preds = %273
  %277 = load i32, ptr %258, align 8
  %278 = load i32, ptr %264, align 4
  %279 = sub nsw i32 %267, %274
  %.frozen8 = freeze i32 %279
  %.frozen9 = freeze i32 %278
  %280 = sdiv i32 %.frozen8, %.frozen9
  %281 = mul i32 %280, %.frozen9
  %.decomposed10 = sub i32 %.frozen8, %281
  %.not.i.i114.i.i = icmp eq i32 %.decomposed10, 0
  %.not22.i.i115.i.i = icmp slt i32 %280, %277
  %or.cond.i.i116.i.i = select i1 %.not.i.i114.i.i, i1 %.not22.i.i115.i.i, i1 false
  %spec.select.i.i117.i.i = select i1 %or.cond.i.i116.i.i, i32 %280, i32 -1
  br label %_Z26nvshmemi_team_translate_peiii.exit119.i.i

_Z26nvshmemi_team_translate_peiii.exit119.i.i:    ; preds = %276, %273, %254
  %.1.i118.i.i = phi i32 [ -1, %254 ], [ -1, %273 ], [ %spec.select.i.i117.i.i, %276 ]
  %282 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 40), align 8
  %283 = ptrtoint ptr %282 to i64
  %284 = sub i64 %240, %283
  %.not.i120.i.i = icmp uge ptr %147, %282
  %285 = load i64, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 48), align 8
  %286 = icmp ult i64 %284, %285
  %or.cond.i121.i.i = select i1 %.not.i120.i.i, i1 %286, i1 false
  br i1 %or.cond.i121.i.i, label %287, label %_Z32nvshmemii_put_signal_threadgroupIaL13threadgroup_t2ELb0EEvPT_PKS1_mPmmiib.exit.i.i

287:                                              ; preds = %_Z26nvshmemi_team_translate_peiii.exit119.i.i
  %288 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 56), align 8
  %289 = sext i32 %.1.i118.i.i to i64
  %290 = getelementptr inbounds i64, ptr %288, i64 %289
  %291 = tail call fastcc i64 @__ppukernel_ldg_ulonglong(ptr %290) #17
  %.not20.i123.i.i = icmp eq i64 %291, 0
  %292 = inttoptr i64 %291 to ptr
  %293 = getelementptr inbounds i8, ptr %292, i64 %284
  %294 = icmp eq ptr %293, null
  %or.cond131.i.i = select i1 %.not20.i123.i.i, i1 true, i1 %294
  br i1 %or.cond131.i.i, label %_Z32nvshmemii_put_signal_threadgroupIaL13threadgroup_t2ELb0EEvPT_PKS1_mPmmiib.exit.i.i, label %295

295:                                              ; preds = %287
  %296 = sub i64 %244, %283
  %297 = getelementptr inbounds i8, ptr %292, i64 %296
  tail call fastcc void @_Z27nvshmemi_memcpy_threadgroupIL13threadgroup_t2EEvPvPKvm(ptr %297, ptr %241, i64 range(i64 -2147483648, 2147483648) %2) #22
  tail call fastcc void @__ppukernel_syncthreads_void() #22
  br i1 %.not28.i.i.i, label %298, label %_Z32nvshmemii_put_signal_threadgroupIaL13threadgroup_t2ELb0EEvPT_PKS1_mPmmiib.exit.i.i

298:                                              ; preds = %295
  tail call fastcc void @__ppukernel_threadfence_system_void() #17
  %299 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 56), align 8
  %300 = getelementptr inbounds i64, ptr %299, i64 %289
  %301 = tail call fastcc i64 @__ppukernel_ldg_ulonglong(ptr %300) #17
  %302 = inttoptr i64 %301 to ptr
  %.not.i.i.i.i76.i = icmp eq i64 %301, 0
  br i1 %.not.i.i.i.i76.i, label %308, label %303

303:                                              ; preds = %298
  %304 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 40), align 8
  %305 = ptrtoint ptr %304 to i64
  %306 = sub i64 %246, %305
  %307 = getelementptr inbounds i8, ptr %302, i64 %306
  store volatile i64 %243, ptr %307, align 8
  br label %_Z32nvshmemii_put_signal_threadgroupIaL13threadgroup_t2ELb0EEvPT_PKS1_mPmmiib.exit.i.i

308:                                              ; preds = %298
  %309 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 32), align 8
  %310 = icmp slt i32 %309, 3
  br i1 %310, label %311, label %317

311:                                              ; preds = %308
  %312 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 40), align 8
  %313 = ptrtoint ptr %312 to i64
  %314 = sub i64 %246, %313
  %315 = getelementptr inbounds i8, ptr %302, i64 %314
  %316 = tail call fastcc i64 @__ppukernel_atomicAdd_u64(ptr %315, i64 range(i64 0, 4294967296) %243) #17
  br label %_Z32nvshmemii_put_signal_threadgroupIaL13threadgroup_t2ELb0EEvPT_PKS1_mPmmiib.exit.i.i

317:                                              ; preds = %308
  notail call fastcc void @_Z38nvshmemi_transfer_amo_nonfetch_with_epImEvPvT_i14nvshmemi_amo_ti(ptr %242, i64 range(i64 0, 4294967296) %243, i32 %.1.i118.i.i) #17
  br label %_Z32nvshmemii_put_signal_threadgroupIaL13threadgroup_t2ELb0EEvPT_PKS1_mPmmiib.exit.i.i

_Z32nvshmemii_put_signal_threadgroupIaL13threadgroup_t2ELb0EEvPT_PKS1_mPmmiib.exit.i.i: ; preds = %317, %311, %303, %295, %287, %_Z26nvshmemi_team_translate_peiii.exit119.i.i
  %exitcond.not.i75.i = icmp eq i32 %252, %92
  br i1 %exitcond.not.i75.i, label %.critedge111.i.i, label %247, !llvm.loop !50

.critedge111.i.i:                                 ; preds = %_Z32nvshmemii_put_signal_threadgroupIaL13threadgroup_t2ELb0EEvPT_PKS1_mPmmiib.exit.i.i, %247, %.critedge.i71.i
  %318 = icmp ne i32 %150, 0
  %.not109.i72.i = icmp eq ptr %0, %1
  %or.cond.i73.i = select i1 %318, i1 true, i1 %.not109.i72.i
  br i1 %or.cond.i73.i, label %320, label %319

319:                                              ; preds = %.critedge111.i.i
  tail call fastcc void @_Z27nvshmemi_memcpy_threadgroupIL13threadgroup_t2EEvPvPKvm(ptr %0, ptr %1, i64 range(i64 -2147483648, 2147483648) %2) #22
  br label %320

320:                                              ; preds = %319, %.critedge111.i.i
  br i1 %.not.i69.i, label %321, label %_Z37nvshmemi_bcast_nonLL_tree_threadgroupIaL13threadgroup_t2EEviPT_PKS1_mii.exit.i

321:                                              ; preds = %320
  %322 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 32), align 8
  %323 = icmp sgt i32 %322, 2
  br i1 %323, label %324, label %325

324:                                              ; preds = %321
  notail call fastcc void @_Z23nvshmemi_transfer_quietIL13threadgroup_t0EEvb() #17
  br label %_Z14nvshmemi_quietIL13threadgroup_t0EEvv.exit.i.i

325:                                              ; preds = %321
  tail call fastcc void @__ppukernel_threadfence_system_void() #17
  br label %_Z14nvshmemi_quietIL13threadgroup_t0EEvv.exit.i.i

_Z14nvshmemi_quietIL13threadgroup_t0EEvv.exit.i.i: ; preds = %325, %324
  %326 = load i64, ptr %148, align 8
  %327 = add i64 %326, 16
  store i64 %327, ptr %148, align 8
  br label %_Z37nvshmemi_bcast_nonLL_tree_threadgroupIaL13threadgroup_t2EEviPT_PKS1_mii.exit.i

_Z37nvshmemi_bcast_nonLL_tree_threadgroupIaL13threadgroup_t2EEviPT_PKS1_mii.exit.i: ; preds = %_Z14nvshmemi_quietIL13threadgroup_t0EEvv.exit.i.i, %320
  tail call fastcc void @__ppukernel_syncthreads_void() #22
  br label %_Z30nvshmemi_broadcast_threadgroupIaL13threadgroup_t2EEviPT_PKS1_mi.exit

_Z30nvshmemi_broadcast_threadgroupIaL13threadgroup_t2EEviPT_PKS1_mi.exit: ; preds = %.thread.i, %_Z41nvshmemi_bcast_put2all_direct_threadgroupIaL13threadgroup_t2EEviPT_PKS1_mi.exit.i, %_Z34nvshmemi_bcast_put2all_threadgroupIaL13threadgroup_t2EEviPT_PKS1_mi.exit.i, %_Z37nvshmemi_bcast_nonLL_tree_threadgroupIaL13threadgroup_t2EEviPT_PKS1_mii.exit.i
  ret void
}

; CHECK-LABLE: __ppu_printf_begin
; Function Attrs: mustprogress nofree noinline norecurse nounwind null_pointer_is_valid
define internal fastcc i64 @__ppu_printf_begin(i32 %0) unnamed_addr #27 {
  %2 = tail call i64 @llvm.ppu.read.printf.buf.addr() #17
  %3 = icmp eq i64 %2, 0
  br i1 %3, label %89, label %4

4:                                                ; preds = %1
  %5 = inttoptr i64 %2 to ptr addrspace(1)
  %6 = add i32 %0, -201
  %7 = icmp ult i32 %6, -257
  %8 = add i32 %0, 47
  %9 = sdiv i32 %8, 248
  %10 = shl nsw i32 %9, 3
  %11 = select i1 %7, i32 %10, i32 0
  %12 = load i64, ptr addrspace(1) %5, align 8, !tbaa !51
  %13 = getelementptr inbounds nuw i8, ptr addrspace(1) %5, i64 8
  %14 = load i64, ptr addrspace(1) %13, align 8, !tbaa !54
  %15 = add i32 %0, 311
  %16 = add i32 %15, %11
  %17 = and i32 %16, -256
  %18 = zext i32 %17 to i64
  %19 = icmp ult i64 %12, %18
  br i1 %19, label %89, label %20

20:                                               ; preds = %4
  %21 = getelementptr inbounds nuw i8, ptr addrspace(1) %5, i64 16
  %22 = addrspacecast ptr addrspace(1) %21 to ptr
; CHECK: %{{.+}} = call fastcc i64 @__ppukernelstub_atomic_add_u64(i8* %{{.+}}, i64 %{{.+}}) #17
  %23 = tail call fastcc i64 @__ppukernelstub_atomic_add_u64(ptr %22, i64 %18) #45, !ppu.simt.noyield !23
  %24 = getelementptr inbounds nuw i8, ptr addrspace(1) %5, i64 24
  %25 = add i64 %23, %18
  br label %26

26:                                               ; preds = %33, %20
  %27 = phi i32 [ 10000, %20 ], [ %29, %33 ]
  %28 = load volatile i64, ptr addrspace(1) %24, align 8, !tbaa !55, !ppu.simt.noyield !23
  %29 = add nsw i32 %27, -1
  %30 = icmp eq i32 %29, 0
  %31 = icmp ult i64 %23, %28
  %32 = or i1 %30, %31
  br i1 %32, label %36, label %33

33:                                               ; preds = %26
  %34 = sub i64 %25, %28
  %35 = icmp ult i64 %12, %34
  br i1 %35, label %26, label %62, !llvm.loop !56

36:                                               ; preds = %26
  %37 = getelementptr inbounds nuw i8, ptr addrspace(1) %5, i64 32
  %38 = addrspacecast ptr addrspace(1) %37 to ptr
  %39 = load i64, ptr %38, align 8, !tbaa !57
  br label %40, !ppu.simt.noyield !23

40:                                               ; preds = %43, %36
  %41 = phi i64 [ %39, %36 ], [ %44, %43 ]
  %42 = icmp ult i64 %41, %25, !ppu.simt.noyield !23
  br i1 %42, label %43, label %46, !ppu.simt.noyield !23

43:                                               ; preds = %40
  %44 = tail call fastcc i64 @__ppukernelstub_atomic_cas_u64(ptr nonnull %38, i64 %41, i64 %25) #45, !ppu.simt.noyield !23
  %45 = icmp eq i64 %44, %41, !ppu.simt.noyield !23
  br i1 %45, label %46, label %40, !llvm.loop !58, !ppu.simt.noyield !23

46:                                               ; preds = %43, %40
  %47 = getelementptr inbounds nuw i8, ptr addrspace(1) %5, i64 40
  %48 = addrspacecast ptr addrspace(1) %47 to ptr
  %49 = tail call fastcc i64 @__ppukernelstub_atomic_add_u64(ptr %48, i64 %18) #45, !ppu.simt.noyield !23
  %50 = add i64 %49, %18
  %51 = load volatile i64, ptr addrspace(1) %37, align 8, !tbaa !59, !ppu.simt.noyield !23
  %52 = icmp eq i64 %51, %50, !ppu.simt.noyield !23
  br i1 %52, label %53, label %.sink.split, !ppu.simt.noyield !23

53:                                               ; preds = %46
  %54 = addrspacecast ptr addrspace(1) %24 to ptr, !ppu.simt.noyield !23
  %55 = load i64, ptr %54, align 8, !tbaa !57, !ppu.simt.noyield !23
  br label %56, !ppu.simt.noyield !23

56:                                               ; preds = %59, %53
  %57 = phi i64 [ %55, %53 ], [ %60, %59 ], !ppu.simt.noyield !23
  %58 = icmp ult i64 %57, %50, !ppu.simt.noyield !23
  br i1 %58, label %59, label %.sink.split, !ppu.simt.noyield !23

59:                                               ; preds = %56
  %60 = tail call fastcc i64 @__ppukernelstub_atomic_cas_u64(ptr nonnull %54, i64 %57, i64 %50) #45, !ppu.simt.noyield !23
  %61 = icmp eq i64 %60, %57, !ppu.simt.noyield !23
  br i1 %61, label %.sink.split, label %56, !llvm.loop !58, !ppu.simt.noyield !23

62:                                               ; preds = %33
  %63 = urem i64 %23, %12
  %64 = add i64 %63, %14
  %65 = inttoptr i64 %64 to ptr addrspace(1)
  store i64 71922819891, ptr addrspace(1) %65, align 8
  %66 = getelementptr inbounds nuw i8, ptr addrspace(1) %65, i64 8
  store i32 %17, ptr addrspace(1) %66, align 8, !tbaa !60
  %67 = getelementptr inbounds nuw i8, ptr addrspace(1) %65, i64 12
  store i32 0, ptr addrspace(1) %67, align 4, !tbaa !63
  %68 = getelementptr inbounds nuw i8, ptr addrspace(1) %65, i64 32
  store i64 0, ptr addrspace(1) %68, align 8, !tbaa !64
  %69 = getelementptr inbounds nuw i8, ptr addrspace(1) %65, i64 40
  store i64 %23, ptr addrspace(1) %69, align 8, !tbaa !65
  %70 = add i64 %64, 56
  %71 = getelementptr inbounds nuw i8, ptr addrspace(1) %65, i64 48
  store i64 %70, ptr addrspace(1) %71, align 8, !tbaa !66
  %72 = tail call i32 @llvm.ppu.read.tix.sreg.ctaid.x()
  %73 = tail call i32 @llvm.ppu.read.tix.sreg.nctaid.x()
  %74 = tail call i32 @llvm.ppu.read.tix.sreg.ctaid.y()
  %75 = mul nsw i32 %74, %73
  %76 = add nsw i32 %75, %72
  %77 = getelementptr inbounds nuw i8, ptr addrspace(1) %65, i64 16
  store i32 %76, ptr addrspace(1) %77, align 8, !tbaa !67
  %78 = tail call i32 @llvm.ppu.read.tix.sreg.tid.x()
  %79 = tail call i32 @llvm.ppu.read.tix.sreg.ntid.x()
  %80 = tail call i32 @llvm.ppu.read.tix.sreg.tid.y()
  %81 = tail call i32 @llvm.ppu.read.tix.sreg.ntid.y()
  %82 = tail call i32 @llvm.ppu.read.tix.sreg.tid.z()
  %83 = mul i32 %82, %81
  %84 = add i32 %83, %80
  %85 = mul i32 %84, %79
  %86 = add i32 %85, %78
  %87 = getelementptr inbounds nuw i8, ptr addrspace(1) %65, i64 20
  store i32 %86, ptr addrspace(1) %87, align 4, !tbaa !68
  %88 = getelementptr inbounds nuw i8, ptr addrspace(1) %65, i64 24
  store i64 0, ptr addrspace(1) %88, align 8, !tbaa !69
  br label %.sink.split

.sink.split:                                      ; preds = %56, %59, %46, %62
  %.ph = phi i64 [ %64, %62 ], [ 0, %46 ], [ 0, %59 ], [ 0, %56 ]
  tail call fastcc void @__llvm_fence_system() #17
  br label %89

89:                                               ; preds = %.sink.split, %4, %1
  %90 = phi i64 [ 0, %1 ], [ 0, %4 ], [ %.ph, %.sink.split ]
  ret i64 %90
}

; Function Attrs: nofree noinline norecurse nounwind null_pointer_is_valid
define internal fastcc i64 @__ppu_printf_append_string_n(i64 returned %0, ptr readonly captures(none) %1, i32 %2, i32 range(i32 0, 2) %3) unnamed_addr #28 {
  %5 = icmp eq i64 %0, 0
  br i1 %5, label %106, label %6

6:                                                ; preds = %4
  %7 = tail call i64 @llvm.ppu.read.printf.buf.addr() #17
  %8 = inttoptr i64 %7 to ptr addrspace(1)
  %9 = getelementptr inbounds nuw i8, ptr addrspace(1) %8, i64 8
  %10 = load i64, ptr addrspace(1) %9, align 8, !tbaa !54
  %11 = inttoptr i64 %10 to ptr addrspace(1)
  %12 = load i64, ptr addrspace(1) %8, align 8, !tbaa !51
  %13 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 %12
  %14 = add i32 %2, 7
  %15 = and i32 %14, -8
  %16 = inttoptr i64 %0 to ptr addrspace(1)
  %17 = getelementptr inbounds nuw i8, ptr addrspace(1) %16, i64 48
  %18 = load i64, ptr addrspace(1) %17, align 8, !tbaa !66
  %19 = getelementptr inbounds nuw i8, ptr addrspace(1) %16, i64 12
  %20 = load i32, ptr addrspace(1) %19, align 4, !tbaa !63
  %21 = add i32 %20, 1
  store i32 %21, ptr addrspace(1) %19, align 4, !tbaa !63
  %22 = inttoptr i64 %18 to ptr addrspace(1)
  %23 = addrspacecast ptr addrspace(1) %22 to ptr
  %24 = addrspacecast ptr addrspace(1) %11 to ptr
  %25 = addrspacecast ptr addrspace(1) %13 to ptr
  %26 = zext i32 %15 to i64
  %27 = ptrtoint ptr %23 to i64
  %28 = and i64 %27, 255
  %29 = icmp eq i64 %28, 0
  br i1 %29, label %30, label %33

30:                                               ; preds = %6
  store i64 -9223371964931955917, ptr %23, align 8
  %31 = getelementptr inbounds nuw i8, ptr addrspace(1) %22, i64 8
  %32 = addrspacecast ptr addrspace(1) %31 to ptr
  br label %33

33:                                               ; preds = %30, %6
  %34 = phi ptr [ %32, %30 ], [ %23, %6 ]
  %35 = getelementptr inbounds nuw i8, ptr %34, i64 8
  %36 = icmp ult ptr %35, %25
  %37 = select i1 %36, ptr %35, ptr %24
  store i64 %26, ptr %34, align 8, !tbaa !57
  %38 = icmp eq i32 %2, 0
  br i1 %38, label %.loopexit12, label %.preheader11.preheader

.preheader11.preheader:                           ; preds = %33
  %39 = zext i32 %2 to i64
  br label %.preheader11

.loopexit12:                                      ; preds = %50, %33
  %40 = phi ptr [ %37, %33 ], [ %54, %50 ]
  %41 = icmp ugt i32 %15, %2
  br i1 %41, label %.preheader, label %.loopexit10

.preheader11:                                     ; preds = %.preheader11.preheader, %50
  %indvars.iv = phi i64 [ 0, %.preheader11.preheader ], [ %indvars.iv.next, %50 ]
  %42 = phi ptr [ %37, %.preheader11.preheader ], [ %54, %50 ]
  %43 = getelementptr inbounds nuw i8, ptr %1, i64 %indvars.iv
  %44 = load i8, ptr %43, align 1, !tbaa !70
  %45 = ptrtoint ptr %42 to i64
  %46 = and i64 %45, 255
  %47 = icmp eq i64 %46, 0
  br i1 %47, label %48, label %50

48:                                               ; preds = %.preheader11
  store i64 -9223371964931955917, ptr %42, align 8
  %49 = getelementptr inbounds nuw i8, ptr %42, i64 8
  br label %50

50:                                               ; preds = %48, %.preheader11
  %51 = phi ptr [ %49, %48 ], [ %42, %.preheader11 ]
  %52 = getelementptr inbounds nuw i8, ptr %51, i64 1
  %53 = icmp ult ptr %52, %25
  %54 = select i1 %53, ptr %52, ptr %24
  store i8 %44, ptr %51, align 1, !tbaa !70
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %55 = icmp eq i64 %indvars.iv.next, %39
  br i1 %55, label %.loopexit12, label %.preheader11, !llvm.loop !71

.loopexit10:                                      ; preds = %66, %.loopexit12
  %56 = phi ptr [ %40, %.loopexit12 ], [ %70, %66 ]
  %57 = ptrtoint ptr %56 to i64
  store i64 %57, ptr addrspace(1) %17, align 8, !tbaa !66
  %58 = icmp eq i32 %3, 0
  br i1 %58, label %106, label %72

.preheader:                                       ; preds = %.loopexit12, %66
  %59 = phi i32 [ %71, %66 ], [ %2, %.loopexit12 ]
  %60 = phi ptr [ %70, %66 ], [ %40, %.loopexit12 ]
  %61 = ptrtoint ptr %60 to i64
  %62 = and i64 %61, 255
  %63 = icmp eq i64 %62, 0
  br i1 %63, label %64, label %66

64:                                               ; preds = %.preheader
  store i64 -9223371964931955917, ptr %60, align 8
  %65 = getelementptr inbounds nuw i8, ptr %60, i64 8
  br label %66

66:                                               ; preds = %64, %.preheader
  %67 = phi ptr [ %65, %64 ], [ %60, %.preheader ]
  %68 = getelementptr inbounds nuw i8, ptr %67, i64 1
  %69 = icmp ult ptr %68, %25
  %70 = select i1 %69, ptr %68, ptr %24
  %71 = add nuw i32 %59, 1
  %exitcond.not = icmp eq i32 %71, %15
  br i1 %exitcond.not, label %.loopexit10, label %.preheader, !llvm.loop !72

72:                                               ; preds = %.loopexit10
  %73 = getelementptr inbounds nuw i8, ptr addrspace(1) %16, i64 40
  %74 = load i64, ptr addrspace(1) %73, align 8, !tbaa !65
  %75 = getelementptr inbounds nuw i8, ptr addrspace(1) %16, i64 8
  %76 = load i32, ptr addrspace(1) %75, align 8, !tbaa !60
  %77 = zext i32 %76 to i64
  %78 = add i64 %74, %77
  %79 = getelementptr inbounds nuw i8, ptr addrspace(1) %16, i64 32
  store i64 %78, ptr addrspace(1) %79, align 8, !tbaa !64
  tail call fastcc void @__llvm_fence_system() #17
  %80 = getelementptr inbounds nuw i8, ptr addrspace(1) %8, i64 32
  %81 = addrspacecast ptr addrspace(1) %80 to ptr
  %82 = load i64, ptr %81, align 8, !tbaa !57
  br label %83, !ppu.simt.noyield !23

83:                                               ; preds = %86, %72
  %84 = phi i64 [ %82, %72 ], [ %87, %86 ]
  %85 = icmp ult i64 %84, %78, !ppu.simt.noyield !23
  br i1 %85, label %86, label %89, !ppu.simt.noyield !23

86:                                               ; preds = %83
  %87 = tail call fastcc i64 @__ppukernelstub_atomic_cas_u64(ptr nonnull %81, i64 %84, i64 %78) #45, !ppu.simt.noyield !23
  %88 = icmp eq i64 %87, %84, !ppu.simt.noyield !23
  br i1 %88, label %89, label %83, !llvm.loop !58, !ppu.simt.noyield !23

89:                                               ; preds = %86, %83
  %90 = getelementptr inbounds nuw i8, ptr addrspace(1) %8, i64 40
  %91 = addrspacecast ptr addrspace(1) %90 to ptr
  %92 = tail call fastcc i64 @__ppukernelstub_atomic_add_u64(ptr %91, i64 %77) #45, !ppu.simt.noyield !23
  %93 = add i64 %92, %77
  %94 = load volatile i64, ptr addrspace(1) %80, align 8, !tbaa !59, !ppu.simt.noyield !23
  %95 = icmp eq i64 %94, %93, !ppu.simt.noyield !23
  br i1 %95, label %96, label %.loopexit, !ppu.simt.noyield !23

96:                                               ; preds = %89
  %97 = getelementptr inbounds nuw i8, ptr addrspace(1) %8, i64 24
  %98 = addrspacecast ptr addrspace(1) %97 to ptr, !ppu.simt.noyield !23
  %99 = load i64, ptr %98, align 8, !tbaa !57, !ppu.simt.noyield !23
  br label %100, !ppu.simt.noyield !23

100:                                              ; preds = %103, %96
  %101 = phi i64 [ %99, %96 ], [ %104, %103 ], !ppu.simt.noyield !23
  %102 = icmp ult i64 %101, %93, !ppu.simt.noyield !23
  br i1 %102, label %103, label %.loopexit, !ppu.simt.noyield !23

103:                                              ; preds = %100
  %104 = tail call fastcc i64 @__ppukernelstub_atomic_cas_u64(ptr nonnull %98, i64 %101, i64 %93) #45, !ppu.simt.noyield !23
  %105 = icmp eq i64 %104, %101, !ppu.simt.noyield !23
  br i1 %105, label %.loopexit, label %100, !llvm.loop !58, !ppu.simt.noyield !23

.loopexit:                                        ; preds = %103, %100, %89
  tail call fastcc void @__llvm_fence_system() #17
  br label %106

106:                                              ; preds = %.loopexit, %.loopexit10, %4
  ret i64 %0
}

; Function Attrs: nofree noinline norecurse nounwind null_pointer_is_valid
define internal fastcc i64 @__ppu_printf_append_args(i64 returned %0, i64 range(i64 0, 4294967296) %1, i32 range(i32 0, 2) %2) unnamed_addr #28 {
  %4 = icmp eq i64 %0, 0
  br i1 %4, label %80, label %5

5:                                                ; preds = %3
  %6 = inttoptr i64 %0 to ptr addrspace(1)
  %7 = tail call i64 @llvm.ppu.read.printf.buf.addr() #17
  %8 = inttoptr i64 %7 to ptr addrspace(1)
  %9 = getelementptr inbounds nuw i8, ptr addrspace(1) %8, i64 8
  %10 = load i64, ptr addrspace(1) %9, align 8, !tbaa !54
  %11 = inttoptr i64 %10 to ptr addrspace(1)
  %12 = load i64, ptr addrspace(1) %8, align 8, !tbaa !51
  %13 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 %12
  %14 = getelementptr inbounds nuw i8, ptr addrspace(1) %6, i64 48
  %15 = load i64, ptr addrspace(1) %14, align 8, !tbaa !66
  %16 = getelementptr inbounds nuw i8, ptr addrspace(1) %6, i64 12
  %17 = load i32, ptr addrspace(1) %16, align 4, !tbaa !63
  %18 = add i32 %17, 1
  store i32 %18, ptr addrspace(1) %16, align 4, !tbaa !63
  %19 = inttoptr i64 %15 to ptr addrspace(1)
  %20 = addrspacecast ptr addrspace(1) %19 to ptr
  %21 = addrspacecast ptr addrspace(1) %13 to ptr
  %22 = ptrtoint ptr %20 to i64
  %23 = and i64 %22, 255
  %24 = icmp eq i64 %23, 0
  br i1 %24, label %25, label %28

25:                                               ; preds = %5
  store i64 -9223371964931955917, ptr %20, align 8
  %26 = getelementptr inbounds nuw i8, ptr addrspace(1) %19, i64 8
  %27 = addrspacecast ptr addrspace(1) %26 to ptr
  br label %28

28:                                               ; preds = %25, %5
  %29 = phi ptr [ %27, %25 ], [ %20, %5 ]
  %30 = getelementptr inbounds nuw i8, ptr %29, i64 8
  %31 = icmp ult ptr %30, %21
  %32 = addrspacecast ptr addrspace(1) %11 to ptr
  %33 = select i1 %31, ptr %30, ptr %32
  store i64 8, ptr %29, align 8, !tbaa !57
  %34 = ptrtoint ptr %33 to i64
  %35 = and i64 %34, 255
  %36 = icmp eq i64 %35, 0
  br i1 %36, label %37, label %39

37:                                               ; preds = %28
  store i64 -9223371964931955917, ptr %33, align 8
  %38 = getelementptr inbounds nuw i8, ptr %33, i64 8
  br label %39

39:                                               ; preds = %37, %28
  %40 = phi ptr [ %38, %37 ], [ %33, %28 ]
  %41 = getelementptr inbounds nuw i8, ptr %40, i64 8
  %42 = icmp ult ptr %41, %21
  %43 = select i1 %42, ptr %41, ptr %32
  store i64 %1, ptr %40, align 8, !tbaa !57
  %44 = ptrtoint ptr %43 to i64
  store i64 %44, ptr addrspace(1) %14, align 8, !tbaa !66
  %45 = icmp eq i32 %2, 0
  br i1 %45, label %80, label %46

46:                                               ; preds = %39
  %47 = getelementptr inbounds nuw i8, ptr addrspace(1) %6, i64 40
  %48 = load i64, ptr addrspace(1) %47, align 8, !tbaa !65
  %49 = getelementptr inbounds nuw i8, ptr addrspace(1) %6, i64 8
  %50 = load i32, ptr addrspace(1) %49, align 8, !tbaa !60
  %51 = zext i32 %50 to i64
  %52 = add i64 %48, %51
  %53 = getelementptr inbounds nuw i8, ptr addrspace(1) %6, i64 32
  store i64 %52, ptr addrspace(1) %53, align 8, !tbaa !64
  tail call fastcc void @__llvm_fence_system() #17
  %54 = getelementptr inbounds nuw i8, ptr addrspace(1) %8, i64 32
  %55 = addrspacecast ptr addrspace(1) %54 to ptr
  %56 = load i64, ptr %55, align 8, !tbaa !57
  br label %57, !ppu.simt.noyield !23

57:                                               ; preds = %60, %46
  %58 = phi i64 [ %56, %46 ], [ %61, %60 ]
  %59 = icmp ult i64 %58, %52, !ppu.simt.noyield !23
  br i1 %59, label %60, label %63, !ppu.simt.noyield !23

60:                                               ; preds = %57
  %61 = tail call fastcc i64 @__ppukernelstub_atomic_cas_u64(ptr nonnull %55, i64 %58, i64 %52) #45, !ppu.simt.noyield !23
  %62 = icmp eq i64 %61, %58, !ppu.simt.noyield !23
  br i1 %62, label %63, label %57, !llvm.loop !58, !ppu.simt.noyield !23

63:                                               ; preds = %60, %57
  %64 = getelementptr inbounds nuw i8, ptr addrspace(1) %8, i64 40
  %65 = addrspacecast ptr addrspace(1) %64 to ptr
  %66 = tail call fastcc i64 @__ppukernelstub_atomic_add_u64(ptr %65, i64 %51) #45, !ppu.simt.noyield !23
  %67 = add i64 %66, %51
  %68 = load volatile i64, ptr addrspace(1) %54, align 8, !tbaa !59, !ppu.simt.noyield !23
  %69 = icmp eq i64 %68, %67, !ppu.simt.noyield !23
  br i1 %69, label %70, label %.loopexit, !ppu.simt.noyield !23

70:                                               ; preds = %63
  %71 = getelementptr inbounds nuw i8, ptr addrspace(1) %8, i64 24
  %72 = addrspacecast ptr addrspace(1) %71 to ptr, !ppu.simt.noyield !23
  %73 = load i64, ptr %72, align 8, !tbaa !57, !ppu.simt.noyield !23
  br label %74, !ppu.simt.noyield !23

74:                                               ; preds = %77, %70
  %75 = phi i64 [ %73, %70 ], [ %78, %77 ], !ppu.simt.noyield !23
  %76 = icmp ult i64 %75, %67, !ppu.simt.noyield !23
  br i1 %76, label %77, label %.loopexit, !ppu.simt.noyield !23

77:                                               ; preds = %74
  %78 = tail call fastcc i64 @__ppukernelstub_atomic_cas_u64(ptr nonnull %72, i64 %75, i64 %67) #45, !ppu.simt.noyield !23
  %79 = icmp eq i64 %78, %75, !ppu.simt.noyield !23
  br i1 %79, label %.loopexit, label %74, !llvm.loop !58, !ppu.simt.noyield !23

.loopexit:                                        ; preds = %77, %74, %63
  tail call fastcc void @__llvm_fence_system() #17
  br label %80

80:                                               ; preds = %.loopexit, %39, %3
  ret i64 %0
}

; Function Attrs: mustprogress noinline nounwind null_pointer_is_valid
define internal fastcc void @_ZL13__assert_failPKcS0_jS0_(ptr %0, ptr %1, i32 range(i32 94, 413) %2, ptr %3) unnamed_addr #29 {
  %5 = tail call i32 @llvm.ppu.read.tix.sreg.tid.x()
  %6 = tail call i32 @llvm.ppu.read.tix.sreg.tid.y()
  %7 = tail call i32 @llvm.ppu.read.tix.sreg.tid.z()
  %8 = tail call i32 @llvm.ppu.read.tix.sreg.ctaid.x()
  %9 = tail call i32 @llvm.ppu.read.tix.sreg.ctaid.y()
  %10 = tail call i32 @llvm.ppu.read.tix.sreg.ctaid.z()
  %constexpr = icmp eq ptr addrspacecast (ptr addrspace(4) @.str.2 to ptr), null
  %11 = and i32 sub (i32 ptrtoint (ptr getelementptr (i8, ptr addrspacecast (ptr addrspace(4) @.str.2 to ptr), i64 73) to i32), i32 ptrtoint (ptr addrspacecast (ptr addrspace(4) @.str.2 to ptr) to i32)), -8
  %12 = add i32 %11, 152
  %13 = select i1 %constexpr, i32 144, i32 %12
  %14 = icmp eq ptr %1, null
  br i1 %14, label %27, label %.preheader17

.preheader17:                                     ; preds = %4, %.preheader17
  %15 = phi ptr [ %16, %.preheader17 ], [ %1, %4 ]
  %16 = getelementptr i8, ptr %15, i64 1
  %17 = load i8, ptr %15, align 1
  %18 = icmp eq i8 %17, 0
  br i1 %18, label %19, label %.preheader17

19:                                               ; preds = %.preheader17
  %20 = ptrtoint ptr %1 to i64
  %21 = trunc i64 %20 to i32
  %22 = ptrtoint ptr %15 to i64
  %23 = trunc i64 %22 to i32
  %24 = sub i32 %23, %21
  %25 = and i32 %24, -8
  %26 = add i32 %25, 8
  br label %27

27:                                               ; preds = %19, %4
  %28 = phi i32 [ %26, %19 ], [ 0, %4 ]
  %29 = icmp eq ptr %3, null
  br i1 %29, label %42, label %.preheader16

.preheader16:                                     ; preds = %27, %.preheader16
  %30 = phi ptr [ %31, %.preheader16 ], [ %3, %27 ]
  %31 = getelementptr i8, ptr %30, i64 1
  %32 = load i8, ptr %30, align 1
  %33 = icmp eq i8 %32, 0
  br i1 %33, label %34, label %.preheader16

34:                                               ; preds = %.preheader16
  %35 = ptrtoint ptr %3 to i64
  %36 = trunc i64 %35 to i32
  %37 = ptrtoint ptr %30 to i64
  %38 = trunc i64 %37 to i32
  %39 = sub i32 %38, %36
  %40 = and i32 %39, -8
  %41 = add i32 %40, 8
  br label %42

42:                                               ; preds = %34, %27
  %43 = phi i32 [ %41, %34 ], [ 0, %27 ]
  %44 = icmp eq ptr %0, null
  br i1 %44, label %.preheader14.preheader, label %.preheader15

.preheader15:                                     ; preds = %42, %.preheader15
  %45 = phi ptr [ %46, %.preheader15 ], [ %0, %42 ]
  %46 = getelementptr i8, ptr %45, i64 1
  %47 = load i8, ptr %45, align 1
  %48 = icmp eq i8 %47, 0
  br i1 %48, label %49, label %.preheader15

49:                                               ; preds = %.preheader15
  %50 = ptrtoint ptr %0 to i64
  %51 = trunc i64 %50 to i32
  %52 = ptrtoint ptr %45 to i64
  %53 = trunc i64 %52 to i32
  %54 = sub i32 %53, %51
  %55 = and i32 %54, -8
  %56 = add i32 %55, 8
  br label %.preheader14.preheader

.preheader14.preheader:                           ; preds = %49, %42
  %57 = phi i32 [ %56, %49 ], [ 0, %42 ]
  %58 = add i32 %13, %28
  %59 = add i32 %58, %43
  %60 = add i32 %59, %57
  %61 = tail call fastcc i64 @__ppu_printf_begin(i32 %60)
  %spec.select = select i1 %constexpr, i32 0, i32 add (i32 ptrtoint (ptr getelementptr (i8, ptr addrspacecast (ptr addrspace(4) @.str.2 to ptr), i64 73) to i32), i32 add (i32 sub (i32 0, i32 ptrtoint (ptr addrspacecast (ptr addrspace(4) @.str.2 to ptr) to i32)), i32 1))
  %62 = tail call fastcc i64 @__ppu_printf_append_string_n(i64 %61, ptr addrspacecast (ptr addrspace(4) @.str.2 to ptr), i32 %spec.select, i32 0)
  br i1 %14, label %73, label %.preheader13

.preheader13:                                     ; preds = %.preheader14.preheader, %.preheader13
  %63 = phi ptr [ %64, %.preheader13 ], [ %1, %.preheader14.preheader ]
  %64 = getelementptr i8, ptr %63, i64 1
  %65 = load i8, ptr %63, align 1
  %66 = icmp eq i8 %65, 0
  br i1 %66, label %67, label %.preheader13

67:                                               ; preds = %.preheader13
  %68 = ptrtoint ptr %1 to i64
  %69 = trunc i64 %68 to i32
  %70 = ptrtoint ptr %63 to i64
  %71 = trunc i64 %70 to i32
  %reass.sub = sub i32 %71, %69
  %72 = add i32 %reass.sub, 1
  br label %73

73:                                               ; preds = %67, %.preheader14.preheader
  %74 = phi i32 [ %72, %67 ], [ 0, %.preheader14.preheader ]
  %75 = tail call fastcc i64 @__ppu_printf_append_string_n(i64 %61, ptr %1, i32 %74, i32 0)
  %76 = zext nneg i32 %2 to i64
  %77 = tail call fastcc i64 @__ppu_printf_append_args(i64 %61, i64 %76, i32 0)
  br i1 %29, label %88, label %.preheader12

.preheader12:                                     ; preds = %73, %.preheader12
  %78 = phi ptr [ %79, %.preheader12 ], [ %3, %73 ]
  %79 = getelementptr i8, ptr %78, i64 1
  %80 = load i8, ptr %78, align 1
  %81 = icmp eq i8 %80, 0
  br i1 %81, label %82, label %.preheader12

82:                                               ; preds = %.preheader12
  %83 = ptrtoint ptr %3 to i64
  %84 = trunc i64 %83 to i32
  %85 = ptrtoint ptr %78 to i64
  %86 = trunc i64 %85 to i32
  %reass.sub26 = sub i32 %86, %84
  %87 = add i32 %reass.sub26, 1
  br label %88

88:                                               ; preds = %82, %73
  %89 = phi i32 [ %87, %82 ], [ 0, %73 ]
  %90 = tail call fastcc i64 @__ppu_printf_append_string_n(i64 %61, ptr %3, i32 %89, i32 0)
  %91 = zext i32 %8 to i64
  %92 = tail call fastcc i64 @__ppu_printf_append_args(i64 %61, i64 %91, i32 0)
  %93 = zext i32 %9 to i64
  %94 = tail call fastcc i64 @__ppu_printf_append_args(i64 %61, i64 %93, i32 0)
  %95 = zext i32 %10 to i64
  %96 = tail call fastcc i64 @__ppu_printf_append_args(i64 %61, i64 %95, i32 0)
  %97 = zext i32 %5 to i64
  %98 = tail call fastcc i64 @__ppu_printf_append_args(i64 %61, i64 %97, i32 0)
  %99 = zext i32 %6 to i64
  %100 = tail call fastcc i64 @__ppu_printf_append_args(i64 %61, i64 %99, i32 0)
  %101 = zext i32 %7 to i64
  %102 = tail call fastcc i64 @__ppu_printf_append_args(i64 %61, i64 %101, i32 0)
  br i1 %44, label %113, label %.preheader

.preheader:                                       ; preds = %88, %.preheader
  %103 = phi ptr [ %104, %.preheader ], [ %0, %88 ]
  %104 = getelementptr i8, ptr %103, i64 1
  %105 = load i8, ptr %103, align 1
  %106 = icmp eq i8 %105, 0
  br i1 %106, label %107, label %.preheader

107:                                              ; preds = %.preheader
  %108 = ptrtoint ptr %0 to i64
  %109 = trunc i64 %108 to i32
  %110 = ptrtoint ptr %103 to i64
  %111 = trunc i64 %110 to i32
  %reass.sub27 = sub i32 %111, %109
  %112 = add i32 %reass.sub27, 1
  br label %113

113:                                              ; preds = %107, %88
  %114 = phi i32 [ %112, %107 ], [ 0, %88 ]
  %115 = tail call fastcc i64 @__ppu_printf_append_string_n(i64 %61, ptr %0, i32 %114, i32 1)
  tail call void @llvm.ppu.assert() #17
  ret void
}

; Function Attrs: inlinehint mustprogress nofree norecurse nounwind null_pointer_is_valid
define internal fastcc void @_Z28nvshmemi_barrier_threadgroupIL13threadgroup_t0EEvi(i32 %0) unnamed_addr #30 comdat {
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 32), align 8
  %9 = icmp sgt i32 %8, 2
  br i1 %9, label %10, label %11

10:                                               ; preds = %1
  notail call fastcc void @_Z23nvshmemi_transfer_quietIL13threadgroup_t0EEvb() #17
  br label %12

11:                                               ; preds = %1
  tail call fastcc void @__ppukernel_threadfence_system_void() #17
  br label %12

12:                                               ; preds = %11, %10
  %13 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 96), align 8
  %14 = sext i32 %0 to i64
  %15 = getelementptr inbounds ptr, ptr %13, i64 %14
  %16 = load ptr, ptr %15, align 8
  %17 = getelementptr inbounds nuw i8, ptr %16, i64 16
  %18 = load i32, ptr %17, align 8
  %19 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 128), align 8
  %20 = tail call i32 @llvm.smin.i32(i32 %19, i32 %18)
  %21 = tail call i32 @llvm.smax.i32(i32 %20, i32 2)
  %22 = getelementptr inbounds nuw i8, ptr %16, i64 8
  %23 = load i32, ptr %22, align 8
  %24 = getelementptr inbounds nuw i8, ptr %16, i64 12
  %25 = load i32, ptr %24, align 4
  %26 = load i64, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 152), align 8
  %27 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 8), align 8
  %28 = shl nsw i32 %27, 2
  %29 = sext i32 %28 to i64
  %30 = mul i64 %26, %29
  %31 = lshr i64 %30, 3
  %32 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 104), align 8
  %33 = getelementptr inbounds nuw i8, ptr %16, i64 20
  %34 = load i32, ptr %33, align 4
  %35 = sext i32 %34 to i64
  %36 = load i64, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 200), align 8
  %37 = add i64 %36, 119
  %38 = udiv i64 %37, 120
  %39 = sext i32 %27 to i64
  %40 = shl nsw i64 %39, 8
  %41 = mul i64 %40, %38
  %42 = lshr exact i64 %41, 3
  %43 = load i64, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 168), align 8
  %44 = lshr i64 %43, 3
  %45 = add nuw nsw i64 %31, 442368
  %46 = add nuw nsw i64 %45, %44
  %47 = add nuw nsw i64 %46, %42
  %48 = mul i64 %47, %35
  %49 = getelementptr inbounds i64, ptr %32, i64 %48
  %50 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 112), align 8
  %51 = shl nsw i32 %34, 1
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i64, ptr %50, i64 %52
  %54 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 4), align 4
  %55 = sub nsw i32 %54, %23
  %56 = sdiv i32 %55, %25
  %57 = add nsw i32 %18, -1
  %.not79.i.i.i = icmp eq i32 %57, 0
  switch i32 %21, label %277 [
    i32 2, label %58
    i32 4, label %97
    i32 8, label %142
    i32 16, label %187
    i32 32, label %232
  ]

58:                                               ; preds = %12
  br i1 %.not79.i.i.i, label %_Z30nvshmemi_sync_algo_threadgroupIL13threadgroup_t0EEvi.exit, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %58, %.critedge.i.i
  %.06583.i.i = phi i32 [ %95, %.critedge.i.i ], [ %57, %58 ]
  %.06782.i.i = phi i32 [ %96, %.critedge.i.i ], [ 0, %58 ]
  %59 = shl nuw i32 1, %.06782.i.i
  %.not76.i.i = icmp slt i32 %59, %18
  br i1 %.not76.i.i, label %60, label %.critedge.i.i

60:                                               ; preds = %.preheader.i.i
  %61 = add nsw i32 %59, %56
  %.not77.i.i = icmp slt i32 %61, %18
  %62 = select i1 %.not77.i.i, i32 0, i32 %18
  %spec.select.i.i = sub nsw i32 %61, %62
  %63 = mul nsw i32 %spec.select.i.i, %25
  %64 = add nsw i32 %63, %23
  %65 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 4), align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i64, ptr %49, i64 %66
  %68 = load volatile i64, ptr %53, align 8
  %69 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 32), align 8
  %70 = icmp slt i32 %69, 3
  br i1 %70, label %71, label %82

71:                                               ; preds = %60
  %72 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 56), align 8
  %73 = sext i32 %64 to i64
  %74 = getelementptr inbounds i64, ptr %72, i64 %73
  %75 = tail call fastcc i64 @__ppukernel_ldg_ulonglong(ptr %74) #17
  %76 = inttoptr i64 %75 to ptr
  %77 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 40), align 8
  %78 = ptrtoint ptr %67 to i64
  %79 = ptrtoint ptr %77 to i64
  %80 = sub i64 %78, %79
  %81 = getelementptr inbounds i8, ptr %76, i64 %80
  store volatile i64 %68, ptr %81, align 8
  br label %83

82:                                               ; preds = %60
  notail call fastcc void @_Z30nvshmemi_transfer_amo_nonfetchIlEvPvT_i14nvshmemi_amo_t(ptr %67, i64 %68, i32 %64) #17
  br label %83

83:                                               ; preds = %82, %71
  %84 = sub nsw i32 %56, %59
  %85 = icmp slt i32 %84, 0
  %86 = select i1 %85, i32 %18, i32 0
  %spec.select79.i.i = add nsw i32 %86, %84
  %87 = mul nsw i32 %spec.select79.i.i, %25
  %88 = add nsw i32 %87, %23
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i64, ptr %49, i64 %89
  %91 = load volatile i64, ptr %53, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %7)
  store volatile i64 %91, ptr %7, align 8
  br label %92

92:                                               ; preds = %92, %83
  %93 = load volatile i64, ptr %90, align 8
  %.0..0..0..0..0..0..0..0..0..0..i.i.i = load volatile i64, ptr %7, align 8
  %94 = icmp slt i64 %93, %.0..0..0..0..0..0..0..0..0..0..i.i.i
  br i1 %94, label %92, label %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i.i, !llvm.loop !73

_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i.i: ; preds = %92
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %7)
  br label %.critedge.i.i

.critedge.i.i:                                    ; preds = %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i.i, %.preheader.i.i
  %95 = ashr i32 %.06583.i.i, 1
  %96 = add nuw nsw i32 %.06782.i.i, 1
  %.not.i.i = icmp ult i32 %.06583.i.i, 2
  br i1 %.not.i.i, label %_Z30nvshmemi_sync_algo_threadgroupIL13threadgroup_t0EEvi.exit, label %.preheader.i.i, !llvm.loop !74

97:                                               ; preds = %12
  br i1 %.not79.i.i.i, label %_Z30nvshmemi_sync_algo_threadgroupIL13threadgroup_t0EEvi.exit, label %.preheader.i20.i

.preheader.i20.i:                                 ; preds = %97, %139
  %.06584.i.i = phi i32 [ %140, %139 ], [ %57, %97 ]
  %.06783.i.i = phi i32 [ %141, %139 ], [ 0, %97 ]
  br label %98

98:                                               ; preds = %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i.i, %.preheader.i20.i
  %.06880.i.i = phi i32 [ 1, %.preheader.i20.i ], [ %123, %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i.i ]
  %99 = shl i32 %.06880.i.i, %.06783.i.i
  %.not76.i21.i = icmp slt i32 %99, %18
  br i1 %.not76.i21.i, label %100, label %.preheader

100:                                              ; preds = %98
  %101 = add nsw i32 %99, %56
  %.not77.i26.i = icmp slt i32 %101, %18
  %102 = select i1 %.not77.i26.i, i32 0, i32 %18
  %spec.select.i27.i = sub nsw i32 %101, %102
  %103 = mul nsw i32 %spec.select.i27.i, %25
  %104 = add nsw i32 %103, %23
  %105 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 4), align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i64, ptr %49, i64 %106
  %108 = load volatile i64, ptr %53, align 8
  %109 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 32), align 8
  %110 = icmp slt i32 %109, 3
  br i1 %110, label %111, label %122

111:                                              ; preds = %100
  %112 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 56), align 8
  %113 = sext i32 %104 to i64
  %114 = getelementptr inbounds i64, ptr %112, i64 %113
  %115 = tail call fastcc i64 @__ppukernel_ldg_ulonglong(ptr %114) #17
  %116 = inttoptr i64 %115 to ptr
  %117 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 40), align 8
  %118 = ptrtoint ptr %107 to i64
  %119 = ptrtoint ptr %117 to i64
  %120 = sub i64 %118, %119
  %121 = getelementptr inbounds i8, ptr %116, i64 %120
  store volatile i64 %108, ptr %121, align 8
  br label %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i.i

122:                                              ; preds = %100
  notail call fastcc void @_Z30nvshmemi_transfer_amo_nonfetchIlEvPvT_i14nvshmemi_amo_t(ptr %107, i64 %108, i32 %104) #17
  br label %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i.i

_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i.i: ; preds = %122, %111
  %123 = add nuw nsw i32 %.06880.i.i, 1
  %exitcond.not.i.i = icmp eq i32 %123, 4
  br i1 %exitcond.not.i.i, label %.preheader, label %98, !llvm.loop !75

.preheader:                                       ; preds = %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i.i, %98
  br label %124

124:                                              ; preds = %.preheader, %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i25.i
  %.06981.i.i = phi i32 [ %138, %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i25.i ], [ 1, %.preheader ]
  %125 = shl i32 %.06981.i.i, %.06783.i.i
  %.not78.i.i = icmp slt i32 %125, %18
  br i1 %.not78.i.i, label %126, label %139

126:                                              ; preds = %124
  %127 = sub nsw i32 %56, %125
  %128 = icmp slt i32 %127, 0
  %129 = select i1 %128, i32 %18, i32 0
  %spec.select79.i23.i = add nsw i32 %129, %127
  %130 = mul nsw i32 %spec.select79.i23.i, %25
  %131 = add nsw i32 %130, %23
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds i64, ptr %49, i64 %132
  %134 = load volatile i64, ptr %53, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %6)
  store volatile i64 %134, ptr %6, align 8
  br label %135

135:                                              ; preds = %135, %126
  %136 = load volatile i64, ptr %133, align 8
  %.0..0..0..0..0..0..0..0..0..0..i.i24.i = load volatile i64, ptr %6, align 8
  %137 = icmp slt i64 %136, %.0..0..0..0..0..0..0..0..0..0..i.i24.i
  br i1 %137, label %135, label %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i25.i, !llvm.loop !73

_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i25.i: ; preds = %135
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %6)
  %138 = add nuw nsw i32 %.06981.i.i, 1
  %exitcond85.not.i.i = icmp eq i32 %138, 4
  br i1 %exitcond85.not.i.i, label %139, label %124, !llvm.loop !76

139:                                              ; preds = %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i25.i, %124
  %140 = ashr i32 %.06584.i.i, 2
  %141 = add nuw nsw i32 %.06783.i.i, 1
  %.not.i22.i = icmp ult i32 %.06584.i.i, 4
  br i1 %.not.i22.i, label %_Z30nvshmemi_sync_algo_threadgroupIL13threadgroup_t0EEvi.exit, label %.preheader.i20.i, !llvm.loop !77

142:                                              ; preds = %12
  br i1 %.not79.i.i.i, label %_Z30nvshmemi_sync_algo_threadgroupIL13threadgroup_t0EEvi.exit, label %.preheader.i29.i

.preheader.i29.i:                                 ; preds = %142, %184
  %.06584.i30.i = phi i32 [ %185, %184 ], [ %57, %142 ]
  %.06783.i31.i = phi i32 [ %186, %184 ], [ 0, %142 ]
  br label %143

143:                                              ; preds = %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i43.i, %.preheader.i29.i
  %.06880.i32.i = phi i32 [ 1, %.preheader.i29.i ], [ %168, %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i43.i ]
  %144 = shl i32 %.06880.i32.i, %.06783.i31.i
  %.not76.i33.i = icmp slt i32 %144, %18
  br i1 %.not76.i33.i, label %145, label %.preheader35

145:                                              ; preds = %143
  %146 = add nsw i32 %144, %56
  %.not77.i41.i = icmp slt i32 %146, %18
  %147 = select i1 %.not77.i41.i, i32 0, i32 %18
  %spec.select.i42.i = sub nsw i32 %146, %147
  %148 = mul nsw i32 %spec.select.i42.i, %25
  %149 = add nsw i32 %148, %23
  %150 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 4), align 4
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds i64, ptr %49, i64 %151
  %153 = load volatile i64, ptr %53, align 8
  %154 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 32), align 8
  %155 = icmp slt i32 %154, 3
  br i1 %155, label %156, label %167

156:                                              ; preds = %145
  %157 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 56), align 8
  %158 = sext i32 %149 to i64
  %159 = getelementptr inbounds i64, ptr %157, i64 %158
  %160 = tail call fastcc i64 @__ppukernel_ldg_ulonglong(ptr %159) #17
  %161 = inttoptr i64 %160 to ptr
  %162 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 40), align 8
  %163 = ptrtoint ptr %152 to i64
  %164 = ptrtoint ptr %162 to i64
  %165 = sub i64 %163, %164
  %166 = getelementptr inbounds i8, ptr %161, i64 %165
  store volatile i64 %153, ptr %166, align 8
  br label %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i43.i

167:                                              ; preds = %145
  notail call fastcc void @_Z30nvshmemi_transfer_amo_nonfetchIlEvPvT_i14nvshmemi_amo_t(ptr %152, i64 %153, i32 %149) #17
  br label %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i43.i

_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i43.i: ; preds = %167, %156
  %168 = add nuw nsw i32 %.06880.i32.i, 1
  %exitcond.not.i44.i = icmp eq i32 %168, 8
  br i1 %exitcond.not.i44.i, label %.preheader35, label %143, !llvm.loop !78

.preheader35:                                     ; preds = %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i43.i, %143
  br label %169

169:                                              ; preds = %.preheader35, %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i39.i
  %.06981.i34.i = phi i32 [ %183, %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i39.i ], [ 1, %.preheader35 ]
  %170 = shl i32 %.06981.i34.i, %.06783.i31.i
  %.not78.i35.i = icmp slt i32 %170, %18
  br i1 %.not78.i35.i, label %171, label %184

171:                                              ; preds = %169
  %172 = sub nsw i32 %56, %170
  %173 = icmp slt i32 %172, 0
  %174 = select i1 %173, i32 %18, i32 0
  %spec.select79.i37.i = add nsw i32 %174, %172
  %175 = mul nsw i32 %spec.select79.i37.i, %25
  %176 = add nsw i32 %175, %23
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds i64, ptr %49, i64 %177
  %179 = load volatile i64, ptr %53, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %5)
  store volatile i64 %179, ptr %5, align 8
  br label %180

180:                                              ; preds = %180, %171
  %181 = load volatile i64, ptr %178, align 8
  %.0..0..0..0..0..0..0..0..0..0..i.i38.i = load volatile i64, ptr %5, align 8
  %182 = icmp slt i64 %181, %.0..0..0..0..0..0..0..0..0..0..i.i38.i
  br i1 %182, label %180, label %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i39.i, !llvm.loop !73

_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i39.i: ; preds = %180
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %5)
  %183 = add nuw nsw i32 %.06981.i34.i, 1
  %exitcond85.not.i40.i = icmp eq i32 %183, 8
  br i1 %exitcond85.not.i40.i, label %184, label %169, !llvm.loop !79

184:                                              ; preds = %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i39.i, %169
  %185 = ashr i32 %.06584.i30.i, 3
  %186 = add nuw nsw i32 %.06783.i31.i, 1
  %.not.i36.i = icmp ult i32 %.06584.i30.i, 8
  br i1 %.not.i36.i, label %_Z30nvshmemi_sync_algo_threadgroupIL13threadgroup_t0EEvi.exit, label %.preheader.i29.i, !llvm.loop !80

187:                                              ; preds = %12
  br i1 %.not79.i.i.i, label %_Z30nvshmemi_sync_algo_threadgroupIL13threadgroup_t0EEvi.exit, label %.preheader.i46.i

.preheader.i46.i:                                 ; preds = %187, %229
  %.06584.i47.i = phi i32 [ %230, %229 ], [ %57, %187 ]
  %.06783.i48.i = phi i32 [ %231, %229 ], [ 0, %187 ]
  br label %188

188:                                              ; preds = %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i60.i, %.preheader.i46.i
  %.06880.i49.i = phi i32 [ 1, %.preheader.i46.i ], [ %213, %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i60.i ]
  %189 = shl i32 %.06880.i49.i, %.06783.i48.i
  %.not76.i50.i = icmp slt i32 %189, %18
  br i1 %.not76.i50.i, label %190, label %.preheader37

190:                                              ; preds = %188
  %191 = add nsw i32 %189, %56
  %.not77.i58.i = icmp slt i32 %191, %18
  %192 = select i1 %.not77.i58.i, i32 0, i32 %18
  %spec.select.i59.i = sub nsw i32 %191, %192
  %193 = mul nsw i32 %spec.select.i59.i, %25
  %194 = add nsw i32 %193, %23
  %195 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 4), align 4
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds i64, ptr %49, i64 %196
  %198 = load volatile i64, ptr %53, align 8
  %199 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 32), align 8
  %200 = icmp slt i32 %199, 3
  br i1 %200, label %201, label %212

201:                                              ; preds = %190
  %202 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 56), align 8
  %203 = sext i32 %194 to i64
  %204 = getelementptr inbounds i64, ptr %202, i64 %203
  %205 = tail call fastcc i64 @__ppukernel_ldg_ulonglong(ptr %204) #17
  %206 = inttoptr i64 %205 to ptr
  %207 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 40), align 8
  %208 = ptrtoint ptr %197 to i64
  %209 = ptrtoint ptr %207 to i64
  %210 = sub i64 %208, %209
  %211 = getelementptr inbounds i8, ptr %206, i64 %210
  store volatile i64 %198, ptr %211, align 8
  br label %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i60.i

212:                                              ; preds = %190
  notail call fastcc void @_Z30nvshmemi_transfer_amo_nonfetchIlEvPvT_i14nvshmemi_amo_t(ptr %197, i64 %198, i32 %194) #17
  br label %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i60.i

_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i60.i: ; preds = %212, %201
  %213 = add nuw nsw i32 %.06880.i49.i, 1
  %exitcond.not.i61.i = icmp eq i32 %213, 16
  br i1 %exitcond.not.i61.i, label %.preheader37, label %188, !llvm.loop !81

.preheader37:                                     ; preds = %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i60.i, %188
  br label %214

214:                                              ; preds = %.preheader37, %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i56.i
  %.06981.i51.i = phi i32 [ %228, %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i56.i ], [ 1, %.preheader37 ]
  %215 = shl i32 %.06981.i51.i, %.06783.i48.i
  %.not78.i52.i = icmp slt i32 %215, %18
  br i1 %.not78.i52.i, label %216, label %229

216:                                              ; preds = %214
  %217 = sub nsw i32 %56, %215
  %218 = icmp slt i32 %217, 0
  %219 = select i1 %218, i32 %18, i32 0
  %spec.select79.i54.i = add nsw i32 %219, %217
  %220 = mul nsw i32 %spec.select79.i54.i, %25
  %221 = add nsw i32 %220, %23
  %222 = sext i32 %221 to i64
  %223 = getelementptr inbounds i64, ptr %49, i64 %222
  %224 = load volatile i64, ptr %53, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %4)
  store volatile i64 %224, ptr %4, align 8
  br label %225

225:                                              ; preds = %225, %216
  %226 = load volatile i64, ptr %223, align 8
  %.0..0..0..0..0..0..0..0..0..0..i.i55.i = load volatile i64, ptr %4, align 8
  %227 = icmp slt i64 %226, %.0..0..0..0..0..0..0..0..0..0..i.i55.i
  br i1 %227, label %225, label %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i56.i, !llvm.loop !73

_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i56.i: ; preds = %225
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %4)
  %228 = add nuw nsw i32 %.06981.i51.i, 1
  %exitcond85.not.i57.i = icmp eq i32 %228, 16
  br i1 %exitcond85.not.i57.i, label %229, label %214, !llvm.loop !82

229:                                              ; preds = %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i56.i, %214
  %230 = ashr i32 %.06584.i47.i, 4
  %231 = add nuw nsw i32 %.06783.i48.i, 1
  %.not.i53.i = icmp ult i32 %.06584.i47.i, 16
  br i1 %.not.i53.i, label %_Z30nvshmemi_sync_algo_threadgroupIL13threadgroup_t0EEvi.exit, label %.preheader.i46.i, !llvm.loop !83

232:                                              ; preds = %12
  br i1 %.not79.i.i.i, label %_Z30nvshmemi_sync_algo_threadgroupIL13threadgroup_t0EEvi.exit, label %.preheader.i63.i

.preheader.i63.i:                                 ; preds = %232, %274
  %.06584.i64.i = phi i32 [ %275, %274 ], [ %57, %232 ]
  %.06783.i65.i = phi i32 [ %276, %274 ], [ 0, %232 ]
  br label %233

233:                                              ; preds = %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i77.i, %.preheader.i63.i
  %.06880.i66.i = phi i32 [ 1, %.preheader.i63.i ], [ %258, %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i77.i ]
  %234 = shl i32 %.06880.i66.i, %.06783.i65.i
  %.not76.i67.i = icmp slt i32 %234, %18
  br i1 %.not76.i67.i, label %235, label %.preheader39

235:                                              ; preds = %233
  %236 = add nsw i32 %234, %56
  %.not77.i75.i = icmp slt i32 %236, %18
  %237 = select i1 %.not77.i75.i, i32 0, i32 %18
  %spec.select.i76.i = sub nsw i32 %236, %237
  %238 = mul nsw i32 %spec.select.i76.i, %25
  %239 = add nsw i32 %238, %23
  %240 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 4), align 4
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds i64, ptr %49, i64 %241
  %243 = load volatile i64, ptr %53, align 8
  %244 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 32), align 8
  %245 = icmp slt i32 %244, 3
  br i1 %245, label %246, label %257

246:                                              ; preds = %235
  %247 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 56), align 8
  %248 = sext i32 %239 to i64
  %249 = getelementptr inbounds i64, ptr %247, i64 %248
  %250 = tail call fastcc i64 @__ppukernel_ldg_ulonglong(ptr %249) #17
  %251 = inttoptr i64 %250 to ptr
  %252 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 40), align 8
  %253 = ptrtoint ptr %242 to i64
  %254 = ptrtoint ptr %252 to i64
  %255 = sub i64 %253, %254
  %256 = getelementptr inbounds i8, ptr %251, i64 %255
  store volatile i64 %243, ptr %256, align 8
  br label %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i77.i

257:                                              ; preds = %235
  notail call fastcc void @_Z30nvshmemi_transfer_amo_nonfetchIlEvPvT_i14nvshmemi_amo_t(ptr %242, i64 %243, i32 %239) #17
  br label %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i77.i

_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i77.i: ; preds = %257, %246
  %258 = add nuw nsw i32 %.06880.i66.i, 1
  %exitcond.not.i78.i = icmp eq i32 %258, 32
  br i1 %exitcond.not.i78.i, label %.preheader39, label %233, !llvm.loop !84

.preheader39:                                     ; preds = %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i77.i, %233
  br label %259

259:                                              ; preds = %.preheader39, %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i73.i
  %.06981.i68.i = phi i32 [ %273, %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i73.i ], [ 1, %.preheader39 ]
  %260 = shl i32 %.06981.i68.i, %.06783.i65.i
  %.not78.i69.i = icmp slt i32 %260, %18
  br i1 %.not78.i69.i, label %261, label %274

261:                                              ; preds = %259
  %262 = sub nsw i32 %56, %260
  %263 = icmp slt i32 %262, 0
  %264 = select i1 %263, i32 %18, i32 0
  %spec.select79.i71.i = add nsw i32 %264, %262
  %265 = mul nsw i32 %spec.select79.i71.i, %25
  %266 = add nsw i32 %265, %23
  %267 = sext i32 %266 to i64
  %268 = getelementptr inbounds i64, ptr %49, i64 %267
  %269 = load volatile i64, ptr %53, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3)
  store volatile i64 %269, ptr %3, align 8
  br label %270

270:                                              ; preds = %270, %261
  %271 = load volatile i64, ptr %268, align 8
  %.0..0..0..0..0..0..0..0..0..0..i.i72.i = load volatile i64, ptr %3, align 8
  %272 = icmp slt i64 %271, %.0..0..0..0..0..0..0..0..0..0..i.i72.i
  br i1 %272, label %270, label %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i73.i, !llvm.loop !73

_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i73.i: ; preds = %270
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3)
  %273 = add nuw nsw i32 %.06981.i68.i, 1
  %exitcond85.not.i74.i = icmp eq i32 %273, 32
  br i1 %exitcond85.not.i74.i, label %274, label %259, !llvm.loop !85

274:                                              ; preds = %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i73.i, %259
  %275 = ashr i32 %.06584.i64.i, 5
  %276 = add nuw nsw i32 %.06783.i65.i, 1
  %.not.i70.i = icmp ult i32 %.06584.i64.i, 32
  br i1 %.not.i70.i, label %_Z30nvshmemi_sync_algo_threadgroupIL13threadgroup_t0EEvi.exit, label %.preheader.i63.i, !llvm.loop !86

277:                                              ; preds = %12
  br i1 %.not79.i.i.i, label %_Z30nvshmemi_sync_algo_threadgroupIL13threadgroup_t0EEvi.exit, label %.lr.ph.i.i.i

.preheader.lr.ph.i.i.i:                           ; preds = %.lr.ph.i.i.i
  %.not74.not82.i.i.i = icmp sgt i32 %20, 1
  br i1 %.not74.not82.i.i.i, label %.preheader.us.i.i.i, label %_Z30nvshmemi_sync_algo_threadgroupIL13threadgroup_t0EEvi.exit

.preheader.us.i.i.i:                              ; preds = %.preheader.lr.ph.i.i.i, %._crit_edge90.us.i.i.i
  %.06593.us.i.i.i = phi i32 [ %281, %._crit_edge90.us.i.i.i ], [ 1, %.preheader.lr.ph.i.i.i ]
  %.06692.us.i.i.i = phi i32 [ %282, %._crit_edge90.us.i.i.i ], [ 0, %.preheader.lr.ph.i.i.i ]
  br label %278

278:                                              ; preds = %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.us.i.i.i, %.preheader.us.i.i.i
  %.06783.us.i.i.i = phi i32 [ 1, %.preheader.us.i.i.i ], [ %319, %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.us.i.i.i ]
  %279 = mul nuw nsw i32 %.06783.us.i.i.i, %.06593.us.i.i.i
  %.not75.us.i.i.i = icmp slt i32 %279, %18
  br i1 %.not75.us.i.i.i, label %296, label %.lr.ph89.us.i.i.i.preheader

.lr.ph89.us.i.i.i.preheader:                      ; preds = %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.us.i.i.i, %278
  br label %.lr.ph89.us.i.i.i

.lr.ph89.us.i.i.i:                                ; preds = %.lr.ph89.us.i.i.i.preheader, %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.us.i.i.i
  %.06887.us.i.i.i = phi i32 [ %295, %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.us.i.i.i ], [ 1, %.lr.ph89.us.i.i.i.preheader ]
  %280 = mul nuw nsw i32 %.06887.us.i.i.i, %.06593.us.i.i.i
  %.not77.us.i.i.i = icmp slt i32 %280, %18
  br i1 %.not77.us.i.i.i, label %283, label %._crit_edge90.us.i.i.i

._crit_edge90.us.i.i.i:                           ; preds = %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.us.i.i.i, %.lr.ph89.us.i.i.i
  %281 = mul nuw nsw i32 %.06593.us.i.i.i, %20
  %282 = add nuw i32 %.06692.us.i.i.i, 1
  %exitcond110.not.i.i.i = icmp eq i32 %.06692.us.i.i.i, %.081.i.i.i
  br i1 %exitcond110.not.i.i.i, label %_Z30nvshmemi_sync_algo_threadgroupIL13threadgroup_t0EEvi.exit, label %.preheader.us.i.i.i, !llvm.loop !87

283:                                              ; preds = %.lr.ph89.us.i.i.i
  %284 = sub nsw i32 %56, %280
  %285 = icmp slt i32 %284, 0
  %286 = select i1 %285, i32 %18, i32 0
  %spec.select.us.i.i.i = add nsw i32 %286, %284
  %287 = mul nsw i32 %spec.select.us.i.i.i, %25
  %288 = add nsw i32 %287, %23
  %289 = sext i32 %288 to i64
  %290 = getelementptr inbounds i64, ptr %49, i64 %289
  %291 = load volatile i64, ptr %53, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2)
  store volatile i64 %291, ptr %2, align 8
  br label %292

292:                                              ; preds = %292, %283
  %293 = load volatile i64, ptr %290, align 8
  %.0..0..0..0..0..0..0..0..0..0..0..0..i.us.i.i.i = load volatile i64, ptr %2, align 8
  %294 = icmp slt i64 %293, %.0..0..0..0..0..0..0..0..0..0..0..0..i.us.i.i.i
  br i1 %294, label %292, label %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.us.i.i.i, !llvm.loop !73

_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.us.i.i.i: ; preds = %292
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2)
  %295 = add nuw nsw i32 %.06887.us.i.i.i, 1
  %exitcond109.not.i.i.i = icmp eq i32 %295, %20
  br i1 %exitcond109.not.i.i.i, label %._crit_edge90.us.i.i.i, label %.lr.ph89.us.i.i.i, !llvm.loop !88

296:                                              ; preds = %278
  %297 = add nsw i32 %279, %56
  %298 = srem i32 %297, %18
  %299 = mul nsw i32 %298, %25
  %300 = add nsw i32 %299, %23
  %301 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 4), align 4
  %302 = sext i32 %301 to i64
  %303 = getelementptr inbounds i64, ptr %49, i64 %302
  %304 = load volatile i64, ptr %53, align 8
  %305 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 32), align 8
  %306 = icmp slt i32 %305, 3
  br i1 %306, label %308, label %307

307:                                              ; preds = %296
  notail call fastcc void @_Z30nvshmemi_transfer_amo_nonfetchIlEvPvT_i14nvshmemi_amo_t(ptr %303, i64 %304, i32 %300) #17
  br label %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.us.i.i.i

308:                                              ; preds = %296
  %309 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 56), align 8
  %310 = sext i32 %300 to i64
  %311 = getelementptr inbounds i64, ptr %309, i64 %310
  %312 = tail call fastcc i64 @__ppukernel_ldg_ulonglong(ptr %311) #17
  %313 = inttoptr i64 %312 to ptr
  %314 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 40), align 8
  %315 = ptrtoint ptr %303 to i64
  %316 = ptrtoint ptr %314 to i64
  %317 = sub i64 %315, %316
  %318 = getelementptr inbounds i8, ptr %313, i64 %317
  store volatile i64 %304, ptr %318, align 8
  br label %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.us.i.i.i

_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.us.i.i.i: ; preds = %308, %307
  %319 = add nuw nsw i32 %.06783.us.i.i.i, 1
  %exitcond.not.i.i.i = icmp eq i32 %319, %20
  br i1 %exitcond.not.i.i.i, label %.lr.ph89.us.i.i.i.preheader, label %278, !llvm.loop !89

.lr.ph.i.i.i:                                     ; preds = %277, %.lr.ph.i.i.i
  %.081.i.i.i = phi i32 [ %320, %.lr.ph.i.i.i ], [ 0, %277 ]
  %.06480.i.i.i = phi i32 [ %321, %.lr.ph.i.i.i ], [ %57, %277 ]
  %320 = add nuw nsw i32 %.081.i.i.i, 1
  %321 = sdiv i32 %.06480.i.i.i, %20
  %.not.i.i.i = icmp eq i32 %321, 0
  br i1 %.not.i.i.i, label %.preheader.lr.ph.i.i.i, label %.lr.ph.i.i.i, !llvm.loop !90

_Z30nvshmemi_sync_algo_threadgroupIL13threadgroup_t0EEvi.exit: ; preds = %274, %229, %184, %139, %.critedge.i.i, %._crit_edge90.us.i.i.i, %58, %97, %142, %187, %232, %277, %.preheader.lr.ph.i.i.i
  %322 = load volatile i64, ptr %53, align 8
  %323 = add nsw i64 %322, 1
  store volatile i64 %323, ptr %53, align 8
  %324 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 32), align 8
  %325 = icmp sgt i32 %324, 8
  br i1 %325, label %326, label %327

326:                                              ; preds = %_Z30nvshmemi_sync_algo_threadgroupIL13threadgroup_t0EEvi.exit
  notail call fastcc void @_Z47nvshmemi_transfer_enforce_consistency_at_targetb() #17
  br label %327

327:                                              ; preds = %326, %_Z30nvshmemi_sync_algo_threadgroupIL13threadgroup_t0EEvi.exit
  ret void
}

; Function Attrs: convergent inlinehint mustprogress nounwind null_pointer_is_valid
define internal fastcc void @_Z27nvshmemi_memcpy_threadgroupIL13threadgroup_t2EEvPvPKvm(ptr noalias %0, ptr noalias %1, i64 %2) unnamed_addr #26 comdat {
  %4 = tail call i32 @llvm.ppu.read.tix.sreg.tid.x()
  %5 = tail call i32 @llvm.ppu.read.tix.sreg.tid.y()
  %6 = tail call i32 @llvm.ppu.read.tix.sreg.tid.z()
  %7 = tail call i32 @llvm.ppu.read.tix.sreg.ntid.x()
  %8 = tail call i32 @llvm.ppu.read.tix.sreg.ntid.y()
  %9 = mul i32 %8, %6
  %reass.add = add i32 %9, %5
  %reass.mul = mul i32 %reass.add, %7
  %10 = add i32 %reass.mul, %4
  %11 = tail call i32 @llvm.ppu.read.tix.sreg.ntid.z()
  %12 = mul i32 %8, %7
  %13 = mul i32 %12, %11
  %14 = ptrtoint ptr %0 to i64
  %15 = and i64 %14, 15
  %16 = icmp eq i64 %15, 0
  %17 = ptrtoint ptr %1 to i64
  %18 = and i64 %17, 15
  %19 = icmp eq i64 %18, 0
  %or.cond = select i1 %16, i1 %19, i1 false
  br i1 %or.cond, label %20, label %43

20:                                               ; preds = %3
  %21 = shl nsw i32 %10, 2
  %22 = sext i32 %21 to i64
  %23 = lshr i64 %2, 2
  %24 = and i64 %23, 4611686018427387900
  %25 = icmp ugt i64 %24, %22
  br i1 %25, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %20
  %26 = shl nsw i32 %13, 2
  %27 = sext i32 %26 to i64
  br label %31

._crit_edge:                                      ; preds = %31, %20
  %28 = and i64 %2, 15
  %.not = icmp eq i64 %28, 0
  br i1 %.not, label %common.ret, label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge
  %29 = getelementptr inbounds nuw i32, ptr %1, i64 %24
  %30 = getelementptr inbounds nuw i32, ptr %0, i64 %24
  %.pre = ptrtoint ptr %30 to i64
  %.pre172 = ptrtoint ptr %29 to i64
  br label %43

31:                                               ; preds = %.lr.ph, %31
  %.0128155 = phi i64 [ %22, %.lr.ph ], [ %41, %31 ]
  %32 = getelementptr inbounds nuw i32, ptr %0, i64 %.0128155
  %33 = getelementptr inbounds nuw i32, ptr %1, i64 %.0128155
  %34 = load i32, ptr %33, align 4
  %35 = getelementptr inbounds nuw i8, ptr %33, i64 4
  %36 = load i32, ptr %35, align 4
  %37 = getelementptr inbounds nuw i8, ptr %33, i64 8
  %38 = load i32, ptr %37, align 4
  %39 = getelementptr inbounds nuw i8, ptr %33, i64 12
  %40 = load i32, ptr %39, align 4
  tail call void asm sideeffect "st.volatile.global.v4.u32 [$0], {$1,$2,$3,$4};", "l,r,r,r,r"(ptr %32, i32 %34, i32 %36, i32 %38, i32 %40) #22, !srcloc !91
  %41 = add nsw i64 %.0128155, %27
  %42 = icmp ult i64 %41, %24
  br i1 %42, label %31, label %._crit_edge, !llvm.loop !92

43:                                               ; preds = %._crit_edge._crit_edge, %3
  %.pre-phi173 = phi i64 [ %.pre172, %._crit_edge._crit_edge ], [ %17, %3 ]
  %.pre-phi = phi i64 [ %.pre, %._crit_edge._crit_edge ], [ %14, %3 ]
  %.0124 = phi i64 [ %28, %._crit_edge._crit_edge ], [ %2, %3 ]
  %.1117 = phi ptr [ %29, %._crit_edge._crit_edge ], [ %1, %3 ]
  %.1 = phi ptr [ %30, %._crit_edge._crit_edge ], [ %0, %3 ]
  %44 = and i64 %.pre-phi, 7
  %45 = icmp eq i64 %44, 0
  %46 = and i64 %.pre-phi173, 7
  %47 = icmp eq i64 %46, 0
  %or.cond148 = select i1 %45, i1 %47, i1 false
  br i1 %or.cond148, label %48, label %62

48:                                               ; preds = %43
  %49 = lshr i64 %.0124, 3
  %50 = sext i32 %10 to i64
  %51 = icmp ugt i64 %49, %50
  br i1 %51, label %.lr.ph158, label %._crit_edge159

.lr.ph158:                                        ; preds = %48
  %52 = sext i32 %13 to i64
  br label %56

._crit_edge159:                                   ; preds = %56, %48
  %53 = and i64 %.0124, 7
  %.not141 = icmp eq i64 %53, 0
  br i1 %.not141, label %common.ret, label %._crit_edge159._crit_edge

._crit_edge159._crit_edge:                        ; preds = %._crit_edge159
  %54 = getelementptr inbounds nuw i64, ptr %.1117, i64 %49
  %55 = getelementptr inbounds nuw i64, ptr %.1, i64 %49
  %.pre174 = ptrtoint ptr %55 to i64
  %.pre176 = ptrtoint ptr %54 to i64
  br label %62

56:                                               ; preds = %.lr.ph158, %56
  %.0133156 = phi i64 [ %50, %.lr.ph158 ], [ %60, %56 ]
  %57 = getelementptr inbounds nuw i64, ptr %.1117, i64 %.0133156
  %58 = load i64, ptr %57, align 8
  %59 = getelementptr inbounds nuw i64, ptr %.1, i64 %.0133156
  store i64 %58, ptr %59, align 8
  %60 = add nsw i64 %.0133156, %52
  %61 = icmp ult i64 %60, %49
  br i1 %61, label %56, label %._crit_edge159, !llvm.loop !93

62:                                               ; preds = %._crit_edge159._crit_edge, %43
  %.pre-phi177 = phi i64 [ %.pre176, %._crit_edge159._crit_edge ], [ %.pre-phi173, %43 ]
  %.pre-phi175 = phi i64 [ %.pre174, %._crit_edge159._crit_edge ], [ %.pre-phi, %43 ]
  %.1125 = phi i64 [ %53, %._crit_edge159._crit_edge ], [ %.0124, %43 ]
  %.3119 = phi ptr [ %54, %._crit_edge159._crit_edge ], [ %.1117, %43 ]
  %.3 = phi ptr [ %55, %._crit_edge159._crit_edge ], [ %.1, %43 ]
  %63 = and i64 %.pre-phi175, 3
  %64 = icmp eq i64 %63, 0
  %65 = and i64 %.pre-phi177, 3
  %66 = icmp eq i64 %65, 0
  %or.cond151 = select i1 %64, i1 %66, i1 false
  br i1 %or.cond151, label %67, label %81

67:                                               ; preds = %62
  %68 = lshr i64 %.1125, 2
  %69 = sext i32 %10 to i64
  %70 = icmp ugt i64 %68, %69
  br i1 %70, label %.lr.ph162, label %._crit_edge163

.lr.ph162:                                        ; preds = %67
  %71 = sext i32 %13 to i64
  br label %75

._crit_edge163:                                   ; preds = %75, %67
  %72 = and i64 %.1125, 3
  %.not142 = icmp eq i64 %72, 0
  br i1 %.not142, label %common.ret, label %._crit_edge163._crit_edge

._crit_edge163._crit_edge:                        ; preds = %._crit_edge163
  %73 = getelementptr inbounds nuw i32, ptr %.3119, i64 %68
  %74 = getelementptr inbounds nuw i32, ptr %.3, i64 %68
  %.pre178 = ptrtoint ptr %74 to i64
  %.pre180 = ptrtoint ptr %73 to i64
  br label %81

75:                                               ; preds = %.lr.ph162, %75
  %.0134160 = phi i64 [ %69, %.lr.ph162 ], [ %79, %75 ]
  %76 = getelementptr inbounds nuw i32, ptr %.3119, i64 %.0134160
  %77 = load i32, ptr %76, align 4
  %78 = getelementptr inbounds nuw i32, ptr %.3, i64 %.0134160
  store i32 %77, ptr %78, align 4
  %79 = add nsw i64 %.0134160, %71
  %80 = icmp ult i64 %79, %68
  br i1 %80, label %75, label %._crit_edge163, !llvm.loop !94

81:                                               ; preds = %._crit_edge163._crit_edge, %62
  %.pre-phi181 = phi i64 [ %.pre180, %._crit_edge163._crit_edge ], [ %.pre-phi177, %62 ]
  %.pre-phi179 = phi i64 [ %.pre178, %._crit_edge163._crit_edge ], [ %.pre-phi175, %62 ]
  %.2126 = phi i64 [ %72, %._crit_edge163._crit_edge ], [ %.1125, %62 ]
  %.5121 = phi ptr [ %73, %._crit_edge163._crit_edge ], [ %.3119, %62 ]
  %.5 = phi ptr [ %74, %._crit_edge163._crit_edge ], [ %.3, %62 ]
  %82 = and i64 %.pre-phi179, 1
  %83 = icmp eq i64 %82, 0
  %84 = and i64 %.pre-phi181, 1
  %85 = icmp eq i64 %84, 0
  %or.cond154 = select i1 %83, i1 %85, i1 false
  br i1 %or.cond154, label %86, label %._crit_edge171

._crit_edge171:                                   ; preds = %81
  %.pre182 = sext i32 %10 to i64
  br label %100

86:                                               ; preds = %81
  %87 = lshr i64 %.2126, 1
  %88 = sext i32 %10 to i64
  %89 = icmp ugt i64 %87, %88
  br i1 %89, label %.lr.ph166, label %._crit_edge167

.lr.ph166:                                        ; preds = %86
  %90 = sext i32 %13 to i64
  br label %94

._crit_edge167:                                   ; preds = %94, %86
  %91 = and i64 %.2126, 1
  %.not143 = icmp eq i64 %91, 0
  %92 = getelementptr inbounds nuw i16, ptr %.5, i64 %87
  %93 = getelementptr inbounds nuw i16, ptr %.5121, i64 %87
  br i1 %.not143, label %common.ret, label %100

94:                                               ; preds = %.lr.ph166, %94
  %.0135164 = phi i64 [ %88, %.lr.ph166 ], [ %98, %94 ]
  %95 = getelementptr inbounds nuw i16, ptr %.5121, i64 %.0135164
  %96 = load i16, ptr %95, align 2
  %97 = getelementptr inbounds nuw i16, ptr %.5, i64 %.0135164
  store i16 %96, ptr %97, align 2
  %98 = add i64 %.0135164, %90
  %99 = icmp ult i64 %98, %87
  br i1 %99, label %94, label %._crit_edge167, !llvm.loop !95

100:                                              ; preds = %._crit_edge171, %._crit_edge167
  %.pre-phi183 = phi i64 [ %.pre182, %._crit_edge171 ], [ %88, %._crit_edge167 ]
  %.3127 = phi i64 [ %.2126, %._crit_edge171 ], [ 1, %._crit_edge167 ]
  %.7123 = phi ptr [ %.5121, %._crit_edge171 ], [ %93, %._crit_edge167 ]
  %.7 = phi ptr [ %.5, %._crit_edge171 ], [ %92, %._crit_edge167 ]
  %101 = icmp ugt i64 %.3127, %.pre-phi183
  br i1 %101, label %.lr.ph170, label %common.ret

.lr.ph170:                                        ; preds = %100
  %102 = sext i32 %13 to i64
  br label %103

103:                                              ; preds = %.lr.ph170, %103
  %.0136168 = phi i64 [ %.pre-phi183, %.lr.ph170 ], [ %107, %103 ]
  %104 = getelementptr inbounds i8, ptr %.7123, i64 %.0136168
  %105 = load i8, ptr %104, align 1
  %106 = getelementptr inbounds i8, ptr %.7, i64 %.0136168
  store i8 %105, ptr %106, align 1
  %107 = add i64 %.0136168, %102
  %108 = icmp ult i64 %107, %.3127
  br i1 %108, label %103, label %common.ret, !llvm.loop !96

common.ret:                                       ; preds = %103, %100, %._crit_edge, %._crit_edge159, %._crit_edge163, %._crit_edge167
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nounwind null_pointer_is_valid
define internal fastcc void @_Z23nvshmemi_transfer_quietIL13threadgroup_t0EEvb() unnamed_addr #31 section ".text.compute" {
  %1 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 24), align 8
  %.not = icmp eq i32 %1, 2
  br i1 %.not, label %2, label %14

2:                                                ; preds = %0
  %3 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 680), align 8
  %4 = load volatile i64, ptr %3, align 8
  %5 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 704), align 8
  %6 = load i64, ptr %5, align 8
  br label %7

7:                                                ; preds = %7, %2
  %.0.i.i = phi i64 [ %6, %2 ], [ %9, %7 ]
  %8 = tail call i64 @llvm.umax.i64(i64 %.0.i.i, i64 %4)
  %9 = tail call fastcc i64 @__ppukernel_atomicCAS_u64(ptr %5, i64 %.0.i.i, i64 %8) #17
  %.not.i.i = icmp eq i64 %9, %8
  br i1 %.not.i.i, label %_ZL17atomicMaxUsingCASIyET_PS0_S0_.exit.i, label %7, !llvm.loop !97

_ZL17atomicMaxUsingCASIyET_PS0_S0_.exit.i:        ; preds = %7
  %10 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 712), align 8
  br label %11

11:                                               ; preds = %11, %_ZL17atomicMaxUsingCASIyET_PS0_S0_.exit.i
  %12 = load volatile i64, ptr %10, align 8
  %13 = icmp ult i64 %12, %4
  br i1 %13, label %11, label %_Z20nvshmemi_proxy_quietb.exit, !llvm.loop !98

_Z20nvshmemi_proxy_quietb.exit:                   ; preds = %11
  tail call fastcc void @__ppukernel_threadfence_system_void() #17
  br label %14

14:                                               ; preds = %_Z20nvshmemi_proxy_quietb.exit, %0
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind null_pointer_is_valid willreturn
define internal fastcc void @__ppukernel_threadfence_system_void() unnamed_addr #32 {
  tail call fastcc void @__llvm_fence_system() #17
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind null_pointer_is_valid willreturn
define internal fastcc void @__llvm_fence_system() unnamed_addr #33 {
  fence syncscope("system") seq_cst
  ret void
}

; Function Attrs: inlinehint mustprogress nofree norecurse nounwind null_pointer_is_valid
define internal fastcc void @_Z35nvshmemi_proxy_amo_nonfetch_with_epImEvPvT_i14nvshmemi_amo_ti(ptr %0, i64 range(i64 0, 4294967296) %1, i32 %2) unnamed_addr #30 comdat {
  %4 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 632), align 8
  %5 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 40), align 8
  %6 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 680), align 8
  %7 = tail call fastcc i64 @__ppukernel_atomicAdd_u64(ptr %6, i64 48) #17
  %8 = add i64 %7, 47
  %9 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 696), align 8
  %10 = load volatile i64, ptr %9, align 8
  %11 = load i64, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 736), align 8
  %12 = add i64 %11, -1
  %13 = add i64 %12, %10
  %14 = icmp ult i64 %13, %8
  br i1 %14, label %15, label %_Z3amoImEvPvmT_S1_i14nvshmemi_amo_ti.exit

15:                                               ; preds = %3
  %16 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 688), align 8
  br label %17

17:                                               ; preds = %17, %15
  %18 = load volatile i64, ptr %16, align 8
  %19 = add i64 %18, %12
  %20 = icmp ult i64 %19, %8
  br i1 %20, label %17, label %_Z43nvshmemi_wait_until_greater_than_equals_addImEvPVT_mS0_i.exit.i, !llvm.loop !99

_Z43nvshmemi_wait_until_greater_than_equals_addImEvPVT_mS0_i.exit.i: ; preds = %17, %_Z43nvshmemi_wait_until_greater_than_equals_addImEvPVT_mS0_i.exit.i
  %.0.i.i = phi i64 [ %22, %_Z43nvshmemi_wait_until_greater_than_equals_addImEvPVT_mS0_i.exit.i ], [ %10, %17 ]
  %21 = tail call i64 @llvm.umax.i64(i64 %.0.i.i, i64 %18)
  %22 = tail call fastcc i64 @__ppukernel_atomicCAS_u64(ptr %9, i64 %.0.i.i, i64 %21) #17
  %.not.i.i = icmp eq i64 %22, %21
  br i1 %.not.i.i, label %_ZL17atomicMaxUsingCASIyET_PS0_S0_.exit.i, label %_Z43nvshmemi_wait_until_greater_than_equals_addImEvPVT_mS0_i.exit.i, !llvm.loop !97

_ZL17atomicMaxUsingCASIyET_PS0_S0_.exit.i:        ; preds = %_Z43nvshmemi_wait_until_greater_than_equals_addImEvPVT_mS0_i.exit.i
  tail call fastcc void @__ppukernel_threadfence_system_void() #17
  br label %_Z3amoImEvPvmT_S1_i14nvshmemi_amo_ti.exit

_Z3amoImEvPvmT_S1_i14nvshmemi_amo_ti.exit:        ; preds = %3, %_ZL17atomicMaxUsingCASIyET_PS0_S0_.exit.i
  %23 = and i64 %7, 4194303
  %24 = getelementptr inbounds nuw i8, ptr %4, i64 %23
  %25 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 744), align 8
  %26 = zext nneg i32 %25 to i64
  %27 = xor i64 %7, -1
  %28 = lshr i64 %27, %26
  %29 = and i64 %28, 1
  %30 = ptrtoint ptr %0 to i64
  %31 = ptrtoint ptr %5 to i64
  %32 = sub i64 %30, %31
  %33 = shl i64 %32, 24
  %34 = or disjoint i64 %29, %33
  %35 = or disjoint i64 %34, 459008
  store volatile i64 %35, ptr %24, align 8
  %36 = add i64 %7, 8
  %37 = and i64 %36, 4194303
  %38 = getelementptr inbounds nuw i8, ptr %4, i64 %37
  %39 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 744), align 8
  %40 = zext nneg i32 %39 to i64
  %41 = sub i64 -9, %7
  %42 = lshr i64 %41, %40
  %43 = and i64 %42, 1
  %44 = shl nuw i64 %1, 32
  %45 = shl i32 %2, 16
  %46 = zext i32 %45 to i64
  %47 = or disjoint i64 %44, %46
  %48 = or disjoint i64 %43, %47
  %49 = or disjoint i64 %48, 2304
  store volatile i64 %49, ptr %38, align 8
  %50 = add i64 %7, 16
  %51 = and i64 %50, 4194303
  %52 = getelementptr inbounds nuw i8, ptr %4, i64 %51
  %53 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 744), align 8
  %54 = zext nneg i32 %53 to i64
  %55 = sub i64 -17, %7
  %56 = lshr i64 %55, %54
  %57 = and i64 %56, 1
  %58 = or disjoint i64 %57, 524288
  store volatile i64 %58, ptr %52, align 8
  %59 = add i64 %7, 24
  %60 = and i64 %59, 4194303
  %61 = getelementptr inbounds nuw i8, ptr %4, i64 %60
  %62 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 744), align 8
  %63 = zext nneg i32 %62 to i64
  %64 = sub i64 -25, %7
  %65 = lshr i64 %64, %63
  %66 = and i64 %65, 1
  store volatile i64 %66, ptr %61, align 8
  %67 = add i64 %7, 32
  %68 = and i64 %67, 4194303
  %69 = getelementptr inbounds nuw i8, ptr %4, i64 %68
  %70 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 744), align 8
  %71 = zext nneg i32 %70 to i64
  %72 = sub i64 -33, %7
  %73 = lshr i64 %72, %71
  %74 = and i64 %73, 1
  store volatile i64 %74, ptr %69, align 8
  %75 = add i64 %7, 40
  %76 = and i64 %75, 4194303
  %77 = getelementptr inbounds nuw i8, ptr %4, i64 %76
  %78 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 744), align 8
  %79 = zext nneg i32 %78 to i64
  %80 = sub i64 -41, %7
  %81 = lshr i64 %80, %79
  %82 = and i64 %81, 1
  %83 = or disjoint i64 %82, -4294967296
  store volatile i64 %83, ptr %77, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind null_pointer_is_valid willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define internal fastcc i64 @__ppukernel_atomicAdd_u64(ptr %0, i64 range(i64 0, 4294967296) %1) unnamed_addr #34 {
  %3 = tail call fastcc i64 @__ppukernelstub_atomic_add_u64(ptr %0, i64 %1) #17
  ret i64 %3
}

; Function Attrs: mustprogress nofree norecurse nounwind null_pointer_is_valid willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define internal fastcc i64 @__ppukernelstub_atomic_add_u64(ptr %0, i64 range(i64 0, 4294967296) %1) unnamed_addr #35 {
  %3 = atomicrmw volatile add ptr %0, i64 %1 monotonic, align 8
  ret i64 %3
}

; Function Attrs: mustprogress nofree norecurse nounwind null_pointer_is_valid willreturn
define internal fastcc void @__ppukernel_threadfence_void() unnamed_addr #32 {
  tail call fastcc void @__llvm_fence_device() #17
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind null_pointer_is_valid willreturn
define internal fastcc void @__llvm_fence_device() unnamed_addr #33 {
  fence syncscope("device") seq_cst
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nounwind null_pointer_is_valid
define internal fastcc void @_Z38nvshmemi_transfer_amo_nonfetch_with_epImEvPvT_i14nvshmemi_amo_ti(ptr %0, i64 range(i64 0, 4294967296) %1, i32 %2) unnamed_addr #31 section ".text.compute" {
  tail call fastcc void @_Z35nvshmemi_proxy_amo_nonfetch_with_epImEvPvT_i14nvshmemi_amo_ti(ptr %0, i64 %1, i32 %2) #17
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind null_pointer_is_valid willreturn memory(argmem: read)
define internal fastcc i64 @__ppukernel_ldg_ulonglong(ptr readonly captures(none) %0) unnamed_addr #36 {
  %2 = tail call i64 @llvm.ppu.ldg.generic.i64.p0i64(ptr readonly %0) #17
  ret i64 %2
}

; Function Attrs: nofree nounwind memory(argmem: read)
declare dso_local i64 @llvm.ppu.ldg.generic.i64.p0i64(ptr captures(none)) #37

; Function Attrs: convergent inlinehint mustprogress nounwind null_pointer_is_valid
define internal fastcc void @_Z27nvshmemi_memcpy_threadgroupIL13threadgroup_t0EEvPvPKvm(ptr noalias %0, ptr noalias %1, i64 %2) unnamed_addr #26 comdat {
  %4 = ptrtoint ptr %0 to i64
  %5 = and i64 %4, 15
  %6 = icmp eq i64 %5, 0
  %7 = ptrtoint ptr %1 to i64
  %8 = and i64 %7, 15
  %9 = icmp eq i64 %8, 0
  %or.cond = select i1 %6, i1 %9, i1 false
  br i1 %or.cond, label %.preheader, label %26

.preheader:                                       ; preds = %3
  %10 = lshr i64 %2, 2
  %11 = and i64 %10, 4611686018427387900
  %.not171 = icmp eq i64 %11, 0
  br i1 %.not171, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph, %.preheader
  %12 = and i64 %2, 15
  %.not = icmp eq i64 %12, 0
  br i1 %.not, label %common.ret, label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge
  %13 = getelementptr inbounds nuw i32, ptr %1, i64 %11
  %14 = getelementptr inbounds nuw i32, ptr %0, i64 %11
  %.pre = ptrtoint ptr %14 to i64
  %.pre179 = ptrtoint ptr %13 to i64
  br label %26

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %.0128155 = phi i64 [ %24, %.lr.ph ], [ 0, %.preheader ]
  %15 = getelementptr inbounds nuw i32, ptr %0, i64 %.0128155
  %16 = getelementptr inbounds nuw i32, ptr %1, i64 %.0128155
  %17 = load i32, ptr %16, align 4
  %18 = getelementptr inbounds nuw i8, ptr %16, i64 4
  %19 = load i32, ptr %18, align 4
  %20 = getelementptr inbounds nuw i8, ptr %16, i64 8
  %21 = load i32, ptr %20, align 4
  %22 = getelementptr inbounds nuw i8, ptr %16, i64 12
  %23 = load i32, ptr %22, align 4
  tail call void asm sideeffect "st.volatile.global.v4.u32 [$0], {$1,$2,$3,$4};", "l,r,r,r,r"(ptr %15, i32 %17, i32 %19, i32 %21, i32 %23) #22, !srcloc !91
  %24 = add nuw nsw i64 %.0128155, 4
  %25 = icmp samesign ult i64 %24, %11
  br i1 %25, label %.lr.ph, label %._crit_edge, !llvm.loop !100

26:                                               ; preds = %._crit_edge._crit_edge, %3
  %.pre-phi180 = phi i64 [ %.pre179, %._crit_edge._crit_edge ], [ %7, %3 ]
  %.pre-phi = phi i64 [ %.pre, %._crit_edge._crit_edge ], [ %4, %3 ]
  %.0124 = phi i64 [ %12, %._crit_edge._crit_edge ], [ %2, %3 ]
  %.1117 = phi ptr [ %13, %._crit_edge._crit_edge ], [ %1, %3 ]
  %.1 = phi ptr [ %14, %._crit_edge._crit_edge ], [ %0, %3 ]
  %27 = and i64 %.pre-phi, 7
  %28 = icmp eq i64 %27, 0
  %29 = and i64 %.pre-phi180, 7
  %30 = icmp eq i64 %29, 0
  %or.cond148 = select i1 %28, i1 %30, i1 false
  br i1 %or.cond148, label %31, label %40

31:                                               ; preds = %26
  %32 = lshr i64 %.0124, 3
  %.not172 = icmp ult i64 %.0124, 8
  br i1 %.not172, label %._crit_edge159, label %.lr.ph158

._crit_edge159:                                   ; preds = %.lr.ph158, %31
  %33 = and i64 %.0124, 7
  %.not141 = icmp eq i64 %33, 0
  br i1 %.not141, label %common.ret, label %._crit_edge159._crit_edge

._crit_edge159._crit_edge:                        ; preds = %._crit_edge159
  %34 = getelementptr inbounds nuw i64, ptr %.1117, i64 %32
  %35 = getelementptr inbounds nuw i64, ptr %.1, i64 %32
  %.pre181 = ptrtoint ptr %35 to i64
  %.pre183 = ptrtoint ptr %34 to i64
  br label %40

.lr.ph158:                                        ; preds = %31, %.lr.ph158
  %.0133156 = phi i64 [ %39, %.lr.ph158 ], [ 0, %31 ]
  %36 = getelementptr inbounds nuw i64, ptr %.1117, i64 %.0133156
  %37 = load i64, ptr %36, align 8
  %38 = getelementptr inbounds nuw i64, ptr %.1, i64 %.0133156
  store i64 %37, ptr %38, align 8
  %39 = add nuw nsw i64 %.0133156, 1
  %exitcond.not = icmp eq i64 %39, %32
  br i1 %exitcond.not, label %._crit_edge159, label %.lr.ph158, !llvm.loop !101

40:                                               ; preds = %._crit_edge159._crit_edge, %26
  %.pre-phi184 = phi i64 [ %.pre183, %._crit_edge159._crit_edge ], [ %.pre-phi180, %26 ]
  %.pre-phi182 = phi i64 [ %.pre181, %._crit_edge159._crit_edge ], [ %.pre-phi, %26 ]
  %.1125 = phi i64 [ %33, %._crit_edge159._crit_edge ], [ %.0124, %26 ]
  %.3119 = phi ptr [ %34, %._crit_edge159._crit_edge ], [ %.1117, %26 ]
  %.3 = phi ptr [ %35, %._crit_edge159._crit_edge ], [ %.1, %26 ]
  %41 = and i64 %.pre-phi182, 3
  %42 = icmp eq i64 %41, 0
  %43 = and i64 %.pre-phi184, 3
  %44 = icmp eq i64 %43, 0
  %or.cond151 = select i1 %42, i1 %44, i1 false
  br i1 %or.cond151, label %45, label %54

45:                                               ; preds = %40
  %46 = lshr i64 %.1125, 2
  %.not173 = icmp ult i64 %.1125, 4
  br i1 %.not173, label %._crit_edge163, label %.lr.ph162

._crit_edge163:                                   ; preds = %.lr.ph162, %45
  %47 = and i64 %.1125, 3
  %.not142 = icmp eq i64 %47, 0
  br i1 %.not142, label %common.ret, label %._crit_edge163._crit_edge

._crit_edge163._crit_edge:                        ; preds = %._crit_edge163
  %48 = getelementptr inbounds nuw i32, ptr %.3119, i64 %46
  %49 = getelementptr inbounds nuw i32, ptr %.3, i64 %46
  %.pre185 = ptrtoint ptr %49 to i64
  %.pre187 = ptrtoint ptr %48 to i64
  br label %54

.lr.ph162:                                        ; preds = %45, %.lr.ph162
  %.0134160 = phi i64 [ %53, %.lr.ph162 ], [ 0, %45 ]
  %50 = getelementptr inbounds nuw i32, ptr %.3119, i64 %.0134160
  %51 = load i32, ptr %50, align 4
  %52 = getelementptr inbounds nuw i32, ptr %.3, i64 %.0134160
  store i32 %51, ptr %52, align 4
  %53 = add nuw nsw i64 %.0134160, 1
  %exitcond176.not = icmp eq i64 %53, %46
  br i1 %exitcond176.not, label %._crit_edge163, label %.lr.ph162, !llvm.loop !102

54:                                               ; preds = %._crit_edge163._crit_edge, %40
  %.pre-phi188 = phi i64 [ %.pre187, %._crit_edge163._crit_edge ], [ %.pre-phi184, %40 ]
  %.pre-phi186 = phi i64 [ %.pre185, %._crit_edge163._crit_edge ], [ %.pre-phi182, %40 ]
  %.2126 = phi i64 [ %47, %._crit_edge163._crit_edge ], [ %.1125, %40 ]
  %.5121 = phi ptr [ %48, %._crit_edge163._crit_edge ], [ %.3119, %40 ]
  %.5 = phi ptr [ %49, %._crit_edge163._crit_edge ], [ %.3, %40 ]
  %.5196 = ptrtoint ptr %.5 to i64
  %.5121197 = ptrtoint ptr %.5121 to i64
  %55 = and i64 %.pre-phi186, 1
  %56 = icmp eq i64 %55, 0
  %57 = and i64 %.pre-phi188, 1
  %58 = icmp eq i64 %57, 0
  %or.cond154 = select i1 %56, i1 %58, i1 false
  br i1 %or.cond154, label %59, label %72

59:                                               ; preds = %54
  %60 = lshr i64 %.2126, 1
  %.not174 = icmp ult i64 %.2126, 2
  br i1 %.not174, label %._crit_edge167, label %.lr.ph166.preheader

.lr.ph166.preheader:                              ; preds = %59
  %min.iters.check = icmp ult i64 %.2126, 8
  %61 = sub i64 %.5196, %.5121197
  %diff.check = icmp ult i64 %61, 4
  %or.cond214 = select i1 %min.iters.check, i1 true, i1 %diff.check
  br i1 %or.cond214, label %.lr.ph166.preheader217, label %vector.ph

vector.ph:                                        ; preds = %.lr.ph166.preheader
  %n.vec = and i64 %60, 9223372036854775806
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %62 = getelementptr inbounds nuw i16, ptr %.5121, i64 %index
  %wide.load = load <2 x i16>, ptr %62, align 2
  %63 = getelementptr inbounds nuw i16, ptr %.5, i64 %index
  store <2 x i16> %wide.load, ptr %63, align 2
  %index.next = add nuw i64 %index, 2
  %64 = icmp eq i64 %index.next, %n.vec
  br i1 %64, label %middle.block, label %vector.body, !llvm.loop !103

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %60, %n.vec
  br i1 %cmp.n, label %._crit_edge167, label %.lr.ph166.preheader217

.lr.ph166.preheader217:                           ; preds = %.lr.ph166.preheader, %middle.block
  %.0135164.ph = phi i64 [ 0, %.lr.ph166.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph166

._crit_edge167:                                   ; preds = %.lr.ph166, %middle.block, %59
  %65 = and i64 %.2126, 1
  %.not143 = icmp eq i64 %65, 0
  %66 = getelementptr inbounds nuw i16, ptr %.5, i64 %60
  %67 = getelementptr inbounds nuw i16, ptr %.5121, i64 %60
  br i1 %.not143, label %common.ret, label %.lr.ph170.preheader

.lr.ph166:                                        ; preds = %.lr.ph166.preheader217, %.lr.ph166
  %.0135164 = phi i64 [ %71, %.lr.ph166 ], [ %.0135164.ph, %.lr.ph166.preheader217 ]
  %68 = getelementptr inbounds nuw i16, ptr %.5121, i64 %.0135164
  %69 = load i16, ptr %68, align 2
  %70 = getelementptr inbounds nuw i16, ptr %.5, i64 %.0135164
  store i16 %69, ptr %70, align 2
  %71 = add nuw nsw i64 %.0135164, 1
  %exitcond177.not = icmp eq i64 %71, %60
  br i1 %exitcond177.not, label %._crit_edge167, label %.lr.ph166, !llvm.loop !106

72:                                               ; preds = %54
  %.not175 = icmp eq i64 %.2126, 0
  br i1 %.not175, label %common.ret, label %.lr.ph170.preheader

.lr.ph170.preheader:                              ; preds = %._crit_edge167, %72
  %.7195 = phi ptr [ %.5, %72 ], [ %66, %._crit_edge167 ]
  %.7123194 = phi ptr [ %.5121, %72 ], [ %67, %._crit_edge167 ]
  %.3127193 = phi i64 [ %.2126, %72 ], [ 1, %._crit_edge167 ]
  %min.iters.check203 = icmp ult i64 %.3127193, 4
  %.7123194200 = ptrtoint ptr %.7123194 to i64
  %.7195199 = ptrtoint ptr %.7195 to i64
  %73 = sub i64 %.7195199, %.7123194200
  %diff.check201 = icmp ult i64 %73, 4
  %or.cond215 = select i1 %min.iters.check203, i1 true, i1 %diff.check201
  br i1 %or.cond215, label %.lr.ph170.preheader216, label %vector.ph204

vector.ph204:                                     ; preds = %.lr.ph170.preheader
  %n.vec206 = and i64 %.3127193, -4
  br label %vector.body207

vector.body207:                                   ; preds = %vector.body207, %vector.ph204
  %index208 = phi i64 [ 0, %vector.ph204 ], [ %index.next210, %vector.body207 ]
  %74 = getelementptr inbounds i8, ptr %.7123194, i64 %index208
  %wide.load209 = load <4 x i8>, ptr %74, align 1
  %75 = getelementptr inbounds i8, ptr %.7195, i64 %index208
  store <4 x i8> %wide.load209, ptr %75, align 1
  %index.next210 = add nuw i64 %index208, 4
  %76 = icmp eq i64 %index.next210, %n.vec206
  br i1 %76, label %middle.block211, label %vector.body207, !llvm.loop !107

middle.block211:                                  ; preds = %vector.body207
  %cmp.n212 = icmp eq i64 %.3127193, %n.vec206
  br i1 %cmp.n212, label %common.ret, label %.lr.ph170.preheader216

.lr.ph170.preheader216:                           ; preds = %.lr.ph170.preheader, %middle.block211
  %.0136168.ph = phi i64 [ 0, %.lr.ph170.preheader ], [ %n.vec206, %middle.block211 ]
  br label %.lr.ph170

.lr.ph170:                                        ; preds = %.lr.ph170.preheader216, %.lr.ph170
  %.0136168 = phi i64 [ %80, %.lr.ph170 ], [ %.0136168.ph, %.lr.ph170.preheader216 ]
  %77 = getelementptr inbounds i8, ptr %.7123194, i64 %.0136168
  %78 = load i8, ptr %77, align 1
  %79 = getelementptr inbounds i8, ptr %.7195, i64 %.0136168
  store i8 %78, ptr %79, align 1
  %80 = add nuw i64 %.0136168, 1
  %exitcond178.not = icmp eq i64 %80, %.3127193
  br i1 %exitcond178.not, label %common.ret, label %.lr.ph170, !llvm.loop !108

common.ret:                                       ; preds = %.lr.ph170, %middle.block211, %72, %._crit_edge, %._crit_edge159, %._crit_edge163, %._crit_edge167
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nounwind null_pointer_is_valid
define internal fastcc void @_Z28nvshmemi_transfer_put_signalIL13threadgroup_t0EEvPvS1_mS1_m14nvshmemi_amo_tib(ptr %0, ptr %1, i64 range(i64 -2147483648, 2147483648) %2, ptr %3, i64 range(i64 0, 4294967296) %4, i32 %5) unnamed_addr #31 section ".text.compute" {
  %.not.i = icmp eq i64 %2, 0
  br i1 %.not.i, label %_Z30nvshmemi_proxy_rma_nbi_with_epPvS_mi13nvshmemi_op_ti.exit, label %7

7:                                                ; preds = %6
  %8 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 632), align 8
  %9 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 40), align 8
  tail call fastcc void @__ppukernel_threadfence_void() #17
  %10 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 680), align 8
  %11 = tail call fastcc i64 @__ppukernel_atomicAdd_u64(ptr %10, i64 32) #17
  %12 = add i64 %11, 31
  %13 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 696), align 8
  %14 = load volatile i64, ptr %13, align 8
  %15 = load i64, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 736), align 8
  %16 = add i64 %15, -1
  %17 = add i64 %16, %14
  %18 = icmp ult i64 %17, %12
  br i1 %18, label %19, label %_Z12transfer_dmaPvS_miii.exit

19:                                               ; preds = %7
  %20 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 688), align 8
  br label %21

21:                                               ; preds = %21, %19
  %22 = load volatile i64, ptr %20, align 8
  %23 = add i64 %16, %22
  %24 = icmp ult i64 %23, %12
  br i1 %24, label %21, label %_Z43nvshmemi_wait_until_greater_than_equals_addImEvPVT_mS0_i.exit, !llvm.loop !99

_Z43nvshmemi_wait_until_greater_than_equals_addImEvPVT_mS0_i.exit: ; preds = %21, %_Z43nvshmemi_wait_until_greater_than_equals_addImEvPVT_mS0_i.exit
  %.0.i = phi i64 [ %26, %_Z43nvshmemi_wait_until_greater_than_equals_addImEvPVT_mS0_i.exit ], [ %14, %21 ]
  %25 = tail call i64 @llvm.umax.i64(i64 %.0.i, i64 %22)
  %26 = tail call fastcc i64 @__ppukernel_atomicCAS_u64(ptr %13, i64 %.0.i, i64 %25) #17
  %.not.i9 = icmp eq i64 %26, %25
  br i1 %.not.i9, label %_ZL17atomicMaxUsingCASIyET_PS0_S0_.exit, label %_Z43nvshmemi_wait_until_greater_than_equals_addImEvPVT_mS0_i.exit, !llvm.loop !97

_ZL17atomicMaxUsingCASIyET_PS0_S0_.exit:          ; preds = %_Z43nvshmemi_wait_until_greater_than_equals_addImEvPVT_mS0_i.exit
  tail call fastcc void @__ppukernel_threadfence_system_void() #17
  br label %_Z12transfer_dmaPvS_miii.exit

_Z12transfer_dmaPvS_miii.exit:                    ; preds = %7, %_ZL17atomicMaxUsingCASIyET_PS0_S0_.exit
  %27 = and i64 %11, 4194303
  %28 = getelementptr inbounds nuw i8, ptr %8, i64 %27
  %29 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 744), align 8
  %30 = zext nneg i32 %29 to i64
  %31 = xor i64 %11, -1
  %32 = lshr i64 %31, %30
  %33 = and i64 %32, 1
  %34 = ptrtoint ptr %0 to i64
  %35 = ptrtoint ptr %9 to i64
  %36 = sub i64 %34, %35
  %37 = ptrtoint ptr %1 to i64
  %38 = shl i64 %36, 24
  %39 = or disjoint i64 %33, %38
  %40 = or disjoint i64 %39, 65792
  store volatile i64 %40, ptr %28, align 8
  %41 = add i64 %11, 8
  %42 = and i64 %37, -256
  %43 = and i64 %41, 4194303
  %44 = getelementptr inbounds nuw i8, ptr %8, i64 %43
  %45 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 744), align 8
  %46 = zext nneg i32 %45 to i64
  %47 = sub i64 -9, %11
  %48 = lshr i64 %47, %46
  %49 = and i64 %48, 1
  %50 = or disjoint i64 %49, %42
  store volatile i64 %50, ptr %44, align 8
  %51 = add i64 %11, 16
  %52 = load i64, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 736), align 8
  %53 = add i64 %52, -1
  %54 = and i64 %53, %51
  %55 = getelementptr inbounds i8, ptr %8, i64 %54
  %56 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 744), align 8
  %57 = zext nneg i32 %56 to i64
  %58 = sub i64 -17, %11
  %59 = lshr i64 %58, %57
  %60 = and i64 %59, 1
  %61 = shl nsw i64 %2, 16
  %62 = shl i64 %37, 8
  %63 = and i64 %62, 65280
  %64 = or disjoint i64 %63, %61
  %65 = or disjoint i64 %60, %64
  store volatile i64 %65, ptr %55, align 8
  %66 = add i64 %11, 24
  %67 = and i64 %66, 4194303
  %68 = getelementptr inbounds nuw i8, ptr %8, i64 %67
  %69 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 744), align 8
  %70 = zext nneg i32 %69 to i64
  %71 = sub i64 -25, %11
  %72 = lshr i64 %71, %70
  %73 = and i64 %72, 1
  %74 = shl i32 %5, 16
  %75 = zext i32 %74 to i64
  %76 = or disjoint i64 %73, %75
  %77 = or disjoint i64 %76, -4294967296
  store volatile i64 %77, ptr %68, align 8
  br label %_Z30nvshmemi_proxy_rma_nbi_with_epPvS_mi13nvshmemi_op_ti.exit

_Z30nvshmemi_proxy_rma_nbi_with_epPvS_mi13nvshmemi_op_ti.exit: ; preds = %6, %_Z12transfer_dmaPvS_miii.exit
  %78 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 680), align 8
  %79 = tail call fastcc i64 @__ppukernel_atomicAdd_u64(ptr %78, i64 8) #17
  %80 = add i64 %79, 7
  %81 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 696), align 8
  %82 = load volatile i64, ptr %81, align 8
  %83 = load i64, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 736), align 8
  %84 = add i64 %83, -1
  %85 = add i64 %84, %82
  %86 = icmp ult i64 %85, %80
  br i1 %86, label %87, label %_Z20nvshmemi_proxy_fencev.exit

87:                                               ; preds = %_Z30nvshmemi_proxy_rma_nbi_with_epPvS_mi13nvshmemi_op_ti.exit
  %88 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 688), align 8
  br label %89

89:                                               ; preds = %89, %87
  %90 = load volatile i64, ptr %88, align 8
  %91 = add i64 %90, %84
  %92 = icmp ult i64 %91, %80
  br i1 %92, label %89, label %_Z43nvshmemi_wait_until_greater_than_equals_addImEvPVT_mS0_i.exit.i, !llvm.loop !99

_Z43nvshmemi_wait_until_greater_than_equals_addImEvPVT_mS0_i.exit.i: ; preds = %89, %_Z43nvshmemi_wait_until_greater_than_equals_addImEvPVT_mS0_i.exit.i
  %.0.i.i = phi i64 [ %94, %_Z43nvshmemi_wait_until_greater_than_equals_addImEvPVT_mS0_i.exit.i ], [ %82, %89 ]
  %93 = tail call i64 @llvm.umax.i64(i64 %.0.i.i, i64 %90)
  %94 = tail call fastcc i64 @__ppukernel_atomicCAS_u64(ptr %81, i64 %.0.i.i, i64 %93) #17
  %.not.i.i = icmp eq i64 %94, %93
  br i1 %.not.i.i, label %_ZL17atomicMaxUsingCASIyET_PS0_S0_.exit.i, label %_Z43nvshmemi_wait_until_greater_than_equals_addImEvPVT_mS0_i.exit.i, !llvm.loop !97

_ZL17atomicMaxUsingCASIyET_PS0_S0_.exit.i:        ; preds = %_Z43nvshmemi_wait_until_greater_than_equals_addImEvPVT_mS0_i.exit.i
  tail call fastcc void @__ppukernel_threadfence_system_void() #17
  %.pre.i = load i64, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 736), align 8
  %.pre17.i = add i64 %.pre.i, -1
  br label %_Z20nvshmemi_proxy_fencev.exit

_Z20nvshmemi_proxy_fencev.exit:                   ; preds = %_Z30nvshmemi_proxy_rma_nbi_with_epPvS_mi13nvshmemi_op_ti.exit, %_ZL17atomicMaxUsingCASIyET_PS0_S0_.exit.i
  %.pre-phi.i = phi i64 [ %84, %_Z30nvshmemi_proxy_rma_nbi_with_epPvS_mi13nvshmemi_op_ti.exit ], [ %.pre17.i, %_ZL17atomicMaxUsingCASIyET_PS0_S0_.exit.i ]
  %95 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 632), align 8
  %96 = ptrtoint ptr %95 to i64
  %97 = and i64 %.pre-phi.i, %79
  %98 = add i64 %97, %96
  %99 = inttoptr i64 %98 to ptr
  %100 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 744), align 8
  %101 = zext nneg i32 %100 to i64
  %102 = xor i64 %79, -1
  %103 = lshr i64 %102, %101
  %104 = and i64 %103, 1
  %105 = or disjoint i64 %104, 393216
  store volatile i64 %105, ptr %99, align 8
  tail call fastcc void @_Z35nvshmemi_proxy_amo_nonfetch_with_epImEvPvT_i14nvshmemi_amo_ti(ptr %3, i64 range(i64 0, 4294967296) %4, i32 %5) #17
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind null_pointer_is_valid
define internal fastcc void @__ppukernel_syncthreads_void() unnamed_addr #38 {
  tail call void @llvm.ppu.sync.warp(i32 -1) #22
  tail call void @llvm.ppu.barrier.sync.cnt(i32 0, i32 0, i32 31) #22
  ret void
}

; Function Attrs: convergent nounwind
declare void @llvm.ppu.sync.warp(i32) #22

; Function Attrs: convergent nounwind
declare dso_local void @llvm.ppu.barrier.sync.cnt(i32, i32, i32) #22

; Function Attrs: mustprogress nofree noinline norecurse nounwind null_pointer_is_valid
define internal fastcc void @_Z47nvshmemi_transfer_enforce_consistency_at_targetb() unnamed_addr #31 section ".text.compute" {
  %1 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 680), align 8
  %2 = load volatile i64, ptr %1, align 8
  %3 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 720), align 8
  %4 = load i64, ptr %3, align 8
  br label %5

5:                                                ; preds = %5, %0
  %.0.i.i = phi i64 [ %4, %0 ], [ %7, %5 ]
  %6 = tail call i64 @llvm.umax.i64(i64 %.0.i.i, i64 %2)
  %7 = tail call fastcc i64 @__ppukernel_atomicCAS_u64(ptr %3, i64 %.0.i.i, i64 %6) #17
  %.not.i.i = icmp eq i64 %7, %6
  br i1 %.not.i.i, label %_ZL17atomicMaxUsingCASIyET_PS0_S0_.exit.i, label %5, !llvm.loop !97

_ZL17atomicMaxUsingCASIyET_PS0_S0_.exit.i:        ; preds = %5
  %8 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 728), align 8
  br label %9

9:                                                ; preds = %9, %_ZL17atomicMaxUsingCASIyET_PS0_S0_.exit.i
  %10 = load volatile i64, ptr %8, align 8
  %11 = icmp ult i64 %10, %2
  br i1 %11, label %9, label %_Z44nvshmemi_proxy_enforce_consistency_at_targetb.exit, !llvm.loop !98

_Z44nvshmemi_proxy_enforce_consistency_at_targetb.exit: ; preds = %9
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nounwind null_pointer_is_valid
define internal fastcc void @_Z30nvshmemi_transfer_amo_nonfetchIlEvPvT_i14nvshmemi_amo_t(ptr %0, i64 %1, i32 %2) unnamed_addr #31 section ".text.compute" {
  notail call fastcc void @_Z38nvshmemi_transfer_amo_nonfetch_with_epIlEvPvT_i14nvshmemi_amo_ti(ptr %0, i64 %1, i32 %2) #17
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nounwind null_pointer_is_valid
define internal fastcc void @_Z38nvshmemi_transfer_amo_nonfetch_with_epIlEvPvT_i14nvshmemi_amo_ti(ptr %0, i64 %1, i32 %2) unnamed_addr #31 section ".text.compute" {
  %4 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 632), align 8
  %5 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 40), align 8
  %6 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 680), align 8
  %7 = tail call fastcc i64 @__ppukernel_atomicAdd_u64(ptr %6, i64 48) #17
  %8 = add i64 %7, 47
  %9 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 696), align 8
  %10 = load volatile i64, ptr %9, align 8
  %11 = load i64, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 736), align 8
  %12 = add i64 %11, -1
  %13 = add i64 %12, %10
  %14 = icmp ult i64 %13, %8
  br i1 %14, label %15, label %_Z35nvshmemi_proxy_amo_nonfetch_with_epIlEvPvT_i14nvshmemi_amo_ti.exit

15:                                               ; preds = %3
  %16 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 688), align 8
  br label %17

17:                                               ; preds = %17, %15
  %18 = load volatile i64, ptr %16, align 8
  %19 = add i64 %18, %12
  %20 = icmp ult i64 %19, %8
  br i1 %20, label %17, label %_Z43nvshmemi_wait_until_greater_than_equals_addImEvPVT_mS0_i.exit.i.i, !llvm.loop !99

_Z43nvshmemi_wait_until_greater_than_equals_addImEvPVT_mS0_i.exit.i.i: ; preds = %17, %_Z43nvshmemi_wait_until_greater_than_equals_addImEvPVT_mS0_i.exit.i.i
  %.0.i.i.i = phi i64 [ %22, %_Z43nvshmemi_wait_until_greater_than_equals_addImEvPVT_mS0_i.exit.i.i ], [ %10, %17 ]
  %21 = tail call i64 @llvm.umax.i64(i64 %.0.i.i.i, i64 %18)
  %22 = tail call fastcc i64 @__ppukernel_atomicCAS_u64(ptr %9, i64 %.0.i.i.i, i64 %21) #17
  %.not.i.i.i = icmp eq i64 %22, %21
  br i1 %.not.i.i.i, label %_ZL17atomicMaxUsingCASIyET_PS0_S0_.exit.i.i, label %_Z43nvshmemi_wait_until_greater_than_equals_addImEvPVT_mS0_i.exit.i.i, !llvm.loop !97

_ZL17atomicMaxUsingCASIyET_PS0_S0_.exit.i.i:      ; preds = %_Z43nvshmemi_wait_until_greater_than_equals_addImEvPVT_mS0_i.exit.i.i
  tail call fastcc void @__ppukernel_threadfence_system_void() #17
  br label %_Z35nvshmemi_proxy_amo_nonfetch_with_epIlEvPvT_i14nvshmemi_amo_ti.exit

_Z35nvshmemi_proxy_amo_nonfetch_with_epIlEvPvT_i14nvshmemi_amo_ti.exit: ; preds = %3, %_ZL17atomicMaxUsingCASIyET_PS0_S0_.exit.i.i
  %23 = and i64 %7, 4194303
  %24 = getelementptr inbounds nuw i8, ptr %4, i64 %23
  %25 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 744), align 8
  %26 = zext nneg i32 %25 to i64
  %27 = xor i64 %7, -1
  %28 = lshr i64 %27, %26
  %29 = and i64 %28, 1
  %30 = ptrtoint ptr %0 to i64
  %31 = ptrtoint ptr %5 to i64
  %32 = sub i64 %30, %31
  %33 = shl i64 %32, 24
  %34 = or disjoint i64 %29, %33
  %35 = or disjoint i64 %34, 459008
  store volatile i64 %35, ptr %24, align 8
  %36 = add i64 %7, 8
  %37 = and i64 %36, 4194303
  %38 = getelementptr inbounds nuw i8, ptr %4, i64 %37
  %39 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 744), align 8
  %40 = zext nneg i32 %39 to i64
  %41 = sub i64 -9, %7
  %42 = lshr i64 %41, %40
  %43 = and i64 %42, 1
  %44 = shl i64 %1, 32
  %45 = shl i32 %2, 16
  %46 = zext i32 %45 to i64
  %47 = or disjoint i64 %44, %46
  %48 = or disjoint i64 %43, %47
  %49 = or disjoint i64 %48, 2048
  store volatile i64 %49, ptr %38, align 8
  %50 = add i64 %7, 16
  %51 = and i64 %50, 4194303
  %52 = getelementptr inbounds nuw i8, ptr %4, i64 %51
  %53 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 744), align 8
  %54 = zext nneg i32 %53 to i64
  %55 = sub i64 -17, %7
  %56 = lshr i64 %55, %54
  %57 = and i64 %56, 1
  %58 = and i64 %1, -4294967296
  %59 = or disjoint i64 %58, %57
  %60 = or disjoint i64 %59, 524288
  store volatile i64 %60, ptr %52, align 8
  %61 = add i64 %7, 24
  %62 = and i64 %61, 4194303
  %63 = getelementptr inbounds nuw i8, ptr %4, i64 %62
  %64 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 744), align 8
  %65 = zext nneg i32 %64 to i64
  %66 = sub i64 -25, %7
  %67 = lshr i64 %66, %65
  %68 = and i64 %67, 1
  store volatile i64 %68, ptr %63, align 8
  %69 = add i64 %7, 32
  %70 = and i64 %69, 4194303
  %71 = getelementptr inbounds nuw i8, ptr %4, i64 %70
  %72 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 744), align 8
  %73 = zext nneg i32 %72 to i64
  %74 = sub i64 -33, %7
  %75 = lshr i64 %74, %73
  %76 = and i64 %75, 1
  store volatile i64 %76, ptr %71, align 8
  %77 = add i64 %7, 40
  %78 = and i64 %77, 4194303
  %79 = getelementptr inbounds nuw i8, ptr %4, i64 %78
  %80 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 744), align 8
  %81 = zext nneg i32 %80 to i64
  %82 = sub i64 -41, %7
  %83 = lshr i64 %82, %81
  %84 = and i64 %83, 1
  %85 = or disjoint i64 %84, -4294967296
  store volatile i64 %85, ptr %79, align 8
  ret void
}

; Function Attrs: mustprogress nofree noinline nounwind null_pointer_is_valid
define internal fastcc void @_Z33nvshmemi_transfer_rma_nbi_with_epIL13threadgroup_t2EL13nvshmemi_op_t1EEvPvS2_mii(ptr %0, ptr %1, i64 %2, i32 %3) unnamed_addr #39 section ".text.compute" comdat {
  %5 = tail call i32 @llvm.ppu.read.tix.sreg.tid.x()
  %6 = tail call i32 @llvm.ppu.read.tix.sreg.tid.y()
  %7 = tail call i32 @llvm.ppu.read.tix.sreg.tid.z()
  %8 = tail call i32 @llvm.ppu.read.tix.sreg.ntid.x()
  %9 = tail call i32 @llvm.ppu.read.tix.sreg.ntid.y()
  %10 = mul i32 %8, %6
  %11 = add i32 %10, %5
  %12 = mul i32 %7, %8
  %13 = mul i32 %12, %9
  %14 = sub i32 0, %13
  %.not = icmp ne i32 %11, %14
  %.not.i = icmp eq i64 %2, 0
  %or.cond = select i1 %.not, i1 true, i1 %.not.i
  br i1 %or.cond, label %_Z30nvshmemi_proxy_rma_nbi_with_epPvS_mi13nvshmemi_op_ti.exit, label %15

15:                                               ; preds = %4
  %16 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 632), align 8
  %17 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 40), align 8
  tail call fastcc void @__ppukernel_threadfence_void() #17
  %18 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 680), align 8
  %19 = tail call fastcc i64 @__ppukernel_atomicAdd_u64(ptr %18, i64 32) #17
  %20 = add i64 %19, 31
  %21 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 696), align 8
  %22 = load volatile i64, ptr %21, align 8
  %23 = load i64, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 736), align 8
  %24 = add i64 %23, -1
  %25 = add i64 %24, %22
  %26 = icmp ult i64 %25, %20
  br i1 %26, label %27, label %_Z12transfer_dmaPvS_miii.exit

27:                                               ; preds = %15
  %28 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 688), align 8
  br label %29

29:                                               ; preds = %29, %27
  %30 = load volatile i64, ptr %28, align 8
  %31 = add i64 %24, %30
  %32 = icmp ult i64 %31, %20
  br i1 %32, label %29, label %_Z43nvshmemi_wait_until_greater_than_equals_addImEvPVT_mS0_i.exit, !llvm.loop !99

_Z43nvshmemi_wait_until_greater_than_equals_addImEvPVT_mS0_i.exit: ; preds = %29, %_Z43nvshmemi_wait_until_greater_than_equals_addImEvPVT_mS0_i.exit
  %.0.i = phi i64 [ %34, %_Z43nvshmemi_wait_until_greater_than_equals_addImEvPVT_mS0_i.exit ], [ %22, %29 ]
  %33 = tail call i64 @llvm.umax.i64(i64 %.0.i, i64 %30)
  %34 = tail call fastcc i64 @__ppukernel_atomicCAS_u64(ptr %21, i64 %.0.i, i64 %33) #17
  %.not.i14 = icmp eq i64 %34, %33
  br i1 %.not.i14, label %_ZL17atomicMaxUsingCASIyET_PS0_S0_.exit, label %_Z43nvshmemi_wait_until_greater_than_equals_addImEvPVT_mS0_i.exit, !llvm.loop !97

_ZL17atomicMaxUsingCASIyET_PS0_S0_.exit:          ; preds = %_Z43nvshmemi_wait_until_greater_than_equals_addImEvPVT_mS0_i.exit
  tail call fastcc void @__ppukernel_threadfence_system_void() #17
  br label %_Z12transfer_dmaPvS_miii.exit

_Z12transfer_dmaPvS_miii.exit:                    ; preds = %15, %_ZL17atomicMaxUsingCASIyET_PS0_S0_.exit
  %35 = and i64 %19, 4194303
  %36 = getelementptr inbounds nuw i8, ptr %16, i64 %35
  %37 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 744), align 8
  %38 = zext nneg i32 %37 to i64
  %39 = xor i64 %19, -1
  %40 = lshr i64 %39, %38
  %41 = and i64 %40, 1
  %42 = ptrtoint ptr %0 to i64
  %43 = ptrtoint ptr %17 to i64
  %44 = sub i64 %42, %43
  %45 = ptrtoint ptr %1 to i64
  %46 = shl i64 %44, 24
  %47 = or disjoint i64 %41, %46
  %48 = or disjoint i64 %47, 65792
  store volatile i64 %48, ptr %36, align 8
  %49 = add i64 %19, 8
  %50 = and i64 %45, -256
  %51 = and i64 %49, 4194303
  %52 = getelementptr inbounds nuw i8, ptr %16, i64 %51
  %53 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 744), align 8
  %54 = zext nneg i32 %53 to i64
  %55 = sub i64 -9, %19
  %56 = lshr i64 %55, %54
  %57 = and i64 %56, 1
  %58 = or disjoint i64 %57, %50
  store volatile i64 %58, ptr %52, align 8
  %59 = add i64 %19, 16
  %60 = load i64, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 736), align 8
  %61 = add i64 %60, -1
  %62 = and i64 %61, %59
  %63 = getelementptr inbounds i8, ptr %16, i64 %62
  %64 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 744), align 8
  %65 = zext nneg i32 %64 to i64
  %66 = sub i64 -17, %19
  %67 = lshr i64 %66, %65
  %68 = and i64 %67, 1
  %69 = shl i64 %2, 16
  %70 = shl i64 %45, 8
  %71 = and i64 %70, 65280
  %72 = or disjoint i64 %71, %69
  %73 = or disjoint i64 %68, %72
  store volatile i64 %73, ptr %63, align 8
  %74 = add i64 %19, 24
  %75 = and i64 %74, 4194303
  %76 = getelementptr inbounds nuw i8, ptr %16, i64 %75
  %77 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 744), align 8
  %78 = zext nneg i32 %77 to i64
  %79 = sub i64 -25, %19
  %80 = lshr i64 %79, %78
  %81 = and i64 %80, 1
  %82 = shl i32 %3, 16
  %83 = zext i32 %82 to i64
  %84 = or disjoint i64 %81, %83
  %85 = or disjoint i64 %84, -4294967296
  store volatile i64 %85, ptr %76, align 8
  br label %_Z30nvshmemi_proxy_rma_nbi_with_epPvS_mi13nvshmemi_op_ti.exit

_Z30nvshmemi_proxy_rma_nbi_with_epPvS_mi13nvshmemi_op_ti.exit: ; preds = %_Z12transfer_dmaPvS_miii.exit, %4
  ret void
}

; Function Attrs: convergent inlinehint mustprogress nounwind null_pointer_is_valid
define internal fastcc void @_Z28nvshmemi_barrier_threadgroupIL13threadgroup_t2EEvi() unnamed_addr #26 comdat {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = tail call i32 @llvm.ppu.read.tix.sreg.tid.x()
  %8 = tail call i32 @llvm.ppu.read.tix.sreg.tid.y()
  %9 = tail call i32 @llvm.ppu.read.tix.sreg.tid.z()
  %10 = tail call i32 @llvm.ppu.read.tix.sreg.ntid.x()
  %11 = tail call i32 @llvm.ppu.read.tix.sreg.ntid.y()
  %12 = mul i32 %11, %9
  %reass.add = add i32 %12, %8
  %reass.mul = mul i32 %reass.add, %10
  %13 = add i32 %reass.mul, %7
  tail call fastcc void @__ppukernel_syncthreads_void() #22
  %14 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 32), align 8
  %15 = icmp sgt i32 %14, 2
  br i1 %15, label %16, label %17

16:                                               ; preds = %0
  notail call fastcc void @_Z23nvshmemi_transfer_quietIL13threadgroup_t2EEvb() #22
  br label %19

17:                                               ; preds = %0
  %.not = icmp eq i32 %13, 0
  br i1 %.not, label %18, label %19

18:                                               ; preds = %17
  tail call fastcc void @__ppukernel_threadfence_system_void() #17
  br label %19

19:                                               ; preds = %17, %18, %16
  tail call fastcc void @__ppukernel_syncthreads_void() #22
  %20 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 96), align 8
  %21 = load ptr, ptr %20, align 8
  %22 = getelementptr inbounds nuw i8, ptr %21, i64 16
  %23 = load i32, ptr %22, align 8
  %24 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 128), align 8
  %25 = tail call i32 @llvm.smin.i32(i32 %24, i32 %23)
  %26 = tail call i32 @llvm.smax.i32(i32 %25, i32 2)
  %27 = getelementptr inbounds nuw i8, ptr %21, i64 236
  %28 = load i8, ptr %27, align 4, !range !109
  %29 = trunc nuw i8 %28 to i1
  %spec.select.i = select i1 %29, i32 %23, i32 %26
  %30 = getelementptr inbounds nuw i8, ptr %21, i64 8
  %31 = load i32, ptr %30, align 8
  %32 = getelementptr inbounds nuw i8, ptr %21, i64 12
  %33 = load i32, ptr %32, align 4
  %34 = load i64, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 152), align 8
  %35 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 8), align 8
  %36 = shl nsw i32 %35, 2
  %37 = sext i32 %36 to i64
  %38 = mul i64 %34, %37
  %39 = lshr i64 %38, 3
  %40 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 104), align 8
  %41 = getelementptr inbounds nuw i8, ptr %21, i64 20
  %42 = load i32, ptr %41, align 4
  %43 = sext i32 %42 to i64
  %44 = load i64, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 200), align 8
  %45 = add i64 %44, 119
  %46 = udiv i64 %45, 120
  %47 = sext i32 %35 to i64
  %48 = shl nsw i64 %47, 8
  %49 = mul i64 %48, %46
  %50 = lshr exact i64 %49, 3
  %51 = load i64, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 168), align 8
  %52 = lshr i64 %51, 3
  %53 = add nuw nsw i64 %39, 442368
  %54 = add nuw nsw i64 %53, %52
  %55 = add nuw nsw i64 %54, %50
  %56 = mul i64 %55, %43
  %57 = getelementptr inbounds i64, ptr %40, i64 %56
  %58 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 112), align 8
  %59 = shl nsw i32 %42, 1
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i64, ptr %58, i64 %60
  %62 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 4), align 4
  %63 = sub nsw i32 %62, %31
  %64 = sdiv i32 %63, %33
  %65 = add nsw i32 %23, -1
  switch i32 %spec.select.i, label %331 [
    i32 2, label %66
    i32 4, label %119
    i32 8, label %172
    i32 16, label %225
    i32 32, label %278
  ]

66:                                               ; preds = %19
  %67 = tail call i32 @llvm.ppu.read.tix.sreg.ntid.z()
  %68 = mul i32 %11, %10
  %69 = mul i32 %68, %67
  %.not88.i.i = icmp eq i32 %65, 0
  br i1 %.not88.i.i, label %._crit_edge93.i.i, label %.lr.ph92.i.i

.lr.ph92.i.i:                                     ; preds = %66
  %70 = add nsw i32 %13, 1
  %71 = icmp slt i32 %13, 1
  br label %72

72:                                               ; preds = %._crit_edge86.i.i, %.lr.ph92.i.i
  %.06590.i.i = phi i32 [ %65, %.lr.ph92.i.i ], [ %114, %._crit_edge86.i.i ]
  %.06789.i.i = phi i32 [ 0, %.lr.ph92.i.i ], [ %115, %._crit_edge86.i.i ]
  br i1 %71, label %.lr.ph.i.i, label %._crit_edge86.i.i

.lr.ph.i.i:                                       ; preds = %72, %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i.i
  %.06881.i.i = phi i32 [ %97, %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i.i ], [ %70, %72 ]
  %73 = shl i32 %.06881.i.i, %.06789.i.i
  %.not77.i.i = icmp slt i32 %73, %23
  br i1 %.not77.i.i, label %74, label %.lr.ph85.i.i.preheader

74:                                               ; preds = %.lr.ph.i.i
  %75 = add nsw i32 %73, %64
  %.not78.i.i = icmp slt i32 %75, %23
  %76 = select i1 %.not78.i.i, i32 0, i32 %23
  %spec.select.i.i = sub nsw i32 %75, %76
  %77 = mul nsw i32 %spec.select.i.i, %33
  %78 = add nsw i32 %77, %31
  %79 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 4), align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i64, ptr %57, i64 %80
  %82 = load volatile i64, ptr %61, align 8
  %83 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 32), align 8
  %84 = icmp slt i32 %83, 3
  br i1 %84, label %85, label %96

85:                                               ; preds = %74
  %86 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 56), align 8
  %87 = sext i32 %78 to i64
  %88 = getelementptr inbounds i64, ptr %86, i64 %87
  %89 = tail call fastcc i64 @__ppukernel_ldg_ulonglong(ptr %88) #17
  %90 = inttoptr i64 %89 to ptr
  %91 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 40), align 8
  %92 = ptrtoint ptr %81 to i64
  %93 = ptrtoint ptr %91 to i64
  %94 = sub i64 %92, %93
  %95 = getelementptr inbounds i8, ptr %90, i64 %94
  store volatile i64 %82, ptr %95, align 8
  br label %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i.i

96:                                               ; preds = %74
  notail call fastcc void @_Z30nvshmemi_transfer_amo_nonfetchIlEvPvT_i14nvshmemi_amo_t(ptr %81, i64 %82, i32 %78) #17
  br label %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i.i

_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i.i: ; preds = %96, %85
  %97 = add nsw i32 %.06881.i.i, %69
  %98 = icmp slt i32 %97, 2
  br i1 %98, label %.lr.ph.i.i, label %.lr.ph85.i.i.preheader, !llvm.loop !110

.lr.ph85.i.i.preheader:                           ; preds = %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i.i, %.lr.ph.i.i
  br label %.lr.ph85.i.i

.lr.ph85.i.i:                                     ; preds = %.lr.ph85.i.i.preheader, %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i.i
  %.06983.i.i = phi i32 [ %112, %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i.i ], [ %70, %.lr.ph85.i.i.preheader ]
  %99 = shl i32 %.06983.i.i, %.06789.i.i
  %.not79.i.i = icmp slt i32 %99, %23
  br i1 %.not79.i.i, label %100, label %._crit_edge86.i.i

100:                                              ; preds = %.lr.ph85.i.i
  %101 = sub nsw i32 %64, %99
  %102 = icmp slt i32 %101, 0
  %103 = select i1 %102, i32 %23, i32 0
  %spec.select80.i.i = add nsw i32 %103, %101
  %104 = mul nsw i32 %spec.select80.i.i, %33
  %105 = add nsw i32 %104, %31
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i64, ptr %57, i64 %106
  %108 = load volatile i64, ptr %61, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %6)
  store volatile i64 %108, ptr %6, align 8
  br label %109

109:                                              ; preds = %109, %100
  %110 = load volatile i64, ptr %107, align 8
  %.0..0..0..0..0..0..0..0..0..0..i.i.i = load volatile i64, ptr %6, align 8
  %111 = icmp slt i64 %110, %.0..0..0..0..0..0..0..0..0..0..i.i.i
  br i1 %111, label %109, label %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i.i, !llvm.loop !73

_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i.i: ; preds = %109
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %6)
  %112 = add nsw i32 %.06983.i.i, %69
  %113 = icmp slt i32 %112, 2
  br i1 %113, label %.lr.ph85.i.i, label %._crit_edge86.i.i, !llvm.loop !111

._crit_edge86.i.i:                                ; preds = %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i.i, %.lr.ph85.i.i, %72
  %114 = ashr i32 %.06590.i.i, 1
  %115 = add nuw nsw i32 %.06789.i.i, 1
  tail call fastcc void @__ppukernel_syncthreads_void() #22
  %.not.i.i = icmp ult i32 %.06590.i.i, 2
  br i1 %.not.i.i, label %._crit_edge93.i.i, label %72, !llvm.loop !112

._crit_edge93.i.i:                                ; preds = %._crit_edge86.i.i, %66
  %.not76.i.i = icmp eq i32 %13, 0
  br i1 %.not76.i.i, label %116, label %_Z28sync_dissem_pow2_threadgroupILi2ELi1EL13threadgroup_t2EEvi.exit.i

116:                                              ; preds = %._crit_edge93.i.i
  %117 = load volatile i64, ptr %61, align 8
  %118 = add nsw i64 %117, 1
  store volatile i64 %118, ptr %61, align 8
  br label %_Z28sync_dissem_pow2_threadgroupILi2ELi1EL13threadgroup_t2EEvi.exit.i

_Z28sync_dissem_pow2_threadgroupILi2ELi1EL13threadgroup_t2EEvi.exit.i: ; preds = %116, %._crit_edge93.i.i
  tail call fastcc void @__ppukernel_syncthreads_void() #22
  br label %_Z30nvshmemi_sync_algo_threadgroupIL13threadgroup_t2EEvi.exit

119:                                              ; preds = %19
  %120 = tail call i32 @llvm.ppu.read.tix.sreg.ntid.z()
  %121 = mul i32 %11, %10
  %122 = mul i32 %121, %120
  %.not88.i23.i = icmp eq i32 %65, 0
  br i1 %.not88.i23.i, label %._crit_edge93.i29.i, label %.lr.ph92.i24.i

.lr.ph92.i24.i:                                   ; preds = %119
  %123 = add nsw i32 %13, 1
  %124 = icmp slt i32 %13, 3
  br label %125

125:                                              ; preds = %._crit_edge86.i27.i, %.lr.ph92.i24.i
  %.06590.i25.i = phi i32 [ %65, %.lr.ph92.i24.i ], [ %167, %._crit_edge86.i27.i ]
  %.06789.i26.i = phi i32 [ 0, %.lr.ph92.i24.i ], [ %168, %._crit_edge86.i27.i ]
  br i1 %124, label %.lr.ph.i31.i, label %._crit_edge86.i27.i

.lr.ph.i31.i:                                     ; preds = %125, %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i43.i
  %.06881.i32.i = phi i32 [ %150, %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i43.i ], [ %123, %125 ]
  %126 = shl i32 %.06881.i32.i, %.06789.i26.i
  %.not77.i33.i = icmp slt i32 %126, %23
  br i1 %.not77.i33.i, label %127, label %.lr.ph85.i35.i.preheader

127:                                              ; preds = %.lr.ph.i31.i
  %128 = add nsw i32 %126, %64
  %.not78.i41.i = icmp slt i32 %128, %23
  %129 = select i1 %.not78.i41.i, i32 0, i32 %23
  %spec.select.i42.i = sub nsw i32 %128, %129
  %130 = mul nsw i32 %spec.select.i42.i, %33
  %131 = add nsw i32 %130, %31
  %132 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 4), align 4
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds i64, ptr %57, i64 %133
  %135 = load volatile i64, ptr %61, align 8
  %136 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 32), align 8
  %137 = icmp slt i32 %136, 3
  br i1 %137, label %138, label %149

138:                                              ; preds = %127
  %139 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 56), align 8
  %140 = sext i32 %131 to i64
  %141 = getelementptr inbounds i64, ptr %139, i64 %140
  %142 = tail call fastcc i64 @__ppukernel_ldg_ulonglong(ptr %141) #17
  %143 = inttoptr i64 %142 to ptr
  %144 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 40), align 8
  %145 = ptrtoint ptr %134 to i64
  %146 = ptrtoint ptr %144 to i64
  %147 = sub i64 %145, %146
  %148 = getelementptr inbounds i8, ptr %143, i64 %147
  store volatile i64 %135, ptr %148, align 8
  br label %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i43.i

149:                                              ; preds = %127
  notail call fastcc void @_Z30nvshmemi_transfer_amo_nonfetchIlEvPvT_i14nvshmemi_amo_t(ptr %134, i64 %135, i32 %131) #17
  br label %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i43.i

_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i43.i: ; preds = %149, %138
  %150 = add nsw i32 %.06881.i32.i, %122
  %151 = icmp slt i32 %150, 4
  br i1 %151, label %.lr.ph.i31.i, label %.lr.ph85.i35.i.preheader, !llvm.loop !113

.lr.ph85.i35.i.preheader:                         ; preds = %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i43.i, %.lr.ph.i31.i
  br label %.lr.ph85.i35.i

.lr.ph85.i35.i:                                   ; preds = %.lr.ph85.i35.i.preheader, %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i40.i
  %.06983.i36.i = phi i32 [ %165, %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i40.i ], [ %123, %.lr.ph85.i35.i.preheader ]
  %152 = shl i32 %.06983.i36.i, %.06789.i26.i
  %.not79.i37.i = icmp slt i32 %152, %23
  br i1 %.not79.i37.i, label %153, label %._crit_edge86.i27.i

153:                                              ; preds = %.lr.ph85.i35.i
  %154 = sub nsw i32 %64, %152
  %155 = icmp slt i32 %154, 0
  %156 = select i1 %155, i32 %23, i32 0
  %spec.select80.i38.i = add nsw i32 %156, %154
  %157 = mul nsw i32 %spec.select80.i38.i, %33
  %158 = add nsw i32 %157, %31
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds i64, ptr %57, i64 %159
  %161 = load volatile i64, ptr %61, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %5)
  store volatile i64 %161, ptr %5, align 8
  br label %162

162:                                              ; preds = %162, %153
  %163 = load volatile i64, ptr %160, align 8
  %.0..0..0..0..0..0..0..0..0..0..i.i39.i = load volatile i64, ptr %5, align 8
  %164 = icmp slt i64 %163, %.0..0..0..0..0..0..0..0..0..0..i.i39.i
  br i1 %164, label %162, label %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i40.i, !llvm.loop !73

_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i40.i: ; preds = %162
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %5)
  %165 = add nsw i32 %.06983.i36.i, %122
  %166 = icmp slt i32 %165, 4
  br i1 %166, label %.lr.ph85.i35.i, label %._crit_edge86.i27.i, !llvm.loop !114

._crit_edge86.i27.i:                              ; preds = %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i40.i, %.lr.ph85.i35.i, %125
  %167 = ashr i32 %.06590.i25.i, 2
  %168 = add nuw nsw i32 %.06789.i26.i, 1
  tail call fastcc void @__ppukernel_syncthreads_void() #22
  %.not.i28.i = icmp ult i32 %.06590.i25.i, 4
  br i1 %.not.i28.i, label %._crit_edge93.i29.i, label %125, !llvm.loop !115

._crit_edge93.i29.i:                              ; preds = %._crit_edge86.i27.i, %119
  %.not76.i30.i = icmp eq i32 %13, 0
  br i1 %.not76.i30.i, label %169, label %_Z28sync_dissem_pow2_threadgroupILi4ELi2EL13threadgroup_t2EEvi.exit.i

169:                                              ; preds = %._crit_edge93.i29.i
  %170 = load volatile i64, ptr %61, align 8
  %171 = add nsw i64 %170, 1
  store volatile i64 %171, ptr %61, align 8
  br label %_Z28sync_dissem_pow2_threadgroupILi4ELi2EL13threadgroup_t2EEvi.exit.i

_Z28sync_dissem_pow2_threadgroupILi4ELi2EL13threadgroup_t2EEvi.exit.i: ; preds = %169, %._crit_edge93.i29.i
  tail call fastcc void @__ppukernel_syncthreads_void() #22
  br label %_Z30nvshmemi_sync_algo_threadgroupIL13threadgroup_t2EEvi.exit

172:                                              ; preds = %19
  %173 = tail call i32 @llvm.ppu.read.tix.sreg.ntid.z()
  %174 = mul i32 %11, %10
  %175 = mul i32 %174, %173
  %.not88.i46.i = icmp eq i32 %65, 0
  br i1 %.not88.i46.i, label %._crit_edge93.i52.i, label %.lr.ph92.i47.i

.lr.ph92.i47.i:                                   ; preds = %172
  %176 = add nsw i32 %13, 1
  %177 = icmp slt i32 %13, 7
  br label %178

178:                                              ; preds = %._crit_edge86.i50.i, %.lr.ph92.i47.i
  %.06590.i48.i = phi i32 [ %65, %.lr.ph92.i47.i ], [ %220, %._crit_edge86.i50.i ]
  %.06789.i49.i = phi i32 [ 0, %.lr.ph92.i47.i ], [ %221, %._crit_edge86.i50.i ]
  br i1 %177, label %.lr.ph.i54.i, label %._crit_edge86.i50.i

.lr.ph.i54.i:                                     ; preds = %178, %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i66.i
  %.06881.i55.i = phi i32 [ %203, %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i66.i ], [ %176, %178 ]
  %179 = shl i32 %.06881.i55.i, %.06789.i49.i
  %.not77.i56.i = icmp slt i32 %179, %23
  br i1 %.not77.i56.i, label %180, label %.lr.ph85.i58.i.preheader

180:                                              ; preds = %.lr.ph.i54.i
  %181 = add nsw i32 %179, %64
  %.not78.i64.i = icmp slt i32 %181, %23
  %182 = select i1 %.not78.i64.i, i32 0, i32 %23
  %spec.select.i65.i = sub nsw i32 %181, %182
  %183 = mul nsw i32 %spec.select.i65.i, %33
  %184 = add nsw i32 %183, %31
  %185 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 4), align 4
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds i64, ptr %57, i64 %186
  %188 = load volatile i64, ptr %61, align 8
  %189 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 32), align 8
  %190 = icmp slt i32 %189, 3
  br i1 %190, label %191, label %202

191:                                              ; preds = %180
  %192 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 56), align 8
  %193 = sext i32 %184 to i64
  %194 = getelementptr inbounds i64, ptr %192, i64 %193
  %195 = tail call fastcc i64 @__ppukernel_ldg_ulonglong(ptr %194) #17
  %196 = inttoptr i64 %195 to ptr
  %197 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 40), align 8
  %198 = ptrtoint ptr %187 to i64
  %199 = ptrtoint ptr %197 to i64
  %200 = sub i64 %198, %199
  %201 = getelementptr inbounds i8, ptr %196, i64 %200
  store volatile i64 %188, ptr %201, align 8
  br label %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i66.i

202:                                              ; preds = %180
  notail call fastcc void @_Z30nvshmemi_transfer_amo_nonfetchIlEvPvT_i14nvshmemi_amo_t(ptr %187, i64 %188, i32 %184) #17
  br label %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i66.i

_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i66.i: ; preds = %202, %191
  %203 = add nsw i32 %.06881.i55.i, %175
  %204 = icmp slt i32 %203, 8
  br i1 %204, label %.lr.ph.i54.i, label %.lr.ph85.i58.i.preheader, !llvm.loop !116

.lr.ph85.i58.i.preheader:                         ; preds = %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i66.i, %.lr.ph.i54.i
  br label %.lr.ph85.i58.i

.lr.ph85.i58.i:                                   ; preds = %.lr.ph85.i58.i.preheader, %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i63.i
  %.06983.i59.i = phi i32 [ %218, %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i63.i ], [ %176, %.lr.ph85.i58.i.preheader ]
  %205 = shl i32 %.06983.i59.i, %.06789.i49.i
  %.not79.i60.i = icmp slt i32 %205, %23
  br i1 %.not79.i60.i, label %206, label %._crit_edge86.i50.i

206:                                              ; preds = %.lr.ph85.i58.i
  %207 = sub nsw i32 %64, %205
  %208 = icmp slt i32 %207, 0
  %209 = select i1 %208, i32 %23, i32 0
  %spec.select80.i61.i = add nsw i32 %209, %207
  %210 = mul nsw i32 %spec.select80.i61.i, %33
  %211 = add nsw i32 %210, %31
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds i64, ptr %57, i64 %212
  %214 = load volatile i64, ptr %61, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %4)
  store volatile i64 %214, ptr %4, align 8
  br label %215

215:                                              ; preds = %215, %206
  %216 = load volatile i64, ptr %213, align 8
  %.0..0..0..0..0..0..0..0..0..0..i.i62.i = load volatile i64, ptr %4, align 8
  %217 = icmp slt i64 %216, %.0..0..0..0..0..0..0..0..0..0..i.i62.i
  br i1 %217, label %215, label %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i63.i, !llvm.loop !73

_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i63.i: ; preds = %215
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %4)
  %218 = add nsw i32 %.06983.i59.i, %175
  %219 = icmp slt i32 %218, 8
  br i1 %219, label %.lr.ph85.i58.i, label %._crit_edge86.i50.i, !llvm.loop !117

._crit_edge86.i50.i:                              ; preds = %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i63.i, %.lr.ph85.i58.i, %178
  %220 = ashr i32 %.06590.i48.i, 3
  %221 = add nuw nsw i32 %.06789.i49.i, 1
  tail call fastcc void @__ppukernel_syncthreads_void() #22
  %.not.i51.i = icmp ult i32 %.06590.i48.i, 8
  br i1 %.not.i51.i, label %._crit_edge93.i52.i, label %178, !llvm.loop !118

._crit_edge93.i52.i:                              ; preds = %._crit_edge86.i50.i, %172
  %.not76.i53.i = icmp eq i32 %13, 0
  br i1 %.not76.i53.i, label %222, label %_Z28sync_dissem_pow2_threadgroupILi8ELi3EL13threadgroup_t2EEvi.exit.i

222:                                              ; preds = %._crit_edge93.i52.i
  %223 = load volatile i64, ptr %61, align 8
  %224 = add nsw i64 %223, 1
  store volatile i64 %224, ptr %61, align 8
  br label %_Z28sync_dissem_pow2_threadgroupILi8ELi3EL13threadgroup_t2EEvi.exit.i

_Z28sync_dissem_pow2_threadgroupILi8ELi3EL13threadgroup_t2EEvi.exit.i: ; preds = %222, %._crit_edge93.i52.i
  tail call fastcc void @__ppukernel_syncthreads_void() #22
  br label %_Z30nvshmemi_sync_algo_threadgroupIL13threadgroup_t2EEvi.exit

225:                                              ; preds = %19
  %226 = tail call i32 @llvm.ppu.read.tix.sreg.ntid.z()
  %227 = mul i32 %11, %10
  %228 = mul i32 %227, %226
  %.not88.i69.i = icmp eq i32 %65, 0
  br i1 %.not88.i69.i, label %._crit_edge93.i75.i, label %.lr.ph92.i70.i

.lr.ph92.i70.i:                                   ; preds = %225
  %229 = add nsw i32 %13, 1
  %230 = icmp slt i32 %13, 15
  br label %231

231:                                              ; preds = %._crit_edge86.i73.i, %.lr.ph92.i70.i
  %.06590.i71.i = phi i32 [ %65, %.lr.ph92.i70.i ], [ %273, %._crit_edge86.i73.i ]
  %.06789.i72.i = phi i32 [ 0, %.lr.ph92.i70.i ], [ %274, %._crit_edge86.i73.i ]
  br i1 %230, label %.lr.ph.i77.i, label %._crit_edge86.i73.i

.lr.ph.i77.i:                                     ; preds = %231, %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i89.i
  %.06881.i78.i = phi i32 [ %256, %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i89.i ], [ %229, %231 ]
  %232 = shl i32 %.06881.i78.i, %.06789.i72.i
  %.not77.i79.i = icmp slt i32 %232, %23
  br i1 %.not77.i79.i, label %233, label %.lr.ph85.i81.i.preheader

233:                                              ; preds = %.lr.ph.i77.i
  %234 = add nsw i32 %232, %64
  %.not78.i87.i = icmp slt i32 %234, %23
  %235 = select i1 %.not78.i87.i, i32 0, i32 %23
  %spec.select.i88.i = sub nsw i32 %234, %235
  %236 = mul nsw i32 %spec.select.i88.i, %33
  %237 = add nsw i32 %236, %31
  %238 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 4), align 4
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds i64, ptr %57, i64 %239
  %241 = load volatile i64, ptr %61, align 8
  %242 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 32), align 8
  %243 = icmp slt i32 %242, 3
  br i1 %243, label %244, label %255

244:                                              ; preds = %233
  %245 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 56), align 8
  %246 = sext i32 %237 to i64
  %247 = getelementptr inbounds i64, ptr %245, i64 %246
  %248 = tail call fastcc i64 @__ppukernel_ldg_ulonglong(ptr %247) #17
  %249 = inttoptr i64 %248 to ptr
  %250 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 40), align 8
  %251 = ptrtoint ptr %240 to i64
  %252 = ptrtoint ptr %250 to i64
  %253 = sub i64 %251, %252
  %254 = getelementptr inbounds i8, ptr %249, i64 %253
  store volatile i64 %241, ptr %254, align 8
  br label %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i89.i

255:                                              ; preds = %233
  notail call fastcc void @_Z30nvshmemi_transfer_amo_nonfetchIlEvPvT_i14nvshmemi_amo_t(ptr %240, i64 %241, i32 %237) #17
  br label %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i89.i

_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i89.i: ; preds = %255, %244
  %256 = add nsw i32 %.06881.i78.i, %228
  %257 = icmp slt i32 %256, 16
  br i1 %257, label %.lr.ph.i77.i, label %.lr.ph85.i81.i.preheader, !llvm.loop !119

.lr.ph85.i81.i.preheader:                         ; preds = %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i89.i, %.lr.ph.i77.i
  br label %.lr.ph85.i81.i

.lr.ph85.i81.i:                                   ; preds = %.lr.ph85.i81.i.preheader, %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i86.i
  %.06983.i82.i = phi i32 [ %271, %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i86.i ], [ %229, %.lr.ph85.i81.i.preheader ]
  %258 = shl i32 %.06983.i82.i, %.06789.i72.i
  %.not79.i83.i = icmp slt i32 %258, %23
  br i1 %.not79.i83.i, label %259, label %._crit_edge86.i73.i

259:                                              ; preds = %.lr.ph85.i81.i
  %260 = sub nsw i32 %64, %258
  %261 = icmp slt i32 %260, 0
  %262 = select i1 %261, i32 %23, i32 0
  %spec.select80.i84.i = add nsw i32 %262, %260
  %263 = mul nsw i32 %spec.select80.i84.i, %33
  %264 = add nsw i32 %263, %31
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds i64, ptr %57, i64 %265
  %267 = load volatile i64, ptr %61, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3)
  store volatile i64 %267, ptr %3, align 8
  br label %268

268:                                              ; preds = %268, %259
  %269 = load volatile i64, ptr %266, align 8
  %.0..0..0..0..0..0..0..0..0..0..i.i85.i = load volatile i64, ptr %3, align 8
  %270 = icmp slt i64 %269, %.0..0..0..0..0..0..0..0..0..0..i.i85.i
  br i1 %270, label %268, label %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i86.i, !llvm.loop !73

_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i86.i: ; preds = %268
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3)
  %271 = add nsw i32 %.06983.i82.i, %228
  %272 = icmp slt i32 %271, 16
  br i1 %272, label %.lr.ph85.i81.i, label %._crit_edge86.i73.i, !llvm.loop !120

._crit_edge86.i73.i:                              ; preds = %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i86.i, %.lr.ph85.i81.i, %231
  %273 = ashr i32 %.06590.i71.i, 4
  %274 = add nuw nsw i32 %.06789.i72.i, 1
  tail call fastcc void @__ppukernel_syncthreads_void() #22
  %.not.i74.i = icmp ult i32 %.06590.i71.i, 16
  br i1 %.not.i74.i, label %._crit_edge93.i75.i, label %231, !llvm.loop !121

._crit_edge93.i75.i:                              ; preds = %._crit_edge86.i73.i, %225
  %.not76.i76.i = icmp eq i32 %13, 0
  br i1 %.not76.i76.i, label %275, label %_Z28sync_dissem_pow2_threadgroupILi16ELi4EL13threadgroup_t2EEvi.exit.i

275:                                              ; preds = %._crit_edge93.i75.i
  %276 = load volatile i64, ptr %61, align 8
  %277 = add nsw i64 %276, 1
  store volatile i64 %277, ptr %61, align 8
  br label %_Z28sync_dissem_pow2_threadgroupILi16ELi4EL13threadgroup_t2EEvi.exit.i

_Z28sync_dissem_pow2_threadgroupILi16ELi4EL13threadgroup_t2EEvi.exit.i: ; preds = %275, %._crit_edge93.i75.i
  tail call fastcc void @__ppukernel_syncthreads_void() #22
  br label %_Z30nvshmemi_sync_algo_threadgroupIL13threadgroup_t2EEvi.exit

278:                                              ; preds = %19
  %279 = tail call i32 @llvm.ppu.read.tix.sreg.ntid.z()
  %280 = mul i32 %11, %10
  %281 = mul i32 %280, %279
  %.not88.i92.i = icmp eq i32 %65, 0
  br i1 %.not88.i92.i, label %._crit_edge93.i98.i, label %.lr.ph92.i93.i

.lr.ph92.i93.i:                                   ; preds = %278
  %282 = add nsw i32 %13, 1
  %283 = icmp slt i32 %13, 31
  br label %284

284:                                              ; preds = %._crit_edge86.i96.i, %.lr.ph92.i93.i
  %.06590.i94.i = phi i32 [ %65, %.lr.ph92.i93.i ], [ %326, %._crit_edge86.i96.i ]
  %.06789.i95.i = phi i32 [ 0, %.lr.ph92.i93.i ], [ %327, %._crit_edge86.i96.i ]
  br i1 %283, label %.lr.ph.i100.i, label %._crit_edge86.i96.i

.lr.ph.i100.i:                                    ; preds = %284, %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i112.i
  %.06881.i101.i = phi i32 [ %309, %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i112.i ], [ %282, %284 ]
  %285 = shl i32 %.06881.i101.i, %.06789.i95.i
  %.not77.i102.i = icmp slt i32 %285, %23
  br i1 %.not77.i102.i, label %286, label %.lr.ph85.i104.i.preheader

286:                                              ; preds = %.lr.ph.i100.i
  %287 = add nsw i32 %285, %64
  %.not78.i110.i = icmp slt i32 %287, %23
  %288 = select i1 %.not78.i110.i, i32 0, i32 %23
  %spec.select.i111.i = sub nsw i32 %287, %288
  %289 = mul nsw i32 %spec.select.i111.i, %33
  %290 = add nsw i32 %289, %31
  %291 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 4), align 4
  %292 = sext i32 %291 to i64
  %293 = getelementptr inbounds i64, ptr %57, i64 %292
  %294 = load volatile i64, ptr %61, align 8
  %295 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 32), align 8
  %296 = icmp slt i32 %295, 3
  br i1 %296, label %297, label %308

297:                                              ; preds = %286
  %298 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 56), align 8
  %299 = sext i32 %290 to i64
  %300 = getelementptr inbounds i64, ptr %298, i64 %299
  %301 = tail call fastcc i64 @__ppukernel_ldg_ulonglong(ptr %300) #17
  %302 = inttoptr i64 %301 to ptr
  %303 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 40), align 8
  %304 = ptrtoint ptr %293 to i64
  %305 = ptrtoint ptr %303 to i64
  %306 = sub i64 %304, %305
  %307 = getelementptr inbounds i8, ptr %302, i64 %306
  store volatile i64 %294, ptr %307, align 8
  br label %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i112.i

308:                                              ; preds = %286
  notail call fastcc void @_Z30nvshmemi_transfer_amo_nonfetchIlEvPvT_i14nvshmemi_amo_t(ptr %293, i64 %294, i32 %290) #17
  br label %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i112.i

_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i112.i: ; preds = %308, %297
  %309 = add nsw i32 %.06881.i101.i, %281
  %310 = icmp slt i32 %309, 32
  br i1 %310, label %.lr.ph.i100.i, label %.lr.ph85.i104.i.preheader, !llvm.loop !122

.lr.ph85.i104.i.preheader:                        ; preds = %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i112.i, %.lr.ph.i100.i
  br label %.lr.ph85.i104.i

.lr.ph85.i104.i:                                  ; preds = %.lr.ph85.i104.i.preheader, %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i109.i
  %.06983.i105.i = phi i32 [ %324, %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i109.i ], [ %282, %.lr.ph85.i104.i.preheader ]
  %311 = shl i32 %.06983.i105.i, %.06789.i95.i
  %.not79.i106.i = icmp slt i32 %311, %23
  br i1 %.not79.i106.i, label %312, label %._crit_edge86.i96.i

312:                                              ; preds = %.lr.ph85.i104.i
  %313 = sub nsw i32 %64, %311
  %314 = icmp slt i32 %313, 0
  %315 = select i1 %314, i32 %23, i32 0
  %spec.select80.i107.i = add nsw i32 %315, %313
  %316 = mul nsw i32 %spec.select80.i107.i, %33
  %317 = add nsw i32 %316, %31
  %318 = sext i32 %317 to i64
  %319 = getelementptr inbounds i64, ptr %57, i64 %318
  %320 = load volatile i64, ptr %61, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2)
  store volatile i64 %320, ptr %2, align 8
  br label %321

321:                                              ; preds = %321, %312
  %322 = load volatile i64, ptr %319, align 8
  %.0..0..0..0..0..0..0..0..0..0..i.i108.i = load volatile i64, ptr %2, align 8
  %323 = icmp slt i64 %322, %.0..0..0..0..0..0..0..0..0..0..i.i108.i
  br i1 %323, label %321, label %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i109.i, !llvm.loop !73

_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i109.i: ; preds = %321
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2)
  %324 = add nsw i32 %.06983.i105.i, %281
  %325 = icmp slt i32 %324, 32
  br i1 %325, label %.lr.ph85.i104.i, label %._crit_edge86.i96.i, !llvm.loop !123

._crit_edge86.i96.i:                              ; preds = %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i109.i, %.lr.ph85.i104.i, %284
  %326 = ashr i32 %.06590.i94.i, 5
  %327 = add nuw nsw i32 %.06789.i95.i, 1
  tail call fastcc void @__ppukernel_syncthreads_void() #22
  %.not.i97.i = icmp ult i32 %.06590.i94.i, 32
  br i1 %.not.i97.i, label %._crit_edge93.i98.i, label %284, !llvm.loop !124

._crit_edge93.i98.i:                              ; preds = %._crit_edge86.i96.i, %278
  %.not76.i99.i = icmp eq i32 %13, 0
  br i1 %.not76.i99.i, label %328, label %_Z28sync_dissem_pow2_threadgroupILi32ELi5EL13threadgroup_t2EEvi.exit.i

328:                                              ; preds = %._crit_edge93.i98.i
  %329 = load volatile i64, ptr %61, align 8
  %330 = add nsw i64 %329, 1
  store volatile i64 %330, ptr %61, align 8
  br label %_Z28sync_dissem_pow2_threadgroupILi32ELi5EL13threadgroup_t2EEvi.exit.i

_Z28sync_dissem_pow2_threadgroupILi32ELi5EL13threadgroup_t2EEvi.exit.i: ; preds = %328, %._crit_edge93.i98.i
  tail call fastcc void @__ppukernel_syncthreads_void() #22
  br label %_Z30nvshmemi_sync_algo_threadgroupIL13threadgroup_t2EEvi.exit

331:                                              ; preds = %19
  %.not79.i.i.i = icmp eq i32 %65, 0
  br i1 %.not79.i.i.i, label %._crit_edge.i.i.i.thread, label %.lr.ph.i.i.i

._crit_edge.i.i.i.thread:                         ; preds = %331
  %332 = tail call i32 @llvm.ppu.read.tix.sreg.ntid.z()
  br label %._crit_edge98.i.i.i

.lr.ph.i.i.i:                                     ; preds = %331, %.lr.ph.i.i.i
  %.081.i.i.i = phi i32 [ %333, %.lr.ph.i.i.i ], [ 0, %331 ]
  %.06480.i.i.i = phi i32 [ %334, %.lr.ph.i.i.i ], [ %65, %331 ]
  %333 = add nuw nsw i32 %.081.i.i.i, 1
  %334 = sdiv i32 %.06480.i.i.i, %25
  %.not.i.i.i = icmp eq i32 %334, 0
  br i1 %.not.i.i.i, label %.lr.ph97.i.i.i, label %.lr.ph.i.i.i, !llvm.loop !125

.lr.ph97.i.i.i:                                   ; preds = %.lr.ph.i.i.i
  %335 = tail call i32 @llvm.ppu.read.tix.sreg.ntid.z()
  %336 = mul i32 %11, %10
  %337 = mul i32 %336, %335
  %338 = add nsw i32 %13, 1
  %.not75.not82.i.i.i = icmp slt i32 %338, %25
  br label %339

._crit_edge98.i.i.i:                              ; preds = %._crit_edge92.i.i.i, %._crit_edge.i.i.i.thread
  %.not74.i.i.i = icmp eq i32 %13, 0
  br i1 %.not74.i.i.i, label %381, label %_Z23sync_dissem_threadgroupIL13threadgroup_t2EEvi.exit.i

339:                                              ; preds = %._crit_edge92.i.i.i, %.lr.ph97.i.i.i
  %.06595.i.i.i = phi i32 [ 1, %.lr.ph97.i.i.i ], [ %379, %._crit_edge92.i.i.i ]
  %.06694.i.i.i = phi i32 [ 0, %.lr.ph97.i.i.i ], [ %380, %._crit_edge92.i.i.i ]
  br i1 %.not75.not82.i.i.i, label %.lr.ph85.i.i.i, label %._crit_edge92.i.i.i

.lr.ph85.i.i.i:                                   ; preds = %339, %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i.i.i
  %.06783.i.i.i = phi i32 [ %364, %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i.i.i ], [ %338, %339 ]
  %340 = mul nsw i32 %.06783.i.i.i, %.06595.i.i.i
  %.not76.i.i.i = icmp slt i32 %340, %23
  br i1 %.not76.i.i.i, label %341, label %.lr.ph91.i.i.i.preheader

341:                                              ; preds = %.lr.ph85.i.i.i
  %342 = add nsw i32 %340, %64
  %343 = srem i32 %342, %23
  %344 = mul nsw i32 %343, %33
  %345 = add nsw i32 %344, %31
  %346 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 4), align 4
  %347 = sext i32 %346 to i64
  %348 = getelementptr inbounds i64, ptr %57, i64 %347
  %349 = load volatile i64, ptr %61, align 8
  %350 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 32), align 8
  %351 = icmp slt i32 %350, 3
  br i1 %351, label %352, label %363

352:                                              ; preds = %341
  %353 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 56), align 8
  %354 = sext i32 %345 to i64
  %355 = getelementptr inbounds i64, ptr %353, i64 %354
  %356 = tail call fastcc i64 @__ppukernel_ldg_ulonglong(ptr %355) #17
  %357 = inttoptr i64 %356 to ptr
  %358 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 40), align 8
  %359 = ptrtoint ptr %348 to i64
  %360 = ptrtoint ptr %358 to i64
  %361 = sub i64 %359, %360
  %362 = getelementptr inbounds i8, ptr %357, i64 %361
  store volatile i64 %349, ptr %362, align 8
  br label %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i.i.i

363:                                              ; preds = %341
  notail call fastcc void @_Z30nvshmemi_transfer_amo_nonfetchIlEvPvT_i14nvshmemi_amo_t(ptr %348, i64 %349, i32 %345) #17
  br label %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i.i.i

_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i.i.i: ; preds = %363, %352
  %364 = add nsw i32 %.06783.i.i.i, %337
  %.not75.not.i.i.i = icmp slt i32 %364, %25
  br i1 %.not75.not.i.i.i, label %.lr.ph85.i.i.i, label %.lr.ph91.i.i.i.preheader, !llvm.loop !126

.lr.ph91.i.i.i.preheader:                         ; preds = %_Z27nvshmemi_signal_for_barrierIlEvPT_S0_i.exit.i.i.i, %.lr.ph85.i.i.i
  br label %.lr.ph91.i.i.i

.lr.ph91.i.i.i:                                   ; preds = %.lr.ph91.i.i.i.preheader, %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i.i.i
  %.06889.i.i.i = phi i32 [ %378, %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i.i.i ], [ %338, %.lr.ph91.i.i.i.preheader ]
  %365 = mul nsw i32 %.06889.i.i.i, %.06595.i.i.i
  %.not78.i.i.i = icmp slt i32 %365, %23
  br i1 %.not78.i.i.i, label %366, label %._crit_edge92.i.i.i

366:                                              ; preds = %.lr.ph91.i.i.i
  %367 = sub nsw i32 %64, %365
  %368 = icmp slt i32 %367, 0
  %369 = select i1 %368, i32 %23, i32 0
  %spec.select.i.i.i = add nsw i32 %369, %367
  %370 = mul nsw i32 %spec.select.i.i.i, %33
  %371 = add nsw i32 %370, %31
  %372 = sext i32 %371 to i64
  %373 = getelementptr inbounds i64, ptr %57, i64 %372
  %374 = load volatile i64, ptr %61, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %1)
  store volatile i64 %374, ptr %1, align 8
  br label %375

375:                                              ; preds = %375, %366
  %376 = load volatile i64, ptr %373, align 8
  %.0..0..0..0..0..0..0..0..0..0..0..0..i.i.i.i = load volatile i64, ptr %1, align 8
  %377 = icmp slt i64 %376, %.0..0..0..0..0..0..0..0..0..0..0..0..i.i.i.i
  br i1 %377, label %375, label %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i.i.i, !llvm.loop !73

_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i.i.i: ; preds = %375
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %1)
  %378 = add nsw i32 %.06889.i.i.i, %337
  %.not77.not.i.i.i = icmp slt i32 %378, %25
  br i1 %.not77.not.i.i.i, label %.lr.ph91.i.i.i, label %._crit_edge92.i.i.i, !llvm.loop !127

._crit_edge92.i.i.i:                              ; preds = %_Z39nvshmemi_wait_until_greater_than_equalsIVlEvPVT_S1_i.exit.i.i.i, %.lr.ph91.i.i.i, %339
  %379 = mul nsw i32 %.06595.i.i.i, %25
  tail call fastcc void @__ppukernel_syncthreads_void() #22
  %380 = add nuw i32 %.06694.i.i.i, 1
  %exitcond.not.i.i.i = icmp eq i32 %.06694.i.i.i, %.081.i.i.i
  br i1 %exitcond.not.i.i.i, label %._crit_edge98.i.i.i, label %339, !llvm.loop !128

381:                                              ; preds = %._crit_edge98.i.i.i
  %382 = load volatile i64, ptr %61, align 8
  %383 = add nsw i64 %382, 1
  store volatile i64 %383, ptr %61, align 8
  br label %_Z23sync_dissem_threadgroupIL13threadgroup_t2EEvi.exit.i

_Z23sync_dissem_threadgroupIL13threadgroup_t2EEvi.exit.i: ; preds = %381, %._crit_edge98.i.i.i
  tail call fastcc void @__ppukernel_syncthreads_void() #22
  br label %_Z30nvshmemi_sync_algo_threadgroupIL13threadgroup_t2EEvi.exit

_Z30nvshmemi_sync_algo_threadgroupIL13threadgroup_t2EEvi.exit: ; preds = %_Z28sync_dissem_pow2_threadgroupILi2ELi1EL13threadgroup_t2EEvi.exit.i, %_Z28sync_dissem_pow2_threadgroupILi4ELi2EL13threadgroup_t2EEvi.exit.i, %_Z28sync_dissem_pow2_threadgroupILi8ELi3EL13threadgroup_t2EEvi.exit.i, %_Z28sync_dissem_pow2_threadgroupILi16ELi4EL13threadgroup_t2EEvi.exit.i, %_Z28sync_dissem_pow2_threadgroupILi32ELi5EL13threadgroup_t2EEvi.exit.i, %_Z23sync_dissem_threadgroupIL13threadgroup_t2EEvi.exit.i
  %384 = icmp eq i32 %13, 0
  %385 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 32), align 8
  %386 = icmp sgt i32 %385, 8
  %or.cond = select i1 %384, i1 %386, i1 false
  br i1 %or.cond, label %387, label %388

387:                                              ; preds = %_Z30nvshmemi_sync_algo_threadgroupIL13threadgroup_t2EEvi.exit
  notail call fastcc void @_Z47nvshmemi_transfer_enforce_consistency_at_targetb() #17
  br label %388

388:                                              ; preds = %387, %_Z30nvshmemi_sync_algo_threadgroupIL13threadgroup_t2EEvi.exit
  tail call fastcc void @__ppukernel_syncthreads_void() #22
  ret void
}

; Function Attrs: convergent mustprogress noinline nounwind null_pointer_is_valid
define internal fastcc void @_Z23nvshmemi_transfer_quietIL13threadgroup_t2EEvb() unnamed_addr #40 section ".text.compute" {
  %1 = tail call i32 @llvm.ppu.read.tix.sreg.tid.x()
  %2 = tail call i32 @llvm.ppu.read.tix.sreg.tid.y()
  %3 = tail call i32 @llvm.ppu.read.tix.sreg.tid.z()
  %4 = tail call i32 @llvm.ppu.read.tix.sreg.ntid.x()
  %5 = tail call i32 @llvm.ppu.read.tix.sreg.ntid.y()
  %6 = mul i32 %4, %2
  %7 = add i32 %6, %1
  %8 = load i32, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 24), align 8
  %9 = icmp ne i32 %8, 2
  %10 = mul i32 %3, %4
  %11 = mul i32 %10, %5
  %12 = sub i32 0, %11
  %13 = icmp ne i32 %7, %12
  %or.cond = select i1 %9, i1 true, i1 %13
  br i1 %or.cond, label %26, label %14

14:                                               ; preds = %0
  %15 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 680), align 8
  %16 = load volatile i64, ptr %15, align 8
  %17 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 704), align 8
  %18 = load i64, ptr %17, align 8
  br label %19

19:                                               ; preds = %19, %14
  %.0.i.i = phi i64 [ %18, %14 ], [ %21, %19 ]
  %20 = tail call i64 @llvm.umax.i64(i64 %.0.i.i, i64 %16)
  %21 = tail call fastcc i64 @__ppukernel_atomicCAS_u64(ptr %17, i64 %.0.i.i, i64 %20) #17
  %.not.i.i = icmp eq i64 %21, %20
  br i1 %.not.i.i, label %_ZL17atomicMaxUsingCASIyET_PS0_S0_.exit.i, label %19, !llvm.loop !97

_ZL17atomicMaxUsingCASIyET_PS0_S0_.exit.i:        ; preds = %19
  %22 = load ptr, ptr addrspace(4) getelementptr inbounds nuw (i8, ptr addrspace(4) @nvshmemi_device_state_d, i32 712), align 8
  br label %23

23:                                               ; preds = %23, %_ZL17atomicMaxUsingCASIyET_PS0_S0_.exit.i
  %24 = load volatile i64, ptr %22, align 8
  %25 = icmp ult i64 %24, %16
  br i1 %25, label %23, label %_Z20nvshmemi_proxy_quietb.exit, !llvm.loop !98

_Z20nvshmemi_proxy_quietb.exit:                   ; preds = %23
  tail call fastcc void @__ppukernel_threadfence_system_void() #17
  br label %26

26:                                               ; preds = %_Z20nvshmemi_proxy_quietb.exit, %0
  tail call fastcc void @__ppukernel_syncthreads_void() #22
  ret void
}

; Function Attrs: nofree nosync nounwind speculatable memory(none)
declare dso_local i64 @llvm.ppu.read.printf.buf.addr() #9

; Function Attrs: nofree nosync nounwind memory(none)
declare i32 @llvm.ppu.read.tix.sreg.ctaid.x() #12

; Function Attrs: nofree nosync nounwind memory(none)
declare i32 @llvm.ppu.read.tix.sreg.nctaid.x() #12

; Function Attrs: nofree nosync nounwind memory(none)
declare i32 @llvm.ppu.read.tix.sreg.ctaid.y() #12

; Function Attrs: nofree nosync nounwind memory(none)
declare i32 @llvm.ppu.read.tix.sreg.tid.x() #12

; Function Attrs: nofree nosync nounwind memory(none)
declare i32 @llvm.ppu.read.tix.sreg.ntid.x() #12

; Function Attrs: nofree nosync nounwind memory(none)
declare i32 @llvm.ppu.read.tix.sreg.tid.y() #12

; Function Attrs: nofree nosync nounwind memory(none)
declare i32 @llvm.ppu.read.tix.sreg.ntid.y() #12

; Function Attrs: nofree nosync nounwind memory(none)
declare i32 @llvm.ppu.read.tix.sreg.tid.z() #12

; Function Attrs: nofree nosync nounwind memory(none)
declare i32 @llvm.ppu.read.tix.sreg.ntid.z() #12

; Function Attrs: nofree nosync nounwind memory(none)
declare i32 @llvm.ppu.read.tix.sreg.ctaid.z() #12

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.copysign.f32(float, float) #41

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #41

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umax.i64(i64, i64) #41

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #41

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #41

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare half @llvm.fabs.f16(half) #41

attributes #0 = { "host-constant" }
attributes #1 = { nounwind "nvvm.reqntid"="128" }
attributes #2 = { mustprogress nofree nosync nounwind null_pointer_is_valid willreturn memory(none) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+ptx32" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind null_pointer_is_valid willreturn memory(none) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+ptx32" }
attributes #4 = { convergent mustprogress nofree nounwind null_pointer_is_valid willreturn memory(none) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "ppu-ftz-off" "stack-protector-buffer-size"="8" "target-features"="+ptx32" }
attributes #5 = { convergent mustprogress nofree nounwind null_pointer_is_valid willreturn memory(none) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+ptx32" }
attributes #6 = { alwaysinline mustprogress nounwind null_pointer_is_valid "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+ptx32" }
attributes #7 = { convergent mustprogress noinline nounwind null_pointer_is_valid "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+ptx32" }
attributes #8 = { convergent nomerge nounwind }
attributes #9 = { nofree nosync nounwind speculatable memory(none) }
attributes #10 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #11 = { convergent nounwind null_pointer_is_valid memory(inaccessiblemem: readwrite) "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #12 = { nofree nosync nounwind memory(none) }
attributes #13 = { convergent nofree nounwind memory(none) }
attributes #14 = { mustprogress nofree norecurse nounwind null_pointer_is_valid willreturn memory(argmem: readwrite) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+ptx32" }
attributes #15 = { mustprogress nofree norecurse nounwind null_pointer_is_valid willreturn memory(argmem: readwrite) "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #16 = { convergent nomerge nounwind memory(inaccessiblemem: readwrite) }
attributes #17 = { nounwind }
attributes #18 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #19 = { mustprogress norecurse nounwind null_pointer_is_valid "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+ptx32" }
attributes #20 = { convergent nounwind null_pointer_is_valid "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+ptx32" }
attributes #21 = { convergent mustprogress nofree noinline norecurse nounwind null_pointer_is_valid willreturn memory(none) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "ppu-lateinline" "stack-protector-buffer-size"="8" "target-features"="+ptx32" }
attributes #22 = { convergent nounwind }
attributes #23 = { mustprogress nofree norecurse nosync nounwind null_pointer_is_valid willreturn memory(none) "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #24 = { mustprogress nofree noinline nosync nounwind null_pointer_is_valid willreturn memory(none) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+ptx32" }
attributes #25 = { convergent mustprogress nofree noinline nounwind null_pointer_is_valid willreturn memory(none) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "ppu-ftz-off" "stack-protector-buffer-size"="8" "target-features"="+ptx32" }
attributes #26 = { convergent inlinehint mustprogress nounwind null_pointer_is_valid "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="ppu001" "target-features"="+ppu001,+ptx32" }
attributes #27 = { mustprogress nofree noinline norecurse nounwind null_pointer_is_valid "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+ptx32" }
attributes #28 = { nofree noinline norecurse nounwind null_pointer_is_valid "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+ptx32" }
attributes #29 = { mustprogress noinline nounwind null_pointer_is_valid "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="ppu001" "target-features"="+ppu001,+ptx32" }
attributes #30 = { inlinehint mustprogress nofree norecurse nounwind null_pointer_is_valid "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="ppu001" "target-features"="+ppu001,+ptx32" }
attributes #31 = { mustprogress nofree noinline norecurse nounwind null_pointer_is_valid "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="ppu001" "target-features"="+ppu001,+ptx32" }
attributes #32 = { mustprogress nofree norecurse nounwind null_pointer_is_valid willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+ptx32" }
attributes #33 = { mustprogress nofree norecurse nounwind null_pointer_is_valid willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #34 = { mustprogress nofree norecurse nounwind null_pointer_is_valid willreturn memory(argmem: readwrite, inaccessiblemem: readwrite) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+ptx32" }
attributes #35 = { mustprogress nofree norecurse nounwind null_pointer_is_valid willreturn memory(argmem: readwrite, inaccessiblemem: readwrite) "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #36 = { mustprogress nofree norecurse nounwind null_pointer_is_valid willreturn memory(argmem: read) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+ptx32" }
attributes #37 = { nofree nounwind memory(argmem: read) }
attributes #38 = { convergent mustprogress noinline norecurse nounwind null_pointer_is_valid "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+ptx32" }
attributes #39 = { mustprogress nofree noinline nounwind null_pointer_is_valid "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="ppu001" "target-features"="+ppu001,+ptx32" }
attributes #40 = { convergent mustprogress noinline nounwind null_pointer_is_valid "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="ppu001" "target-features"="+ppu001,+ptx32" }
attributes #41 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #42 = { convergent nounwind willreturn memory(none) }
attributes #43 = { nounwind willreturn memory(none) }
attributes #44 = { memory(none) }
attributes #45 = { disable_sanitizer_instrumentation nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12, !13}
!llvm.build.commands = !{!14}
!ppu.module.id = !{!15}
!ppu.bc.type = !{!16}
!ppu.packed.struct.\3A\3Acooperative_groups\3A\3A__v1\3A\3Athread_group\3A\3Agroup_data = !{!17}
!ppu.packed.struct.__ubsan\3A\3ADiag\3A\3AArg = !{!18, !18}
!ppu.packed.class.__ubsan\3A\3ADiag = !{!19, !19}
!ppu.packed.class.__ubsan\3A\3ATypeDescriptor = !{!17, !17, !17}
!ppu.packed.struct.__ubsan\3A\3ATypeMismatchData = !{!20}
!ppu.packed.struct.__ubsan\3A\3AImplicitConversionData = !{!20}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "triton", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly)
!1 = !DIFile(filename: "test_nvshmem_api.py", directory: "/ppuswhome/xiao.han/workspace/Triton-distributed/./python/triton_dist/test/nvidia")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 4, !"nvvm-reflect-ftz", i32 1}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 4, !"hggc-reflect-fastmath", i32 0}
!6 = !{i32 4, !"hggc-reflect-fmad", i32 1}
!7 = !{i32 4, !"hggc-reflect-precdiv", i32 1}
!8 = !{i32 4, !"hggc-reflect-precsqrt", i32 1}
!9 = !{i32 4, !"hggc-reflect-strictftz", i32 0}
!10 = !{i32 4, !"hggc-reflect-simtbranch", i32 1}
!11 = !{i32 4, !"hggc-reflect-mathcfg", i32 15}
!12 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!13 = !{!"clang version 13.0.1 (0.0.0-a4cb03)"}
!14 = !{!"/usr/local/PPU_SDK/bin/clang -cc1 -triple ppu -aux-triple x86_64-unknown-linux-gnu -emit-llvm-bc -emit-llvm-uselists -disable-free -disable-llvm-verifier -discard-value-names -main-file-name init_device.cu -main-file-name-with-path /ppuswhome/wensuyang.wsy/workspace/docker/sailSHMEM/src/device/init/init_device.cu -mrelocation-model static -fno-delete-null-pointer-checks -mframe-pointer=none -relaxed-aliasing -fno-strict-return -fno-rounding-math -fno-verbose-asm -no-integrated-as -mconstructor-aliases -aux-target-cpu x86-64 -disable-O0-optnone -fcuda-is-device -fcuda-allow-variadic-functions -mlink-builtin-bitcode /usr/local/PPU_SDK/include/hgrt/details/system/clang/13.0.1/include/libppudevice.bc --hggc-bc-version=hgvm_v1 --hggc-simt-branch -target-feature +ppu001 -target-sdk-version=0.0 -target-cpu ppu001 -debugger-tuning=gdb -fno-dwarf-directory-asm -fdebug-ranges-base-address -fcoverage-compilation-dir=/ppuswhome/wensuyang.wsy/workspace/docker/sailSHMEM/build/src/llvm_lib -resource-dir /usr/local/PPU_SDK/include/hgrt/details/system/clang/13.0.1 -use-gcc-builtins -no-round-trip-args -internal-isystem /usr/local/PPU_SDK/include/hgrt/details/system/clang/13.0.1/include -include gcc_x86imm_builtins.h -include gcc_builtins.h -hgfb-stub-name /tmp/init_device-82ed82.hgfb.c -hggc-host-stub-name /tmp/init_device-host-4c6cb0.cpp -O1 -std=c++11 -fdeprecated-macro -fno-autolink -fdebug-compilation-dir=/ppuswhome/wensuyang.wsy/workspace/docker/sailSHMEM/build/src/llvm_lib -ferror-limit 19 -femit-all-decls --hggc-splitter-is-on -fgnuc-version=13.3.0 -fdelayed-template-parsing -fcxx-exceptions -fexceptions -fcolor-diagnostics -disable-llvm-passes -cuid=2bc1975862d514a9 -fcuda-allow-variadic-functions -D__GCC_HAVE_DWARF2_CFI_ASM=1 -o libnvshmem_device.bc -x hggc-cpp-output /tmp/init_device-8d7b13.hggci"}
!15 = !{!"_18DQ5JTNCKREK"}
!16 = !{!"hgvm_v1"}
!17 = !{i32 3}
!18 = !{i32 1}
!19 = !{i32 4, i32 8}
!20 = !{i32 4}
!21 = distinct !DISubprogram(name: "_nvshmem_broadcast", linkageName: "_nvshmem_broadcast", scope: !1, file: !1, line: 518, type: !22, scopeLine: 518, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!22 = !DISubroutineType(cc: DW_CC_normal, types: !23)
!23 = !{}
!24 = !DILocation(line: 522, column: 94, scope: !21)
!25 = !DILocation(line: 527, column: 4, scope: !21)
!26 = !{i32 0, i32 33}
!27 = !{!28, !29, i64 12}
!28 = !{!"_ZTS5uint4", !29, i64 0, !29, i64 4, !29, i64 8, !29, i64 12}
!29 = !{!"int", !30, i64 0}
!30 = !{!"omnipotent char", !31, i64 0}
!31 = !{!"Simple C++ TBAA"}
!32 = !{!28, !29, i64 8}
!33 = !{!28, !29, i64 4}
!34 = !{!28, !29, i64 0}
!35 = !{!29, !29, i64 0}
!36 = distinct !{!36, !37, !38}
!37 = !{!"llvm.loop.mustprogress"}
!38 = !{!"llvm.loop.unroll.disable"}
!39 = distinct !{!39, !37, !38}
!40 = distinct !{!40, !37, !38}
!41 = distinct !{!41, !37, !38}
!42 = distinct !{!42, !37, !38}
!43 = distinct !{!43, !37, !38}
!44 = distinct !{!44, !37, !38}
!45 = distinct !{!45, !37, !38}
!46 = distinct !{!46, !37, !38}
!47 = distinct !{!47, !37, !38}
!48 = distinct !{!48, !37, !38}
!49 = distinct !{!49, !37, !38}
!50 = distinct !{!50, !37, !38}
!51 = !{!52, !53, i64 0}
!52 = !{!"_ZTS17PrintBufferHeader", !53, i64 0, !53, i64 8, !53, i64 16, !53, i64 24, !53, i64 32, !53, i64 40}
!53 = !{!"long long", !30, i64 0}
!54 = !{!52, !53, i64 8}
!55 = !{!52, !53, i64 24}
!56 = distinct !{!56, !37, !38}
!57 = !{!53, !53, i64 0}
!58 = distinct !{!58, !37, !38}
!59 = !{!52, !53, i64 32}
!60 = !{!61, !29, i64 8}
!61 = !{!"_ZTS22PrintBufferEntryHeader", !62, i64 0, !29, i64 8, !29, i64 12, !29, i64 16, !29, i64 20, !53, i64 24, !53, i64 32, !53, i64 40, !53, i64 48}
!62 = !{!"_ZTS25PrintBufferEntrySubheader", !53, i64 0, !53, i64 4, !53, i64 7}
!63 = !{!61, !29, i64 12}
!64 = !{!61, !53, i64 32}
!65 = !{!61, !53, i64 40}
!66 = !{!61, !53, i64 48}
!67 = !{!61, !29, i64 16}
!68 = !{!61, !29, i64 20}
!69 = !{!61, !53, i64 24}
!70 = !{!30, !30, i64 0}
!71 = distinct !{!71, !37, !38}
!72 = distinct !{!72, !37, !38}
!73 = distinct !{!73, !37, !38}
!74 = distinct !{!74, !37, !38}
!75 = distinct !{!75, !37, !38}
!76 = distinct !{!76, !37, !38}
!77 = distinct !{!77, !37, !38}
!78 = distinct !{!78, !37, !38}
!79 = distinct !{!79, !37, !38}
!80 = distinct !{!80, !37, !38}
!81 = distinct !{!81, !37, !38}
!82 = distinct !{!82, !37, !38}
!83 = distinct !{!83, !37, !38}
!84 = distinct !{!84, !37, !38}
!85 = distinct !{!85, !37, !38}
!86 = distinct !{!86, !37, !38}
!87 = distinct !{!87, !37, !38}
!88 = distinct !{!88, !37, !38}
!89 = distinct !{!89, !37, !38}
!90 = distinct !{!90, !37, !38}
!91 = !{i64 2719087}
!92 = distinct !{!92, !37, !38}
!93 = distinct !{!93, !37, !38}
!94 = distinct !{!94, !37, !38}
!95 = distinct !{!95, !37, !38}
!96 = distinct !{!96, !37, !38}
!97 = distinct !{!97, !37, !38}
!98 = distinct !{!98, !37, !38}
!99 = distinct !{!99, !37, !38}
!100 = distinct !{!100, !37, !38}
!101 = distinct !{!101, !37, !38}
!102 = distinct !{!102, !37, !38}
!103 = distinct !{!103, !37, !38, !104, !105}
!104 = !{!"llvm.loop.isvectorized", i32 1}
!105 = !{!"llvm.loop.unroll.runtime.disable"}
!106 = distinct !{!106, !37, !38, !104}
!107 = distinct !{!107, !37, !38, !104, !105}
!108 = distinct !{!108, !37, !38, !104}
!109 = !{i8 0, i8 2}
!110 = distinct !{!110, !37, !38}
!111 = distinct !{!111, !37, !38}
!112 = distinct !{!112, !37, !38}
!113 = distinct !{!113, !37, !38}
!114 = distinct !{!114, !37, !38}
!115 = distinct !{!115, !37, !38}
!116 = distinct !{!116, !37, !38}
!117 = distinct !{!117, !37, !38}
!118 = distinct !{!118, !37, !38}
!119 = distinct !{!119, !37, !38}
!120 = distinct !{!120, !37, !38}
!121 = distinct !{!121, !37, !38}
!122 = distinct !{!122, !37, !38}
!123 = distinct !{!123, !37, !38}
!124 = distinct !{!124, !37, !38}
!125 = distinct !{!125, !37, !38}
!126 = distinct !{!126, !37, !38}
!127 = distinct !{!127, !37, !38}
!128 = distinct !{!128, !37, !38}
