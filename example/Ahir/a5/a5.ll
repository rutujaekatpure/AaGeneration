; ModuleID = 'a5.bc'
source_filename = "a5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@R1 = dso_local global i32 0, align 4
@R2 = dso_local global i32 0, align 4
@R3 = dso_local global i32 0, align 4
@key = dso_local global [2 x i32] zeroinitializer, align 4
@frame = dso_local global i32 0, align 4
@AtoB = dso_local global [4 x i32] zeroinitializer, align 16
@BtoA = dso_local global [4 x i32] zeroinitializer, align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @a5reg() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  store i32 0, ptr %2, align 4
  %22 = load i32, ptr @R1, align 4
  store i32 %22, ptr %7, align 4
  %23 = load i32, ptr @R2, align 4
  store i32 %23, ptr %8, align 4
  %24 = load i32, ptr @R3, align 4
  store i32 %24, ptr %9, align 4
  %25 = load i32, ptr %7, align 4
  store i32 %25, ptr %10, align 4
  %26 = load i32, ptr %8, align 4
  store i32 %26, ptr %11, align 4
  %27 = load i32, ptr %9, align 4
  store i32 %27, ptr %12, align 4
  %28 = load i32, ptr %7, align 4
  %29 = lshr i32 %28, 8
  store i32 %29, ptr %13, align 4
  %30 = load i32, ptr %8, align 4
  %31 = lshr i32 %30, 10
  store i32 %31, ptr %14, align 4
  %32 = load i32, ptr %9, align 4
  %33 = lshr i32 %32, 10
  store i32 %33, ptr %15, align 4
  %34 = load i32, ptr %13, align 4
  %35 = and i32 %34, 1
  %36 = sub i32 0, %35
  store i32 %36, ptr %16, align 4
  %37 = load i32, ptr %14, align 4
  %38 = and i32 %37, 1
  %39 = sub i32 0, %38
  store i32 %39, ptr %17, align 4
  %40 = load i32, ptr %15, align 4
  %41 = and i32 %40, 1
  %42 = sub i32 0, %41
  store i32 %42, ptr %18, align 4
  %43 = load i32, ptr %17, align 4
  %44 = xor i32 %43, -1
  %45 = load i32, ptr %18, align 4
  %46 = xor i32 %45, -1
  %47 = and i32 %44, %46
  %48 = load i32, ptr %16, align 4
  %49 = xor i32 %48, -1
  %50 = load i32, ptr %18, align 4
  %51 = and i32 %49, %50
  %52 = or i32 %47, %51
  %53 = load i32, ptr %16, align 4
  %54 = load i32, ptr %17, align 4
  %55 = and i32 %53, %54
  %56 = or i32 %52, %55
  store i32 %56, ptr %19, align 4
  %57 = load i32, ptr %17, align 4
  %58 = xor i32 %57, -1
  %59 = load i32, ptr %18, align 4
  %60 = xor i32 %59, -1
  %61 = and i32 %58, %60
  %62 = load i32, ptr %16, align 4
  %63 = xor i32 %62, -1
  %64 = load i32, ptr %17, align 4
  %65 = and i32 %63, %64
  %66 = or i32 %61, %65
  %67 = load i32, ptr %16, align 4
  %68 = load i32, ptr %18, align 4
  %69 = and i32 %67, %68
  %70 = or i32 %66, %69
  store i32 %70, ptr %20, align 4
  %71 = load i32, ptr %16, align 4
  %72 = xor i32 %71, -1
  %73 = load i32, ptr %18, align 4
  %74 = xor i32 %73, -1
  %75 = and i32 %72, %74
  %76 = load i32, ptr %17, align 4
  %77 = xor i32 %76, -1
  %78 = load i32, ptr %18, align 4
  %79 = and i32 %77, %78
  %80 = or i32 %75, %79
  %81 = load i32, ptr %16, align 4
  %82 = load i32, ptr %17, align 4
  %83 = and i32 %81, %82
  %84 = or i32 %80, %83
  store i32 %84, ptr %21, align 4
  %85 = load i32, ptr %7, align 4
  %86 = lshr i32 %85, 18
  store i32 %86, ptr %3, align 4
  %87 = load i32, ptr %7, align 4
  %88 = lshr i32 %87, 17
  store i32 %88, ptr %4, align 4
  %89 = load i32, ptr %7, align 4
  %90 = lshr i32 %89, 16
  store i32 %90, ptr %5, align 4
  %91 = load i32, ptr %7, align 4
  %92 = lshr i32 %91, 13
  store i32 %92, ptr %6, align 4
  %93 = load i32, ptr %3, align 4
  %94 = load i32, ptr %4, align 4
  %95 = xor i32 %93, %94
  store i32 %95, ptr %3, align 4
  %96 = load i32, ptr %5, align 4
  %97 = load i32, ptr %6, align 4
  %98 = xor i32 %96, %97
  store i32 %98, ptr %5, align 4
  %99 = load i32, ptr %3, align 4
  %100 = load i32, ptr %5, align 4
  %101 = xor i32 %99, %100
  store i32 %101, ptr %3, align 4
  %102 = load i32, ptr %3, align 4
  %103 = and i32 %102, 1
  store i32 %103, ptr %3, align 4
  %104 = load i32, ptr %7, align 4
  %105 = shl i32 %104, 1
  %106 = and i32 %105, 524287
  store i32 %106, ptr %7, align 4
  %107 = load i32, ptr %3, align 4
  %108 = load i32, ptr %7, align 4
  %109 = or i32 %108, %107
  store i32 %109, ptr %7, align 4
  %110 = load i32, ptr %8, align 4
  %111 = lshr i32 %110, 21
  store i32 %111, ptr %3, align 4
  %112 = load i32, ptr %8, align 4
  %113 = lshr i32 %112, 20
  store i32 %113, ptr %4, align 4
  %114 = load i32, ptr %3, align 4
  %115 = load i32, ptr %4, align 4
  %116 = xor i32 %114, %115
  store i32 %116, ptr %3, align 4
  %117 = load i32, ptr %3, align 4
  %118 = and i32 %117, 1
  store i32 %118, ptr %3, align 4
  %119 = load i32, ptr %8, align 4
  %120 = shl i32 %119, 1
  %121 = and i32 %120, 4194303
  store i32 %121, ptr %8, align 4
  %122 = load i32, ptr %3, align 4
  %123 = load i32, ptr %8, align 4
  %124 = or i32 %123, %122
  store i32 %124, ptr %8, align 4
  %125 = load i32, ptr %9, align 4
  %126 = lshr i32 %125, 22
  store i32 %126, ptr %3, align 4
  %127 = load i32, ptr %9, align 4
  %128 = lshr i32 %127, 21
  store i32 %128, ptr %4, align 4
  %129 = load i32, ptr %9, align 4
  %130 = lshr i32 %129, 20
  store i32 %130, ptr %5, align 4
  %131 = load i32, ptr %9, align 4
  %132 = lshr i32 %131, 7
  store i32 %132, ptr %6, align 4
  %133 = load i32, ptr %3, align 4
  %134 = load i32, ptr %4, align 4
  %135 = xor i32 %133, %134
  store i32 %135, ptr %3, align 4
  %136 = load i32, ptr %5, align 4
  %137 = load i32, ptr %6, align 4
  %138 = xor i32 %136, %137
  store i32 %138, ptr %5, align 4
  %139 = load i32, ptr %3, align 4
  %140 = load i32, ptr %5, align 4
  %141 = xor i32 %139, %140
  store i32 %141, ptr %3, align 4
  %142 = load i32, ptr %3, align 4
  %143 = and i32 %142, 1
  store i32 %143, ptr %3, align 4
  %144 = load i32, ptr %9, align 4
  %145 = shl i32 %144, 1
  %146 = and i32 %145, 8388607
  store i32 %146, ptr %9, align 4
  %147 = load i32, ptr %3, align 4
  %148 = load i32, ptr %9, align 4
  %149 = or i32 %148, %147
  store i32 %149, ptr %9, align 4
  %150 = load i32, ptr %7, align 4
  %151 = load i32, ptr %21, align 4
  %152 = and i32 %150, %151
  %153 = load i32, ptr %10, align 4
  %154 = load i32, ptr %21, align 4
  %155 = xor i32 %154, -1
  %156 = and i32 %153, %155
  %157 = or i32 %152, %156
  store i32 %157, ptr %10, align 4
  %158 = load i32, ptr %8, align 4
  %159 = load i32, ptr %19, align 4
  %160 = and i32 %158, %159
  %161 = load i32, ptr %11, align 4
  %162 = load i32, ptr %19, align 4
  %163 = xor i32 %162, -1
  %164 = and i32 %161, %163
  %165 = or i32 %160, %164
  store i32 %165, ptr %11, align 4
  %166 = load i32, ptr %9, align 4
  %167 = load i32, ptr %20, align 4
  %168 = and i32 %166, %167
  %169 = load i32, ptr %12, align 4
  %170 = load i32, ptr %20, align 4
  %171 = xor i32 %170, -1
  %172 = and i32 %169, %171
  %173 = or i32 %168, %172
  store i32 %173, ptr %12, align 4
  %174 = load i32, ptr %10, align 4
  %175 = lshr i32 %174, 18
  store i32 %175, ptr %3, align 4
  %176 = load i32, ptr %11, align 4
  %177 = lshr i32 %176, 21
  store i32 %177, ptr %4, align 4
  %178 = load i32, ptr %12, align 4
  %179 = lshr i32 %178, 22
  store i32 %179, ptr %5, align 4
  %180 = load i32, ptr %3, align 4
  %181 = load i32, ptr %4, align 4
  %182 = xor i32 %180, %181
  store i32 %182, ptr %3, align 4
  %183 = load i32, ptr %3, align 4
  %184 = load i32, ptr %5, align 4
  %185 = xor i32 %183, %184
  store i32 %185, ptr %3, align 4
  %186 = load i32, ptr %3, align 4
  %187 = and i32 %186, 1
  store i32 %187, ptr %3, align 4
  %188 = load i32, ptr %10, align 4
  store i32 %188, ptr @R1, align 4
  %189 = load i32, ptr %11, align 4
  store i32 %189, ptr @R2, align 4
  %190 = load i32, ptr %12, align 4
  store i32 %190, ptr @R3, align 4
  %191 = load i32, ptr %3, align 4
  ret i32 %191
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @initreg() #0 {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = load i32, ptr @R1, align 4
  store i32 %9, ptr %6, align 4
  %10 = load i32, ptr @R2, align 4
  store i32 %10, ptr %7, align 4
  %11 = load i32, ptr @R3, align 4
  store i32 %11, ptr %8, align 4
  %12 = load i32, ptr %6, align 4
  %13 = and i32 %12, 262144
  %14 = lshr i32 %13, 18
  %15 = trunc i32 %14 to i8
  store i8 %15, ptr %2, align 1
  %16 = load i32, ptr %6, align 4
  %17 = and i32 %16, 131072
  %18 = lshr i32 %17, 17
  %19 = trunc i32 %18 to i8
  store i8 %19, ptr %3, align 1
  %20 = load i32, ptr %6, align 4
  %21 = and i32 %20, 65536
  %22 = lshr i32 %21, 16
  %23 = trunc i32 %22 to i8
  store i8 %23, ptr %4, align 1
  %24 = load i32, ptr %6, align 4
  %25 = and i32 %24, 8192
  %26 = lshr i32 %25, 13
  %27 = trunc i32 %26 to i8
  store i8 %27, ptr %5, align 1
  %28 = load i32, ptr %6, align 4
  %29 = shl i32 %28, 1
  %30 = and i32 %29, 524287
  store i32 %30, ptr %6, align 4
  %31 = load i8, ptr %2, align 1
  %32 = zext i8 %31 to i32
  %33 = load i8, ptr %3, align 1
  %34 = zext i8 %33 to i32
  %35 = xor i32 %32, %34
  %36 = load i8, ptr %4, align 1
  %37 = zext i8 %36 to i32
  %38 = xor i32 %35, %37
  %39 = load i8, ptr %5, align 1
  %40 = zext i8 %39 to i32
  %41 = xor i32 %38, %40
  %42 = load i32, ptr %6, align 4
  %43 = or i32 %42, %41
  store i32 %43, ptr %6, align 4
  %44 = load i32, ptr %7, align 4
  %45 = and i32 %44, 2097152
  %46 = lshr i32 %45, 21
  %47 = trunc i32 %46 to i8
  store i8 %47, ptr %2, align 1
  %48 = load i32, ptr %7, align 4
  %49 = and i32 %48, 1048576
  %50 = lshr i32 %49, 20
  %51 = trunc i32 %50 to i8
  store i8 %51, ptr %3, align 1
  %52 = load i32, ptr %7, align 4
  %53 = shl i32 %52, 1
  %54 = and i32 %53, 4194303
  store i32 %54, ptr %7, align 4
  %55 = load i8, ptr %2, align 1
  %56 = zext i8 %55 to i32
  %57 = load i8, ptr %3, align 1
  %58 = zext i8 %57 to i32
  %59 = xor i32 %56, %58
  %60 = load i32, ptr %7, align 4
  %61 = or i32 %60, %59
  store i32 %61, ptr %7, align 4
  %62 = load i32, ptr %8, align 4
  %63 = and i32 %62, 4194304
  %64 = lshr i32 %63, 22
  %65 = trunc i32 %64 to i8
  store i8 %65, ptr %2, align 1
  %66 = load i32, ptr %8, align 4
  %67 = and i32 %66, 2097152
  %68 = lshr i32 %67, 21
  %69 = trunc i32 %68 to i8
  store i8 %69, ptr %3, align 1
  %70 = load i32, ptr %8, align 4
  %71 = and i32 %70, 1048576
  %72 = lshr i32 %71, 20
  %73 = trunc i32 %72 to i8
  store i8 %73, ptr %4, align 1
  %74 = load i32, ptr %8, align 4
  %75 = and i32 %74, 128
  %76 = lshr i32 %75, 7
  %77 = trunc i32 %76 to i8
  store i8 %77, ptr %5, align 1
  %78 = load i32, ptr %8, align 4
  %79 = shl i32 %78, 1
  %80 = and i32 %79, 8388607
  store i32 %80, ptr %8, align 4
  %81 = load i8, ptr %2, align 1
  %82 = zext i8 %81 to i32
  %83 = load i8, ptr %3, align 1
  %84 = zext i8 %83 to i32
  %85 = xor i32 %82, %84
  %86 = load i8, ptr %4, align 1
  %87 = zext i8 %86 to i32
  %88 = xor i32 %85, %87
  %89 = load i8, ptr %5, align 1
  %90 = zext i8 %89 to i32
  %91 = xor i32 %88, %90
  %92 = load i32, ptr %8, align 4
  %93 = or i32 %92, %91
  store i32 %93, ptr %8, align 4
  %94 = load i32, ptr %6, align 4
  store i32 %94, ptr @R1, align 4
  %95 = load i32, ptr %7, align 4
  store i32 %95, ptr @R2, align 4
  %96 = load i32, ptr %8, align 4
  store i32 %96, ptr @R3, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @a5init() #0 {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i8 0, ptr %1, align 1
  br label %4

