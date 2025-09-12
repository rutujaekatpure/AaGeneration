; ModuleID = '<string>'
source_filename = "<string>"
target triple = "x86_64-unknown-linux-gnu"

@str.0 = private unnamed_addr constant [7 x i8] c"in_data"
@str.1 = private unnamed_addr constant [8 x i8] c"out_data"

define i64 @power(i64 %.1, i64 %.2) local_unnamed_addr {
vars:
  %.6 = tail call i64 @read_uint64([7 x i8]* nonnull @str.0)
  tail call void @__aa_barrier__()
  br label %while

while:                                            ; preds = %while, %vars
  %y.0 = phi i64 [ %.2, %vars ], [ %.17, %while ]
  %result.0 = phi i64 [ %.6, %vars ], [ %.14, %while ]
  tail call void @__loop_pipelining_on__(i64 10, i64 13, i64 14)
  %.14 = mul i64 %result.0, %.1
  %.17 = add i64 %y.0, -1
  %.20 = icmp slt i64 %.17, 1
  br i1 %.20, label %while_out, label %while

while_out:                                        ; preds = %while
  tail call void @write_uint64([8 x i8]* nonnull @str.1, i64 %.1)
  ret i64 %.14
}

declare i64 @read_uint64([7 x i8]*) local_unnamed_addr

declare void @__aa_barrier__() local_unnamed_addr

declare void @__loop_pipelining_on__(i64, i64, i64) local_unnamed_addr

declare void @write_uint64([8 x i8]*, i64) local_unnamed_addr