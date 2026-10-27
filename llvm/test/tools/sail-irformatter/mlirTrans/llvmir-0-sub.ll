; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@global_aligned32 = private global i64 42, align 32
@global_aligned64 = private global i64 42, align 64
@global_aligned64_native = private global i64 42, align 64
@i32_global = internal global i32 42
@i32_const = internal constant i53 52
@int_global_array = internal global [3 x i32] [i32 62, i32 62, i32 62]
@int_global_array_zero_elements = internal constant [3 x [0 x [4 x float]]] zeroinitializer
@int_global_array_zero_elements_1d = internal constant [0 x float] zeroinitializer
@i32_global_addr_space = internal addrspace(7) global i32 62
@float_global = internal global float 0.000000e+00
@float_global_array = internal global [1 x float] [float -5.000000e+00]
@string_const = internal constant [6 x i8] c"foobar"
@int_global_undef = internal global i64 undef
@f8E4M3FN_global_as_i8 = internal global i8 60
@f8E5M2_global_as_i8 = internal global i8 62
@f8E4M3FNUZ_global_as_i8 = internal global i8 68
@f8E5M2FNUZ_global_as_i8 = internal global i8 66
@f8E4M3B11FNUZ_global_as_i8 = internal global i8 92
@bf16_global_as_i16 = internal global i16 16320
@explicit_undef = global i32 undef
@int_gep = internal constant ptr getelementptr (i32, ptr @i32_global, i32 2)
@dense_float_vector = internal global <3 x float> <float 1.000000e+00, float 2.000000e+00, float 3.000000e+00>
@splat_float_vector = internal global <3 x float> <float 4.200000e+01, float 4.200000e+01, float 4.200000e+01>
@dense_double_vector = internal global <3 x double> <double 1.000000e+00, double 2.000000e+00, double 3.000000e+00>
@splat_double_vector = internal global <3 x double> <double 4.200000e+01, double 4.200000e+01, double 4.200000e+01>
@dense_i64_vector = internal global <3 x i64> <i64 1, i64 2, i64 3>
@splat_i64_vector = internal global <3 x i64> <i64 42, i64 42, i64 42>
@dense_float_vector_2d = internal global [2 x <2 x float>] [<2 x float> <float 1.000000e+00, float 2.000000e+00>, <2 x float> <float 3.000000e+00, float 4.000000e+00>]
@splat_float_vector_2d = internal global [2 x <2 x float>] [<2 x float> <float 4.200000e+01, float 4.200000e+01>, <2 x float> <float 4.200000e+01, float 4.200000e+01>]
@dense_float_vector_3d = internal global [2 x [2 x <2 x float>]] [[2 x <2 x float>] [<2 x float> <float 1.000000e+00, float 2.000000e+00>, <2 x float> <float 3.000000e+00, float 4.000000e+00>], [2 x <2 x float>] [<2 x float> <float 5.000000e+00, float 6.000000e+00>, <2 x float> <float 7.000000e+00, float 8.000000e+00>]]
@splat_float_vector_3d = internal global [2 x [2 x <2 x float>]] [[2 x <2 x float>] [<2 x float> <float 4.200000e+01, float 4.200000e+01>, <2 x float> <float 4.200000e+01, float 4.200000e+01>], [2 x <2 x float>] [<2 x float> <float 4.200000e+01, float 4.200000e+01>, <2 x float> <float 4.200000e+01, float 4.200000e+01>]]
@private = private global i32 42
@internal = internal global i32 42
@available_externally = available_externally global i32 42
@linkonce = linkonce global i32 42
@weak = weak global i32 42
@common = common global i32 0
@appending = appending global [3 x i32] [i32 1, i32 2, i32 3]
@extern_weak = extern_weak global i32
@linkonce_odr = linkonce_odr global i32 42
@weak_odr = weak_odr global i32 42
@external = external global i32
@hidden = hidden constant [6 x i8] c"string"
@protected = protected constant i64 42
@no_unnamed_addr = private constant i64 42
@local_unnamed_addr = private local_unnamed_addr constant i64 42
@unnamed_addr = private unnamed_addr constant i64 42
@has_dso_local = dso_local global i64 42
@has_thr_local = thread_local global i64 42
@sectionvar = internal constant [10 x i8] c"teststring", section ".mysection"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @empty() {
  ret void
}

define void @global_refs() {
  %1 = load i32, ptr @i32_global, align 4
  %2 = load i8, ptr @string_const, align 1
  ret void
}

