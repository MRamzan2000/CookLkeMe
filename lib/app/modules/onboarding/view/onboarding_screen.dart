import 'package:animate_do/animate_do.dart';
import 'package:cooklkeme/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:cooklkeme/core/theme/app_colors.dart';
import 'package:cooklkeme/core/theme/app_text_styles.dart';
import 'package:cooklkeme/core/widgets/get_vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final OnboardingController controller = Get.put(OnboardingController());

  @override
  void initState() {
    super.initState();

    /// PRELOAD IMAGES
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (final image in controller.pages) {
        precacheImage(AssetImage(image), context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Stack(
          children: [
            /// PAGEVIEW IMAGES
            PageView.builder(
              controller: controller.pageController,
              itemCount: controller.pages.length,
              onPageChanged: controller.changePage,
              itemBuilder: (context, index) {
                return FadeInDown(
                  duration: const Duration(milliseconds: 1100),
                  key: ValueKey(
                      controller.headings[controller.currentIndex.value]),
                  child: RepaintBoundary(
                    key: ValueKey(controller.currentIndex.value),
                    child: Image.asset(
                      controller.pages[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      filterQuality: FilterQuality.low,
                    ),
                  ),
                );
              },
            ),

            /// OVERLAY CONTENT
            SafeArea(
              top: false,
              child: Column(
                children: [
                  const Spacer(),

                  /// HEADING ANIMATION
                  FadeInRight(
                    key: ValueKey(
                        controller.headings[controller.currentIndex.value]),
                    duration: const Duration(milliseconds: 700),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: Text(
                        controller.headings[controller.currentIndex.value],
                        textAlign: TextAlign.center,
                        style: AppTextStyles.onboardingBoldStyle,
                      ),
                    ),
                  ),

                  /// DETAILS ANIMATION
                  FadeInLeft(
                    key: ValueKey(
                        controller.details[controller.currentIndex.value]),
                    duration: const Duration(milliseconds: 900),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: Text(
                        controller.details[controller.currentIndex.value],
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.onboardingRegularStyle,
                      ),
                    ),
                  ),

                  getVerticalSpace(height: 1.h),

                  /// BOTTOM BAR
                  FadeInUp(
                    duration: const Duration(milliseconds: 1100),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      height: 5.6.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.bottomBarBgColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// INDICATORS
                          Row(
                            children: List.generate(
                              controller.pages.length,
                              (index) => AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin:  EdgeInsets.only(right: 6.px),
                                width: controller.currentIndex.value == index
                                    ? 24.px
                                    : 8.px,
                                height: 8.px,
                                decoration: BoxDecoration(
                                  color: controller.currentIndex.value == index
                                      ? AppColors.secondaryColor
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),

                          /// NEXT BUTTON
                          InkWell(
                            onTap: controller.nextPage,
                            child: Text(
                              controller.currentIndex.value==2?"Get Started":
                              "Next",
                              style: AppTextStyles.textButtonStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
