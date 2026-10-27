; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @rocdl_special_regs() {
  %1 = call i32 @llvm.amdgcn.workitem.id.x()
  %2 = call i32 @llvm.amdgcn.workitem.id.y()
  %3 = call i32 @llvm.amdgcn.workitem.id.z()
  %4 = call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = call i32 @llvm.amdgcn.workgroup.id.z()
  %7 = call i64 @__ockl_get_local_size(i32 0)
  %8 = call i64 @__ockl_get_local_size(i32 1)
  %9 = call i64 @__ockl_get_local_size(i32 2)
  %10 = call i64 @__ockl_get_num_groups(i32 0)
  %11 = call i64 @__ockl_get_num_groups(i32 1)
  %12 = call i64 @__ockl_get_num_groups(i32 2)
  %13 = call range(i32 0, 64) i32 @llvm.amdgcn.workitem.id.x()
  ret i32 %1
}

define amdgpu_kernel void @kernel_func() #0 {
  ret void
}

define amdgpu_kernel void @kernel_func_workgroups() #1 {
  ret void
}

define amdgpu_kernel void @known_block_sizes() #2 !reqd_work_group_size !1 {
  ret void
}

define amdgpu_kernel void @kernel_func_no_uniform_work_groups() #3 {
  ret void
}

define i32 @rocdl.lane_id() {
  %1 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %2 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %1)
  ret i32 %2
}

define i32 @rocdl.swizzle(i32 %0) {
  %2 = call i32 @llvm.amdgcn.ds.swizzle(i32 %0, i32 100)
  ret i32 %2
}

define i32 @rocdl.bpermute(i32 %0) {
  %2 = call i32 @llvm.amdgcn.ds.bpermute(i32 10, i32 %0)
  ret i32 %2
}

define i32 @rocdl.ballot32(i1 %0) {
  %2 = call i32 @llvm.amdgcn.ballot.i32(i1 %0)
  ret i32 %2
}

define i64 @rocdl.ballot64(i1 %0) {
  %2 = call i64 @llvm.amdgcn.ballot.i64(i1 %0)
  ret i64 %2
}

define void @rocdl.waitcnt() {
  call void @llvm.amdgcn.s.waitcnt(i32 0)
  ret void
}

define void @rocdl.s.barrier() {
  call void @llvm.amdgcn.s.barrier()
  ret void
}

