import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  late final PageController pageController;

  final RxInt currentIndex = 0.obs;

  final List<String> pages = [
    "assets/images/onboarding_1.webp",
    "assets/images/onboarding_2.webp",
    "assets/images/onboarding_3.webp",
  ];

  final List<String> headings = [
    "Discover Endless Recipes",
    "Share Your Creations",
    "Connect with Food Lovers",
  ];

  final List<String> details = [
    "Swipe through a world of flavors! From quick snacks to gourmet meals, explore recipes that inspire your next dish.",
    "Got a favorite recipe? Record, edit, and post it to show off your cooking skills. Inspire others with your delicious creations!",
    "Follow chefs and fellow foodies, engage with their recipes, and join a community that’s as passionate about food as you are.",
  ];

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  void changePage(int index) {
    currentIndex.value = index;
  }

  void nextPage() {
    if (currentIndex.value < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}