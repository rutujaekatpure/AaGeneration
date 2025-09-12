; ModuleID = 'main.bc'
source_filename = "main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.pipeId_ = type { ptr, i32 }

@.str = private unnamed_addr constant [6 x i8] c"pipe1\00", align 1
@p1 = dso_local constant [1 x %struct.pipeId_] [%struct.pipeId_ { ptr @.str, i32 4 }], align 16
@.str.1 = private unnamed_addr constant [6 x i8] c"pipe2\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @foo(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %4 = load ptr, ptr @p1, align 16
  %5 = getelementptr inbounds i8, ptr %4, i64 0
  %6 = load i32, ptr %2, align 4
  call void @write_uint32(ptr noundef %5, i32 noundef %6)
  %7 = call i32 @read_uint32(ptr noundef @.str.1)
  store i32 %7, ptr %3, align 4
  %8 = load i32, ptr %3, align 4
  ret i32 %8
}

declare void @write_uint32(ptr noundef, i32 noundef) #1

declare i32 @read_uint32(ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @bar() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 @read_uint32(ptr noundef @.str)
  store i32 %2, ptr %1, align 4
  %3 = load i32, ptr %1, align 4
  call void @write_uint32(ptr noundef @.str.1, i32 noundef %3)
  ret i32 1
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
