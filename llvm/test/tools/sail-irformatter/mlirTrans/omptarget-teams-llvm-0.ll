; RUN: sail-irformatter -S -verify-pointers < %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8

declare void @foo(i32)

define void @omp_target_teams_shared_simple(i32 %0) {
  %structArg = alloca { i32 }, align 8
  %gid.addr = alloca i32, align 4
  %tid.addr = alloca i32, align 4
  br label %teams.entry

teams.entry:                                      ; preds = %1
  br label %codeRepl

codeRepl:                                         ; preds = %teams.entry
  %gep_ = getelementptr { i32 }, ptr %structArg, i32 0, i32 0
  store i32 %0, ptr %gep_, align 4
  call void @omp_target_teams_shared_simple..omp_par(ptr %gid.addr, ptr %tid.addr, ptr %structArg)
  br label %teams.exit

teams.exit:                                       ; preds = %codeRepl
  ret void
}

define internal void @omp_target_teams_shared_simple..omp_par(ptr %gid.addr, ptr %tid.addr, ptr %0) {
teams.alloca:
  %gep_ = getelementptr { i32 }, ptr %0, i32 0, i32 0
  %loadgep_ = load i32, ptr %gep_, align 4
  %gid.use = load i32, ptr %gid.addr, align 4
  %tid.use = load i32, ptr %tid.addr, align 4
  br label %teams.body

teams.body:                                       ; preds = %teams.alloca
  br label %omp.teams.region

omp.teams.region:                                 ; preds = %teams.body
  call void @foo(i32 %loadgep_)
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.teams.region
  br label %teams.exit.exitStub

teams.exit.exitStub:                              ; preds = %omp.region.cont
  ret void
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
