; ModuleID = 'main.o'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g = global [2 x i32] [i32 1, i32 1], align 4
@f = global [2 x [2 x i32]] [[2 x i32] [i32 1, i32 1], [2 x i32] [i32 1, i32 1]], align 16

define i32 @main() nounwind {
entry:
  %retval = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval
  %tmp = load i32* getelementptr inbounds ([2 x i32]* @g, i32 0, i64 0)
  %tmp1 = load i32* getelementptr inbounds ([2 x i32]* @g, i32 0, i64 1)
  %add = add nsw i32 %tmp, %tmp1
  %tmp2 = load i32* getelementptr inbounds ([2 x [2 x i32]]* @f, i32 0, i64 0, i64 0)
  %add3 = add nsw i32 %add, %tmp2
  %tmp4 = load i32* getelementptr inbounds ([2 x [2 x i32]]* @f, i32 0, i64 1, i64 1)
  %add5 = add nsw i32 %add3, %tmp4
  store i32 %add5, i32* %b, align 4
  %tmp6 = load i32* %b, align 4
  ret i32 %tmp6
}