declare void @body(i64)

define void @simple_loop() {
  br label %1

1:                                                ; preds = %0
  br label %2

2:                                                ; preds = %5, %1
  %3 = phi i64 [ %6, %5 ], [ 1, %1 ]
  %4 = icmp slt i64 %3, 42
  br i1 %4, label %5, label %7

5:                                                ; preds = %2
  call void @body(i64 %3)
  %6 = add i64 %3, 1
  br label %2

7:                                                ; preds = %2
  ret void
}

define void @simple_caller() {
  call void @simple_loop()
  ret void
}

define void @ml_caller() {
  call void @simple_loop()
  call void @more_imperfectly_nested_loops()
  ret void
}

declare i64 @body_args(i64)

declare i32 @other(i64, i32)

define i32 @func_args(i32 %0, i32 %1) {
  br label %3

3:                                                ; preds = %2
  br label %4

4:                                                ; preds = %7, %3
  %5 = phi i64 [ %12, %7 ], [ 0, %3 ]
  %6 = icmp slt i64 %5, 42
  br i1 %6, label %7, label %13

7:                                                ; preds = %4
  %8 = call i64 @body_args(i64 %5)
  %9 = call i32 @other(i64 %8, i32 %0)
  %10 = call i32 @other(i64 %8, i32 %9)
  %11 = call i32 @other(i64 %8, i32 %1)
  %12 = add i64 %5, 1
  br label %4

13:                                               ; preds = %4
  %14 = call i32 @other(i64 0, i32 0)
  ret i32 %14
}

declare void @pre(i64)

declare void @body2(i64, i64)

declare void @post(i64)

define void @imperfectly_nested_loops() {
  br label %1

1:                                                ; preds = %0
  br label %2

2:                                                ; preds = %12, %1
  %3 = phi i64 [ %13, %12 ], [ 0, %1 ]
  %4 = icmp slt i64 %3, 42
  br i1 %4, label %5, label %14

5:                                                ; preds = %2
  call void @pre(i64 %3)
  br label %6

6:                                                ; preds = %5
  br label %7

7:                                                ; preds = %10, %6
  %8 = phi i64 [ %11, %10 ], [ 7, %6 ]
  %9 = icmp slt i64 %8, 56
  br i1 %9, label %10, label %12

10:                                               ; preds = %7
  call void @body2(i64 %3, i64 %8)
  %11 = add i64 %8, 2
  br label %7

12:                                               ; preds = %7
  call void @post(i64 %3)
  %13 = add i64 %3, 1
  br label %2

14:                                               ; preds = %2
  ret void
}

declare void @mid(i64)

declare void @body3(i64, i64)

define void @more_imperfectly_nested_loops() {
  br label %1

1:                                                ; preds = %0
  br label %2

2:                                                ; preds = %19, %1
  %3 = phi i64 [ %20, %19 ], [ 0, %1 ]
  %4 = icmp slt i64 %3, 42
  br i1 %4, label %5, label %21

5:                                                ; preds = %2
  call void @pre(i64 %3)
  br label %6

6:                                                ; preds = %5
  br label %7

7:                                                ; preds = %10, %6
  %8 = phi i64 [ %11, %10 ], [ 7, %6 ]
  %9 = icmp slt i64 %8, 56
  br i1 %9, label %10, label %12

10:                                               ; preds = %7
  call void @body2(i64 %3, i64 %8)
  %11 = add i64 %8, 2
  br label %7

12:                                               ; preds = %7
  call void @mid(i64 %3)
  br label %13

13:                                               ; preds = %12
  br label %14

14:                                               ; preds = %17, %13
  %15 = phi i64 [ %18, %17 ], [ 18, %13 ]
  %16 = icmp slt i64 %15, 37
  br i1 %16, label %17, label %19

17:                                               ; preds = %14
  call void @body3(i64 %3, i64 %15)
  %18 = add i64 %15, 3
  br label %14

19:                                               ; preds = %14
  call void @post(i64 %3)
  %20 = add i64 %3, 1
  br label %2

21:                                               ; preds = %2
  ret void
}

define internal void @func_internal() {
  ret void
}

define hidden void @hidden_func() {
  ret void
}

define protected void @protected_func() {
  ret void
}

define dso_local void @dso_local_func() {
  ret void
}

