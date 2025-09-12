; ModuleID = '<string>'
source_filename = "<string>"
target triple = "x86_64-unknown-linux-gnu"

@arr = local_unnamed_addr global [3 x [2 x i64]] [[2 x i64] [i64 1, i64 2], [2 x i64] [i64 3, i64 4], [2 x i64] [i64 5, i64 6]]

; Function Attrs: norecurse nounwind readonly
define i64 @for_() local_unnamed_addr #0 {
vars:
  %.14 = load i64, i64* getelementptr inbounds ([3 x [2 x i64]], [3 x [2 x i64]]* @arr, i64 0, i64 0, i64 0), align 16
  %.14.1 = load i64, i64* getelementptr inbounds ([3 x [2 x i64]], [3 x [2 x i64]]* @arr, i64 0, i64 1, i64 0), align 16
  %.15.1 = add i64 %.14.1, %.14
  %.14.2 = load i64, i64* getelementptr inbounds ([3 x [2 x i64]], [3 x [2 x i64]]* @arr, i64 0, i64 2, i64 0), align 16
  %.15.2 = add i64 %.14.2, %.15.1
  %.14.3 = load i64, i64* getelementptr inbounds ([3 x [2 x i64]], [3 x [2 x i64]]* @arr, i64 1, i64 0, i64 0), align 16
  %.15.3 = add i64 %.14.3, %.15.2
  %.14.4 = load i64, i64* getelementptr ([3 x [2 x i64]], [3 x [2 x i64]]* @arr, i64 1, i64 1, i64 0), align 16
  %.15.4 = add i64 %.14.4, %.15.3
  ret i64 %.15.4
}