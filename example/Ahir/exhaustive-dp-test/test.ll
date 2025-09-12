; ModuleID = 'test.bc'
source_filename = "test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@int_x = dso_local global [6 x i32] zeroinitializer, align 16
@int_y = dso_local global [6 x i32] zeroinitializer, align 16
@int_arith = dso_local global [3 x i32] zeroinitializer, align 4
@int_cmp = dso_local global [6 x i32] zeroinitializer, align 16
@int_shift = dso_local global [2 x i32] zeroinitializer, align 4
@short_x = dso_local global [6 x i16] zeroinitializer, align 2
@short_y = dso_local global [6 x i16] zeroinitializer, align 2
@short_arith = dso_local global [3 x i16] zeroinitializer, align 2
@short_cmp = dso_local global [6 x i16] zeroinitializer, align 2
@short_shift = dso_local global [2 x i16] zeroinitializer, align 2
@float_x = dso_local global [6 x float] zeroinitializer, align 16
@float_y = dso_local global [6 x float] zeroinitializer, align 16
@float_arith = dso_local global [3 x float] zeroinitializer, align 4
@float_cmp = dso_local global [6 x i32] zeroinitializer, align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @test_ints() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  %4 = load i32, ptr @int_x, align 16
  %5 = load i32, ptr @int_y, align 16
  %6 = add nsw i32 %4, %5
  store i32 %6, ptr @int_arith, align 4
  %7 = load i32, ptr getelementptr inbounds ([6 x i32], ptr @int_x, i64 0, i64 1), align 4
  %8 = load i32, ptr getelementptr inbounds ([6 x i32], ptr @int_y, i64 0, i64 1), align 4
  %9 = sub nsw i32 %7, %8
  store i32 %9, ptr getelementptr inbounds ([3 x i32], ptr @int_arith, i64 0, i64 1), align 4
  %10 = load i32, ptr getelementptr inbounds ([6 x i32], ptr @int_x, i64 0, i64 2), align 8
  %11 = load i32, ptr getelementptr inbounds ([6 x i32], ptr @int_y, i64 0, i64 2), align 8
  %12 = mul nsw i32 %10, %11
  store i32 %12, ptr getelementptr inbounds ([3 x i32], ptr @int_arith, i64 0, i64 2), align 4
  %13 = load i32, ptr @int_x, align 16
  %14 = load i32, ptr @int_y, align 16
  %15 = icmp sgt i32 %13, %14
  %16 = zext i1 %15 to i32
  store i32 %16, ptr @int_cmp, align 16
  %17 = load i32, ptr getelementptr inbounds ([6 x i32], ptr @int_x, i64 0, i64 1), align 4
  %18 = load i32, ptr getelementptr inbounds ([6 x i32], ptr @int_y, i64 0, i64 1), align 4
  %19 = icmp sge i32 %17, %18
  %20 = zext i1 %19 to i32
  store i32 %20, ptr getelementptr inbounds ([6 x i32], ptr @int_cmp, i64 0, i64 1), align 4
  %21 = load i32, ptr getelementptr inbounds ([6 x i32], ptr @int_x, i64 0, i64 2), align 8
  %22 = load i32, ptr getelementptr inbounds ([6 x i32], ptr @int_y, i64 0, i64 2), align 8
  %23 = icmp slt i32 %21, %22
  %24 = zext i1 %23 to i32
  store i32 %24, ptr getelementptr inbounds ([6 x i32], ptr @int_cmp, i64 0, i64 2), align 8
  %25 = load i32, ptr getelementptr inbounds ([6 x i32], ptr @int_x, i64 0, i64 3), align 4
  %26 = load i32, ptr getelementptr inbounds ([6 x i32], ptr @int_y, i64 0, i64 3), align 4
  %27 = icmp sle i32 %25, %26
  %28 = zext i1 %27 to i32
  store i32 %28, ptr getelementptr inbounds ([6 x i32], ptr @int_cmp, i64 0, i64 3), align 4
  %29 = load i32, ptr getelementptr inbounds ([6 x i32], ptr @int_x, i64 0, i64 4), align 16
  %30 = load i32, ptr getelementptr inbounds ([6 x i32], ptr @int_y, i64 0, i64 4), align 16
  %31 = icmp eq i32 %29, %30
  %32 = zext i1 %31 to i32
  store i32 %32, ptr getelementptr inbounds ([6 x i32], ptr @int_cmp, i64 0, i64 4), align 16
  %33 = load i32, ptr getelementptr inbounds ([6 x i32], ptr @int_x, i64 0, i64 5), align 4
  %34 = load i32, ptr getelementptr inbounds ([6 x i32], ptr @int_y, i64 0, i64 5), align 4
  %35 = icmp ne i32 %33, %34
  %36 = zext i1 %35 to i32
  store i32 %36, ptr getelementptr inbounds ([6 x i32], ptr @int_cmp, i64 0, i64 5), align 4
  store i32 0, ptr %3, align 4
  br label %37

