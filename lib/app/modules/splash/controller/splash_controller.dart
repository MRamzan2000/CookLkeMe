import 'dart:async';
import 'package:cooklkeme/app/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  Timer? timer;
  @override
  void onInit() {
    navigateToNextScreen();
    super.onInit();
  }

  void navigateToNextScreen() {
    timer = Timer(Duration(seconds: 2), () {
      Get.offAllNamed(AppRoutes.onboarding);
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
