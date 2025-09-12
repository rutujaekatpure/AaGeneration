; ModuleID = '<string>'
source_filename = "<string>"
target triple = "x86_64-unknown-linux-gnu"

define i64 @power(i64 %.1, i64 %.2) local_unnamed_addr {
vars:
  %.11 = icmp sgt i64 %.1, 10
  br i1 %.11, label %while.us, label %while

while.us:                                         ; preds = %vars, %while.us
  %y.0.us = phi i64 [ %.22.us, %while.us ], [ %.2, %vars ]
  %result.0.us = phi i64 [ %result.1.us, %while.us ], [ 0, %vars ]
  tail call void @__loop_pipelining_on__(i64 10, i64 13, i64 14)
  %.15.us = add i64 %y.0.us, %.1
  %result.1.us = add i64 %.15.us, %result.0.us
  %.22.us = add i64 %y.0.us, -1
  %.25.us = icmp slt i64 %.22.us, 1
  br i1 %.25.us, label %while_out, label %while.us

while:                                            ; preds = %vars, %while
  %y.0 = phi i64 [ %.22, %while ], [ %.2, %vars ]
  tail call void @__loop_pipelining_on__(i64 10, i64 13, i64 14)
  %.22 = add i64 %y.0, -1
  %.25 = icmp slt i64 %.22, 1
  br i1 %.25, label %while_out, label %while

while_out:                                        ; preds = %while, %while.us
  %result.1.lcssa = phi i64 [ %result.1.us, %while.us ], [ 0, %while ]
  ret i64 %result.1.lcssa
}

declare void @__loop_pipelining_on__(i64, i64, i64) local_unnamed_addr