define void @rocdl.barrier() {
  fence syncscope("workgroup") release
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

define void @rocdl.setprio() {
  call void @llvm.amdgcn.s.setprio(i16 0)
  call void @llvm.amdgcn.s.setprio(i16 1)
  ret void
}

define void @rocdl.schedbarrier() {
  call void @llvm.amdgcn.sched.barrier(i32 0)
  call void @llvm.amdgcn.sched.barrier(i32 1)
  ret void
}

define <32 x float> @rocdl.xdlops(float %0, float %1, <32 x float> %2, i32 %3, <16 x float> %4, <4 x float> %5, <4 x half> %6, <32 x i32> %7, <16 x i32> %8, <4 x i32> %9, <2 x i16> %10, i64 %11) {
  %13 = call <32 x float> @llvm.amdgcn.mfma.f32.32x32x1f32(float %0, float %1, <32 x float> %2, i32 42, i32 42, i32 42)
  %14 = call <16 x float> @llvm.amdgcn.mfma.f32.16x16x1f32(float %0, float %1, <16 x float> %4, i32 42, i32 42, i32 42)
  %15 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x4f32(float %0, float %1, <4 x float> %5, i32 42, i32 42, i32 42)
  %16 = call <4 x float> @llvm.amdgcn.mfma.f32.4x4x1f32(float %0, float %1, <4 x float> %5, i32 42, i32 42, i32 42)
  %17 = call <16 x float> @llvm.amdgcn.mfma.f32.32x32x2f32(float %0, float %1, <16 x float> %4, i32 42, i32 42, i32 42)
  %18 = call <32 x float> @llvm.amdgcn.mfma.f32.32x32x4f16(<4 x half> %6, <4 x half> %6, <32 x float> %2, i32 42, i32 42, i32 42)
  %19 = call <16 x float> @llvm.amdgcn.mfma.f32.16x16x4f16(<4 x half> %6, <4 x half> %6, <16 x float> %4, i32 42, i32 42, i32 42)
  %20 = call <4 x float> @llvm.amdgcn.mfma.f32.4x4x4f16(<4 x half> %6, <4 x half> %6, <4 x float> %5, i32 42, i32 42, i32 42)
  %21 = call <16 x float> @llvm.amdgcn.mfma.f32.32x32x8f16(<4 x half> %6, <4 x half> %6, <16 x float> %4, i32 42, i32 42, i32 42)
  %22 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %6, <4 x half> %6, <4 x float> %5, i32 42, i32 42, i32 42)
  %23 = call <32 x i32> @llvm.amdgcn.mfma.i32.32x32x4i8(i32 %3, i32 %3, <32 x i32> %7, i32 42, i32 42, i32 42)
  %24 = call <16 x i32> @llvm.amdgcn.mfma.i32.16x16x4i8(i32 %3, i32 %3, <16 x i32> %8, i32 42, i32 42, i32 42)
  %25 = call <4 x i32> @llvm.amdgcn.mfma.i32.4x4x4i8(i32 %3, i32 %3, <4 x i32> %9, i32 42, i32 42, i32 42)
  %26 = call <16 x i32> @llvm.amdgcn.mfma.i32.32x32x8i8(i32 %3, i32 %3, <16 x i32> %8, i32 42, i32 42, i32 42)
  %27 = call <4 x i32> @llvm.amdgcn.mfma.i32.16x16x16i8(i32 %3, i32 %3, <4 x i32> %9, i32 42, i32 42, i32 42)
  %28 = call <32 x float> @llvm.amdgcn.mfma.f32.32x32x2bf16(<2 x i16> %10, <2 x i16> %10, <32 x float> %2, i32 42, i32 42, i32 42)
  %29 = call <16 x float> @llvm.amdgcn.mfma.f32.16x16x2bf16(<2 x i16> %10, <2 x i16> %10, <16 x float> %4, i32 42, i32 42, i32 42)
  %30 = call <4 x float> @llvm.amdgcn.mfma.f32.4x4x2bf16(<2 x i16> %10, <2 x i16> %10, <4 x float> %5, i32 42, i32 42, i32 42)
  %31 = call <16 x float> @llvm.amdgcn.mfma.f32.32x32x4bf16(<2 x i16> %10, <2 x i16> %10, <16 x float> %4, i32 42, i32 42, i32 42)
  %32 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x8bf16(<2 x i16> %10, <2 x i16> %10, <4 x float> %5, i32 42, i32 42, i32 42)
  %33 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %11, i64 %11, <4 x float> %5, i32 42, i32 42, i32 42)
  %34 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.fp8(i64 %11, i64 %11, <4 x float> %5, i32 42, i32 42, i32 42)
  %35 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.bf8(i64 %11, i64 %11, <4 x float> %5, i32 42, i32 42, i32 42)
  %36 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %11, i64 %11, <4 x float> %5, i32 42, i32 42, i32 42)
  %37 = call <16 x float> @llvm.amdgcn.mfma.f32.32x32x16.bf8.bf8(i64 %11, i64 %11, <16 x float> %4, i32 42, i32 42, i32 42)
  %38 = call <16 x float> @llvm.amdgcn.mfma.f32.32x32x16.bf8.fp8(i64 %11, i64 %11, <16 x float> %4, i32 42, i32 42, i32 42)
  %39 = call <16 x float> @llvm.amdgcn.mfma.f32.32x32x16.fp8.bf8(i64 %11, i64 %11, <16 x float> %4, i32 42, i32 42, i32 42)
  %40 = call <16 x float> @llvm.amdgcn.mfma.f32.32x32x16.bf8.bf8(i64 %11, i64 %11, <16 x float> %4, i32 42, i32 42, i32 42)
  ret <32 x float> %13
}