4:                                                ; preds = %29, %0
  %5 = load i8, ptr %1, align 1
  %6 = zext i8 %5 to i32
  %7 = icmp slt i32 %6, 64
  br i1 %7, label %8, label %32

8:                                                ; preds = %4
  %9 = load i8, ptr %1, align 1
  %10 = zext i8 %9 to i32
  %11 = ashr i32 %10, 5
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [2 x i32], ptr @key, i64 0, i64 %12
  %14 = load i32, ptr %13, align 4
  %15 = load i8, ptr %1, align 1
  %16 = zext i8 %15 to i32
  %17 = and i32 %16, 31
  %18 = lshr i32 %14, %17
  %19 = and i32 %18, 1
  store i32 %19, ptr %2, align 4
  %20 = load i32, ptr %2, align 4
  %21 = load i32, ptr @R1, align 4
  %22 = xor i32 %21, %20
  store i32 %22, ptr @R1, align 4
  %23 = load i32, ptr %2, align 4
  %24 = load i32, ptr @R2, align 4
  %25 = xor i32 %24, %23
  store i32 %25, ptr @R2, align 4
  %26 = load i32, ptr %2, align 4
  %27 = load i32, ptr @R3, align 4
  %28 = xor i32 %27, %26
  store i32 %28, ptr @R3, align 4
  call void @initreg()
  br label %29