define void @memref_alloc() {
  %1 = call ptr @malloc(i64 400)
  %2 = insertvalue { ptr } undef, ptr %1, 0
  ret void
}

declare i64 @get_index()

define void @store_load_static() {
  %1 = call ptr @malloc(i64 40)
  %2 = insertvalue { ptr } undef, ptr %1, 0
  br label %3

3:                                                ; preds = %0
  br label %4

4:                                                ; preds = %7, %3
  %5 = phi i64 [ %10, %7 ], [ 0, %3 ]
  %6 = icmp slt i64 %5, 10
  br i1 %6, label %7, label %11

7:                                                ; preds = %4
  %8 = extractvalue { ptr } %2, 0
  %9 = getelementptr float, ptr %8, i64 %5
  store float 1.000000e+00, ptr %9, align 4
  %10 = add i64 %5, 1
  br label %4

11:                                               ; preds = %4
  br label %12

12:                                               ; preds = %11
  br label %13

13:                                               ; preds = %16, %12
  %14 = phi i64 [ %20, %16 ], [ 0, %12 ]
  %15 = icmp slt i64 %14, 10
  br i1 %15, label %16, label %21

16:                                               ; preds = %13
  %17 = extractvalue { ptr } %2, 0
  %18 = getelementptr float, ptr %17, i64 %14
  %19 = load float, ptr %18, align 4
  %20 = add i64 %14, 1
  br label %13

21:                                               ; preds = %13
  ret void
}

define void @store_load_dynamic(i64 %0) {
  %2 = mul i64 %0, 4
  %3 = call ptr @malloc(i64 %2)
  %4 = insertvalue { ptr, i64 } undef, ptr %3, 0
  %5 = insertvalue { ptr, i64 } %4, i64 %0, 1
  br label %6

6:                                                ; preds = %1
  br label %7

7:                                                ; preds = %10, %6
  %8 = phi i64 [ %14, %10 ], [ 0, %6 ]
  %9 = icmp slt i64 %8, %0
  br i1 %9, label %10, label %15

10:                                               ; preds = %7
  %11 = extractvalue { ptr, i64 } %5, 1
  %12 = extractvalue { ptr, i64 } %5, 0
  %13 = getelementptr float, ptr %12, i64 %8
  store float 1.000000e+00, ptr %13, align 4
  %14 = add i64 %8, 1
  br label %7

15:                                               ; preds = %7
  br label %16

16:                                               ; preds = %15
  br label %17

17:                                               ; preds = %20, %16
  %18 = phi i64 [ %25, %20 ], [ 0, %16 ]
  %19 = icmp slt i64 %18, %0
  br i1 %19, label %20, label %26

20:                                               ; preds = %17
  %21 = extractvalue { ptr, i64 } %5, 1
  %22 = extractvalue { ptr, i64 } %5, 0
  %23 = getelementptr float, ptr %22, i64 %18
  %24 = load float, ptr %23, align 4
  %25 = add i64 %18, 1
  br label %17

26:                                               ; preds = %17
  ret void
}

define void @store_load_mixed(i64 %0) {
  %2 = mul i64 2, %0
  %3 = mul i64 %2, 4
  %4 = mul i64 %3, 10
  %5 = mul i64 %4, 4
  %6 = call ptr @malloc(i64 %5)
  %7 = insertvalue { ptr, i64, i64 } undef, ptr %6, 0
  %8 = insertvalue { ptr, i64, i64 } %7, i64 %0, 1
  %9 = insertvalue { ptr, i64, i64 } %8, i64 10, 2
  %10 = call i64 @get_index()
  %11 = call i64 @get_index()
  %12 = extractvalue { ptr, i64, i64 } %9, 1
  %13 = extractvalue { ptr, i64, i64 } %9, 2
  %14 = mul i64 1, %12
  %15 = add i64 %14, 2
  %16 = mul i64 %15, 4
  %17 = add i64 %16, %10
  %18 = mul i64 %17, %13
  %19 = add i64 %18, %11
  %20 = extractvalue { ptr, i64, i64 } %9, 0
  %21 = getelementptr float, ptr %20, i64 %19
  store float 4.200000e+01, ptr %21, align 4
  %22 = extractvalue { ptr, i64, i64 } %9, 1
  %23 = extractvalue { ptr, i64, i64 } %9, 2
  %24 = mul i64 %11, %22
  %25 = add i64 %24, %10
  %26 = mul i64 %25, 4
  %27 = add i64 %26, 2
  %28 = mul i64 %27, %23
  %29 = add i64 %28, 1
  %30 = extractvalue { ptr, i64, i64 } %9, 0
  %31 = getelementptr float, ptr %30, i64 %29
  %32 = load float, ptr %31, align 4
  ret void
}