37:                                               ; preds = %50, %0
  %38 = load i32, ptr %3, align 4
  %39 = icmp slt i32 %38, 6
  br i1 %39, label %40, label %53

40:                                               ; preds = %37
  %41 = load i32, ptr %1, align 4
  %42 = load i32, ptr %3, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [6 x i32], ptr @int_cmp, i64 0, i64 %43
  %45 = load i32, ptr %44, align 4
  %46 = load i32, ptr %3, align 4
  %47 = shl i32 %46, 2
  %48 = shl i32 %45, %47
  %49 = and i32 %41, %48
  store i32 %49, ptr %1, align 4
  br label %50

50:                                               ; preds = %40
  %51 = load i32, ptr %3, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, ptr %3, align 4
  br label %37

53:                                               ; preds = %37
  %54 = load i32, ptr @int_x, align 16
  %55 = ashr i32 %54, 4
  store i32 %55, ptr @int_shift, align 4
  %56 = load i32, ptr @int_y, align 16
  %57 = shl i32 %56, 4
  store i32 %57, ptr getelementptr inbounds ([2 x i32], ptr @int_shift, i64 0, i64 1), align 4
  %58 = load i32, ptr @int_arith, align 4
  store i32 %58, ptr %2, align 4
  %59 = load i32, ptr getelementptr inbounds ([3 x i32], ptr @int_arith, i64 0, i64 1), align 4
  %60 = load i32, ptr %2, align 4
  %61 = and i32 %60, %59
  store i32 %61, ptr %2, align 4
  %62 = load i32, ptr getelementptr inbounds ([3 x i32], ptr @int_arith, i64 0, i64 2), align 4
  %63 = load i32, ptr %2, align 4
  %64 = or i32 %63, %62
  store i32 %64, ptr %2, align 4
  %65 = load i32, ptr @int_shift, align 4
  %66 = load i32, ptr %2, align 4
  %67 = xor i32 %66, %65
  store i32 %67, ptr %2, align 4
  %68 = load i32, ptr getelementptr inbounds ([2 x i32], ptr @int_shift, i64 0, i64 1), align 4
  %69 = load i32, ptr %2, align 4
  %70 = xor i32 %69, %68
  store i32 %70, ptr %2, align 4
  %71 = load i32, ptr %1, align 4
  %72 = load i32, ptr %2, align 4
  %73 = add i32 %72, %71
  store i32 %73, ptr %2, align 4
  %74 = load i32, ptr %2, align 4
  ret i32 %74
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i16 @test_shorts() #0 {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  %3 = alloca i32, align 4
  store i16 0, ptr %1, align 2
  store i16 0, ptr %2, align 2
  %4 = load i16, ptr @short_x, align 2
  %5 = zext i16 %4 to i32
  %6 = load i16, ptr @short_y, align 2
  %7 = zext i16 %6 to i32
  %8 = add nsw i32 %5, %7
  %9 = trunc i32 %8 to i16
  store i16 %9, ptr @short_arith, align 2
  %10 = load i16, ptr getelementptr inbounds ([6 x i16], ptr @short_x, i64 0, i64 1), align 2
  %11 = zext i16 %10 to i32
  %12 = load i16, ptr getelementptr inbounds ([6 x i16], ptr @short_y, i64 0, i64 1), align 2
  %13 = zext i16 %12 to i32
  %14 = sub nsw i32 %11, %13
  %15 = trunc i32 %14 to i16
  store i16 %15, ptr getelementptr inbounds ([3 x i16], ptr @short_arith, i64 0, i64 1), align 2
  %16 = load i16, ptr getelementptr inbounds ([6 x i16], ptr @short_x, i64 0, i64 2), align 2
  %17 = zext i16 %16 to i32
  %18 = load i16, ptr getelementptr inbounds ([6 x i16], ptr @short_y, i64 0, i64 2), align 2
  %19 = zext i16 %18 to i32
  %20 = mul nsw i32 %17, %19
  %21 = trunc i32 %20 to i16
  store i16 %21, ptr getelementptr inbounds ([3 x i16], ptr @short_arith, i64 0, i64 2), align 2
  %22 = load i16, ptr @short_x, align 2
  %23 = zext i16 %22 to i32
  %24 = load i16, ptr @short_y, align 2
  %25 = zext i16 %24 to i32
  %26 = icmp sgt i32 %23, %25
  %27 = zext i1 %26 to i32
  %28 = trunc i32 %27 to i16
  store i16 %28, ptr @short_cmp, align 2
  %29 = load i16, ptr getelementptr inbounds ([6 x i16], ptr @short_x, i64 0, i64 1), align 2
  %30 = zext i16 %29 to i32
  %31 = load i16, ptr getelementptr inbounds ([6 x i16], ptr @short_y, i64 0, i64 1), align 2
  %32 = zext i16 %31 to i32
  %33 = icmp sge i32 %30, %32
  %34 = zext i1 %33 to i32
  %35 = trunc i32 %34 to i16
  store i16 %35, ptr getelementptr inbounds ([6 x i16], ptr @short_cmp, i64 0, i64 1), align 2
  %36 = load i16, ptr getelementptr inbounds ([6 x i16], ptr @short_x, i64 0, i64 2), align 2
  %37 = zext i16 %36 to i32
  %38 = load i16, ptr getelementptr inbounds ([6 x i16], ptr @short_y, i64 0, i64 2), align 2
  %39 = zext i16 %38 to i32
  %40 = icmp slt i32 %37, %39
  %41 = zext i1 %40 to i32
  %42 = trunc i32 %41 to i16
  store i16 %42, ptr getelementptr inbounds ([6 x i16], ptr @short_cmp, i64 0, i64 2), align 2
  %43 = load i16, ptr getelementptr inbounds ([6 x i16], ptr @short_x, i64 0, i64 3), align 2
  %44 = zext i16 %43 to i32
  %45 = load i16, ptr getelementptr inbounds ([6 x i16], ptr @short_y, i64 0, i64 3), align 2
  %46 = zext i16 %45 to i32
  %47 = icmp sle i32 %44, %46
  %48 = zext i1 %47 to i32
  %49 = trunc i32 %48 to i16
  store i16 %49, ptr getelementptr inbounds ([6 x i16], ptr @short_cmp, i64 0, i64 3), align 2
  %50 = load i16, ptr getelementptr inbounds ([6 x i16], ptr @short_x, i64 0, i64 4), align 2
  %51 = zext i16 %50 to i32
  %52 = load i16, ptr getelementptr inbounds ([6 x i16], ptr @short_y, i64 0, i64 4), align 2
  %53 = zext i16 %52 to i32
  %54 = icmp eq i32 %51, %53
  %55 = zext i1 %54 to i32
  %56 = trunc i32 %55 to i16
  store i16 %56, ptr getelementptr inbounds ([6 x i16], ptr @short_cmp, i64 0, i64 4), align 2
  %57 = load i16, ptr getelementptr inbounds ([6 x i16], ptr @short_x, i64 0, i64 5), align 2
  %58 = zext i16 %57 to i32
  %59 = load i16, ptr getelementptr inbounds ([6 x i16], ptr @short_y, i64 0, i64 5), align 2
  %60 = zext i16 %59 to i32
  %61 = icmp ne i32 %58, %60
  %62 = zext i1 %61 to i32
  %63 = trunc i32 %62 to i16
  store i16 %63, ptr getelementptr inbounds ([6 x i16], ptr @short_cmp, i64 0, i64 5), align 2
  store i32 0, ptr %3, align 4
  br label %64

