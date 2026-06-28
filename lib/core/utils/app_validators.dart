import 'package:get/get.dart';

class AppValidation {
  static String? name(String? value) {
    final name = value?.trim() ?? '';

    if (name.isEmpty) {
      return "Name is required";
    }

    if (name.length < 3) {
      return "Name must be at least 3 characters";
    }

    if (name.length > 30) {
      return "Name is too long";
    }

    // only letters and spaces allowed
    if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(name)) {
      return "Only letters are allowed";
    }

    return null;
  }
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required";
    }
    if (!GetUtils.isEmail(value.trim())) {
      return "Please enter a valid email";
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }

    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }

    return null;
  }
  static String? confirmPassword(
      String? password,
      String? confirmPassword,
      ) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Confirm password is required";
    }

    if (password != confirmPassword) {
      return "Passwords do not match";
    }

    return null;
  }
}