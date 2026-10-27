; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%empty = type {}
%opaque = type opaque
%long = type { i32, { i32, i1 }, float, ptr }
%unpacked = type { i32 }
%packed = type <{ i32 }>
%"name with spaces and !^$@$#" = type <{ i32 }>
%struct-of-arrays = type { [10 x i32] }
%array-of-structs = type { i32 }

declare %empty @return_s_empty()

declare %opaque @return_s_opaque()

declare %long @return_s_long()

declare %unpacked @return_s_unpacked()

declare %packed @return_s_packed()

declare %"name with spaces and !^$@$#" @return_s_symbols()

declare %struct-of-arrays @return_s_struct_of_arrays()

declare [10 x %array-of-structs] @return_s_array_of_structs()

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
