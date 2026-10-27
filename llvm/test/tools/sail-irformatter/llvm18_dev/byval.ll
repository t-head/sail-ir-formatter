; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%struct.uint4 = type { i32, i32, i32, i32 }

; Function Attrs: convergent mustprogress nofree nounwind null_pointer_is_valid willreturn memory(none)
define noundef float @__ppumathpriv_cnvt_f32_u128_rn_u128(i128 noundef %0) #0 {
  %2 = alloca %struct.uint4, align 16
  %3 = alloca %struct.uint4, align 16
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %2) #1
  store i128 %0, ptr %3, align 16, !tbaa.struct !16
; CHECK:  %{{.+}} = call i32 @__ppumathpriv_normalize_u128(i8* noundef nonnull %{{.+}}, %struct.uint4* noundef nonnull byval(%struct.uint4) align 16 %3) #0
  %4 = call i32 @__ppumathpriv_normalize_u128(ptr noundef nonnull %2, ptr noundef nonnull byval(%struct.uint4) align 16 %3) #0
  %5 = load i32, ptr %2, align 16, !tbaa !21
  %6 = getelementptr inbounds %struct.uint4, ptr %2, i64 0, i32 1
  %7 = load i32, ptr %6, align 4, !tbaa !23
  %8 = or i32 %7, %5
  %9 = getelementptr inbounds %struct.uint4, ptr %2, i64 0, i32 2
  %10 = load i32, ptr %9, align 8, !tbaa !24
  %11 = or i32 %8, %10
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %17, label %13

13:                                               ; preds = %1
  %14 = getelementptr inbounds %struct.uint4, ptr %2, i64 0, i32 3
  %15 = load i32, ptr %14, align 4, !tbaa !25
  %16 = or i32 %15, 1
  store i32 %16, ptr %14, align 4, !tbaa !25
  br label %17

17:                                               ; preds = %13, %1
  %18 = getelementptr inbounds %struct.uint4, ptr %2, i64 0, i32 3
  %19 = load i32, ptr %18, align 4, !tbaa !25
  %20 = uitofp i32 %19 to float
  %21 = bitcast float %20 to i32
  %22 = shl i32 %4, 23
  %23 = sub i32 %21, %22
  %24 = add i32 %23, 805306368
  %25 = bitcast i32 %24 to float
  %26 = icmp eq i32 %4, 128
  %27 = select contract i1 %26, float 0.000000e+00, float %25
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %2) #1
  ret float %27
}

; Function Attrs: convergent mustprogress nofree norecurse nosync nounwind null_pointer_is_valid willreturn memory(argmem: readwrite)
; CHECK:  declare i32 @__ppumathpriv_normalize_u128(i8* nocapture noundef, %struct.uint4* nocapture noundef readonly byval(%struct.uint4) align 16) #0
declare i32 @__ppumathpriv_normalize_u128(ptr nocapture noundef, ptr nocapture noundef readonly byval(%struct.uint4) align 16) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

attributes #0 = { convergent mustprogress nofree nounwind null_pointer_is_valid willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="ppu001" "target-features"="+ppu001,+ptx32" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }

!llvm.build.commands = !{!0}
!ppu.module.id = !{!1}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}
!ppu.packed.struct.__ubsan\3A\3ADiag\3A\3AArg = !{!13, !13}
!ppu.packed.class.__ubsan\3A\3ADiag = !{!14, !14}
!ppu.packed.class.__ubsan\3A\3ATypeDescriptor = !{!15, !15, !15}

!0 = !{!"clang-18 -cc1 -triple ppu -aux-triple x86_64-unknown-linux-gnu -emit-llvm -emit-llvm-uselists -dumpdir vectorAdd.out- -save-temps=cwd -disable-free -clear-ast-before-backend -disable-llvm-verifier -discard-value-names -main-file-name vectorAdd.hg -main-file-name-with-path ./vectorAdd.hg -mrelocation-model static -fno-delete-null-pointer-checks -mframe-pointer=all -relaxed-aliasing -fno-strict-return -ffp-contract=on -fno-rounding-math -no-integrated-as -mconstructor-aliases -aux-target-cpu x86-64 -disable-O0-optnone -fcuda-is-device -O2 -fcuda-allow-variadic-functions -mlink-builtin-bitcode llvm-llvm18_dev/build/lib/clang/18/include/libppudevice.bc --hggc-simt-branch -target-feature +ppu001 -target-sdk-version=0.0 -target-cpu ppu001 -debugger-tuning=gdb -fno-dwarf-directory-asm -fdebug-compilation-dir=irfm_test/run_on_ppu -fdebug-ranges-base-address -fcoverage-compilation-dir=irfm_test/run_on_ppu -resource-dir llvm-llvm18_dev/build/lib/clang/18 -use-gcc-builtins -no-round-trip-args -internal-isystem llvm-llvm18_dev/build/lib/clang/18/include -include gcc_x86imm_builtins.h -include gcc_builtins.h -hgfb-stub-name ./tmp/vectorAdd-hgfb.c -hggc-host-stub-name ./tmp/vectorAdd-host.cpp -fdeprecated-macro -ferror-limit 19 --hggc-splitter-is-on -fgnuc-version=11.4.0 -fskip-odr-check-in-gmf -fdelayed-template-parsing -fcxx-exceptions -fexceptions -fcolor-diagnostics -disable-llvm-passes -cuid=9a57656ca16837f6 -fcuda-allow-variadic-functions -std=c++17 -D__GCC_HAVE_DWARF2_CFI_ASM=1 -o ./tmp/vectorAdd-hgvm-ppu-ppu001.bc -x hggc-cpp-output ./tmp/vectorAdd-hgvm-ppu-ppu001.hggci"}
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
!16 = !{i64 0, i64 4, !17, i64 4, i64 4, !17, i64 8, i64 4, !17, i64 12, i64 4, !17}
!17 = !{!18, !18, i64 0}
!18 = !{!"int", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = !{!22, !18, i64 0}
!22 = !{!"_ZTS5uint4", !18, i64 0, !18, i64 4, !18, i64 8, !18, i64 12}
!23 = !{!22, !18, i64 4}
!24 = !{!22, !18, i64 8}
!25 = !{!22, !18, i64 12}
!26 = !{!27, !27, i64 0}
!27 = !{!"short", !19, i64 0}
!28 = !{i64 0, i64 4, !17, i64 4, i64 4, !17, i64 8, i64 4, !17}
!29 = !{i64 0, i64 4, !17, i64 4, i64 4, !17}
!30 = !{i64 0, i64 4, !17}
!31 = distinct !{!31, !32, !33}
!32 = !{!"llvm.loop.mustprogress"}
!33 = !{!"llvm.loop.unroll.disable"}
!34 = distinct !{!34, !32, !33}
!35 = distinct !{!35, !32, !33}
!36 = distinct !{!36, !32, !33}
!37 = !{i32 0, i32 33}
!38 = distinct !{!38, !32, !33}
!39 = distinct !{!39, !32, !33}
!40 = distinct !{!40, !32, !33}
!41 = distinct !{!41, !32, !33}
!42 = !{i64 0, i64 2, !26}
!43 = !{!44, !44, i64 0}
!44 = !{!"_Float16", !19, i64 0}
