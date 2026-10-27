; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s

; ModuleID = 'runtime_memory_allocate_aligned.ll'
source_filename = "runtime.cpp"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%class.anon = type { ptr, ptr, ptr, ptr }
%struct.LLVMRuntime = type { %struct.PreallocatedMemoryChunk, %struct.PreallocatedMemoryChunk, ptr, ptr, ptr, ptr, ptr, [512 x ptr], [512 x i64], ptr, ptr, [1024 x ptr], [1024 x ptr], [1024 x ptr], ptr, ptr, ptr, ptr, ptr, [2048 x i8], [32 x i64], i32, i64, ptr, i32, i32, i64 }
%struct.PreallocatedMemoryChunk = type { ptr, ptr, i64 }

@"_$_str" = external hidden unnamed_addr addrspace(1) constant [144 x i8], align 1
@"_$_str_$_1" = external hidden unnamed_addr addrspace(1) constant [11 x i8], align 1
@"_$_str_$_2" = external hidden unnamed_addr addrspace(1) constant [30 x i8], align 1
@"_$_str_$_3" = external hidden unnamed_addr addrspace(1) constant [28 x i8], align 1

; Function Attrs: noinline nounwind optnone uwtable
define hidden fastcc void @taichi_assert_format(ptr noundef %0, i1 noundef zeroext %1, ptr noundef %2) unnamed_addr #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i8, align 1
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca %class.anon, align 8
  store ptr %0, ptr %4, align 8
  %10 = zext i1 %1 to i8
  store i8 %10, ptr %5, align 1
  store ptr %2, ptr %6, align 8
  store i32 0, ptr %7, align 4
  store ptr null, ptr %8, align 8
  %11 = load i8, ptr %5, align 1
  %12 = trunc i8 %11 to i1
  %13 = zext i1 %12 to i32
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %3
  br label %80

16:                                               ; preds = %3
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds %struct.LLVMRuntime, ptr %17, i32 0, i32 22
  %19 = load i64, ptr %18, align 8
  %20 = icmp ne i64 %19, 0
  br i1 %20, label %79, label %21

21:                                               ; preds = %16
  %22 = load ptr, ptr %4, align 8
  %23 = getelementptr inbounds %struct.LLVMRuntime, ptr %22, i32 0, i32 21
  %24 = getelementptr inbounds %class.anon, ptr %9, i32 0, i32 0
  store ptr %4, ptr %24, align 8
  %25 = getelementptr inbounds %class.anon, ptr %9, i32 0, i32 1
  store ptr %6, ptr %25, align 8
  %26 = getelementptr inbounds %class.anon, ptr %9, i32 0, i32 2
  store ptr %7, ptr %26, align 8
  %27 = getelementptr inbounds %class.anon, ptr %9, i32 0, i32 3
  store ptr %8, ptr %27, align 8
  br label %28

28:                                               ; preds = %28, %21
  %29 = atomicrmw volatile xchg ptr %23, i32 1 seq_cst, align 4
  %30 = icmp eq i32 %29, 1
  br i1 %30, label %28, label %mutex_lock_i32.exit.i.i.i.i, !llvm.loop !35

mutex_lock_i32.exit.i.i.i.i:                      ; preds = %28
  call void @llvm.nvvm.membar.gl()
  %31 = load ptr, ptr %9, align 8
  %32 = load ptr, ptr %31, align 8
  %33 = getelementptr inbounds %struct.LLVMRuntime, ptr %32, i64 0, i32 22
  %34 = load i64, ptr %33, align 8
  %.not.i.i.i.i.i = icmp eq i64 %34, 0
  br i1 %.not.i.i.i.i.i, label %35, label %_Z11locked_taskIZ20taichi_assert_formatE3_dl__0EvPvRKT_.exit

35:                                               ; preds = %mutex_lock_i32.exit.i.i.i.i
  store i64 1, ptr %33, align 8
  %36 = load ptr, ptr %9, align 8
  %37 = load ptr, ptr %36, align 8
  %38 = getelementptr inbounds %struct.LLVMRuntime, ptr %37, i64 0, i32 19
  br i1 false, label %split, label %loadstoreloop

