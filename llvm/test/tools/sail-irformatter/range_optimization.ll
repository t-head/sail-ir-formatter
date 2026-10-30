; RUN: sail-irformatter -S < %s | opt -S -passes='function(correlated-propagation,instcombine,simplifycfg)' | FileCheck %s --implicit-check-not='sdiv ' --implicit-check-not='srem ' --implicit-check-not='select '
; RUN: sail-irformatter -S --type-pointers=false < %s | opt -S -passes='function(correlated-propagation,instcombine,simplifycfg)' | FileCheck %s --implicit-check-not='sdiv ' --implicit-check-not='srem ' --implicit-check-not='select '

; LLVM 17 optimizers can use the converted range without frontend preoptimization.
; CHECK-LABEL: define i32 @gdn_index()
; CHECK: [[TID:%.*]] = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range ![[RANGE:[0-9]+]]
; CHECK: lshr i{{16|32}} %{{.*}}, 4
; CHECK: and i32 [[TID]], 15
; CHECK: add nuw nsw i32
; CHECK-NEXT: ret i32
define i32 @gdn_index() {
  %tid = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %q = sdiv i32 %tid, 16
  %r = srem i32 %tid, 16
  %negative = icmp slt i32 %r, 0
  %correction = select i1 %negative, i32 16, i32 0
  %v = add i32 %r, %correction
  %index = add i32 %q, %v
  ret i32 %index
}

declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x()

; CHECK: ![[RANGE]] = !{i32 0, i32 1024}
