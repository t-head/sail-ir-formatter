; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@printfFormat_0 = internal constant [32 x i8] c"pid (%u, %u, %u) idx (%3u)%s%u\0A\00"
@printfPrefix_0 = internal constant [4 x i8] c" x: "

; Function Attrs: nofree nounwind
declare noundef i32 @vprintf(ptr nocapture noundef readonly, ptr noundef) local_unnamed_addr #0

; CHECK-LABLE: kernel_device_print_0d1d
define void @kernel_device_print_0d1d(ptr addrspace(1) %0, ptr addrspace(1) %1) local_unnamed_addr !dbg !7 {
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !10
  %4 = and i32 %3, 127, !dbg !10
  %5 = zext nneg i32 %4 to i64, !dbg !11
  %6 = getelementptr i8, ptr addrspace(1) %0, i64 %5, !dbg !11
  %7 = tail call i8 asm sideeffect "mov.u16 $0, 0x0;\0A\09@$2 ld.global.b8 { $0 }, [ $1 + 0 ];", "=c,l,b"(ptr addrspace(1) %6, i1 true) #2, !dbg !12
  %8 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #2, !dbg !13
  %9 = tail call i32 asm "mov.u32 $0, %ctaid.y;", "=r"() #2, !dbg !13
  %10 = tail call i32 asm "mov.u32 $0, %ctaid.z;", "=r"() #2, !dbg !13
  %11 = sext i8 %7 to i32
  ; CHECK: %{{.+}} = alloca { i32, i32, i32, i32, i8*, i32 }, align 8
  %12 = alloca { i32, i32, i32, i32, ptr, i32 }, align 8
  store i32 %8, ptr %12, align 8
  ; CHECK: %{{.+}} = getelementptr inbounds { i32, i32, i32, i32, i8*, i32 }, { i32, i32, i32, i32, i8*, i32 }* %{{.+}}, i64 0, i32 1
  %13 = getelementptr inbounds { i32, i32, i32, i32, ptr, i32 }, ptr %12, i64 0, i32 1
  store i32 %9, ptr %13, align 4
  %14 = getelementptr inbounds { i32, i32, i32, i32, ptr, i32 }, ptr %12, i64 0, i32 2
  store i32 %10, ptr %14, align 8
  %15 = getelementptr inbounds { i32, i32, i32, i32, ptr, i32 }, ptr %12, i64 0, i32 3
  store i32 %4, ptr %15, align 4
  %16 = getelementptr inbounds { i32, i32, i32, i32, ptr, i32 }, ptr %12, i64 0, i32 4
  store ptr @printfPrefix_0, ptr %16, align 8
  %17 = getelementptr inbounds { i32, i32, i32, i32, ptr, i32 }, ptr %12, i64 0, i32 5
  store i32 %11, ptr %17, align 8
  %18 = call i32 @vprintf(ptr nonnull @printfFormat_0, ptr nonnull %12)
  %19 = getelementptr i8, ptr addrspace(1) %1, i64 %5, !dbg !14
  call void asm sideeffect "@$2 st.global.b8 [ $1 + 0 ], { $0 };", "c,l,b"(i8 %7, ptr addrspace(1) %19, i1 true) #2, !dbg !15
  ret void, !dbg !16
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { nofree nounwind }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}
!nvvm.annotations = !{!4, !5, !5, !4}
!llvm.ident = !{!6}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 4, !"nvvm-reflect-ftz", i32 1}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "triton", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "print_helper.py", directory: "/ppuswhome/xiao.han/workspace/triton/python/test/unit/language")
!4 = !{ptr @kernel_device_print_0d1d, !"kernel", i32 1}
!5 = !{ptr @kernel_device_print_0d1d, !"maxntidx", i32 128}
!6 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!7 = distinct !DISubprogram(name: "kernel_device_print_0d1d", linkageName: "kernel_device_print_0d1d", scope: !3, file: !3, line: 12, type: !8, scopeLine: 12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2)
!8 = !DISubroutineType(cc: DW_CC_normal, types: !9)
!9 = !{}
!10 = !DILocation(line: 13, column: 33, scope: !7)
!11 = !DILocation(line: 13, column: 20, scope: !7)
!12 = !DILocation(line: 13, column: 16, scope: !7)
!13 = !DILocation(line: 14, column: 27, scope: !7)
!14 = !DILocation(line: 15, column: 17, scope: !7)
!15 = !DILocation(line: 15, column: 38, scope: !7)
!16 = !DILocation(line: 15, column: 4, scope: !7)