define { ptr, i64 } @memref_args_rets({ ptr } %0, { ptr, i64 } %1, { ptr, i64 } %2) {
  %4 = call i64 @get_index()
  %5 = extractvalue { ptr } %0, 0
  %6 = getelementptr float, ptr %5, i64 7
  store float 4.200000e+01, ptr %6, align 4
  %7 = extractvalue { ptr, i64 } %1, 1
  %8 = extractvalue { ptr, i64 } %1, 0
  %9 = getelementptr float, ptr %8, i64 7
  store float 4.200000e+01, ptr %9, align 4
  %10 = extractvalue { ptr, i64 } %2, 1
  %11 = mul i64 7, %10
  %12 = add i64 %11, %4
  %13 = extractvalue { ptr, i64 } %2, 0
  %14 = getelementptr float, ptr %13, i64 %12
  store float 4.200000e+01, ptr %14, align 4
  %15 = mul i64 10, %4
  %16 = mul i64 %15, 4
  %17 = call ptr @malloc(i64 %16)
  %18 = insertvalue { ptr, i64 } undef, ptr %17, 0
  %19 = insertvalue { ptr, i64 } %18, i64 %4, 1
  ret { ptr, i64 } %19
}

define i64 @memref_dim({ ptr, i64, i64 } %0) {
  %2 = extractvalue { ptr, i64, i64 } %0, 1
  %3 = extractvalue { ptr, i64, i64 } %0, 2
  %4 = add i64 42, %2
  %5 = add i64 10, %3
  %6 = add i64 %4, %5
  ret i64 %6
}

declare i64 @get_i64()

declare float @get_f32()

declare { ptr, i64, i64 } @get_memref()

define { i64, float, { ptr, i64, i64 } } @multireturn() {
  %1 = call i64 @get_i64()
  %2 = call float @get_f32()
  %3 = call { ptr, i64, i64 } @get_memref()
  %4 = insertvalue { i64, float, { ptr, i64, i64 } } undef, i64 %1, 0
  %5 = insertvalue { i64, float, { ptr, i64, i64 } } %4, float %2, 1
  %6 = insertvalue { i64, float, { ptr, i64, i64 } } %5, { ptr, i64, i64 } %3, 2
  ret { i64, float, { ptr, i64, i64 } } %6
}

define void @multireturn_caller() {
  %1 = call { i64, float, { ptr, i64, i64 } } @multireturn()
  %2 = extractvalue { i64, float, { ptr, i64, i64 } } %1, 0
  %3 = extractvalue { i64, float, { ptr, i64, i64 } } %1, 1
  %4 = extractvalue { i64, float, { ptr, i64, i64 } } %1, 2
  %5 = add i64 %2, 42
  %6 = fadd float %3, 4.200000e+01
  %7 = extractvalue { ptr, i64, i64 } %4, 1
  %8 = extractvalue { ptr, i64, i64 } %4, 2
  %9 = mul i64 0, %7
  %10 = add i64 %9, 0
  %11 = mul i64 %10, 10
  %12 = add i64 %11, 0
  %13 = mul i64 %12, %8
  %14 = add i64 %13, 0
  %15 = extractvalue { ptr, i64, i64 } %4, 0
  %16 = getelementptr float, ptr %15, i64 %14
  %17 = load float, ptr %16, align 4
  ret void
}

define <4 x float> @vector_ops(<4 x float> %0, <4 x i1> %1, <4 x i64> %2) {
  %4 = fadd <4 x float> %0, <float 4.200000e+01, float 4.200000e+01, float 4.200000e+01, float 4.200000e+01>
  %5 = select <4 x i1> %1, <4 x float> %4, <4 x float> %0
  %6 = sdiv <4 x i64> %2, %2
  %7 = udiv <4 x i64> %2, %2
  %8 = srem <4 x i64> %2, %2
  %9 = urem <4 x i64> %2, %2
  %10 = fdiv <4 x float> %0, <float 4.200000e+01, float 4.200000e+01, float 4.200000e+01, float 4.200000e+01>
  %11 = frem <4 x float> %0, <float 4.200000e+01, float 4.200000e+01, float 4.200000e+01, float 4.200000e+01>
  %12 = and <4 x i64> %2, %2
  %13 = or <4 x i64> %2, %2
  %14 = xor <4 x i64> %2, %2
  %15 = shl <4 x i64> %2, %2
  %16 = lshr <4 x i64> %2, %2
  %17 = ashr <4 x i64> %2, %2
  ret <4 x float> %4
}

