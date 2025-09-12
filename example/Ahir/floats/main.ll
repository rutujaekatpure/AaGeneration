; ModuleID = 'main.bc'
source_filename = "main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @mul(float noundef %0, float noundef %1) #0 {
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  store float %0, ptr %3, align 4
  store float %1, ptr %4, align 4
  %6 = load float, ptr %3, align 4
  %7 = load float, ptr %4, align 4
  %8 = fmul float %6, %7
  store float %8, ptr %5, align 4
  %9 = load float, ptr %5, align 4
  ret float %9
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  store i32 0, ptr %1, align 4
  %5 = call float @mul(float noundef 0x4015333340000000, float noundef 2.500000e+00)
  store float %5, ptr %2, align 4
  store float 0x7FF0000000000000, ptr %3, align 4
  %6 = load float, ptr %2, align 4
  %7 = load float, ptr %3, align 4
  %8 = call float @mul(float noundef %6, float noundef %7)
  store float %8, ptr %4, align 4
  %9 = load float, ptr %2, align 4
  %10 = fpext float %9 to double
  %11 = fcmp oeq double %10, 1.325000e+01
  br i1 %11, label %12, label %13

12:                                               ; preds = %0
  store i32 1, ptr %1, align 4
  br label %14

13:                                               ; preds = %0
  store i32 0, ptr %1, align 4
  br label %14

14:                                               ; preds = %13, %12
  %15 = load i32, ptr %1, align 4
  ret i32 %15
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
