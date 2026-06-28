import 'package:cooklkeme/core/theme/app_colors.dart';
import 'package:cooklkeme/core/theme/app_text_styles.dart';
import 'package:cooklkeme/core/widgets/custom_elevated_button.dart';
import 'package:cooklkeme/core/widgets/custom_text_field.dart';
import 'package:cooklkeme/core/widgets/get_vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                getVerticalSpace(height: 6.h),

                /// TITLE
                Text(
                  "Reset Your Password",
                  style: AppTextStyles.boldStyle.copyWith(fontSize: 18.sp),
                ),

                getVerticalSpace(height: 1.h),
                Text(
                  "Enter your email and we'll send you a link to reset your password.",
                  style: AppTextStyles.onboardingRegularStyle
                      .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                getVerticalSpace(height: 8.h),

                /// EMAIL FIELD
                const CustomTextField(
                  hintText: "Email",
                  prefixIcon: "assets/icons/email.svg",
                ),

                getVerticalSpace(height: 4.h),

                /// BUTTON
                CustomButton(
                  text: "Reset",
                  onPressed: () {},
                  width: 180.px,
                  isLoading: false,
                  height: 4.h,
                ),

                getVerticalSpace(height: 2.h),

                /// SIGNUP TEXT
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Back to  ",
                          style: AppTextStyles.whiteRegularStyle,
                        ),
                        TextSpan(
                          text: "Sign-In",
                          style: AppTextStyles.whiteRegularStyle.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                getVerticalSpace(height: 3.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
