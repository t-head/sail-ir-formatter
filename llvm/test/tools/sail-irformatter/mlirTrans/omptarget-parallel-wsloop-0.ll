; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8"
target triple = "amdgcn-amd-amdhsa"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr addrspace(1) constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8

define void @target_parallel_wsloop(ptr %0) #0 {
  %2 = alloca [1 x ptr], align 8, addrspace(5)
  %3 = addrspacecast ptr addrspace(5) %2 to ptr
  %structArg3 = alloca { ptr }, align 8, addrspace(5)
  %structArg.ascast4 = addrspacecast ptr addrspace(5) %structArg3 to ptr
  br label %entry

entry:                                            ; preds = %1
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr addrspacecast (ptr addrspace(1) @1 to ptr))
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  %gep_5 = getelementptr { ptr }, ptr addrspace(5) %structArg3, i32 0, i32 0
  store ptr %0, ptr addrspace(5) %gep_5, align 8
  %4 = getelementptr inbounds [1 x ptr], ptr %3, i64 0, i64 0
  store ptr %structArg.ascast4, ptr %4, align 8
  call void @__kmpc_parallel_51(ptr addrspacecast (ptr addrspace(1) @1 to ptr), i32 %omp_global_thread_num, i32 1, i32 -1, i32 -1, ptr @target_parallel_wsloop..omp_par.1, ptr null, ptr %3, i64 1)
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit
  ret void
}

; Function Attrs: nounwind
define internal void @target_parallel_wsloop..omp_par.1(ptr noalias noundef %tid.addr.ascast, ptr noalias noundef %zero.addr.ascast, ptr %0) #1 {
omp.par.entry:
  %gep_ = getelementptr { ptr }, ptr %0, i32 0, i32 0
  %loadgep_ = load ptr, ptr %gep_, align 8
  %structArg = alloca { ptr }, align 8, addrspace(5)
  %structArg.ascast = addrspacecast ptr addrspace(5) %structArg to ptr
  %tid.addr.local = alloca i32, align 4, addrspace(5)
  %1 = load i32, ptr %tid.addr.ascast, align 4
  store i32 %1, ptr addrspace(5) %tid.addr.local, align 4
  %tid = load i32, ptr addrspace(5) %tid.addr.local, align 4
  br label %omp.reduction.init

omp.reduction.init:                               ; preds = %omp.par.entry
  br label %omp.par.region

omp.par.region:                                   ; preds = %omp.reduction.init
  br label %omp.par.region1

omp.par.region1:                                  ; preds = %omp.par.region
  br label %omp_loop.preheader

omp_loop.preheader:                               ; preds = %omp.par.region1
  %gep_1 = getelementptr { ptr }, ptr addrspace(5) %structArg, i32 0, i32 0
  store ptr %loadgep_, ptr addrspace(5) %gep_1, align 8
  %2 = call i32 @omp_get_num_threads()
  call void @__kmpc_for_static_loop_4u(ptr addrspacecast (ptr addrspace(1) @1 to ptr), ptr @target_parallel_wsloop..omp_par, ptr %structArg.ascast, i32 10, i32 %2, i32 0)
  br label %omp_loop.exit

omp_loop.exit:                                    ; preds = %omp_loop.preheader
  br label %omp_loop.after

omp_loop.after:                                   ; preds = %omp_loop.exit
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp_loop.after
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont
  br label %omp.par.outlined.exit.exitStub

omp.par.outlined.exit.exitStub:                   ; preds = %omp.par.pre_finalize
  ret void
}

define internal void @target_parallel_wsloop..omp_par(i32 %0, ptr %1) #0 {
omp_loop.body:
  %gep_ = getelementptr { ptr }, ptr %1, i32 0, i32 0
  %loadgep_ = load ptr, ptr %gep_, align 8
  %2 = mul i32 %0, 1
  %3 = add i32 %2, 0
  br label %omp.wsloop.region

omp.wsloop.region:                                ; preds = %omp_loop.body
  %4 = getelementptr [10 x i32], ptr %loadgep_, i32 0, i32 %3
  store i32 %3, ptr %4, align 4
  br label %omp.region.cont2

omp.region.cont2:                                 ; preds = %omp.wsloop.region
  br label %omp.prelatch.exitStub

omp.prelatch.exitStub:                            ; preds = %omp.region.cont2
  ret void
}

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #2

; Function Attrs: alwaysinline
declare void @__kmpc_for_static_loop_4u(ptr, ptr, ptr, i32, i32, i32) #3

; Function Attrs: nounwind
declare i32 @omp_get_num_threads() #2

; Function Attrs: alwaysinline
declare void @__kmpc_parallel_51(ptr, i32, i32, i32, i32, ptr, ptr, ptr, i64) #3

attributes #0 = { "target-cpu"="gfx90a" "target-features"="+gfx9-insts,+wavefrontsize64" }
attributes #1 = { nounwind "target-cpu"="gfx90a" "target-features"="+gfx9-insts,+wavefrontsize64" }
attributes #2 = { nounwind }
attributes #3 = { alwaysinline }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
