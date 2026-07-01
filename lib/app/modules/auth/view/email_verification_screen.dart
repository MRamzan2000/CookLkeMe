import 'package:cooklkeme/core/theme/app_text_styles.dart';
import 'package:cooklkeme/core/widgets/get_vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RepaintBoundary(
                child: SizedBox(
                    height: 30.h,
                    child: Image.asset(
                      "assets/images/email_verification.webp",
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.low,
                    ))),
            Text(
              "Email Confirmation",
              style: AppTextStyles.boldStyle,
            ),
            getVerticalSpace(height: 1.h),
            Text(
              "Please check your email to verify your registration",
              style: AppTextStyles.semiBoldStyle.copyWith(
                fontSize: 14.sp
              ),
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
