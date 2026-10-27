; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @opaque_ptr_load(ptr %0) {
  %2 = load i32, ptr %0, align 4
  ret i32 %2
}

define void @opaque_ptr_store(i32 %0, ptr %1) {
  store i32 %0, ptr %1, align 4
  ret void
}

define void @opaque_ptr_ptr_store(ptr %0, ptr %1) {
  store ptr %0, ptr %1, align 8
  ret void
}

define ptr @opaque_ptr_alloca(i32 %0) {
  %2 = alloca float, i32 %0, align 4
  ret ptr %2
}

define ptr @opaque_ptr_gep(ptr %0, i32 %1) {
  %3 = getelementptr float, ptr %0, i32 %1
  ret ptr %3
}

define ptr @opaque_ptr_gep_struct(ptr %0, i32 %1) {
  %3 = getelementptr { { float, double }, { i32, i64 } }, ptr %0, i32 %1, i32 0, i32 1
  ret ptr %3
}

define <48 x float> @opaque_ptr_matrix_load_store(ptr %0, i64 %1) {
  %3 = call <48 x float> @llvm.matrix.column.major.load.v48f32.i64(ptr align 4 %0, i64 %1, i1 false, i32 3, i32 16)
  call void @llvm.matrix.column.major.store.v48f32.i64(<48 x float> %3, ptr align 4 %0, i64 %1, i1 false, i32 3, i32 16)
  ret <48 x float> %3
}

define <7 x float> @opaque_ptr_masked_load(ptr %0, <7 x i1> %1) {
  %3 = call <7 x float> @llvm.masked.load.v7f32.p0(ptr %0, i32 1, <7 x i1> %1, <7 x float> poison)
  ret <7 x float> %3
}

define <7 x float> @opaque_ptr_gather(<7 x ptr> %0, <7 x i1> %1) {
  %3 = call <7 x float> @llvm.masked.gather.v7f32.v7p0(<7 x ptr> %0, i32 1, <7 x i1> %1, <7 x float> poison)
  ret <7 x float> %3
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <48 x float> @llvm.matrix.column.major.load.v48f32.i64(ptr nocapture, i64, i1 immarg, i32 immarg, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.matrix.column.major.store.v48f32.i64(<48 x float>, ptr nocapture writeonly, i64, i1 immarg, i32 immarg, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <7 x float> @llvm.masked.load.v7f32.p0(ptr nocapture, i32 immarg, <7 x i1>, <7 x float>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(read)
declare <7 x float> @llvm.masked.gather.v7f32.v7p0(<7 x ptr>, i32 immarg, <7 x i1>, <7 x float>) #2

attributes #0 = { nocallback nofree nosync nounwind willreturn memory(argmem: read) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: write) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(read) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
