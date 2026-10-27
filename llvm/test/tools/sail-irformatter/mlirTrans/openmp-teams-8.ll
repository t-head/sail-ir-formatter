; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8

declare void @beforeTeams()

declare void @duringTeams()

declare void @afterTeams()

define void @teams_if(i1 %0) {
  call void @beforeTeams()
  br label %teams.entry

teams.entry:                                      ; preds = %1
  %numTeamsUpper = select i1 %0, i32 0, i32 1
  %numTeamsLower = select i1 %0, i32 0, i32 1
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_push_num_teams_51(ptr @1, i32 %omp_global_thread_num, i32 %numTeamsLower, i32 %numTeamsUpper, i32 0)
  br label %codeRepl

codeRepl:                                         ; preds = %teams.entry
  call void (ptr, i32, ptr, ...) @__kmpc_fork_teams(ptr @1, i32 0, ptr @teams_if..omp_par)
  br label %teams.exit

teams.exit:                                       ; preds = %codeRepl
  call void @afterTeams()
  ret void
}

define internal void @teams_if..omp_par(ptr %global.tid.ptr, ptr %bound.tid.ptr) {
teams.alloca:
  br label %teams.body

teams.body:                                       ; preds = %teams.alloca
  br label %omp.teams.region

omp.teams.region:                                 ; preds = %teams.body
  call void @duringTeams()
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.teams.region
  br label %teams.exit.exitStub

teams.exit.exitStub:                              ; preds = %omp.region.cont
  ret void
}

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #0

declare void @__kmpc_push_num_teams_51(ptr, i32, i32, i32, i32)

; Function Attrs: nounwind
declare !callback !1 void @__kmpc_fork_teams(ptr, i32, ptr, ...) #0

attributes #0 = { nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!2}
!2 = !{i64 2, i64 -1, i64 -1, i1 true}

