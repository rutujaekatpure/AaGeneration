; ModuleID = 'add_int.bc'
source_filename = "add_int.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g = dso_local global i32 2, align 4
@f = dso_local global [2 x [2 x i32]] [[2 x i32] [i32 1, i32 5], [2 x i32] [i32 8, i32 2]], align 16
@test = dso_local global [2 x [3 x [4 x i32]]] [[3 x [4 x i32]] [[4 x i32] [i32 3, i32 4, i32 2, i32 3], [4 x i32] [i32 0, i32 -3, i32 9, i32 11], [4 x i32] [i32 23, i32 12, i32 23, i32 2]], [3 x [4 x i32]] [[4 x i32] [i32 13, i32 4, i32 56, i32 3], [4 x i32] [i32 5, i32 9, i32 3, i32 5], [4 x i32] [i32 3, i32 1, i32 4, i32 9]]], align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %7 = load i32, ptr getelementptr inbounds ([2 x [3 x [4 x i32]]], ptr @test, i64 0, i64 1, i64 1, i64 1), align 4
  store i32 %7, ptr %2, align 4
  %8 = load i32, ptr getelementptr inbounds ([2 x [3 x [4 x i32]]], ptr @test, i64 0, i64 1, i64 1), align 16
  store i32 %8, ptr %3, align 4
  %9 = load i32, ptr getelementptr inbounds ([3 x [4 x i32]], ptr @test, i64 0, i64 1, i64 1), align 4
  store i32 %9, ptr %4, align 4
  %10 = load i32, ptr @test, align 16
  store i32 %10, ptr %5, align 4
  %11 = load i32, ptr %2, align 4
  %12 = load i32, ptr %3, align 4
  %13 = add nsw i32 %11, %12
  %14 = load i32, ptr %4, align 4
  %15 = add nsw i32 %13, %14
  %16 = load i32, ptr %5, align 4
  %17 = add nsw i32 %15, %16
  %18 = load i32, ptr getelementptr inbounds ([2 x i32], ptr @f, i64 0, i64 1), align 4
  %19 = add nsw i32 %17, %18
  %20 = load i32, ptr @g, align 4
  %21 = add nsw i32 %19, %20
  store i32 %21, ptr %6, align 4
  %22 = load i32, ptr %2, align 4
  ret i32 %22
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git ee2f9d6dfb6f1360d2dc68d151c84e80252a40ec)"}
