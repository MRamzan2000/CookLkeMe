import 'package:cooklkeme/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppTextStyles {
  static TextStyle boldStyle = GoogleFonts.inter(
      textStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20.sp,
          color: AppColors.whiteColor));
  static TextStyle onboardingBoldStyle = GoogleFonts.inter(
      textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
          color: AppColors.whiteColor));
  static TextStyle textButtonStyle = GoogleFonts.inter(
      textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 17.sp,
          color: AppColors.whiteColor));
  static TextStyle buttonStyle = GoogleFonts.inter(
      textStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 15.sp,
          color: AppColors.whiteColor));
  static TextStyle onboardingRegularStyle = GoogleFonts.inter(
      textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
          color: AppColors.onboardingWhiteColor));
  static TextStyle whiteRegularStyle = GoogleFonts.inter(
      textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15.sp,
          color: AppColors.whiteColor));

  static TextStyle hintStyle = GoogleFonts.inter(
      textStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          color: AppColors.textFieldIconColor));
}