define <8 x float> @rocdl.wmma(<8 x float> %0, <16 x half> %1, <16 x i16> %2, <8 x i32> %3, <2 x i32> %4, <4 x i32> %5, <4 x float> %6, <8 x half> %7, <8 x i16> %8) {
  %10 = call <8 x float> @llvm.amdgcn.wmma.f32.16x16x16.f16.v8f32.v16f16(<16 x half> %1, <16 x half> %1, <8 x float> %0)
  %11 = call <8 x float> @llvm.amdgcn.wmma.f32.16x16x16.bf16.v8f32.v16i16(<16 x i16> %2, <16 x i16> %2, <8 x float> %0)
  %12 = call <16 x half> @llvm.amdgcn.wmma.f16.16x16x16.f16.v16f16.v16f16(<16 x half> %1, <16 x half> %1, <16 x half> %1, i1 false)
  %13 = call <16 x i16> @llvm.amdgcn.wmma.bf16.16x16x16.bf16.v16i16.v16i16(<16 x i16> %2, <16 x i16> %2, <16 x i16> %2, i1 false)
  %14 = call <8 x i32> @llvm.amdgcn.wmma.i32.16x16x16.iu8.v8i32.v4i32(i1 false, <4 x i32> %5, i1 false, <4 x i32> %5, <8 x i32> %3, i1 false)
  %15 = call <8 x i32> @llvm.amdgcn.wmma.i32.16x16x16.iu4.v8i32.v2i32(i1 false, <2 x i32> %4, i1 false, <2 x i32> %4, <8 x i32> %3, i1 false)
  %16 = call <4 x float> @llvm.amdgcn.wmma.f32.16x16x16.f16.v4f32.v16f16(<16 x half> %1, <16 x half> %1, <4 x float> %6)
  %17 = call <4 x float> @llvm.amdgcn.wmma.f32.16x16x16.bf16.v4f32.v16i16(<16 x i16> %2, <16 x i16> %2, <4 x float> %6)
  %18 = call <8 x half> @llvm.amdgcn.wmma.f16.16x16x16.f16.v8f16.v16f16(<16 x half> %1, <16 x half> %1, <8 x half> %7, i1 false)
  %19 = call <8 x i16> @llvm.amdgcn.wmma.bf16.16x16x16.bf16.v8i16.v16i16(<16 x i16> %2, <16 x i16> %2, <8 x i16> %8, i1 false)
  %20 = call <4 x i32> @llvm.amdgcn.wmma.i32.16x16x16.iu8.v4i32.v4i32(i1 false, <4 x i32> %5, i1 false, <4 x i32> %5, <4 x i32> %5, i1 false)
  %21 = call <4 x i32> @llvm.amdgcn.wmma.i32.16x16x16.iu4.v4i32.v2i32(i1 false, <2 x i32> %4, i1 false, <2 x i32> %4, <4 x i32> %5, i1 false)
  ret <8 x float> %10
}

define ptr addrspace(8) @rocdl.make.buffer.rsrc(ptr %0, i16 %1, i32 %2, i32 %3) {
  %5 = call ptr addrspace(8) @llvm.amdgcn.make.buffer.rsrc.p0(ptr %0, i16 %1, i32 %2, i32 %3)
  ret ptr addrspace(8) %5
}

define void @rocdl.raw.ptr.buffer(ptr addrspace(8) %0, i32 %1, i32 %2, i32 %3, <2 x i32> %4, <4 x i32> %5) {
  %7 = call i32 @llvm.amdgcn.raw.ptr.buffer.load.i32(ptr addrspace(8) %0, i32 %1, i32 %2, i32 0)
  %8 = call <2 x i32> @llvm.amdgcn.raw.ptr.buffer.load.v2i32(ptr addrspace(8) %0, i32 %1, i32 %2, i32 0)
  %9 = call <4 x i32> @llvm.amdgcn.raw.ptr.buffer.load.v4i32(ptr addrspace(8) %0, i32 %1, i32 %2, i32 0)
  call void @llvm.amdgcn.raw.ptr.buffer.store.i32(i32 %3, ptr addrspace(8) %0, i32 %1, i32 %2, i32 0)
  call void @llvm.amdgcn.raw.ptr.buffer.store.v2i32(<2 x i32> %4, ptr addrspace(8) %0, i32 %1, i32 %2, i32 0)
  call void @llvm.amdgcn.raw.ptr.buffer.store.v4i32(<4 x i32> %5, ptr addrspace(8) %0, i32 %1, i32 %2, i32 0)
  ret void
}