64:                                               ; preds = %80, %0
  %65 = load i32, ptr %3, align 4
  %66 = icmp slt i32 %65, 6
  br i1 %66, label %67, label %83

67:                                               ; preds = %64
  %68 = load i16, ptr %1, align 2
  %69 = sext i16 %68 to i32
  %70 = load i32, ptr %3, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [6 x i16], ptr @short_cmp, i64 0, i64 %71
  %73 = load i16, ptr %72, align 2
  %74 = zext i16 %73 to i32
  %75 = load i32, ptr %3, align 4
  %76 = shl i32 %75, 2
  %77 = shl i32 %74, %76
  %78 = and i32 %69, %77
  %79 = trunc i32 %78 to i16
  store i16 %79, ptr %1, align 2
  br label %80

80:                                               ; preds = %67
  %81 = load i32, ptr %3, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, ptr %3, align 4
  br label %64

83:                                               ; preds = %64
  %84 = load i16, ptr @short_x, align 2
  %85 = zext i16 %84 to i32
  %86 = ashr i32 %85, 4
  %87 = trunc i32 %86 to i16
  store i16 %87, ptr @short_shift, align 2
  %88 = load i16, ptr @short_y, align 2
  %89 = zext i16 %88 to i32
  %90 = shl i32 %89, 4
  %91 = trunc i32 %90 to i16
  store i16 %91, ptr getelementptr inbounds ([2 x i16], ptr @short_shift, i64 0, i64 1), align 2
  %92 = load i16, ptr @short_arith, align 2
  store i16 %92, ptr %2, align 2
  %93 = load i16, ptr getelementptr inbounds ([3 x i16], ptr @short_arith, i64 0, i64 1), align 2
  %94 = zext i16 %93 to i32
  %95 = load i16, ptr %2, align 2
  %96 = sext i16 %95 to i32
  %97 = and i32 %96, %94
  %98 = trunc i32 %97 to i16
  store i16 %98, ptr %2, align 2
  %99 = load i16, ptr getelementptr inbounds ([3 x i16], ptr @short_arith, i64 0, i64 2), align 2
  %100 = zext i16 %99 to i32
  %101 = load i16, ptr %2, align 2
  %102 = sext i16 %101 to i32
  %103 = or i32 %102, %100
  %104 = trunc i32 %103 to i16
  store i16 %104, ptr %2, align 2
  %105 = load i16, ptr @short_shift, align 2
  %106 = zext i16 %105 to i32
  %107 = load i16, ptr %2, align 2
  %108 = sext i16 %107 to i32
  %109 = xor i32 %108, %106
  %110 = trunc i32 %109 to i16
  store i16 %110, ptr %2, align 2
  %111 = load i16, ptr getelementptr inbounds ([2 x i16], ptr @short_shift, i64 0, i64 1), align 2
  %112 = zext i16 %111 to i32
  %113 = load i16, ptr %2, align 2
  %114 = sext i16 %113 to i32
  %115 = xor i32 %114, %112
  %116 = trunc i32 %115 to i16
  store i16 %116, ptr %2, align 2
  %117 = load i16, ptr %1, align 2
  %118 = sext i16 %117 to i32
  %119 = load i16, ptr %2, align 2
  %120 = sext i16 %119 to i32
  %121 = add nsw i32 %120, %118
  %122 = trunc i32 %121 to i16
  store i16 %122, ptr %2, align 2
  %123 = load i16, ptr %2, align 2
  ret i16 %123
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @test_floats() #0 {
  %1 = alloca i32, align 4
  %2 = alloca float, align 4
  %3 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store float 0.000000e+00, ptr %2, align 4
  %4 = load float, ptr @float_x, align 16
  %5 = load float, ptr @float_y, align 16
  %6 = fadd float %4, %5
  store float %6, ptr @float_arith, align 4
  %7 = load float, ptr getelementptr inbounds ([6 x float], ptr @float_x, i64 0, i64 1), align 4
  %8 = load float, ptr getelementptr inbounds ([6 x float], ptr @float_y, i64 0, i64 1), align 4
  %9 = fsub float %7, %8
  store float %9, ptr getelementptr inbounds ([3 x float], ptr @float_arith, i64 0, i64 1), align 4
  %10 = load float, ptr getelementptr inbounds ([6 x float], ptr @float_x, i64 0, i64 2), align 8
  %11 = load float, ptr getelementptr inbounds ([6 x float], ptr @float_y, i64 0, i64 2), align 8
  %12 = fmul float %10, %11
  store float %12, ptr getelementptr inbounds ([3 x float], ptr @float_arith, i64 0, i64 2), align 4
  %13 = load float, ptr @float_x, align 16
  %14 = load float, ptr @float_y, align 16
  %15 = fcmp ogt float %13, %14
  %16 = zext i1 %15 to i32
  store i32 %16, ptr @float_cmp, align 16
  %17 = load float, ptr getelementptr inbounds ([6 x float], ptr @float_x, i64 0, i64 1), align 4
  %18 = load float, ptr getelementptr inbounds ([6 x float], ptr @float_y, i64 0, i64 1), align 4
  %19 = fcmp oge float %17, %18
  %20 = zext i1 %19 to i32
  store i32 %20, ptr getelementptr inbounds ([6 x i32], ptr @float_cmp, i64 0, i64 1), align 4
  %21 = load float, ptr getelementptr inbounds ([6 x float], ptr @float_x, i64 0, i64 2), align 8
  %22 = load float, ptr getelementptr inbounds ([6 x float], ptr @float_y, i64 0, i64 2), align 8
  %23 = fcmp olt float %21, %22
  %24 = zext i1 %23 to i32
  store i32 %24, ptr getelementptr inbounds ([6 x i32], ptr @float_cmp, i64 0, i64 2), align 8
  %25 = load float, ptr getelementptr inbounds ([6 x float], ptr @float_x, i64 0, i64 3), align 4
  %26 = load float, ptr getelementptr inbounds ([6 x float], ptr @float_y, i64 0, i64 3), align 4
  %27 = fcmp ole float %25, %26
  %28 = zext i1 %27 to i32
  store i32 %28, ptr getelementptr inbounds ([6 x i32], ptr @float_cmp, i64 0, i64 3), align 4
  %29 = load float, ptr getelementptr inbounds ([6 x float], ptr @float_x, i64 0, i64 4), align 16
  %30 = load float, ptr getelementptr inbounds ([6 x float], ptr @float_y, i64 0, i64 4), align 16
  %31 = fcmp oeq float %29, %30
  %32 = zext i1 %31 to i32
  store i32 %32, ptr getelementptr inbounds ([6 x i32], ptr @float_cmp, i64 0, i64 4), align 16
  %33 = load float, ptr getelementptr inbounds ([6 x float], ptr @float_x, i64 0, i64 5), align 4
  %34 = load float, ptr getelementptr inbounds ([6 x float], ptr @float_y, i64 0, i64 5), align 4
  %35 = fcmp une float %33, %34
  %36 = zext i1 %35 to i32
  store i32 %36, ptr getelementptr inbounds ([6 x i32], ptr @float_cmp, i64 0, i64 5), align 4
  store i32 0, ptr %3, align 4
  br label %37

