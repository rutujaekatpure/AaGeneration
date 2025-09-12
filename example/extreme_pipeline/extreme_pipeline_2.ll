; ModuleID = '<string>'
source_filename = "<string>"
target triple = "x86_64-unknown-linux-gnu"

define i64 @power(i64 %.1, i64 %.2) local_unnamed_addr {
vars:
  br label %while

while:                                            ; preds = %while, %vars
  %y.0 = phi i64 [ %.2, %vars ], [ %.17, %while ]
  %result.0 = phi i64 [ 0, %vars ], [ %.14, %while ]
  tail call void @__loop_pipelining_on__(i64 10, i64 13, i64 14)
  %.12 = add i64 %y.0, %.1
  %.14 = add i64 %.12, %result.0
  %.17 = add i64 %y.0, -1
  %.20 = icmp slt i64 %.17, 1
  br i1 %.20, label %while_out, label %while

while_out:                                        ; preds = %while
  ret i64 %.14
}

declare void @__loop_pipelining_on__(i64, i64, i64) local_unnamed_addr