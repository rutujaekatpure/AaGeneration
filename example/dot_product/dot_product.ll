; ModuleID = '<string>'
source_filename = "<string>"
target triple = "x86_64-unknown-linux-gnu"

@a = local_unnamed_addr global [16 x double] zeroinitializer
@b = local_unnamed_addr global [16 x double] zeroinitializer

; Function Attrs: nofree norecurse nounwind writeonly
define void @init() local_unnamed_addr #0 {
vars:
  store double 0.000000e+00, double* getelementptr inbounds ([16 x double], [16 x double]* @a, i64 0, i64 0), align 16
  store double 0.000000e+00, double* getelementptr inbounds ([16 x double], [16 x double]* @b, i64 0, i64 0), align 16
  store double 1.000000e+00, double* getelementptr inbounds ([16 x double], [16 x double]* @a, i64 0, i64 1), align 8
  store double 1.000000e+00, double* getelementptr inbounds ([16 x double], [16 x double]* @b, i64 0, i64 1), align 8
  store double 2.000000e+00, double* getelementptr inbounds ([16 x double], [16 x double]* @a, i64 0, i64 2), align 16
  store double 2.000000e+00, double* getelementptr inbounds ([16 x double], [16 x double]* @b, i64 0, i64 2), align 16
  store double 3.000000e+00, double* getelementptr inbounds ([16 x double], [16 x double]* @a, i64 0, i64 3), align 8
  store double 3.000000e+00, double* getelementptr inbounds ([16 x double], [16 x double]* @b, i64 0, i64 3), align 8
  store double 4.000000e+00, double* getelementptr inbounds ([16 x double], [16 x double]* @a, i64 0, i64 4), align 16
  store double 4.000000e+00, double* getelementptr inbounds ([16 x double], [16 x double]* @b, i64 0, i64 4), align 16
  store double 5.000000e+00, double* getelementptr inbounds ([16 x double], [16 x double]* @a, i64 0, i64 5), align 8
  store double 5.000000e+00, double* getelementptr inbounds ([16 x double], [16 x double]* @b, i64 0, i64 5), align 8
  store double 6.000000e+00, double* getelementptr inbounds ([16 x double], [16 x double]* @a, i64 0, i64 6), align 16
  store double 6.000000e+00, double* getelementptr inbounds ([16 x double], [16 x double]* @b, i64 0, i64 6), align 16
  store double 7.000000e+00, double* getelementptr inbounds ([16 x double], [16 x double]* @a, i64 0, i64 7), align 8
  store double 7.000000e+00, double* getelementptr inbounds ([16 x double], [16 x double]* @b, i64 0, i64 7), align 8
  store double 8.000000e+00, double* getelementptr inbounds ([16 x double], [16 x double]* @a, i64 0, i64 8), align 16
  store double 8.000000e+00, double* getelementptr inbounds ([16 x double], [16 x double]* @b, i64 0, i64 8), align 16
  store double 9.000000e+00, double* getelementptr inbounds ([16 x double], [16 x double]* @a, i64 0, i64 9), align 8
  store double 9.000000e+00, double* getelementptr inbounds ([16 x double], [16 x double]* @b, i64 0, i64 9), align 8
  store double 1.000000e+01, double* getelementptr inbounds ([16 x double], [16 x double]* @a, i64 0, i64 10), align 16
  store double 1.000000e+01, double* getelementptr inbounds ([16 x double], [16 x double]* @b, i64 0, i64 10), align 16
  store double 1.100000e+01, double* getelementptr inbounds ([16 x double], [16 x double]* @a, i64 0, i64 11), align 8
  store double 1.100000e+01, double* getelementptr inbounds ([16 x double], [16 x double]* @b, i64 0, i64 11), align 8
  store double 1.200000e+01, double* getelementptr inbounds ([16 x double], [16 x double]* @a, i64 0, i64 12), align 16
  store double 1.200000e+01, double* getelementptr inbounds ([16 x double], [16 x double]* @b, i64 0, i64 12), align 16
  store double 1.300000e+01, double* getelementptr inbounds ([16 x double], [16 x double]* @a, i64 0, i64 13), align 8
  store double 1.300000e+01, double* getelementptr inbounds ([16 x double], [16 x double]* @b, i64 0, i64 13), align 8
  store double 1.400000e+01, double* getelementptr inbounds ([16 x double], [16 x double]* @a, i64 0, i64 14), align 16
  store double 1.400000e+01, double* getelementptr inbounds ([16 x double], [16 x double]* @b, i64 0, i64 14), align 16
  store double 1.500000e+01, double* getelementptr inbounds ([16 x double], [16 x double]* @a, i64 0, i64 15), align 8
  store double 1.500000e+01, double* getelementptr inbounds ([16 x double], [16 x double]* @b, i64 0, i64 15), align 8
  ret void
}

; Function Attrs: norecurse nounwind readonly
define double @dotp_unrolled() local_unnamed_addr #1 {
vars:
  %.10.pre = load double, double* getelementptr inbounds ([16 x double], [16 x double]* @a, i64 0, i64 0), align 16
  %.13.pre = load double, double* getelementptr inbounds ([16 x double], [16 x double]* @b, i64 0, i64 0), align 16
  %.19.pre = load double, double* getelementptr inbounds ([16 x double], [16 x double]* @a, i64 0, i64 1), align 8
  %.23.pre = load double, double* getelementptr inbounds ([16 x double], [16 x double]* @b, i64 0, i64 1), align 8
  %.29.pre = load double, double* getelementptr inbounds ([16 x double], [16 x double]* @a, i64 0, i64 2), align 16
  %.33.pre = load double, double* getelementptr inbounds ([16 x double], [16 x double]* @b, i64 0, i64 2), align 16
  br label %for_body

for_body:                                         ; preds = %vars, %for_body
  %.33 = phi double [ %.33.pre, %vars ], [ %.43, %for_body ]
  %.29 = phi double [ %.29.pre, %vars ], [ %.39, %for_body ]
  %.23 = phi double [ %.23.pre, %vars ], [ %.33, %for_body ]
  %.19 = phi double [ %.19.pre, %vars ], [ %.29, %for_body ]
  %.13 = phi double [ %.13.pre, %vars ], [ %.23, %for_body ]
  %.10 = phi double [ %.10.pre, %vars ], [ %.19, %for_body ]
  %result.02 = phi double [ 0.000000e+00, %vars ], [ %.56, %for_body ]
  %storemerge1 = phi i64 [ 0, %vars ], [ %.17, %for_body ]
  %.14 = fmul double %.10, %.13
  %.17 = add nuw nsw i64 %storemerge1, 1
  %.24 = fmul double %.19, %.23
  %.34 = fmul double %.29, %.33
  %.37 = add nuw nsw i64 %storemerge1, 3
  %.38 = getelementptr [16 x double], [16 x double]* @a, i64 0, i64 %.37
  %.39 = load double, double* %.38, align 8
  %.42 = getelementptr [16 x double], [16 x double]* @b, i64 0, i64 %.37
  %.43 = load double, double* %.42, align 8
  %.44 = fmul double %.39, %.43
  %.48 = fadd double %.14, %.24
  %.50 = fadd double %.48, %.34
  %.52 = fadd double %.50, %.44
  %.56 = fadd double %result.02, %.52
  %.6 = icmp ult i64 %storemerge1, 15
  br i1 %.6, label %for_body, label %for_out

for_out:                                          ; preds = %for_body
  ret double %.56
}

attributes #0 = { nofree norecurse nounwind writeonly }
attributes #1 = { norecurse nounwind readonly }