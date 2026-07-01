import 'package:cooklkeme/app/modules/auth/services/auth_services.dart';
import 'package:cooklkeme/app/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  final loginFormKey = GlobalKey<FormState>();
  final signupFormKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //instances
  final AuthService _authService = AuthService();
  //SignUp User With Email & Password
  Future<void> createUser() async {
    try {
      if (!signupFormKey.currentState!.validate()) return;
      isLoading.value = true;
      await _authService.createUser(email: emailController.text.trim(), password: passwordController.text.trim());
      await _authService.sendVerificationEmail();
      await _authService.signOut();
      Get.toNamed(AppRoutes.emailVerificationScreen);
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Signup Failed",
        _firebaseError(e.code),
      );
      isLoading.value = false;
    } catch (e) {
      Get.snackbar(
        "Error",
        "Something went wrong.",
      );
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  String _firebaseError(String code) {
    switch (code) {
      case 'email-already-in-use':
        return "Email already registered.";

      // case 'invalid-email':
      //   return "Invalid email address.";
      //
      // case 'weak-password':
      //   return "Password is too weak.";

      case 'network-request-failed':
        return "Please connect your internet.";

      case 'too-many-requests':
        return "Too many attempts. Try later.";

      default:
        return "Authentication failed.";
    }
  }


}