37:                                               ; preds = %50, %0
  %38 = load i32, ptr %3, align 4
  %39 = icmp slt i32 %38, 6
  br i1 %39, label %40, label %53

40:                                               ; preds = %37
  %41 = load i32, ptr %1, align 4
  %42 = load i32, ptr %3, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [6 x i32], ptr @float_cmp, i64 0, i64 %43
  %45 = load i32, ptr %44, align 4
  %46 = load i32, ptr %3, align 4
  %47 = shl i32 %46, 2
  %48 = shl i32 %45, %47
  %49 = and i32 %41, %48
  store i32 %49, ptr %1, align 4
  br label %50

50:                                               ; preds = %40
  %51 = load i32, ptr %3, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, ptr %3, align 4
  br label %37

53:                                               ; preds = %37
  %54 = load float, ptr @float_arith, align 4
  store float %54, ptr %2, align 4
  %55 = load float, ptr getelementptr inbounds ([3 x float], ptr @float_arith, i64 0, i64 1), align 4
  %56 = load float, ptr %2, align 4
  %57 = fadd float %56, %55
  store float %57, ptr %2, align 4
  %58 = load float, ptr getelementptr inbounds ([3 x float], ptr @float_arith, i64 0, i64 2), align 4
  %59 = load float, ptr %2, align 4
  %60 = fsub float %59, %58
  store float %60, ptr %2, align 4
  %61 = load i32, ptr %1, align 4
  %62 = uitofp i32 %61 to float
  %63 = load float, ptr %2, align 4
  %64 = fadd float %63, %62
  store float %64, ptr %2, align 4
  %65 = load float, ptr %2, align 4
  ret float %65
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @start() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 1532671764, ptr %2, align 4
  store i32 0, ptr %1, align 4
  br label %3