define void @rocdl.raw.ptr.buffer.atomic.f32(ptr addrspace(8) %0, i32 %1, i32 %2, float %3) {
  %5 = call float @llvm.amdgcn.raw.ptr.buffer.atomic.fadd.f32(float %3, ptr addrspace(8) %0, i32 %1, i32 %2, i32 0)
  %6 = call float @llvm.amdgcn.raw.ptr.buffer.atomic.fmax.f32(float %3, ptr addrspace(8) %0, i32 %1, i32 %2, i32 0)
  ret void
}

define void @rocdl.raw.ptr.buffer.atomic.i32(ptr addrspace(8) %0, i32 %1, i32 %2, i32 %3) {
  %5 = call i32 @llvm.amdgcn.raw.ptr.buffer.atomic.smax.i32(i32 %3, ptr addrspace(8) %0, i32 %1, i32 %2, i32 0)
  %6 = call i32 @llvm.amdgcn.raw.ptr.buffer.atomic.umin.i32(i32 %3, ptr addrspace(8) %0, i32 %1, i32 %2, i32 0)
  ret void
}

define i32 @rocdl.raw.ptr.buffer.atomic.cmpswap(ptr addrspace(8) %0, i32 %1, i32 %2, i32 %3, i32 %4) {
  %6 = call i32 @llvm.amdgcn.raw.ptr.buffer.atomic.cmpswap.i32(i32 %3, i32 %4, ptr addrspace(8) %0, i32 %1, i32 %2, i32 0)
  ret i32 %6
}

define void @rocdl.raw.buffer(<4 x i32> %0, i32 %1, i32 %2, i32 %3, <2 x i32> %4, <4 x i32> %5) {
  %7 = call i32 @llvm.amdgcn.raw.buffer.load.i32(<4 x i32> %0, i32 %1, i32 %2, i32 0)
  %8 = call <2 x i32> @llvm.amdgcn.raw.buffer.load.v2i32(<4 x i32> %0, i32 %1, i32 %2, i32 0)
  %9 = call <4 x i32> @llvm.amdgcn.raw.buffer.load.v4i32(<4 x i32> %0, i32 %1, i32 %2, i32 0)
  call void @llvm.amdgcn.raw.buffer.store.i32(i32 %3, <4 x i32> %0, i32 %1, i32 %2, i32 0)
  call void @llvm.amdgcn.raw.buffer.store.v2i32(<2 x i32> %4, <4 x i32> %0, i32 %1, i32 %2, i32 0)
  call void @llvm.amdgcn.raw.buffer.store.v4i32(<4 x i32> %5, <4 x i32> %0, i32 %1, i32 %2, i32 0)
  ret void
}

define void @rocdl.raw.buffer.atomic.f32(<4 x i32> %0, i32 %1, i32 %2, float %3) {
  %5 = call float @llvm.amdgcn.raw.buffer.atomic.fadd.f32(float %3, <4 x i32> %0, i32 %1, i32 %2, i32 0)
  %6 = call float @llvm.amdgcn.raw.buffer.atomic.fmax.f32(float %3, <4 x i32> %0, i32 %1, i32 %2, i32 0)
  ret void
}

define void @rocdl.raw.buffer.atomic.i32(<4 x i32> %0, i32 %1, i32 %2, i32 %3) {
  %5 = call i32 @llvm.amdgcn.raw.buffer.atomic.smax.i32(i32 %3, <4 x i32> %0, i32 %1, i32 %2, i32 0)
  %6 = call i32 @llvm.amdgcn.raw.buffer.atomic.umin.i32(i32 %3, <4 x i32> %0, i32 %1, i32 %2, i32 0)
  ret void
}