define <4 x float> @vector_splat_1d() {
  ret <4 x float> zeroinitializer
}

define <vscale x 4 x float> @vector_splat_1d_scalable() {
  ret <vscale x 4 x float> zeroinitializer
}

define [4 x <16 x float>] @vector_splat_2d() {
  ret [4 x <16 x float>] zeroinitializer
}

define [4 x [16 x <4 x float>]] @vector_splat_3d() {
  ret [4 x [16 x <4 x float>]] zeroinitializer
}

define <4 x float> @vector_splat_nonzero() {
  ret <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>
}

define <vscale x 4 x float> @vector_splat_nonzero_scalable() {
  ret <vscale x 4 x float> shufflevector (<vscale x 4 x float> insertelement (<vscale x 4 x float> poison, float 1.000000e+00, i64 0), <vscale x 4 x float> poison, <vscale x 4 x i32> zeroinitializer)
}

define { float, i32 } @ops(float %0, float %1, i32 %2, i32 %3) {
  %5 = fsub float %0, %1
  %6 = sub i32 %2, %3
  %7 = icmp slt i32 %2, %6
  %8 = select i1 %7, i32 %2, i32 %6
  %9 = sdiv i32 %2, %3
  %10 = udiv i32 %2, %3
  %11 = srem i32 %2, %3
  %12 = urem i32 %2, %3
  %13 = insertvalue { float, i32 } undef, float %5, 0
  %14 = insertvalue { float, i32 } %13, i32 %8, 1
  %15 = fdiv float %0, %1
  %16 = frem float %0, %1
  %17 = and i32 %2, %3
  %18 = or i32 %2, %3
  %19 = xor i32 %2, %3
  %20 = shl i32 %2, %3
  %21 = lshr i32 %2, %3
  %22 = ashr i32 %2, %3
  %23 = fneg float %0
  ret { float, i32 } %14
}

define void @gep(ptr %0, i64 %1, ptr %2) {
  %4 = getelementptr { i32, { i32, float } }, ptr %0, i64 %1, i32 1, i32 0
  %5 = getelementptr inbounds { [10 x float] }, ptr %2, i64 %1, i32 0, i64 %1
  ret void
}

define void @indirect_const_call(i64 %0) {
  call void @body(i64 %0)
  ret void
}

define void @cond_br_arguments(i1 %0, i1 %1) {
  br i1 %0, label %3, label %5

3:                                                ; preds = %5, %2
  %4 = phi i1 [ %1, %5 ], [ %0, %2 ]
  ret void

5:                                                ; preds = %2
  br label %3
}

define void @llvm_noalias(ptr noalias %0) {
  ret void
}

declare void @llvm_noalias_decl(ptr noalias)

define void @byrefattr(ptr byref(i32) %0) {
  ret void
}

declare void @byrefattr_decl(ptr byref(i32))

define void @byvalattr(ptr byval(i32) %0) {
  ret void
}

declare void @byvalattr_decl(ptr byval(i32))

define void @sretattr(ptr sret(i32) %0) {
  ret void
}

declare void @sretattr_decl(ptr sret(i32))

define void @nestattr(ptr nest %0) {
  ret void
}

declare void @nestattr_decl(ptr nest)

define void @noundefattr(i32 noundef %0) {
  ret void
}

declare void @noundefattr_decl(i32 noundef)

define void @llvm_align(ptr align 4 %0) {
  ret void
}

declare void @llvm_align_decl(ptr align 4)

define void @inallocaattr(ptr inalloca(i32) %0) {
  ret void
}

declare void @inallocaattr_decl(ptr inalloca(i32))

define void @signextattr(i1 signext %0) {
  ret void
}

declare void @signextattr_decl(i1 signext)

define void @zeroextattr(i1 zeroext %0) {
  ret void
}

declare void @zeroextattr_decl(i1 zeroext)

declare void @alignattr_decl(ptr align 64)

declare void @dereferenceableattr_decl(ptr dereferenceable(32))

declare void @dereferenceableornullattr_decl(ptr dereferenceable_or_null(32))

