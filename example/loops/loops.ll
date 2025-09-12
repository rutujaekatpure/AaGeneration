; ModuleID = 'loops.bc'
source_filename = "loops.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %3, align 4
  store i32 1, ptr %2, align 4
  br label %4

4:                                                ; preds = %11, %0
  %5 = load i32, ptr %2, align 4
  %6 = icmp sle i32 %5, 5
  br i1 %6, label %7, label %14

7:                                                ; preds = %4
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %2, align 4
  %10 = add nsw i32 %8, %9
  store i32 %10, ptr %3, align 4
  br label %11

11:                                               ; preds = %7
  %12 = load i32, ptr %2, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, ptr %2, align 4
  br label %4

14:                                               ; preds = %4
  call void (...) @__aa_barrier__()
  store i32 1, ptr %2, align 4
  br label %15

15:                                               ; preds = %18, %14
  %16 = load i32, ptr %2, align 4
  %17 = icmp sle i32 %16, 5
  br i1 %17, label %18, label %24

18:                                               ; preds = %15
  call void @__loop_pipelining_on__(i32 noundef 63, i32 noundef 2, i32 noundef 1)
  %19 = load i32, ptr %3, align 4
  %20 = load i32, ptr %2, align 4
  %21 = add nsw i32 %19, %20
  store i32 %21, ptr %3, align 4
  %22 = load i32, ptr %2, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %2, align 4
  br label %15

24:                                               ; preds = %15
  store i32 1, ptr %2, align 4
  br label %25

25:                                               ; preds = %24, %34
  call void @__loop_pipelining_on__(i32 noundef 63, i32 noundef 2, i32 noundef 1)
  %26 = load i32, ptr %3, align 4
  %27 = load i32, ptr %2, align 4
  %28 = add nsw i32 %26, %27
  store i32 %28, ptr %3, align 4
  %29 = load i32, ptr %2, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %2, align 4
  %31 = load i32, ptr %2, align 4
  %32 = icmp sgt i32 %31, 5
  br i1 %32, label %33, label %34

33:                                               ; preds = %25
  br label %35

34:                                               ; preds = %25
  br label %25

35:                                               ; preds = %33
  store i32 1, ptr %2, align 4
  br label %36

36:                                               ; preds = %42, %35
  call void @__loop_pipelining_on__(i32 noundef 63, i32 noundef 2, i32 noundef 1)
  %37 = load i32, ptr %3, align 4
  %38 = load i32, ptr %2, align 4
  %39 = add nsw i32 %37, %38
  store i32 %39, ptr %3, align 4
  %40 = load i32, ptr %2, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, ptr %2, align 4
  br label %42

42:                                               ; preds = %36
  %43 = load i32, ptr %2, align 4
  %44 = icmp sle i32 %43, 5
  br i1 %44, label %36, label %45

45:                                               ; preds = %42
  ret i32 0
}

declare void @__aa_barrier__(...) #1

declare void @__loop_pipelining_on__(i32 noundef, i32 noundef, i32 noundef) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git ee2f9d6dfb6f1360d2dc68d151c84e80252a40ec)"}
