import 'package:cooklkeme/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Shader linearGradient = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xFFE7242C), // left red
      Color(0xFFFF8F1D), // right orange
    ],
  ).createShader(
    const Rect.fromLTWH(0.0, 0.0, 220.0, 70.0),
  );
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/icons/appicon.png"),
            SizedBox(height: 1.h,),
            Text("CookLkeMe",style: AppTextStyles.boldStyle.copyWith(
              foreground: Paint()..shader=linearGradient)
            ),

          ],
        ),
      ),
    );
  }
}
