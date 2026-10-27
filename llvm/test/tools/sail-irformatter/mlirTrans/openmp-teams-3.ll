; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8

declare ptr @my_alloca_fn()

declare void @foo(i32, float, ptr, fp128, ptr, i32)

declare void @bar()

define void @omp_teams_branching_shared(i1 %0, i32 %1, float %2, ptr %3, fp128 %4) {
  %structArg = alloca { i1, i32, float, ptr, fp128, ptr, i32 }, align 16
  %6 = call ptr @my_alloca_fn()
  %7 = load i32, ptr %6, align 4
  br label %8

8:                                                ; preds = %5
  br label %codeRepl

codeRepl:                                         ; preds = %8
  %gep_ = getelementptr { i1, i32, float, ptr, fp128, ptr, i32 }, ptr %structArg, i32 0, i32 0
  store i1 %0, ptr %gep_, align 1
  %gep_4 = getelementptr { i1, i32, float, ptr, fp128, ptr, i32 }, ptr %structArg, i32 0, i32 1
  store i32 %1, ptr %gep_4, align 4
  %gep_5 = getelementptr { i1, i32, float, ptr, fp128, ptr, i32 }, ptr %structArg, i32 0, i32 2
  store float %2, ptr %gep_5, align 4
  %gep_6 = getelementptr { i1, i32, float, ptr, fp128, ptr, i32 }, ptr %structArg, i32 0, i32 3
  store ptr %3, ptr %gep_6, align 8
  %gep_7 = getelementptr { i1, i32, float, ptr, fp128, ptr, i32 }, ptr %structArg, i32 0, i32 4
  store fp128 %4, ptr %gep_7, align 16
  %gep_8 = getelementptr { i1, i32, float, ptr, fp128, ptr, i32 }, ptr %structArg, i32 0, i32 5
  store ptr %6, ptr %gep_8, align 8
  %gep_9 = getelementptr { i1, i32, float, ptr, fp128, ptr, i32 }, ptr %structArg, i32 0, i32 6
  store i32 %7, ptr %gep_9, align 4
  call void (ptr, i32, ptr, ...) @__kmpc_fork_teams(ptr @1, i32 1, ptr @omp_teams_branching_shared..omp_par, ptr %structArg)
  br label %teams.exit

teams.exit:                                       ; preds = %codeRepl
  call void @bar()
  ret void
}

define internal void @omp_teams_branching_shared..omp_par(ptr %global.tid.ptr, ptr %bound.tid.ptr, ptr %data) {
teams.alloca:
  %gep_ = getelementptr { i1, i32, float, ptr, fp128, ptr, i32 }, ptr %data, i32 0, i32 0
  %loadgep_ = load i1, ptr %gep_, align 1
  %gep_1 = getelementptr { i1, i32, float, ptr, fp128, ptr, i32 }, ptr %data, i32 0, i32 1
  %loadgep_2 = load i32, ptr %gep_1, align 4
  %gep_3 = getelementptr { i1, i32, float, ptr, fp128, ptr, i32 }, ptr %data, i32 0, i32 2
  %loadgep_4 = load float, ptr %gep_3, align 4
  %gep_5 = getelementptr { i1, i32, float, ptr, fp128, ptr, i32 }, ptr %data, i32 0, i32 3
  %loadgep_6 = load ptr, ptr %gep_5, align 8
  %gep_7 = getelementptr { i1, i32, float, ptr, fp128, ptr, i32 }, ptr %data, i32 0, i32 4
  %loadgep_8 = load fp128, ptr %gep_7, align 16
  %gep_9 = getelementptr { i1, i32, float, ptr, fp128, ptr, i32 }, ptr %data, i32 0, i32 5
  %loadgep_10 = load ptr, ptr %gep_9, align 8
  %gep_11 = getelementptr { i1, i32, float, ptr, fp128, ptr, i32 }, ptr %data, i32 0, i32 6
  %loadgep_12 = load i32, ptr %gep_11, align 4
  br label %teams.body

teams.body:                                       ; preds = %teams.alloca
  br label %omp.teams.region

omp.teams.region:                                 ; preds = %teams.body
  br i1 %loadgep_, label %omp.teams.region1, label %omp.teams.region2

omp.teams.region2:                                ; preds = %omp.teams.region
  br label %omp.teams.region3

omp.teams.region3:                                ; preds = %omp.teams.region1, %omp.teams.region2
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.teams.region3
  br label %teams.exit.exitStub

omp.teams.region1:                                ; preds = %omp.teams.region
  call void @foo(i32 %loadgep_2, float %loadgep_4, ptr %loadgep_6, fp128 %loadgep_8, ptr %loadgep_10, i32 %loadgep_12)
  br label %omp.teams.region3

teams.exit.exitStub:                              ; preds = %omp.region.cont
  ret void
}

; Function Attrs: nounwind
declare !callback !1 void @__kmpc_fork_teams(ptr, i32, ptr, ...) #0

attributes #0 = { nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!2}
!2 = !{i64 2, i64 -1, i64 -1, i1 true}

