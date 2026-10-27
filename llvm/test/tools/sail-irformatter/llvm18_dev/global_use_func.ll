; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = 'jsoncpp.cpp'
source_filename = "jsoncpp.cpp"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-f16:16-f32:32-v16:16-v32:32-n16:32:64"
target triple = "ppu"

%struct.uint4 = type { i32, i32, i32, i32 }

@func_ptr = dso_local addrspace(1) externally_initialized global ptr @func_with_phi, align 8

declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()

define float @func_with_phi(ptr byval(%struct.uint4) %arg0, ptr byval(%struct.uint4) %arg1, ptr byval(%struct.uint4) %arg2) {
entry:
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or i32 %2, %1
  %3 = icmp ult i32 %linear_index, 131072
  %4 = load float, ptr %arg0, align 16
  br i1 %3, label %if, label %then

if:                                               ; preds = %entry
  br label %then

then:                                             ; preds = %if, %entry
; CHECK: %{{.+}} = phi i8* [ %{{.+}}, %if ], [ inttoptr (i64 1234 to i8*), %entry ]
  %arg3.sink = phi ptr [ %arg0, %if ], [ inttoptr (i64 1234 to ptr), %entry ]
  %5 = load float, ptr %arg3.sink, align 16
  %6 = fmul float %4, %5
  ret float %6
}