loadstoreloop:                                    ; preds = %loadstoreloop, %35
  %39 = phi i64 [ 0, %35 ], [ %41, %loadstoreloop ]
  %40 = getelementptr inbounds i8, ptr %38, i64 %39
  store i8 0, ptr %40, align 1
  %41 = add i64 %39, 1
  %42 = icmp ult i64 %41, 2048
  br i1 %42, label %loadstoreloop, label %split

split:                                            ; preds = %loadstoreloop, %35
  %43 = load ptr, ptr %9, align 8
  %44 = load ptr, ptr %43, align 8
  %45 = getelementptr inbounds %struct.LLVMRuntime, ptr %44, i64 0, i32 19
  %46 = getelementptr inbounds %class.anon, ptr %9, i64 0, i32 1
  %47 = load ptr, ptr %46, align 8
  %48 = load ptr, ptr %47, align 8
  %49 = load i8, ptr %48, align 1
  %.not5.i.i.i.i.i.i = icmp eq i8 %49, 0
  br i1 %.not5.i.i.i.i.i.i, label %taichi_strlen.exit.i.i.i.i.i, label %.lr.ph.i.i.i.i.i.i.preheader

.lr.ph.i.i.i.i.i.i.preheader:                     ; preds = %split
  br label %.lr.ph.i.i.i.i.i.i

.lr.ph.i.i.i.i.i.i:                               ; preds = %.lr.ph.i.i.i.i.i.i, %.lr.ph.i.i.i.i.i.i.preheader
  %.07.i.i.i.i.i.i = phi ptr [ %51, %.lr.ph.i.i.i.i.i.i ], [ %48, %.lr.ph.i.i.i.i.i.i.preheader ]
  %.046.i.i.i.i.i.i = phi i64 [ %50, %.lr.ph.i.i.i.i.i.i ], [ 0, %.lr.ph.i.i.i.i.i.i.preheader ]
  %50 = add i64 %.046.i.i.i.i.i.i, 1
  %51 = getelementptr inbounds i8, ptr %.07.i.i.i.i.i.i, i64 1
  %52 = load i8, ptr %51, align 1
  %.not.i.i.i.i.i.i = icmp eq i8 %52, 0
  br i1 %.not.i.i.i.i.i.i, label %taichi_strlen.exit.i.i.i.i.i.loopexit, label %.lr.ph.i.i.i.i.i.i, !llvm.loop !37

taichi_strlen.exit.i.i.i.i.i.loopexit:            ; preds = %.lr.ph.i.i.i.i.i.i
  %.lcssa = phi i64 [ %50, %.lr.ph.i.i.i.i.i.i ]
  br label %taichi_strlen.exit.i.i.i.i.i

taichi_strlen.exit.i.i.i.i.i:                     ; preds = %taichi_strlen.exit.i.i.i.i.i.loopexit, %split
  %.04.lcssa.i.i.i.i.i.i = phi i64 [ 0, %split ], [ %.lcssa, %taichi_strlen.exit.i.i.i.i.i.loopexit ]
  %53 = call i64 @llvm.umin.i64(i64 %.04.lcssa.i.i.i.i.i.i, i64 2047)
  %54 = icmp ne i64 %53, 0
  br i1 %54, label %loop-memcpy-expansion, label %post-loop-memcpy-expansion

loop-memcpy-expansion:                            ; preds = %loop-memcpy-expansion, %taichi_strlen.exit.i.i.i.i.i
  %loop-index = phi i64 [ 0, %taichi_strlen.exit.i.i.i.i.i ], [ %58, %loop-memcpy-expansion ]
  %55 = getelementptr inbounds i8, ptr %48, i64 %loop-index
  %56 = load i8, ptr %55, align 1
  %57 = getelementptr inbounds i8, ptr %45, i64 %loop-index
  store i8 %56, ptr %57, align 1
  %58 = add i64 %loop-index, 1
  %59 = icmp ult i64 %58, %53
  br i1 %59, label %loop-memcpy-expansion, label %post-loop-memcpy-expansion

post-loop-memcpy-expansion:                       ; preds = %loop-memcpy-expansion, %taichi_strlen.exit.i.i.i.i.i
  %60 = getelementptr inbounds %class.anon, ptr %9, i64 0, i32 2
  %61 = load ptr, ptr %60, align 8
  %62 = load i32, ptr %61, align 4
  %63 = icmp sgt i32 %62, 0
  br i1 %63, label %.lr.ph.i.i.i.i.i, label %_Z11locked_taskIZ20taichi_assert_formatE3_dl__0EvPvRKT_.exit

