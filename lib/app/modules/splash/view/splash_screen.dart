import 'dart:async';

import 'package:cooklkeme/app/modules/auth/view/login_screen.dart';
import 'package:cooklkeme/core/theme/app_colors.dart';
import 'package:cooklkeme/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  @override
  void initState() {
    _navigateToNextScreen();
    super.initState();
  }

  void _navigateToNextScreen() {
    _timer = Timer(Duration(seconds: 5), () {
      if (!mounted) return;
      Get.offAll(() => const LoginScreen());
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Shader gradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        AppColors.redColor,
        AppColors.orangeColor,
      ],
    ).createShader(
      const Rect.fromLTWH(0.0, 0.0, 220.0, 70.0),
    );
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.px),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RepaintBoundary(
                child: Image.asset(
                  "assets/icons/appicon.png",
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.low,
                ),
              ),
              Text(
                "CookLkeMe",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppTextStyles.boldStyle.copyWith(
                  foreground: Paint()..shader = gradient,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
