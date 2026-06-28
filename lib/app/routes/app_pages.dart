import 'package:cooklkeme/app/modules/auth/view/login_screen.dart';
import 'package:cooklkeme/app/modules/auth/view/reset_password_screen.dart';
import 'package:cooklkeme/app/modules/auth/view/sign_up_screen.dart';
import 'package:cooklkeme/app/modules/bottom_nav/view/custom_bottom_nav_bar.dart';
import 'package:cooklkeme/app/modules/onboarding/view/onboarding_screen.dart';
import 'package:cooklkeme/app/modules/post/view/create_post.dart';
import 'package:cooklkeme/app/modules/post/view/post_preview.dart';
import 'package:cooklkeme/app/modules/splash/view/splash_screen.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
    GetPage(name: AppRoutes.onboarding, page: () => OnboardingScreen()),
    GetPage(name: AppRoutes.login, page: () => LoginScreen()),
    GetPage(name: AppRoutes.signup, page: () => SignupScreen()),
    GetPage(name: AppRoutes.resetPassword, page: () => ResetPasswordScreen()),
    GetPage(
        name: AppRoutes.customBottomNavScreen,
        page: () => CustomBottomNavScreen()),
    GetPage(name: AppRoutes.createPost, page: () => CreatePost()),
    GetPage(name: AppRoutes.postPreviewScreen, page: () => PostPreviewScreen()),
  ];
}
