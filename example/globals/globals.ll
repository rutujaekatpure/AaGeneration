; ModuleID = '<string>'
source_filename = "<string>"
target triple = "x86_64-unknown-linux-gnu"

@num3 = local_unnamed_addr global i64 0
@num = local_unnamed_addr global [2 x [2 x [2 x i64]]] [[2 x [2 x i64]] [[2 x i64] [i64 20, i64 10], [2 x i64] [i64 20, i64 10]], [2 x [2 x i64]] [[2 x i64] [i64 20, i64 10], [2 x i64] [i64 20, i64 10]]]

; Function Attrs: nofree norecurse nounwind
define i64 @type_conversion(i64 %.1) local_unnamed_addr #0 {
vars:
  %.4 = load i64, i64* @num3, align 8
  %.6 = add i64 %.4, %.1
  store i64 %.6, i64* @num3, align 8
  %.10 = add i64 %.1, 1
  %.14 = getelementptr [2 x [2 x [2 x i64]]], [2 x [2 x [2 x i64]]]* @num, i64 0, i64 %.10, i64 0, i64 0
  store i64 %.6, i64* %.14, align 16
  %.27 = sdiv i64 %.6, 2
  ret i64 %.27
}

attributes #0 = { nofree norecurse nounwind }