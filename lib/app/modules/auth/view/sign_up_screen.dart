import 'package:cooklkeme/app/modules/auth/controller/auth_controller.dart';
import 'package:cooklkeme/core/theme/app_colors.dart';
import 'package:cooklkeme/core/theme/app_gradients.dart';
import 'package:cooklkeme/core/theme/app_text_styles.dart';
import 'package:cooklkeme/core/utils/app_validators.dart';
import 'package:cooklkeme/core/widgets/custom_elevated_button.dart';
import 'package:cooklkeme/core/widgets/custom_text_field.dart';
import 'package:cooklkeme/core/widgets/get_vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late AuthController signUpController;
  @override
  void initState() {
    super.initState();
    signUpController =Get.put(AuthController());
  }
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
            child: Form(
              key: signUpController.signupFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  getVerticalSpace(height: 6.h),

                  /// LOGO
                  RepaintBoundary(
                    child: SizedBox(
                      height: 15.h,
                      width: 250.px,
                      child: Image.asset(
                        "assets/icons/appicon.webp",
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.low,
                      ),
                    ),
                  ),

                  /// APP NAME
                  Text(
                    "CookLkeMe",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.boldStyle.copyWith(
                      fontSize: 20.sp,
                      foreground: Paint()
                        ..shader = AppGradients.primaryTextShader,
                    ),
                  ),

                  getVerticalSpace(height: 6.h),

                  /// TITLE
                  Text(
                    "Sign up",
                    style: AppTextStyles.boldStyle,
                  ),

                  getVerticalSpace(height: 3.h),

                  /// EMAIL FIELD
                   CustomTextField(
                    hintText: "Username",
                    prefixIcon: "assets/icons/username.svg",
                    controller: signUpController.nameController,
                    validator: AppValidation.name,
                  ),
                  getVerticalSpace(height: 1.5.h),

                   CustomTextField(
                    hintText: "Email",
                    prefixIcon: "assets/icons/email.svg",
                    controller: signUpController.emailController,
                     validator: AppValidation.email,
                  ),

                  getVerticalSpace(height: 1.5.h),

                  /// PASSWORD FIELD
                   CustomTextField(
                    hintText: "Password",
                    prefixIcon: "assets/icons/password.svg",
                    suffixIcon: "assets/icons/visible.svg",
                    controller: signUpController.passwordController,
                     validator: AppValidation.password,
                  ),
                  getVerticalSpace(height: 1.5.h),
                   CustomTextField(
                    hintText: "Confirm Password",
                    prefixIcon: "assets/icons/password.svg",
                    suffixIcon: "assets/icons/visible.svg",
                    controller: signUpController.confirmPasswordController,
                     validator: (value) => AppValidation.confirmPassword(
                       signUpController.passwordController.text,
                       value,
                     ),
                  ),

                  getVerticalSpace(height: 7.h),

                  /// BUTTON
                  CustomButton(
                    text: "Sign-up",
                    isLoading: false,
                    onPressed: () {
                      if(signUpController.signupFormKey.currentState!.validate()){


                      }else{

                      }
                    },
                    width: 180.px,
                    height: 4.h,
                  ),

                  getVerticalSpace(height: 2.h),

                  /// SIGNUP TEXT
                  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "I have a account ",
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
      ),
    );
  }
}