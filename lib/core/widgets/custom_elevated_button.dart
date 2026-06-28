import 'package:cooklkeme/core/loading/loading_widget.dart';
import 'package:cooklkeme/core/theme/app_colors.dart';
import 'package:cooklkeme/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final double? borderRadius;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final Widget? child;
  final bool isLoading;

   const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height,
    this.width,
    this.borderRadius,
    this.backgroundColor,
    this.textStyle,
    this.child,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50.px,
      width: width ?? double.infinity,

      child: ElevatedButton(
        onPressed: onPressed,

        style: ElevatedButton.styleFrom(
          backgroundColor:
          backgroundColor ?? AppColors.secondaryColor,

          elevation: 0,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? 30.px,
            ),
          ),
        ),

        child:isLoading?AppLoader():
        Text(
          text,
          style: textStyle ?? AppTextStyles.buttonStyle,
        ),
      ),
    );
  }
}