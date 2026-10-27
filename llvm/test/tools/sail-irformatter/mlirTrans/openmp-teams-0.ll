; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8

declare void @foo()

define void @omp_teams_simple() {
  br label %teams.entry

teams.entry:                                      ; preds = %0
  br label %codeRepl

codeRepl:                                         ; preds = %teams.entry
  call void (ptr, i32, ptr, ...) @__kmpc_fork_teams(ptr @1, i32 0, ptr @omp_teams_simple..omp_par)
  br label %teams.exit

teams.exit:                                       ; preds = %codeRepl
  ret void
}

define internal void @omp_teams_simple..omp_par(ptr %global.tid.ptr, ptr %bound.tid.ptr) {
teams.alloca:
  br label %teams.body

teams.body:                                       ; preds = %teams.alloca
  br label %omp.teams.region

omp.teams.region:                                 ; preds = %teams.body
  call void @foo()
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.teams.region
  br label %teams.exit.exitStub

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