.lr.ph.i.i.i.i.i:                                 ; preds = %post-loop-memcpy-expansion
  %64 = getelementptr inbounds %class.anon, ptr %9, i64 0, i32 3
  br label %65

65:                                               ; preds = %65, %.lr.ph.i.i.i.i.i
  %.07.i.i.i.i.i = phi i32 [ 0, %.lr.ph.i.i.i.i.i ], [ %74, %65 ]
  %66 = load ptr, ptr %64, align 8
  %67 = load ptr, ptr %66, align 8
  %68 = zext i32 %.07.i.i.i.i.i to i64
  %69 = getelementptr inbounds i64, ptr %67, i64 %68
  %70 = load i64, ptr %69, align 8
  %71 = load ptr, ptr %9, align 8
  %72 = load ptr, ptr %71, align 8
  %73 = getelementptr inbounds %struct.LLVMRuntime, ptr %72, i64 0, i32 20, i64 %68
  store i64 %70, ptr %73, align 8
  %74 = add nuw nsw i32 %.07.i.i.i.i.i, 1
  %75 = load ptr, ptr %60, align 8
  %76 = load i32, ptr %75, align 4
  %77 = icmp slt i32 %74, %76
  br i1 %77, label %65, label %_Z11locked_taskIZ20taichi_assert_formatE3_dl__0EvPvRKT_.exit.loopexit, !llvm.loop !38

_Z11locked_taskIZ20taichi_assert_formatE3_dl__0EvPvRKT_.exit.loopexit: ; preds = %65
  br label %_Z11locked_taskIZ20taichi_assert_formatE3_dl__0EvPvRKT_.exit

_Z11locked_taskIZ20taichi_assert_formatE3_dl__0EvPvRKT_.exit: ; preds = %_Z11locked_taskIZ20taichi_assert_formatE3_dl__0EvPvRKT_.exit.loopexit, %post-loop-memcpy-expansion, %mutex_lock_i32.exit.i.i.i.i
  call void @llvm.nvvm.membar.gl()
  %78 = atomicrmw volatile xchg ptr %23, i32 0 seq_cst, align 4
  br label %79

79:                                               ; preds = %_Z11locked_taskIZ20taichi_assert_formatE3_dl__0EvPvRKT_.exit, %16
  call void asm sideeffect "exit;", "~{dirflag},~{fpsr},~{flags}"() #5, !srcloc !39
  br label %80

80:                                               ; preds = %79, %15
  ret void
}

; Function Attrs: alwaysinline
declare void @__assertfail(ptr noundef, ptr noundef, i32 noundef, ptr noundef, i64 noundef) local_unnamed_addr #1

; CHECK-LABLE: runtime_memory_allocate_aligned
; Function Attrs: alwaysinline nounwind uwtable
define dso_local void @runtime_memory_allocate_aligned(ptr noundef %0, i64 noundef %1, i64 noundef %2, ptr nocapture noundef writeonly %3) local_unnamed_addr #2 {
  %5 = addrspacecast ptr %3 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = getelementptr inbounds %struct.LLVMRuntime, ptr addrspace(1) %6, i64 0, i32 1, i32 2
  %8 = load i64, ptr addrspace(1) %7, align 8
  %.not.i = icmp eq i64 %8, 0
  br i1 %.not.i, label %50, label %9

9:                                                ; preds = %4
  %10 = getelementptr inbounds %struct.LLVMRuntime, ptr addrspace(1) %6, i64 0, i32 24
  %11 = addrspacecast ptr addrspace(1) %10 to ptr
  br label %12

12:                                               ; preds = %12, %9
  %13 = atomicrmw volatile xchg ptr %11, i32 1 seq_cst, align 4
  %14 = icmp eq i32 %13, 1
  br i1 %14, label %12, label %mutex_lock_i32.exit.i.i.i.i.i.i, !llvm.loop !35

