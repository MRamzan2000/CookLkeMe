import 'package:cooklkeme/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppGradients {

  /// Linear Gradient
  static final LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      AppColors.redColor,
      AppColors.orangeColor,
    ],
  );

  /// Shader
  static Shader primaryTextShader = primaryGradient.createShader(
    const Rect.fromLTWH(0.0, 0.0, 220.0, 70.0),
  );
}