3:                                                ; preds = %35, %0
  %4 = load i32, ptr %1, align 4
  %5 = icmp slt i32 %4, 6
  br i1 %5, label %6, label %38

6:                                                ; preds = %3
  %7 = load i32, ptr %2, align 4
  %8 = and i32 %7, 1048576
  %9 = lshr i32 %8, 20
  %10 = load i32, ptr %2, align 4
  %11 = and i32 %10, 256
  %12 = lshr i32 %11, 8
  %13 = xor i32 %9, %12
  %14 = load i32, ptr %2, align 4
  %15 = shl i32 %14, 1
  %16 = or i32 %13, %15
  store i32 %16, ptr %2, align 4
  %17 = load i32, ptr %2, align 4
  %18 = load i32, ptr %1, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [6 x i32], ptr @int_x, i64 0, i64 %19
  store i32 %17, ptr %20, align 4
  %21 = load i32, ptr %2, align 4
  %22 = and i32 %21, 1048576
  %23 = lshr i32 %22, 20
  %24 = load i32, ptr %2, align 4
  %25 = and i32 %24, 256
  %26 = lshr i32 %25, 8
  %27 = xor i32 %23, %26
  %28 = load i32, ptr %2, align 4
  %29 = shl i32 %28, 1
  %30 = or i32 %27, %29
  store i32 %30, ptr %2, align 4
  %31 = load i32, ptr %2, align 4
  %32 = load i32, ptr %1, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [6 x i32], ptr @int_y, i64 0, i64 %33
  store i32 %31, ptr %34, align 4
  br label %35

