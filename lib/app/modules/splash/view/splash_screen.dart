import 'package:cooklkeme/app/modules/splash/controller/splash_controller.dart';
import 'package:cooklkeme/core/theme/app_gradients.dart';
import 'package:cooklkeme/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SplashController controller;

  @override
  void initState() {
    controller = Get.put(SplashController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.px),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/appicon.webp",
                fit: BoxFit.contain,
              ),
              Text(
                "CookLkeMe",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppTextStyles.boldStyle.copyWith(
                  foreground: Paint()..shader = AppGradients.primaryTextShader,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
