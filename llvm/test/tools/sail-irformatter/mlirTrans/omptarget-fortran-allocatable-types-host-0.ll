; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }
%struct.__tgt_offload_entry = type { ptr, ptr, i64, i32, i32 }
%struct.__tgt_kernel_arguments = type { i32, i32, ptr, ptr, ptr, ptr, ptr, ptr, i64, i64, [3 x i32], [3 x i32], i32 }

@_QFEfull_arr = internal global { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } undef
@_QFEsect_arr = internal global { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } undef
@0 = private unnamed_addr constant [131 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-fortran-allocatable-types-host.mlir;unknown;28;11;;\00", align 1
@1 = private unnamed_addr constant [131 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-fortran-allocatable-types-host.mlir;unknown;29;11;;\00", align 1
@2 = private unnamed_addr constant [131 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-fortran-allocatable-types-host.mlir;unknown;40;11;;\00", align 1
@3 = private unnamed_addr constant [131 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-fortran-allocatable-types-host.mlir;unknown;41;11;;\00", align 1
@4 = private unnamed_addr constant [131 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-fortran-allocatable-types-host.mlir;unknown;43;11;;\00", align 1
@5 = private unnamed_addr constant [131 x i8] c";/ppuswhome/xiao.han/opensource/llvm-project/mlir/test/Target/LLVMIR/omptarget-fortran-allocatable-types-host.mlir;unknown;44;11;;\00", align 1
@.__omp_offloading_47_69b56b__QQmain_l45.region_id = weak constant i8 0
@.offload_sizes = private unnamed_addr constant [9 x i64] [i64 0, i64 48, i64 0, i64 0, i64 48, i64 0, i64 0, i64 24, i64 4]
@.offload_maptypes = private unnamed_addr constant [9 x i64] [i64 32, i64 281474976710657, i64 281474976710675, i64 32, i64 1125899906842625, i64 1125899906842643, i64 32, i64 1970324836974593, i64 1970324836974611]
@.offload_mapnames = private constant [9 x ptr] [ptr @1, ptr @1, ptr @0, ptr @3, ptr @3, ptr @2, ptr @5, ptr @5, ptr @4]
@6 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@7 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @6 }, align 8
@.offloading.entry_name = internal unnamed_addr constant [39 x i8] c"__omp_offloading_47_69b56b__QQmain_l45\00"
@.offloading.entry.__omp_offloading_47_69b56b__QQmain_l45 = weak constant %struct.__tgt_offload_entry { ptr @.__omp_offloading_47_69b56b__QQmain_l45.region_id, ptr @.offloading.entry_name, i64 0, i32 0, i32 0 }, section "omp_offloading_entries", align 1

; CHECK-LABLE: _QQmain
define void @_QQmain() {
  %.offload_baseptrs = alloca [9 x ptr], align 8
  %.offload_ptrs = alloca [9 x ptr], align 8
  %.offload_mappers = alloca [9 x ptr], align 8
  %.offload_sizes = alloca [9 x i64], align 4
  %kernel_args = alloca %struct.__tgt_kernel_arguments, align 8
  %1 = alloca { ptr, i64, i32, i8, i8, i8, i8 }, i64 1, align 8
  %2 = load i64, ptr getelementptr ({ ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEfull_arr, i32 0, i32 7, i64 0, i32 0), align 4
  %3 = load i64, ptr getelementptr ({ ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEfull_arr, i32 0, i32 7, i64 0, i32 1), align 4
  %4 = load i64, ptr getelementptr ({ ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEfull_arr, i32 0, i32 7, i64 0, i32 2), align 4
  %5 = sub i64 %3, 1
  %6 = load i64, ptr getelementptr ({ ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEsect_arr, i32 0, i32 7, i64 0, i32 0), align 4
  %7 = load i64, ptr getelementptr ({ ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEsect_arr, i32 0, i32 7, i64 0, i32 1), align 4
  %8 = load i64, ptr getelementptr ({ ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEsect_arr, i32 0, i32 7, i64 0, i32 2), align 4
  %9 = sub i64 2, %6
  %10 = sub i64 5, %6
  %11 = getelementptr { ptr, i64, i32, i8, i8, i8, i8 }, ptr %1, i32 0, i32 0
  br label %entry

entry:                                            ; preds = %0
  %12 = sub i64 %5, 0
  %13 = add i64 %12, 1
  %14 = mul i64 1, %13
  %15 = mul i64 %14, 4
  %16 = sub i64 %10, %9
  %17 = add i64 %16, 1
  %18 = mul i64 1, %17
  %19 = mul i64 %18, 4
  %20 = load ptr, ptr @_QFEfull_arr, align 8
  %array_offset = getelementptr inbounds float, ptr %20, i64 0
  %21 = mul i64 %9, 1
  %22 = load ptr, ptr @_QFEsect_arr, align 8
  %array_offset1 = getelementptr inbounds i32, ptr %22, i64 %21
  %23 = load ptr, ptr %11, align 8
; CHECK:  [[GEP:%.*]] = getelementptr inbounds { i8*, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, { i8*, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }* @_QFEfull_arr, i32 1
; CHECK:  [[BITCAST:%.*]] = bitcast { i8*, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }* [[GEP]] to i8*
; CHECK:  [[PTOI:%.*]] = ptrtoint i8* [[BITCAST]] to i64
; CHECK:  [[PTOI1:%.*]] = ptrtoint i8* bitcast ({ i8*, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }* @_QFEfull_arr to i8*) to i64
; CHECK:  [[SUB:%.*]] = sub i64 [[PTOI]], [[PTOI1]]
; CHECK:  sdiv exact i64 [[SUB]], ptrtoint (i8* getelementptr inbounds (i8, i8* null, i32 1) to i64)
  %24 = sdiv exact i64 sub (i64 ptrtoint (ptr getelementptr ({ ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEfull_arr, i32 1) to i64), i64 ptrtoint (ptr @_QFEfull_arr to i64)), ptrtoint (ptr getelementptr (i8, ptr null, i32 1) to i64)
  %25 = sdiv exact i64 sub (i64 ptrtoint (ptr getelementptr ({ ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, ptr @_QFEsect_arr, i32 1) to i64), i64 ptrtoint (ptr @_QFEsect_arr to i64)), ptrtoint (ptr getelementptr (i8, ptr null, i32 1) to i64)
  %26 = getelementptr { ptr, i64, i32, i8, i8, i8, i8 }, ptr %1, i32 1
  %27 = ptrtoint ptr %26 to i64
  %28 = ptrtoint ptr %1 to i64
  %29 = sub i64 %27, %28
  %30 = sdiv exact i64 %29, ptrtoint (ptr getelementptr (i8, ptr null, i32 1) to i64)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %.offload_sizes, ptr align 4 @.offload_sizes, i64 72, i1 false)
  %31 = getelementptr inbounds [9 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  store ptr @_QFEfull_arr, ptr %31, align 8
  %32 = getelementptr inbounds [9 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  store ptr @_QFEfull_arr, ptr %32, align 8
  %33 = getelementptr inbounds [9 x i64], ptr %.offload_sizes, i32 0, i32 0
  store i64 %24, ptr %33, align 8
  %34 = getelementptr inbounds [9 x ptr], ptr %.offload_mappers, i64 0, i64 0
  store ptr null, ptr %34, align 8
  %35 = getelementptr inbounds [9 x ptr], ptr %.offload_baseptrs, i32 0, i32 1
  store ptr @_QFEfull_arr, ptr %35, align 8
  %36 = getelementptr inbounds [9 x ptr], ptr %.offload_ptrs, i32 0, i32 1
  store ptr @_QFEfull_arr, ptr %36, align 8
  %37 = getelementptr inbounds [9 x ptr], ptr %.offload_mappers, i64 0, i64 1
  store ptr null, ptr %37, align 8
  %38 = getelementptr inbounds [9 x ptr], ptr %.offload_baseptrs, i32 0, i32 2
  store ptr @_QFEfull_arr, ptr %38, align 8
  %39 = getelementptr inbounds [9 x ptr], ptr %.offload_ptrs, i32 0, i32 2
  store ptr %array_offset, ptr %39, align 8
  %40 = getelementptr inbounds [9 x i64], ptr %.offload_sizes, i32 0, i32 2
  store i64 %15, ptr %40, align 8
  %41 = getelementptr inbounds [9 x ptr], ptr %.offload_mappers, i64 0, i64 2
  store ptr null, ptr %41, align 8
  %42 = getelementptr inbounds [9 x ptr], ptr %.offload_baseptrs, i32 0, i32 3
  store ptr @_QFEsect_arr, ptr %42, align 8
  %43 = getelementptr inbounds [9 x ptr], ptr %.offload_ptrs, i32 0, i32 3
  store ptr @_QFEsect_arr, ptr %43, align 8
  %44 = getelementptr inbounds [9 x i64], ptr %.offload_sizes, i32 0, i32 3
  store i64 %25, ptr %44, align 8
  %45 = getelementptr inbounds [9 x ptr], ptr %.offload_mappers, i64 0, i64 3
  store ptr null, ptr %45, align 8
  %46 = getelementptr inbounds [9 x ptr], ptr %.offload_baseptrs, i32 0, i32 4
  store ptr @_QFEsect_arr, ptr %46, align 8
  %47 = getelementptr inbounds [9 x ptr], ptr %.offload_ptrs, i32 0, i32 4
  store ptr @_QFEsect_arr, ptr %47, align 8
  %48 = getelementptr inbounds [9 x ptr], ptr %.offload_mappers, i64 0, i64 4
  store ptr null, ptr %48, align 8
  %49 = getelementptr inbounds [9 x ptr], ptr %.offload_baseptrs, i32 0, i32 5
  store ptr @_QFEsect_arr, ptr %49, align 8
  %50 = getelementptr inbounds [9 x ptr], ptr %.offload_ptrs, i32 0, i32 5
  store ptr %array_offset1, ptr %50, align 8
  %51 = getelementptr inbounds [9 x i64], ptr %.offload_sizes, i32 0, i32 5
  store i64 %19, ptr %51, align 8
  %52 = getelementptr inbounds [9 x ptr], ptr %.offload_mappers, i64 0, i64 5
  store ptr null, ptr %52, align 8
  %53 = getelementptr inbounds [9 x ptr], ptr %.offload_baseptrs, i32 0, i32 6
  store ptr %1, ptr %53, align 8
  %54 = getelementptr inbounds [9 x ptr], ptr %.offload_ptrs, i32 0, i32 6
  store ptr %1, ptr %54, align 8
  %55 = getelementptr inbounds [9 x i64], ptr %.offload_sizes, i32 0, i32 6
  store i64 %30, ptr %55, align 8
  %56 = getelementptr inbounds [9 x ptr], ptr %.offload_mappers, i64 0, i64 6
  store ptr null, ptr %56, align 8
  %57 = getelementptr inbounds [9 x ptr], ptr %.offload_baseptrs, i32 0, i32 7
  store ptr %1, ptr %57, align 8
  %58 = getelementptr inbounds [9 x ptr], ptr %.offload_ptrs, i32 0, i32 7
  store ptr %1, ptr %58, align 8
  %59 = getelementptr inbounds [9 x ptr], ptr %.offload_mappers, i64 0, i64 7
  store ptr null, ptr %59, align 8
  %60 = getelementptr inbounds [9 x ptr], ptr %.offload_baseptrs, i32 0, i32 8
  store ptr %1, ptr %60, align 8
  %61 = getelementptr inbounds [9 x ptr], ptr %.offload_ptrs, i32 0, i32 8
  store ptr %23, ptr %61, align 8
  %62 = getelementptr inbounds [9 x ptr], ptr %.offload_mappers, i64 0, i64 8
  store ptr null, ptr %62, align 8
  %63 = getelementptr inbounds [9 x ptr], ptr %.offload_baseptrs, i32 0, i32 0
  %64 = getelementptr inbounds [9 x ptr], ptr %.offload_ptrs, i32 0, i32 0
  %65 = getelementptr inbounds [9 x i64], ptr %.offload_sizes, i32 0, i32 0
  %66 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 0
  store i32 3, ptr %66, align 4
  %67 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 1
  store i32 9, ptr %67, align 4
  %68 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 2
  store ptr %63, ptr %68, align 8
  %69 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 3
  store ptr %64, ptr %69, align 8
  %70 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 4
  store ptr %65, ptr %70, align 8
  %71 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 5
  store ptr @.offload_maptypes, ptr %71, align 8
  %72 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 6
  store ptr @.offload_mapnames, ptr %72, align 8
  %73 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 7
  store ptr null, ptr %73, align 8
  %74 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 8
  store i64 0, ptr %74, align 8
  %75 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 9
  store i64 0, ptr %75, align 8
  %76 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 10
  store [3 x i32] [i32 -1, i32 0, i32 0], ptr %76, align 4
  %77 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 11
  store [3 x i32] zeroinitializer, ptr %77, align 4
  %78 = getelementptr inbounds %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 12
  store i32 0, ptr %78, align 4
  %79 = call i32 @__tgt_target_kernel(ptr @7, i64 -1, i32 -1, i32 0, ptr @.__omp_offloading_47_69b56b__QQmain_l45.region_id, ptr %kernel_args)
  %80 = icmp ne i32 %79, 0
  br i1 %80, label %omp_offload.failed, label %omp_offload.cont

omp_offload.failed:                               ; preds = %entry
  call void @__omp_offloading_47_69b56b__QQmain_l45(ptr @_QFEfull_arr, ptr @_QFEsect_arr, ptr %1)
  br label %omp_offload.cont

omp_offload.cont:                                 ; preds = %omp_offload.failed, %entry
  ret void
}

define internal void @__omp_offloading_47_69b56b__QQmain_l45(ptr %0, ptr %1, ptr %2) {
entry:
  br label %omp.target

omp.target:                                       ; preds = %entry
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.target
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #0

; Function Attrs: nounwind
declare i32 @__tgt_target_kernel(ptr, i64, i32, i32, ptr, ptr) #1

attributes #0 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { nounwind }

!llvm.module.flags = !{!0}
!omp_offload.info = !{!1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 0, i32 71, i32 6927723, !"_QQmain", i32 45, i32 0, i32 0}
