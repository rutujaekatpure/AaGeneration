; ModuleID = '<string>'
source_filename = "<string>"
target triple = "x86_64-unknown-linux-gnu"

@str.0 = private unnamed_addr constant [7 x i8] c"in_data"
@str.1 = private unnamed_addr constant [8 x i8] c"out_data"

define i64 @power(i64 %x, i64 %y) local_unnamed_addr {
vars:
  %.6 = tail call i64 @read_uint64([7 x i8]* nonnull @str.0)
  tail call void @__aa_barrier__()
  %.13 = icmp slt i64 %x, 10
  br i1 %.13, label %while.us, label %while

while.us:                                         ; preds = %vars, %while.us
  %y.1.0.us = phi i64 [ %.20.us, %while.us ], [ %y, %vars ]
  %result.0.us = phi i64 [ %.17.us, %while.us ], [ %.6, %vars ]
  tail call void @__loop_pipelining_on__(i64 10, i64 13, i64 14)
  %.17.us = mul i64 %result.0.us, %x
  %.20.us = add i64 %y.1.0.us, -1
  %.32.us = icmp slt i64 %.20.us, 1
  br i1 %.32.us, label %while_out, label %while.us

while:                                            ; preds = %vars, %while
  %y.1.0 = phi i64 [ %.28, %while ], [ %y, %vars ]
  %result.0 = phi i64 [ %.25, %while ], [ %.6, %vars ]
  tail call void @__loop_pipelining_on__(i64 10, i64 13, i64 14)
  %.25 = sdiv i64 %result.0, %x
  %.28 = add i64 %y.1.0, 1
  %.32 = icmp slt i64 %.28, 1
  br i1 %.32, label %while_out, label %while

while_out:                                        ; preds = %while, %while.us
  %result.1.lcssa = phi i64 [ %.17.us, %while.us ], [ %.25, %while ]
  tail call void @write_uint64([8 x i8]* nonnull @str.1, i64 %x)
  ret i64 %result.1.lcssa
}

declare i64 @read_uint64([7 x i8]*) local_unnamed_addr

declare void @__aa_barrier__() local_unnamed_addr

declare void @__loop_pipelining_on__(i64, i64, i64) local_unnamed_addr

declare void @write_uint64([8 x i8]*, i64) local_unnamed_addr