declare void @inregattr_decl(ptr inreg)

declare void @nocaptureattr_decl(ptr nocapture)

declare void @nofreeattr_decl(ptr nofree)

declare void @nonnullattr_decl(ptr nonnull)

declare void @preallocatedattr_decl(ptr preallocated(float))

declare ptr @returnedattr_decl(ptr returned)

declare void @alignstackattr_decl(ptr alignstack(32))

declare void @writeonlyattr_decl(ptr writeonly)

declare align 4 ptr @alignattr_ret_decl()

declare noalias ptr @noaliasattr_ret_decl()

declare noundef ptr @noundefattr_ret_decl()

declare signext i1 @signextattr_ret_decl()

declare zeroext i1 @zeroextattr_ret_decl()

declare nonnull ptr @nonnullattr_ret_decl()

declare dereferenceable(32) ptr @dereferenceableattr_ret_decl()

declare dereferenceable_or_null(16) ptr @dereferenceableornullattr_ret_decl()

declare inreg ptr @inregattr_ret_decl()

declare float @varargs(...)

define void @varargs_call(i32 %0) {
  %2 = call float (...) @varargs(i32 %0)
  %3 = call nnan float (...) @varargs(i32 %0)
  ret void
}

define i32 @intpointerconversion(i32 %0) {
  %2 = inttoptr i32 %0 to ptr
  %3 = ptrtoint ptr %2 to i32
  ret i32 %3
}

define i32 @fpconversion(i32 %0) {
  %2 = sitofp i32 %0 to float
  %3 = fptosi float %2 to i32
  %4 = uitofp i32 %3 to float
  %5 = fptoui float %4 to i32
  ret i32 %5
}

define ptr addrspace(2) @addrspace(ptr %0) {
  %2 = addrspacecast ptr %0 to ptr addrspace(2)
  ret ptr addrspace(2) %2
}

define [12 x i8] @stringconstant() {
  ret [12 x i8] c"Hello world!"
}

define { float, float } @complexfpconstant() {
  ret { float, float } { float -1.000000e+00, float 0.000000e+00 }
}

define { i32, i32 } @complexintconstant() {
  ret { i32, i32 } { i32 -1, i32 0 }
}

define [2 x { i32, i32 }] @complexintconstantsplat() {
  ret [2 x { i32, i32 }] [{ i32, i32 } { i32 0, i32 1 }, { i32, i32 } { i32 0, i32 1 }]
}

define [2 x [2 x { i32, i32 }]] @complexintconstantarray() {
  ret [2 x [2 x { i32, i32 }]] [[2 x { i32, i32 }] [{ i32, i32 } { i32 0, i32 1 }, { i32, i32 } { i32 2, i32 3 }], [2 x { i32, i32 }] [{ i32, i32 } { i32 4, i32 5 }, { i32, i32 } { i32 6, i32 7 }]]
}

define <3 x i32> @indexconstantsplat() {
  ret <3 x i32> <i32 42, i32 42, i32 42>
}

define <3 x i32> @indexconstantarray() {
  ret <3 x i32> <i32 0, i32 1, i32 2>
}

define void @noreach() {
  unreachable
}

define void @fcmp(float %0, float %1) {
  %3 = fcmp oeq float %0, %1
  %4 = fcmp ogt float %0, %1
  %5 = fcmp oge float %0, %1
  %6 = fcmp olt float %0, %1
  %7 = fcmp ole float %0, %1
  %8 = fcmp one float %0, %1
  %9 = fcmp ord float %0, %1
  %10 = fcmp ueq float %0, %1
  %11 = fcmp ugt float %0, %1
  %12 = fcmp uge float %0, %1
  %13 = fcmp ult float %0, %1
  %14 = fcmp ule float %0, %1
  %15 = fcmp une float %0, %1
  %16 = fcmp uno float %0, %1
  ret void
}

define void @vect(<4 x float> %0, i32 %1, float %2) {
  %4 = extractelement <4 x float> %0, i32 %1
  %5 = insertelement <4 x float> %0, float %2, i32 %1
  %6 = shufflevector <4 x float> %0, <4 x float> %0, <5 x i32> <i32 0, i32 0, i32 0, i32 0, i32 7>
  ret void
}

define void @vect_i64idx(<4 x float> %0, i64 %1, float %2) {
  %4 = extractelement <4 x float> %0, i64 %1
  %5 = insertelement <4 x float> %0, float %2, i64 %1
  ret void
}

