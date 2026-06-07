import 'package:cooklkeme/core/theme/app_colors.dart';
import 'package:cooklkeme/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;

  final String? prefixIcon;
  final String? suffixIcon;

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;

  final bool obscureText;
  final bool readOnly;
  final bool enabled;
  final bool autofocus;

  final int? maxLines;

  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;

  final EdgeInsetsGeometry? contentPadding;

  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;

  final Color? fillColor;
  final Color? cursorColor;

  final double? borderRadius;
  final double borderWidth;

  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;

  const CustomTextField({
    super.key,
     this.hintText,

    this.labelText,

    this.prefixIcon,
    this.suffixIcon,

    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,

    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.autofocus = false,

    this.maxLines = 1,

    this.onTap,
    this.onChanged,

    this.contentPadding,

    this.textStyle,
    this.hintStyle,
    this.labelStyle,

    this.fillColor,
    this.cursorColor,

    this.borderRadius,
    this.borderWidth = 1,

    this.enabledBorderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? 36.px;

    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      obscureText: obscureText,
      readOnly: readOnly,
      enabled: enabled,
      autofocus: autofocus,
      onTap: onTap,
      onChanged: onChanged,
      maxLines: maxLines,
      cursorColor: cursorColor ?? AppColors.secondaryColor,
      style: textStyle ?? AppTextStyles.onboardingRegularStyle,
      decoration: InputDecoration(
        isCollapsed: true,
        filled: true,
        fillColor: fillColor ?? AppColors.textFieldBgColor,

        hintText: hintText,
        hintStyle: hintStyle ?? AppTextStyles.hintStyle,

        labelText: labelText,
        labelStyle: labelStyle,

        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
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
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: enabledBorderColor ?? Colors.transparent,
            width: borderWidth,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: focusedBorderColor ?? AppColors.secondaryColor,
            width: borderWidth,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: errorBorderColor ?? AppColors.redColor,
            width: borderWidth,
          ),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: errorBorderColor ?? AppColors.redColor,
            width: borderWidth,
          ),
        ),
      ),
    );
  }
}