import 'package:cooklkeme/core/theme/app_colors.dart';
import 'package:cooklkeme/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? prefixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? suffixIcon;
  final VoidCallback? onTap;
  final bool readOnly;
  final int? maxLines;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.onTap,
    this.readOnly = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      readOnly: readOnly,
      onTap: onTap,
      maxLines: maxLines,
      cursorColor: AppColors.secondaryColor,
      style: AppTextStyles.onboardingRegularStyle,
      decoration: InputDecoration(
        isCollapsed: true,
        filled: true,
        fillColor: AppColors.textFieldBgColor,
        hintText: hintText,
        hintStyle: AppTextStyles.hintStyle,
        contentPadding: EdgeInsets.symmetric(
          vertical: 12.px,
          horizontal: 16.px,
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: 45.px,
        ),
        prefixIcon: prefixIcon == null
            ? null
            : Padding(
                padding: EdgeInsets.only(left: 15.px),
                child: SvgPicture.asset(
                  prefixIcon!,
                  width: 20.px,
                  height: 20.px,
                ),
              ),
        suffixIconConstraints: BoxConstraints(
          minWidth: 45.px,
        ),
        suffixIcon: suffixIcon == null
            ? null
            : Padding(
                padding: EdgeInsets.only(right: 15.px),
                child: SvgPicture.asset(
                  suffixIcon!,
                  width: 20.px,
                  height: 20.px,
                ),
              ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(36.px),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(36.px),
          borderSide: BorderSide(
            color: AppColors.secondaryColor,
            width: 1.px,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(36.px),
          borderSide: BorderSide(
            color: AppColors.redColor,
            width: 1.px,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(36.px),
          borderSide: BorderSide(
            color: AppColors.redColor,
            width: 1.px,
          ),
        ),
      ),
    );
  }
}
