; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@dense_resource_tensor_constant = internal constant [5 x float] [float 0x3FCA034080000000, float 0xBFD0466300000000, float 0xBFD75DDF80000000, float 0xBFDE074F40000000, float 0x3FDDD3A1C0000000]
@dense_resource_vector_constant = internal constant <5 x float> <float 0x3FCA034080000000, float 0xBFD0466300000000, float 0xBFD75DDF80000000, float 0xBFDE074F40000000, float 0x3FDDD3A1C0000000>
@dense_resource_multidim_tensor_constant = internal constant [1 x [2 x [2 x float]]] [[2 x [2 x float]] [[2 x float] [float 0x3FD6B46A80000000, float 0x3FD6781AC0000000], [2 x float] [float 0xBFB45A2AA0000000, float 0x3FD77A5CA0000000]]]
@dense_resource_multidim_vector_constant = internal constant [1 x [2 x <2 x float>]] [[2 x <2 x float>] [<2 x float> <float 0x3FD6B46A80000000, float 0x3FD6781AC0000000>, <2 x float> <float 0xBFB45A2AA0000000, float 0x3FD77A5CA0000000>]]

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