define i32 @rocdl.raw.buffer.atomic.cmpswap(<4 x i32> %0, i32 %1, i32 %2, i32 %3, i32 %4) {
  %6 = call i32 @llvm.amdgcn.raw.buffer.atomic.cmpswap.i32(i32 %3, i32 %4, <4 x i32> %0, i32 %1, i32 %2, i32 0)
  ret i32 %6
}

define i32 @rocdl_8bit_floats(i32 %0, i32 %1) {
  %3 = call float @llvm.amdgcn.cvt.f32.bf8(i32 %0, i32 0)
  %4 = call float @llvm.amdgcn.cvt.f32.fp8(i32 %0, i32 0)
  %5 = call i32 @llvm.amdgcn.cvt.pk.bf8.f32(float %3, float %4, i32 %0, i1 false)
  %6 = call i32 @llvm.amdgcn.cvt.pk.fp8.f32(float %3, float %4, i32 %5, i1 false)
  %7 = call i32 @llvm.amdgcn.cvt.sr.bf8.f32(float %3, i32 %1, i32 %6, i32 2)
  %8 = call i32 @llvm.amdgcn.cvt.sr.fp8.f32(float %4, i32 %1, i32 %7, i32 3)
  ret i32 %8
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workitem.id.x() #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workitem.id.y() #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workitem.id.z() #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.y() #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.z() #4

declare i64 @__ockl_get_local_size(i32)

declare i64 @__ockl_get_num_groups(i32)

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #5

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #5

; Function Attrs: convergent nocallback nofree nounwind willreturn memory(none)
declare i32 @llvm.amdgcn.ds.swizzle(i32, i32 immarg) #6

; Function Attrs: convergent nocallback nofree nounwind willreturn memory(none)
declare i32 @llvm.amdgcn.ds.bpermute(i32, i32) #6

; Function Attrs: convergent nocallback nofree nounwind willreturn memory(none)
declare i32 @llvm.amdgcn.ballot.i32(i1) #6

; Function Attrs: convergent nocallback nofree nounwind willreturn memory(none)
declare i64 @llvm.amdgcn.ballot.i64(i1) #6

; Function Attrs: nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.s.waitcnt(i32 immarg) #7

; Function Attrs: convergent nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #8

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.amdgcn.s.setprio(i16 immarg) #9

; Function Attrs: convergent nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.sched.barrier(i32 immarg) #8

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare <32 x float> @llvm.amdgcn.mfma.f32.32x32x1f32(float, float, <32 x float>, i32 immarg, i32 immarg, i32 immarg) #10

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare <16 x float> @llvm.amdgcn.mfma.f32.16x16x1f32(float, float, <16 x float>, i32 immarg, i32 immarg, i32 immarg) #10

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x float> @llvm.amdgcn.mfma.f32.16x16x4f32(float, float, <4 x float>, i32 immarg, i32 immarg, i32 immarg) #10

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x float> @llvm.amdgcn.mfma.f32.4x4x1f32(float, float, <4 x float>, i32 immarg, i32 immarg, i32 immarg) #10

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare <16 x float> @llvm.amdgcn.mfma.f32.32x32x2f32(float, float, <16 x float>, i32 immarg, i32 immarg, i32 immarg) #10

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare <32 x float> @llvm.amdgcn.mfma.f32.32x32x4f16(<4 x half>, <4 x half>, <32 x float>, i32 immarg, i32 immarg, i32 immarg) #10

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare <16 x float> @llvm.amdgcn.mfma.f32.16x16x4f16(<4 x half>, <4 x half>, <16 x float>, i32 immarg, i32 immarg, i32 immarg) #10

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x float> @llvm.amdgcn.mfma.f32.4x4x4f16(<4 x half>, <4 x half>, <4 x float>, i32 immarg, i32 immarg, i32 immarg) #10

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare <16 x float> @llvm.amdgcn.mfma.f32.32x32x8f16(<4 x half>, <4 x half>, <16 x float>, i32 immarg, i32 immarg, i32 immarg) #10

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half>, <4 x half>, <4 x float>, i32 immarg, i32 immarg, i32 immarg) #10

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare <32 x i32> @llvm.amdgcn.mfma.i32.32x32x4i8(i32, i32, <32 x i32>, i32 immarg, i32 immarg, i32 immarg) #10

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare <16 x i32> @llvm.amdgcn.mfma.i32.16x16x4i8(i32, i32, <16 x i32>, i32 immarg, i32 immarg, i32 immarg) #10

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x i32> @llvm.amdgcn.mfma.i32.4x4x4i8(i32, i32, <4 x i32>, i32 immarg, i32 immarg, i32 immarg) #10

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare <16 x i32> @llvm.amdgcn.mfma.i32.32x32x8i8(i32, i32, <16 x i32>, i32 immarg, i32 immarg, i32 immarg) #10

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x i32> @llvm.amdgcn.mfma.i32.16x16x16i8(i32, i32, <4 x i32>, i32 immarg, i32 immarg, i32 immarg) #10

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare <32 x float> @llvm.amdgcn.mfma.f32.32x32x2bf16(<2 x i16>, <2 x i16>, <32 x float>, i32 immarg, i32 immarg, i32 immarg) #10

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare <16 x float> @llvm.amdgcn.mfma.f32.16x16x2bf16(<2 x i16>, <2 x i16>, <16 x float>, i32 immarg, i32 immarg, i32 immarg) #10

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x float> @llvm.amdgcn.mfma.f32.4x4x2bf16(<2 x i16>, <2 x i16>, <4 x float>, i32 immarg, i32 immarg, i32 immarg) #10

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare <16 x float> @llvm.amdgcn.mfma.f32.32x32x4bf16(<2 x i16>, <2 x i16>, <16 x float>, i32 immarg, i32 immarg, i32 immarg) #10

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x float> @llvm.amdgcn.mfma.f32.16x16x8bf16(<2 x i16>, <2 x i16>, <4 x float>, i32 immarg, i32 immarg, i32 immarg) #10

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64, i64, <4 x float>, i32 immarg, i32 immarg, i32 immarg) #10

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.fp8(i64, i64, <4 x float>, i32 immarg, i32 immarg, i32 immarg) #10

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.bf8(i64, i64, <4 x float>, i32 immarg, i32 immarg, i32 immarg) #10

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64, i64, <4 x float>, i32 immarg, i32 immarg, i32 immarg) #10

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare <16 x float> @llvm.amdgcn.mfma.f32.32x32x16.bf8.bf8(i64, i64, <16 x float>, i32 immarg, i32 immarg, i32 immarg) #10

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare <16 x float> @llvm.amdgcn.mfma.f32.32x32x16.bf8.fp8(i64, i64, <16 x float>, i32 immarg, i32 immarg, i32 immarg) #10

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare <16 x float> @llvm.amdgcn.mfma.f32.32x32x16.fp8.bf8(i64, i64, <16 x float>, i32 immarg, i32 immarg, i32 immarg) #10