define void @scalable_vect(<vscale x 4 x float> %0, i32 %1, float %2) {
  %4 = extractelement <vscale x 4 x float> %0, i32 %1
  %5 = insertelement <vscale x 4 x float> %0, float %2, i32 %1
  %6 = shufflevector <vscale x 4 x float> %0, <vscale x 4 x float> %0, <vscale x 4 x i32> zeroinitializer
  ret void
}

define void @scalable_vect_i64idx(<vscale x 4 x float> %0, i64 %1, float %2) {
  %4 = extractelement <vscale x 4 x float> %0, i64 %1
  %5 = insertelement <vscale x 4 x float> %0, float %2, i64 %1
  ret void
}

define void @alloca(i64 %0) {
  %2 = alloca i32, i64 %0, align 4
  %3 = alloca i32, i64 %0, align 8
  %4 = alloca i32, i64 %0, align 4, addrspace(3)
  %5 = alloca inalloca i32, i64 %0, align 4
  ret void
}

define <4 x float> @constants() {
  ret <4 x float> <float 4.200000e+01, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00>
}

define i16 @fp_casts(float %0, double %1) {
  %3 = fptrunc double %1 to float
  %4 = fpext float %0 to double
  %5 = fptosi double %4 to i16
  ret i16 %5
}

define void @integer_extension_and_truncation(i32 %0) {
  %2 = sext i32 %0 to i64
  %3 = zext i32 %0 to i64
  %4 = trunc i32 %0 to i16
  ret void
}

define ptr @null() {
  ret ptr null
}

define [2 x [2 x <2 x i32>]] @elements_constant_3d_vector() {
  ret [2 x [2 x <2 x i32>]] [[2 x <2 x i32>] [<2 x i32> <i32 1, i32 2>, <2 x i32> <i32 3, i32 4>], [2 x <2 x i32>] [<2 x i32> <i32 42, i32 43>, <2 x i32> <i32 44, i32 45>]]
}

define [2 x [2 x [2 x i32]]] @elements_constant_3d_array() {
  ret [2 x [2 x [2 x i32]]] [[2 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 3, i32 4]], [2 x [2 x i32]] [[2 x i32] [i32 42, i32 43], [2 x i32] [i32 44, i32 45]]]
}

define void @atomicrmw(ptr %0, float %1, ptr %2, i32 %3) {
  %5 = atomicrmw fadd ptr %0, float %1 monotonic, align 4
  %6 = atomicrmw fsub ptr %0, float %1 monotonic, align 4
  %7 = atomicrmw fmax ptr %0, float %1 monotonic, align 4
  %8 = atomicrmw fmin ptr %0, float %1 monotonic, align 4
  %9 = atomicrmw xchg ptr %0, float %1 monotonic, align 4
  %10 = atomicrmw add ptr %2, i32 %3 acquire, align 4
  %11 = atomicrmw sub ptr %2, i32 %3 release, align 4
  %12 = atomicrmw and ptr %2, i32 %3 acq_rel, align 4
  %13 = atomicrmw nand ptr %2, i32 %3 seq_cst, align 4
  %14 = atomicrmw or ptr %2, i32 %3 monotonic, align 4
  %15 = atomicrmw xor ptr %2, i32 %3 monotonic, align 4
  %16 = atomicrmw max ptr %2, i32 %3 monotonic, align 4
  %17 = atomicrmw min ptr %2, i32 %3 monotonic, align 4
  %18 = atomicrmw umax ptr %2, i32 %3 monotonic, align 4
  %19 = atomicrmw umin ptr %2, i32 %3 monotonic, align 4
  %20 = atomicrmw uinc_wrap ptr %2, i32 %3 monotonic, align 4
  %21 = atomicrmw udec_wrap ptr %2, i32 %3 monotonic, align 4
  %22 = atomicrmw volatile udec_wrap ptr %2, i32 %3 syncscope("singlethread") monotonic, align 8
  ret void
}

define void @cmpxchg(ptr %0, i32 %1, i32 %2) {
  %4 = cmpxchg ptr %0, i32 %1, i32 %2 acq_rel monotonic, align 4
  %5 = extractvalue { i32, i1 } %4, 0
  %6 = extractvalue { i32, i1 } %4, 1
  %7 = cmpxchg weak volatile ptr %0, i32 %1, i32 %2 syncscope("singlethread") acq_rel monotonic, align 8
  ret void
}


!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

