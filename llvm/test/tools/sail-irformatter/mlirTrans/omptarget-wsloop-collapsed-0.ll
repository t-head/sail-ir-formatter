; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8"
target triple = "amdgcn-amd-amdhsa"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr addrspace(1) constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8

define void @target_collapsed_wsloop(ptr %0) {
  %structArg = alloca { ptr }, align 8, addrspace(5)
  %structArg.ascast = addrspacecast ptr addrspace(5) %structArg to ptr
  br label %entry

entry:                                            ; preds = %1
  br label %omp_loop.preheader

omp_loop.preheader:                               ; preds = %entry
  br label %omp_collapsed.preheader

omp_collapsed.preheader:                          ; preds = %omp_loop.preheader
  %gep_ = getelementptr { ptr }, ptr addrspace(5) %structArg, i32 0, i32 0
  store ptr %0, ptr addrspace(5) %gep_, align 8
  %2 = call i32 @omp_get_num_threads()
  call void @__kmpc_for_static_loop_4u(ptr addrspacecast (ptr addrspace(1) @1 to ptr), ptr @target_collapsed_wsloop..omp_par, ptr %structArg.ascast, i32 10000, i32 %2, i32 0)
  br label %omp_collapsed.exit

omp_collapsed.exit:                               ; preds = %omp_collapsed.preheader
  br label %omp_collapsed.after

omp_collapsed.after:                              ; preds = %omp_collapsed.exit
  br label %omp_loop.after

omp_loop.after:                                   ; preds = %omp_collapsed.after
  ret void
}

define internal void @target_collapsed_wsloop..omp_par(i32 %0, ptr %1) {
omp_collapsed.body:
  %gep_ = getelementptr { ptr }, ptr %1, i32 0, i32 0
  %loadgep_ = load ptr, ptr %gep_, align 8
  %2 = urem i32 %0, 100
  %3 = udiv i32 %0, 100
  br label %omp_loop.body

omp_loop.body:                                    ; preds = %omp_collapsed.body
  %4 = mul i32 %3, 1
  %5 = add i32 %4, 0
  br label %omp_loop.preheader1

omp_loop.preheader1:                              ; preds = %omp_loop.body
  br label %omp_loop.body4

omp_loop.body4:                                   ; preds = %omp_loop.preheader1
  %6 = mul i32 %2, 1
  %7 = add i32 %6, 0
  br label %omp.wsloop.region

omp.wsloop.region:                                ; preds = %omp_loop.body4
  %8 = add i32 %5, %7
  %9 = mul nsw i32 %7, 99
  %10 = add i32 %5, %9
  %11 = getelementptr i32, ptr %loadgep_, i32 %10
  store i32 %8, ptr %11, align 4
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.wsloop.region
  br label %omp_loop.after7

omp_loop.after7:                                  ; preds = %omp.region.cont
  br label %omp.prelatch.exitStub

omp.prelatch.exitStub:                            ; preds = %omp_loop.after7
  ret void
}

; Function Attrs: alwaysinline
declare void @__kmpc_for_static_loop_4u(ptr, ptr, ptr, i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @omp_get_num_threads() #1

attributes #0 = { alwaysinline }
attributes #1 = { nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