; Function Attrs: convergent nocallback nofree nounwind willreturn memory(none)
declare <8 x float> @llvm.amdgcn.wmma.f32.16x16x16.f16.v8f32.v16f16(<16 x half>, <16 x half>, <8 x float>) #6

; Function Attrs: convergent nocallback nofree nounwind willreturn memory(none)
declare <8 x float> @llvm.amdgcn.wmma.f32.16x16x16.bf16.v8f32.v16i16(<16 x i16>, <16 x i16>, <8 x float>) #6

; Function Attrs: convergent nocallback nofree nounwind willreturn memory(none)
declare <16 x half> @llvm.amdgcn.wmma.f16.16x16x16.f16.v16f16.v16f16(<16 x half>, <16 x half>, <16 x half>, i1 immarg) #6

; Function Attrs: convergent nocallback nofree nounwind willreturn memory(none)
declare <16 x i16> @llvm.amdgcn.wmma.bf16.16x16x16.bf16.v16i16.v16i16(<16 x i16>, <16 x i16>, <16 x i16>, i1 immarg) #6

; Function Attrs: convergent nocallback nofree nounwind willreturn memory(none)
declare <8 x i32> @llvm.amdgcn.wmma.i32.16x16x16.iu8.v8i32.v4i32(i1 immarg, <4 x i32>, i1 immarg, <4 x i32>, <8 x i32>, i1 immarg) #6