mutex_lock_i32.exit.i.i.i.i.i.i:                  ; preds = %12
  tail call void @llvm.nvvm.membar.gl()
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %6, i64 24
  %15 = load ptr, ptr addrspace(1) %sunkaddr, align 8
  %16 = ptrtoint ptr %15 to i64
  %17 = getelementptr inbounds %struct.LLVMRuntime, ptr addrspace(1) %6, i64 0, i32 1, i32 1
  %18 = load ptr, ptr addrspace(1) %17, align 8
  %19 = add i64 %2, -1
  %20 = add i64 %19, %16
  %21 = or i64 %20, %2
  %22 = and i64 %21, -4294967296
  %23 = icmp eq i64 %22, 0
  br i1 %23, label %24, label %29

24:                                               ; preds = %mutex_lock_i32.exit.i.i.i.i.i.i
  %25 = trunc i64 %2 to i32
  %26 = trunc i64 %20 to i32
  %27 = urem i32 %26, %25
  %28 = zext i32 %27 to i64
  br label %31

29:                                               ; preds = %mutex_lock_i32.exit.i.i.i.i.i.i
  %30 = urem i64 %20, %2
  br label %31

31:                                               ; preds = %29, %24
  %32 = phi i64 [ %28, %24 ], [ %30, %29 ]
  %33 = ptrtoint ptr %18 to i64
  %34 = ptrtoint ptr %15 to i64
  %35 = xor i64 %32, -1
  %36 = add i64 %35, %2
  %37 = add i64 %36, %1
  %38 = add i64 %37, %34
  %.not.i.i.i.i.i.i.i = icmp ugt i64 %38, %33
  %39 = getelementptr inbounds i8, ptr %15, i64 %37
  %40 = add i64 %36, %34
  br i1 %.not.i.i.i.i.i.i.i, label %_Z11locked_taskIZN11LLVMRuntime29allocate_from_reserved_memoryER23PreallocatedMemoryChunkmmE3_dl__1EvPvRKT_.exit.i.i, label %41

41:                                               ; preds = %31
  %42 = inttoptr i64 %40 to ptr
  %sunkaddr4 = getelementptr inbounds i8, ptr addrspace(1) %6, i64 24
  store ptr %39, ptr addrspace(1) %sunkaddr4, align 8
  br label %_Z11locked_taskIZN11LLVMRuntime29allocate_from_reserved_memoryER23PreallocatedMemoryChunkmmE3_dl__1EvPvRKT_.exit.i.i

_Z11locked_taskIZN11LLVMRuntime29allocate_from_reserved_memoryER23PreallocatedMemoryChunkmmE3_dl__1EvPvRKT_.exit.i.i: ; preds = %41, %31
  %.0.i.i = phi ptr [ null, %31 ], [ %42, %41 ]
  %43 = ptrtoint ptr %18 to i64
  %44 = icmp ugt i64 %38, %43
  tail call void @llvm.nvvm.membar.gl()
  %45 = atomicrmw volatile xchg ptr %11, i32 0 seq_cst, align 4
  br i1 %44, label %46, label %_ZN11LLVMRuntime29allocate_from_reserved_memoryER23PreallocatedMemoryChunkmm.exit.i

46:                                               ; preds = %_Z11locked_taskIZN11LLVMRuntime29allocate_from_reserved_memoryER23PreallocatedMemoryChunkmmE3_dl__1EvPvRKT_.exit.i.i
  tail call void @__assertfail(ptr noundef nonnull addrspacecast (ptr addrspace(1) @"_$_str" to ptr), ptr noundef nonnull addrspacecast (ptr addrspace(1) @"_$_str_$_1" to ptr), i32 noundef 0, ptr noundef nonnull addrspacecast (ptr addrspace(1) @"_$_str_$_2" to ptr), i64 noundef 1) #5
  br label %_ZN11LLVMRuntime29allocate_from_reserved_memoryER23PreallocatedMemoryChunkmm.exit.i

_ZN11LLVMRuntime29allocate_from_reserved_memoryER23PreallocatedMemoryChunkmm.exit.i: ; preds = %46, %_Z11locked_taskIZN11LLVMRuntime29allocate_from_reserved_memoryER23PreallocatedMemoryChunkmmE3_dl__1EvPvRKT_.exit.i.i
  %47 = ptrtoint ptr %18 to i64
  %48 = icmp ugt i64 %38, %47
  %49 = xor i1 %48, true
  tail call fastcc void @taichi_assert_format(ptr noundef nonnull %0, i1 noundef zeroext %49, ptr noundef nonnull addrspacecast (ptr addrspace(1) @"_$_str_$_3" to ptr))
  br label %_ZN11LLVMRuntime16allocate_alignedER23PreallocatedMemoryChunkmmb.exit

