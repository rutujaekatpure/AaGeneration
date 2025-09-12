; ModuleID = 'main.opt.o'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g = common global [10 x i32] zeroinitializer, align 16

define void @cpy(i32* nocapture %a) nounwind {
entry:
  %tmp1 = load i32* %a, align 4
  %add.ptr = getelementptr inbounds i32* %a, i64 1
  store i32 %tmp1, i32* %add.ptr, align 4
  ret void
}

define i32 @main(i32 %a) nounwind {
entry:
  %tmp1.i = load i32* getelementptr inbounds ([10 x i32]* @g, i64 0, i64 0), align 16
  store i32 %tmp1.i, i32* getelementptr inbounds ([10 x i32]* @g, i64 0, i64 1), align 4
  ret i32 %tmp1.i
}