; Function Attrs: convergent nocallback nofree nounwind willreturn memory(none)
declare <8 x i32> @llvm.amdgcn.wmma.i32.16x16x16.iu4.v8i32.v2i32(i1 immarg, <2 x i32>, i1 immarg, <2 x i32>, <8 x i32>, i1 immarg) #6

; Function Attrs: convergent nocallback nofree nounwind willreturn memory(none)
declare <4 x float> @llvm.amdgcn.wmma.f32.16x16x16.f16.v4f32.v16f16(<16 x half>, <16 x half>, <4 x float>) #6

; Function Attrs: convergent nocallback nofree nounwind willreturn memory(none)
declare <4 x float> @llvm.amdgcn.wmma.f32.16x16x16.bf16.v4f32.v16i16(<16 x i16>, <16 x i16>, <4 x float>) #6

; Function Attrs: convergent nocallback nofree nounwind willreturn memory(none)
declare <8 x half> @llvm.amdgcn.wmma.f16.16x16x16.f16.v8f16.v16f16(<16 x half>, <16 x half>, <8 x half>, i1 immarg) #6

; Function Attrs: convergent nocallback nofree nounwind willreturn memory(none)
declare <8 x i16> @llvm.amdgcn.wmma.bf16.16x16x16.bf16.v8i16.v16i16(<16 x i16>, <16 x i16>, <8 x i16>, i1 immarg) #6

; Function Attrs: convergent nocallback nofree nounwind willreturn memory(none)
declare <4 x i32> @llvm.amdgcn.wmma.i32.16x16x16.iu8.v4i32.v4i32(i1 immarg, <4 x i32>, i1 immarg, <4 x i32>, <4 x i32>, i1 immarg) #6

; Function Attrs: convergent nocallback nofree nounwind willreturn memory(none)
declare <4 x i32> @llvm.amdgcn.wmma.i32.16x16x16.iu4.v4i32.v2i32(i1 immarg, <2 x i32>, i1 immarg, <2 x i32>, <4 x i32>, i1 immarg) #6

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare ptr addrspace(8) @llvm.amdgcn.make.buffer.rsrc.p0(ptr readnone, i16, i32, i32) #4

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare i32 @llvm.amdgcn.raw.ptr.buffer.load.i32(ptr addrspace(8) nocapture readonly, i32, i32, i32 immarg) #11

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <2 x i32> @llvm.amdgcn.raw.ptr.buffer.load.v2i32(ptr addrspace(8) nocapture readonly, i32, i32, i32 immarg) #11

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <4 x i32> @llvm.amdgcn.raw.ptr.buffer.load.v4i32(ptr addrspace(8) nocapture readonly, i32, i32, i32 immarg) #11

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.amdgcn.raw.ptr.buffer.store.i32(i32, ptr addrspace(8) nocapture writeonly, i32, i32, i32 immarg) #12

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.amdgcn.raw.ptr.buffer.store.v2i32(<2 x i32>, ptr addrspace(8) nocapture writeonly, i32, i32, i32 immarg) #12

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.amdgcn.raw.ptr.buffer.store.v4i32(<4 x i32>, ptr addrspace(8) nocapture writeonly, i32, i32, i32 immarg) #12

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare float @llvm.amdgcn.raw.ptr.buffer.atomic.fadd.f32(float, ptr addrspace(8) nocapture, i32, i32, i32 immarg) #13

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare float @llvm.amdgcn.raw.ptr.buffer.atomic.fmax.f32(float, ptr addrspace(8) nocapture, i32, i32, i32 immarg) #13

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare i32 @llvm.amdgcn.raw.ptr.buffer.atomic.smax.i32(i32, ptr addrspace(8) nocapture, i32, i32, i32 immarg) #13

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare i32 @llvm.amdgcn.raw.ptr.buffer.atomic.umin.i32(i32, ptr addrspace(8) nocapture, i32, i32, i32 immarg) #13

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare i32 @llvm.amdgcn.raw.ptr.buffer.atomic.cmpswap.i32(i32, i32, ptr addrspace(8) nocapture, i32, i32, i32 immarg) #13

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(read)
declare i32 @llvm.amdgcn.raw.buffer.load.i32(<4 x i32>, i32, i32, i32 immarg) #14

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(read)
declare <2 x i32> @llvm.amdgcn.raw.buffer.load.v2i32(<4 x i32>, i32, i32, i32 immarg) #14

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(read)
declare <4 x i32> @llvm.amdgcn.raw.buffer.load.v4i32(<4 x i32>, i32, i32, i32 immarg) #14

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.amdgcn.raw.buffer.store.i32(i32, <4 x i32>, i32, i32, i32 immarg) #15

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.amdgcn.raw.buffer.store.v2i32(<2 x i32>, <4 x i32>, i32, i32, i32 immarg) #15

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.amdgcn.raw.buffer.store.v4i32(<4 x i32>, <4 x i32>, i32, i32, i32 immarg) #15

