; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s
; focus on Attributes: hggcnoyield dead_on_unwind writable

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.__half = type { i16 }

; CHECK-LABLE: __ppukernel_float2half_f16
; Function Attrs: alwaysinline convergent mustprogress nofree norecurse nosync nounwind null_pointer_is_valid willreturn memory(argmem: write)
; CHECK: define internal void @__ppukernel_float2half_f16(i8* noalias nocapture writeonly sret(%struct.__half) align 2 %0, float noundef %1) local_unnamed_addr #0 {
define internal void @__ppukernel_float2half_f16(ptr dead_on_unwind noalias nocapture writable writeonly sret(%struct.__half) align 2 %0, float noundef %1) local_unnamed_addr #0 {
  %3 = fptrunc float %1 to half
; CHECK: %{{.+}} = bitcast i8* %0 to half*
; CHECK: store half %3, half* %{{.+}}, align 2
  store half %3, ptr %0, align 2
  ret void
}

attributes #0 = { alwaysinline convergent mustprogress nofree norecurse nosync hggcnoyield nounwind null_pointer_is_valid willreturn memory(argmem: write) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="ppu001" "target-features"="+ppu001,+ptx32" }

!llvm.build.commands = !{!0}
!ppu.module.id = !{!1}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}
!ppu.packed.struct.__ubsan\3A\3ADiag\3A\3AArg = !{!13, !13}
!ppu.packed.class.__ubsan\3A\3ADiag = !{!14, !14}
!ppu.packed.class.__ubsan\3A\3ATypeDescriptor = !{!15, !15, !15}

!0 = !{!"llvm-llvm18_dev/build/bin/clang-18 -cc1 -triple ppu -aux-triple x86_64-unknown-linux-gnu -emit-llvm -emit-llvm-uselists -dumpdir vectorAdd.out- -save-temps=cwd -disable-free -clear-ast-before-backend -disable-llvm-verifier -discard-value-names -main-file-name vectorAdd.hg -main-file-name-with-path ./vectorAdd.hg -mrelocation-model static -fno-delete-null-pointer-checks -mframe-pointer=all -relaxed-aliasing -fno-strict-return -ffp-contract=on -fno-rounding-math -no-integrated-as -mconstructor-aliases -aux-target-cpu x86-64 -disable-O0-optnone -fcuda-is-device -O2 -fcuda-allow-variadic-functions -mlink-builtin-bitcode llvm-llvm18_dev/build/lib/clang/18/include/libppudevice.bc --hggc-simt-branch -target-feature +ppu001 -target-sdk-version=0.0 -target-cpu ppu001 -debugger-tuning=gdb -fno-dwarf-directory-asm -fdebug-compilation-dir=irfm_test/run_on_ppu -fdebug-ranges-base-address -fcoverage-compilation-dir=irfm_test/run_on_ppu -resource-dir llvm-llvm18_dev/build/lib/clang/18 -use-gcc-builtins -no-round-trip-args -internal-isystem llvm-llvm18_dev/build/lib/clang/18/include -include gcc_x86imm_builtins.h -include gcc_builtins.h -hgfb-stub-name ./tmp/vectorAdd-hgfb.c -hggc-host-stub-name ./tmp/vectorAdd-host.cpp -fdeprecated-macro -ferror-limit 19 --hggc-splitter-is-on -fgnuc-version=11.4.0 -fskip-odr-check-in-gmf -fdelayed-template-parsing -fcxx-exceptions -fexceptions -fcolor-diagnostics -disable-llvm-passes -cuid=9a57656ca16837f6 -fcuda-allow-variadic-functions -std=c++17 -D__GCC_HAVE_DWARF2_CFI_ASM=1 -o ./tmp/vectorAdd-hgvm-ppu-ppu001.bc -x hggc-cpp-output ./tmp/vectorAdd-hgvm-ppu-ppu001.hggci"}
!1 = !{!"27UN9AX6BXQJL"}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 4, !"hggc-reflect-ftz", i32 0}
!4 = !{i32 4, !"hggc-reflect-fastmath", i32 0}
!5 = !{i32 4, !"hggc-reflect-fmad", i32 1}
!6 = !{i32 4, !"hggc-reflect-precdiv", i32 1}
!7 = !{i32 4, !"hggc-reflect-precsqrt", i32 1}
!8 = !{i32 4, !"hggc-reflect-strictftz", i32 0}
!9 = !{i32 4, !"hggc-reflect-simtbranch", i32 1}
!10 = !{i32 4, !"hggc-reflect-mathcfg", i32 15}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 18.1.7 (dev-4225212de9a8)"}
!13 = !{i32 1}
!14 = !{i32 4, i32 8}
!15 = !{i32 3}
