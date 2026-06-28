
import 'package:cooklkeme/app/modules/auth/controller/auth_controller.dart';
import 'package:cooklkeme/app/routes/app_routes.dart';
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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthController loginController;

  @override
  void initState() {
    super.initState();
    loginController = Get.put(AuthController());
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
              key:loginController.loginFormKey ,
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
                    "Sign In",
                    style: AppTextStyles.boldStyle,
                  ),

                  getVerticalSpace(height: 3.h),

                  /// EMAIL FIELD
                   CustomTextField(
                    hintText: "Email/Username",
                    prefixIcon: "assets/icons/email.svg",
                    controller: loginController.emailController,
                    validator: AppValidation.email,
                  ),

                  getVerticalSpace(height: 2.h),

                  /// PASSWORD FIELD
                   CustomTextField(
                    hintText: "Password",
                    prefixIcon: "assets/icons/password.svg",
                    suffixIcon: "assets/icons/visible.svg",
                    controller: loginController.passwordController,
                    validator: AppValidation.password,
                  ),
                  getVerticalSpace(height: 1.h),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(AppRoutes.resetPassword);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forgot Password",
                          style: AppTextStyles.whiteRegularStyle
                              .copyWith(color: AppColors.secondaryColor),
                        )
                      ],
                    ),
                  ),

                  getVerticalSpace(height: 6.h),

                  /// BUTTON
                  Obx(
                    ()=> CustomButton(
                      text: "Sign-in",
                      onPressed: () {
                        loginController.isLoading.value= ! loginController.isLoading.value;
                        if(loginController.loginFormKey.currentState!.validate()){

                        }else{

                        }
                        // Get.toNamed(AppRoutes.customBottomNavScreen);
                      },
                      width: 180.px,
                      height: 4.h,
                      isLoading: loginController.isLoading.value,
                    ),
                  ),

                  getVerticalSpace(height: 2.h),

                  /// SIGNUP TEXT
                  GestureDetector(
                    onTap: () {

                      Get.toNamed(AppRoutes.signup);

                    },
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "I don't have an account ",
                            style: AppTextStyles.whiteRegularStyle,
                          ),
                          TextSpan(
                            text: "Sign-up",
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
