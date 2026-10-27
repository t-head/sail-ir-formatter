; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare void @return_void()

declare half @return_half()

declare bfloat @return_bfloat()

declare float @return_float()

declare double @return_double()

declare fp128 @return_fp128()

declare x86_fp80 @return_x86_fp80()

declare ppc_fp128 @return_ppc_fp128()

declare x86_mmx @return_x86_mmx()

declare void @f_void_i32(i32)

declare i32 @f_i32_empty()

declare i32 @f_i32_half_bfloat_float_double(half, bfloat, float, double)

declare i32 @f_i32_i32_i32(i32, i32)

declare void @f_void_variadic(...)

declare void @f_void_i32_i32_variadic(i32, i32, ...)

declare ptr @f_f_i32_i32()

declare i1 @return_i1()

declare i8 @return_i8()

declare i16 @return_i16()

declare i32 @return_i32()

declare i64 @return_i64()

declare i57 @return_i57()

declare i129 @return_i129()

declare ptr @return_p()

declare ptr addrspace(1) @return_p_1()

declare ptr addrspace(42) @return_p_42()

declare <4 x i32> @return_v4_i32()

declare <4 x float> @return_v4_float()

declare <vscale x 4 x float> @return_vs_4_float()

declare <vscale x 4 x i32> @return_vs_4_i32()

declare <vscale x 8 x half> @return_vs_8_half()

declare <4 x ptr> @return_v_4_pi8()

declare [10 x i32] @return_a10_i32()

declare [8 x float] @return_a8_float()

declare [10 x ptr addrspace(4)] @return_a10_p_4()

declare [10 x [4 x float]] @return_a10_a4_float()

declare {} @return_struct_empty()

declare { i32 } @return_s_i32()

declare { float, i32 } @return_s_float_i32()

declare { { i32 } } @return_s_s_i32()

declare { i32, { i32 }, float } @return_s_i32_s_i32_float()

declare <{}> @return_sp_empty()

declare <{ i32 }> @return_sp_i32()

declare <{ float, i32 }> @return_sp_float_i32()

declare <{ i32, { i32, i1 }, float }> @return_sp_i32_s_i31_1_float()

declare { <{ i32 }> } @return_s_sp_i32()

declare <{ { i32 } }> @return_sp_s_i32()

declare target("target-no-param") @return_target_ext_no_param()

declare target("target-type-param", i32, double) @return_target_ext_type_params()

declare target("target-int-param", 0, 42) @return_target_ext_int_params()

declare target("target-params", i32, double, 0, 5) @return_target_ext_params()

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

