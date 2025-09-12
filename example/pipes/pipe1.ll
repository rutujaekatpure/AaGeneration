; ModuleID = '<string>'
source_filename = "<string>"
target triple = "x86_64-unknown-linux-gnu"

@str.0 = private unnamed_addr constant [7 x i8] c"in_data"
@str.1 = private unnamed_addr constant [8 x i8] c"out_data"

define void @power() local_unnamed_addr {
vars:
  %.2 = tail call i64 @read_uint64([7 x i8]* nonnull @str.0)
  %.5 = add i64 %.2, 5
  tail call void @write_uint64([8 x i8]* nonnull @str.1, i64 %.5)
  ret void
}

declare i64 @read_uint64([7 x i8]*) local_unnamed_addr

declare void @write_uint64([8 x i8]*, i64) local_unnamed_addr