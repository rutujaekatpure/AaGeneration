; ModuleID = 'sqroot.bc'
source_filename = "sqroot.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @sqroot(float noundef %0) #0 {
  %2 = alloca float, align 4
  %3 = alloca i32, align 4
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  %7 = alloca float, align 4
  %8 = alloca float, align 4
  store float %0, ptr %2, align 4
  store float 0.000000e+00, ptr %4, align 4
  store float 0.000000e+00, ptr %5, align 4
  store float 0.000000e+00, ptr %6, align 4
  store float 0.000000e+00, ptr %7, align 4
  store float 0x3F1A36E2E0000000, ptr %8, align 4
  call void (...) @global_storage_initializer_()
  %9 = load float, ptr %2, align 4
  %10 = fpext float %9 to double
  %11 = fcmp ogt double %10, 1.000000e+00
  br i1 %11, label %12, label %14

12:                                               ; preds = %1
  %13 = load float, ptr %2, align 4
  store float %13, ptr %4, align 4
  store float 0.000000e+00, ptr %5, align 4
  br label %16

14:                                               ; preds = %1
  store float 1.000000e+00, ptr %4, align 4
  %15 = load float, ptr %2, align 4
  store float %15, ptr %5, align 4
  br label %16

16:                                               ; preds = %14, %12
  store i32 0, ptr %3, align 4
  br label %17

17:                                               ; preds = %38, %16
  %18 = load i32, ptr %3, align 4
  %19 = icmp slt i32 %18, 13
  br i1 %19, label %20, label %41

20:                                               ; preds = %17
  %21 = load float, ptr %4, align 4
  %22 = load float, ptr %5, align 4
  %23 = fadd float %21, %22
  %24 = fpext float %23 to double
  %25 = fmul double %24, 5.000000e-01
  %26 = fptrunc double %25 to float
  store float %26, ptr %6, align 4
  %27 = load float, ptr %6, align 4
  %28 = load float, ptr %6, align 4
  %29 = fmul float %27, %28
  store float %29, ptr %7, align 4
  %30 = load float, ptr %7, align 4
  %31 = load float, ptr %2, align 4
  %32 = fcmp olt float %30, %31
  br i1 %32, label %33, label %35

33:                                               ; preds = %20
  %34 = load float, ptr %6, align 4
  store float %34, ptr %5, align 4
  br label %37

35:                                               ; preds = %20
  %36 = load float, ptr %6, align 4
  store float %36, ptr %4, align 4
  br label %37

37:                                               ; preds = %35, %33
  br label %38

38:                                               ; preds = %37
  %39 = load i32, ptr %3, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %3, align 4
  br label %17

41:                                               ; preds = %17
  %42 = load float, ptr %6, align 4
  ret float %42
}

declare void @global_storage_initializer_(...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca float, align 4
  store i32 0, ptr %1, align 4
  store float 3.000000e+00, ptr %2, align 4
  %3 = load float, ptr %2, align 4
  %4 = call float @sqroot(float noundef %3)
  store float %4, ptr %2, align 4
  ret i32 0
}

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
