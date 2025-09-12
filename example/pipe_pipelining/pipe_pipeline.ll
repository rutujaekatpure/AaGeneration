; ModuleID = '<string>'
source_filename = "<string>"
target triple = "x86_64-unknown-linux-gnu"

@str.0 = private unnamed_addr constant [7 x i8] c"in_data"
@str.1 = private unnamed_addr constant [8 x i8] c"out_data"

define i64 @power(i64 %.1, i64 %.2) local_unnamed_addr {
vars:
  %.6 = tail call i64 @read_uint64([7 x i8]* nonnull @str.0)
  tail call void @__aa_barrier__()
  %.131.not = icmp eq i64 %.2, 0
  br i1 %.131.not, label %for_out, label %for_body

for_body:                                         ; preds = %vars, %for_body
  %result.03 = phi i64 [ %.18, %for_body ], [ %.6, %vars ]
  %storemerge2 = phi i64 [ %.21, %for_body ], [ 0, %vars ]
  tail call void @__loop_pipelining_on__(i64 10, i64 13, i64 14)
  %.18 = mul i64 %result.03, %.1
  %.21 = add nuw i64 %storemerge2, 1
  %.13 = icmp ult i64 %.21, %.2
  br i1 %.13, label %for_body, label %for_out

for_out:                                          ; preds = %for_body, %vars
  %result.0.lcssa = phi i64 [ %.6, %vars ], [ %.18, %for_body ]
  tail call void @write_uint64([8 x i8]* nonnull @str.1, i64 %.1)
  ret i64 %result.0.lcssa
}

declare i64 @read_uint64([7 x i8]*) local_unnamed_addr

declare void @__aa_barrier__() local_unnamed_addr

declare void @__loop_pipelining_on__(i64, i64, i64) local_unnamed_addr

declare void @write_uint64([8 x i8]*, i64) local_unnamed_addr