35:                                               ; preds = %6
  %36 = load i32, ptr %1, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %1, align 4
  br label %3

38:                                               ; preds = %3
  store i32 0, ptr %1, align 4
  br label %39

39:                                               ; preds = %73, %38
  %40 = load i32, ptr %1, align 4
  %41 = icmp slt i32 %40, 6
  br i1 %41, label %42, label %76

42:                                               ; preds = %39
  %43 = load i32, ptr %2, align 4
  %44 = and i32 %43, 1048576
  %45 = lshr i32 %44, 20
  %46 = load i32, ptr %2, align 4
  %47 = and i32 %46, 256
  %48 = lshr i32 %47, 8
  %49 = xor i32 %45, %48
  %50 = load i32, ptr %2, align 4
  %51 = shl i32 %50, 1
  %52 = or i32 %49, %51
  store i32 %52, ptr %2, align 4
  %53 = load i32, ptr %2, align 4
  %54 = trunc i32 %53 to i16
  %55 = load i32, ptr %1, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [6 x i16], ptr @short_x, i64 0, i64 %56
  store i16 %54, ptr %57, align 2
  %58 = load i32, ptr %2, align 4
  %59 = and i32 %58, 1048576
  %60 = lshr i32 %59, 20
  %61 = load i32, ptr %2, align 4
  %62 = and i32 %61, 256
  %63 = lshr i32 %62, 8
  %64 = xor i32 %60, %63
  %65 = load i32, ptr %2, align 4
  %66 = shl i32 %65, 1
  %67 = or i32 %64, %66
  store i32 %67, ptr %2, align 4
  %68 = load i32, ptr %2, align 4
  %69 = trunc i32 %68 to i16
  %70 = load i32, ptr %1, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [6 x i16], ptr @short_y, i64 0, i64 %71
  store i16 %69, ptr %72, align 2
  br label %73

73:                                               ; preds = %42
  %74 = load i32, ptr %1, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, ptr %1, align 4
  br label %39