50:                                               ; preds = %4
  %51 = getelementptr inbounds %struct.LLVMRuntime, ptr addrspace(1) %6, i64 0, i32 2
  %52 = load ptr, ptr addrspace(1) %51, align 8
  %53 = getelementptr inbounds %struct.LLVMRuntime, ptr addrspace(1) %6, i64 0, i32 6
  %54 = load ptr, ptr addrspace(1) %53, align 8
  ; CHECK: %{{.+}} = tail call noundef i8* %{{.+}}(i8* noundef %{{.+}}, i64 noundef %1, i64 noundef %2) #5
  %55 = tail call noundef ptr %52(ptr noundef %54, i64 noundef %1, i64 noundef %2) #5
  br label %_ZN11LLVMRuntime16allocate_alignedER23PreallocatedMemoryChunkmmb.exit

_ZN11LLVMRuntime16allocate_alignedER23PreallocatedMemoryChunkmmb.exit: ; preds = %50, %_ZN11LLVMRuntime29allocate_from_reserved_memoryER23PreallocatedMemoryChunkmm.exit.i
  %.0.i = phi ptr [ %.0.i.i, %_ZN11LLVMRuntime29allocate_from_reserved_memoryER23PreallocatedMemoryChunkmm.exit.i ], [ %55, %50 ]
  %56 = ptrtoint ptr %.0.i to i64
  store i64 %56, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: nocallback nounwind
declare void @llvm.nvvm.membar.gl() #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umin.i64(i64, i64) #4

attributes #0 = { noinline nounwind optnone uwtable "denormal-fp-math-f32"="preserve-sign" "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="true" }
attributes #1 = { alwaysinline "denormal-fp-math-f32"="preserve-sign" "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="true" }
attributes #2 = { alwaysinline nounwind uwtable "denormal-fp-math-f32"="preserve-sign" "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="true" }
attributes #3 = { nocallback nounwind }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5}
!llvm.ident = !{!6}
!nvvmir.version = !{!7}
!nvvm.annotations = !{!8, !9, !8, !10, !10, !10, !10, !11, !11, !10, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{i32 4, !"nvvm-reflect-ftz", i32 1}
!6 = !{!"Ubuntu clang version 15.0.7"}
!7 = !{i32 1, i32 4}
!8 = !{null, !"align", i32 8}
!9 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!10 = !{null, !"align", i32 16}
!11 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!12 = distinct !{null, !"kernel", i32 1}
!13 = distinct !{null, !"kernel", i32 1}
!14 = distinct !{null, !"kernel", i32 1}
!15 = distinct !{null, !"kernel", i32 1}
!16 = distinct !{null, !"kernel", i32 1}
!17 = distinct !{null, !"kernel", i32 1}
!18 = distinct !{null, !"kernel", i32 1}
!19 = distinct !{null, !"kernel", i32 1}
!20 = distinct !{null, !"kernel", i32 1}
!21 = distinct !{null, !"kernel", i32 1}
!22 = distinct !{null, !"kernel", i32 1}
!23 = distinct !{null, !"kernel", i32 1}
!24 = distinct !{null, !"kernel", i32 1}
!25 = distinct !{null, !"kernel", i32 1}
!26 = !{ptr @runtime_memory_allocate_aligned, !"kernel", i32 1}
!27 = distinct !{null, !"kernel", i32 1}
!28 = distinct !{null, !"kernel", i32 1}
!29 = distinct !{null, !"kernel", i32 1}
!30 = distinct !{null, !"kernel", i32 1}
!31 = distinct !{null, !"kernel", i32 1}
!32 = distinct !{null, !"kernel", i32 1}
!33 = distinct !{null, !"kernel", i32 1}
!34 = distinct !{null, !"kernel", i32 1}
!35 = distinct !{!35, !36}
!36 = !{!"llvm.loop.mustprogress"}
!37 = distinct !{!37, !36}
!38 = distinct !{!38, !36}
!39 = !{i64 22228}
