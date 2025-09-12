; ModuleID = 'conversions.bc'
source_filename = "conversions.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"in_data\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"out_data\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @read_uint64(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  ret i64 1
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @write_uint64(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @conversionTest() #0 {
  %1 = alloca i64, align 8
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %2, ptr %4, align 8
  store ptr %3, ptr %5, align 8
  br label %6

6:                                                ; preds = %0, %6
  %7 = call i64 @read_uint64(ptr noundef @.str)
  store i64 %7, ptr %1, align 8
  %8 = load i64, ptr %1, align 8
  %9 = and i64 %8, 4294967295
  %10 = trunc i64 %9 to i32
  %11 = load ptr, ptr %4, align 8
  store i32 %10, ptr %11, align 4
  %12 = load i64, ptr %1, align 8
  %13 = lshr i64 %12, 32
  %14 = trunc i64 %13 to i32
  %15 = load ptr, ptr %5, align 8
  store i32 %14, ptr %15, align 4
  %16 = load float, ptr %2, align 4
  %17 = fpext float %16 to double
  %18 = fadd double %17, 1.000000e+00
  %19 = fptrunc double %18 to float
  store float %19, ptr %2, align 4
  %20 = load float, ptr %3, align 4
  %21 = fpext float %20 to double
  %22 = fadd double %21, 1.000000e+00
  %23 = fptrunc double %22 to float
  store float %23, ptr %3, align 4
  %24 = load ptr, ptr %5, align 8
  %25 = load i32, ptr %24, align 4
  %26 = zext i32 %25 to i64
  store i64 %26, ptr %1, align 8
  %27 = load i64, ptr %1, align 8
  %28 = shl i64 %27, 32
  %29 = load ptr, ptr %4, align 8
  %30 = load i32, ptr %29, align 4
  %31 = zext i32 %30 to i64
  %32 = or i64 %28, %31
  store i64 %32, ptr %1, align 8
  %33 = load i64, ptr %1, align 8
  call void @write_uint64(ptr noundef @.str.1, i64 noundef %33)
  br label %6
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