76:                                               ; preds = %39
  store i32 0, ptr %1, align 4
  %77 = load i32, ptr %1, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, ptr %1, align 4
  %79 = sext i32 %77 to i64
  %80 = getelementptr inbounds [6 x float], ptr @float_x, i64 0, i64 %79
  store float 0x3FAC480620000000, ptr %80, align 4
  %81 = load i32, ptr %1, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, ptr %1, align 4
  %83 = sext i32 %81 to i64
  %84 = getelementptr inbounds [6 x float], ptr @float_x, i64 0, i64 %83
  store float 0x3FE3AE7F60000000, ptr %84, align 4
  %85 = load i32, ptr %1, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, ptr %1, align 4
  %87 = sext i32 %85 to i64
  %88 = getelementptr inbounds [6 x float], ptr @float_x, i64 0, i64 %87
  store float 0xBFFF6FC040000000, ptr %88, align 4
  %89 = load i32, ptr %1, align 4
  %90 = add nsw i32 %89, 1
  store i32 %90, ptr %1, align 4
  %91 = sext i32 %89 to i64
  %92 = getelementptr inbounds [6 x float], ptr @float_x, i64 0, i64 %91
  store float 0x3FABA7FC40000000, ptr %92, align 4
  %93 = load i32, ptr %1, align 4
  %94 = add nsw i32 %93, 1
  store i32 %94, ptr %1, align 4
  %95 = sext i32 %93 to i64
  %96 = getelementptr inbounds [6 x float], ptr @float_x, i64 0, i64 %95
  store float 0x3FE99C8000000000, ptr %96, align 4
  %97 = load i32, ptr %1, align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, ptr %1, align 4
  %99 = sext i32 %97 to i64
  %100 = getelementptr inbounds [6 x float], ptr @float_x, i64 0, i64 %99
  store float 0x3FF1B33FC0000000, ptr %100, align 4
  store i32 0, ptr %1, align 4
  %101 = load i32, ptr %1, align 4
  %102 = add nsw i32 %101, 1
  store i32 %102, ptr %1, align 4
  %103 = sext i32 %101 to i64
  %104 = getelementptr inbounds [6 x float], ptr @float_y, i64 0, i64 %103
  store float 0xBFD4C300A0000000, ptr %104, align 4
  %105 = load i32, ptr %1, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, ptr %1, align 4
  %107 = sext i32 %105 to i64
  %108 = getelementptr inbounds [6 x float], ptr @float_y, i64 0, i64 %107
  store float 0xBFFC17BFA0000000, ptr %108, align 4
  %109 = load i32, ptr %1, align 4
  %110 = add nsw i32 %109, 1
  store i32 %110, ptr %1, align 4
  %111 = sext i32 %109 to i64
  %112 = getelementptr inbounds [6 x float], ptr @float_y, i64 0, i64 %111
  store float 0x3FF2154000000000, ptr %112, align 4
  %113 = load i32, ptr %1, align 4
  %114 = add nsw i32 %113, 1
  store i32 %114, ptr %1, align 4
  %115 = sext i32 %113 to i64
  %116 = getelementptr inbounds [6 x float], ptr @float_y, i64 0, i64 %115
  store float 0xBFC4CE0320000000, ptr %116, align 4
  %117 = load i32, ptr %1, align 4
  %118 = add nsw i32 %117, 1
  store i32 %118, ptr %1, align 4
  %119 = sext i32 %117 to i64
  %120 = getelementptr inbounds [6 x float], ptr @float_y, i64 0, i64 %119
  store float 0x3FB2B3FEA0000000, ptr %120, align 4
  %121 = load i32, ptr %1, align 4
  %122 = add nsw i32 %121, 1
  store i32 %122, ptr %1, align 4
  %123 = sext i32 %121 to i64
  %124 = getelementptr inbounds [6 x float], ptr @float_y, i64 0, i64 %123
  store float 0x3FD3D0FE80000000, ptr %124, align 4
  %125 = call i32 @test_ints()
  %126 = call float @test_floats()
  %127 = fptosi float %126 to i32
  %128 = xor i32 %125, %127
  %129 = call signext i16 @test_shorts()
  %130 = sext i16 %129 to i32
  %131 = xor i32 %128, %130
  ret i32 %131
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %3 = call i32 @start()
  store i32 %3, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  ret i32 %4
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