; Function Attrs: nocallback nofree nounwind willreturn
declare float @llvm.amdgcn.raw.buffer.atomic.fadd.f32(float, <4 x i32>, i32, i32, i32 immarg) #7

; Function Attrs: nocallback nofree nounwind willreturn
declare float @llvm.amdgcn.raw.buffer.atomic.fmax.f32(float, <4 x i32>, i32, i32, i32 immarg) #7

; Function Attrs: nocallback nofree nounwind willreturn
declare i32 @llvm.amdgcn.raw.buffer.atomic.smax.i32(i32, <4 x i32>, i32, i32, i32 immarg) #7

; Function Attrs: nocallback nofree nounwind willreturn
declare i32 @llvm.amdgcn.raw.buffer.atomic.umin.i32(i32, <4 x i32>, i32, i32, i32 immarg) #7

; Function Attrs: nocallback nofree nounwind willreturn
declare i32 @llvm.amdgcn.raw.buffer.atomic.cmpswap.i32(i32, i32, <4 x i32>, i32, i32, i32 immarg) #7

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.amdgcn.cvt.f32.bf8(i32, i32 immarg) #5

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.amdgcn.cvt.f32.fp8(i32, i32 immarg) #5

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i32 @llvm.amdgcn.cvt.pk.bf8.f32(float, float, i32, i1 immarg) #5

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i32 @llvm.amdgcn.cvt.pk.fp8.f32(float, float, i32, i1 immarg) #5

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i32 @llvm.amdgcn.cvt.sr.bf8.f32(float, i32, i32, i32 immarg) #5

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i32 @llvm.amdgcn.cvt.sr.fp8.f32(float, i32, i32, i32 immarg) #5

attributes #0 = { "amdgpu-flat-work-group-size"="1,256" "uniform-work-group-size"="true" }
attributes #1 = { "amdgpu-flat-work-group-size"="1,1024" "uniform-work-group-size"="true" }
attributes #2 = { "amdgpu-flat-work-group-size"="128,128" "uniform-work-group-size"="true" }
attributes #3 = { "amdgpu-flat-work-group-size"="1,256" "uniform-work-group-size"="false" }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #6 = { convergent nocallback nofree nounwind willreturn memory(none) }
attributes #7 = { nocallback nofree nounwind willreturn }
attributes #8 = { convergent nocallback nofree nounwind willreturn }
attributes #9 = { nocallback nofree nosync nounwind willreturn }
attributes #10 = { convergent nocallback nofree nosync nounwind willreturn memory(none) }
attributes #11 = { nocallback nofree nosync nounwind willreturn memory(argmem: read) }
attributes #12 = { nocallback nofree nosync nounwind willreturn memory(argmem: write) }
attributes #13 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #14 = { nocallback nofree nosync nounwind willreturn memory(read) }
attributes #15 = { nocallback nofree nosync nounwind willreturn memory(write) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 16, i32 4, i32 2}