29:                                               ; preds = %8
  %30 = load i8, ptr %1, align 1
  %31 = add i8 %30, 1
  store i8 %31, ptr %1, align 1
  br label %4

32:                                               ; preds = %4
  store i8 0, ptr %1, align 1
  br label %33

33:                                               ; preds = %52, %32
  %34 = load i8, ptr %1, align 1
  %35 = zext i8 %34 to i32
  %36 = icmp slt i32 %35, 22
  br i1 %36, label %37, label %55

37:                                               ; preds = %33
  %38 = load i32, ptr @frame, align 4
  %39 = load i8, ptr %1, align 1
  %40 = zext i8 %39 to i32
  %41 = lshr i32 %38, %40
  %42 = and i32 %41, 1
  store i32 %42, ptr %3, align 4
  %43 = load i32, ptr %3, align 4
  %44 = load i32, ptr @R1, align 4
  %45 = xor i32 %44, %43
  store i32 %45, ptr @R1, align 4
  %46 = load i32, ptr %3, align 4
  %47 = load i32, ptr @R2, align 4
  %48 = xor i32 %47, %46
  store i32 %48, ptr @R2, align 4
  %49 = load i32, ptr %3, align 4
  %50 = load i32, ptr @R3, align 4
  %51 = xor i32 %50, %49
  store i32 %51, ptr @R3, align 4
  call void @initreg()
  br label %52

