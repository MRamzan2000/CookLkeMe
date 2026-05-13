import 'package:cooklkeme/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppTextStyles {
  static TextStyle boldStyle = GoogleFonts.inter(
      textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22.sp,
          color: AppColors.whiteColor));
  static TextStyle whiteRegularStyle = GoogleFonts.inter(
      textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
          color: AppColors.whiteColor));

  static TextStyle hintStyle = GoogleFonts.inter(
      textStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12.sp,
          color: AppColors.textFieldIconColor));
}