52:                                               ; preds = %37
  %53 = load i8, ptr %1, align 1
  %54 = add i8 %53, 1
  store i8 %54, ptr %1, align 1
  br label %33

55:                                               ; preds = %33
  store i8 0, ptr %1, align 1
  br label %56

56:                                               ; preds = %62, %55
  %57 = load i8, ptr %1, align 1
  %58 = zext i8 %57 to i32
  %59 = icmp slt i32 %58, 100
  br i1 %59, label %60, label %65

60:                                               ; preds = %56
  %61 = call i32 @a5reg()
  br label %62

62:                                               ; preds = %60
  %63 = load i8, ptr %1, align 1
  %64 = add i8 %63, 1
  store i8 %64, ptr %1, align 1
  br label %56

65:                                               ; preds = %56
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr @R3, align 4
  store i32 0, ptr @R2, align 4
  store i32 0, ptr @R1, align 4
  store i32 0, ptr @frame, align 4
  store i32 -1, ptr @key, align 4
  store i32 -1, ptr getelementptr inbounds ([2 x i32], ptr @key, i64 0, i64 1), align 4
  call void @a5init()
  store i8 0, ptr %2, align 1
  br label %4

4:                                                ; preds = %17, %0
  %5 = load i8, ptr %2, align 1
  %6 = zext i8 %5 to i32
  %7 = icmp slt i32 %6, 32
  br i1 %7, label %8, label %20

8:                                                ; preds = %4
  %9 = call i32 @a5reg()
  %10 = load i8, ptr %2, align 1
  %11 = zext i8 %10 to i32
  %12 = and i32 %11, 31
  %13 = sub nsw i32 31, %12
  %14 = shl i32 %9, %13
  %15 = load i32, ptr %3, align 4
  %16 = or i32 %15, %14
  store i32 %16, ptr %3, align 4
  br label %17

17:                                               ; preds = %8
  %18 = load i8, ptr %2, align 1
  %19 = add i8 %18, 1
  store i8 %19, ptr %2, align 1
  br label %4

20:                                               ; preds = %4
  %21 = load i32, ptr %3, align 4
  ret i32 %21
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
