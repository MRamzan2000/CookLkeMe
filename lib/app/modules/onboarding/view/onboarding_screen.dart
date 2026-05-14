import 'package:cooklkeme/core/theme/app_colors.dart';
import 'package:cooklkeme/core/theme/app_text_styles.dart';
import 'package:cooklkeme/core/widgets/get_vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;

  int currentIndex = 0;

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
  void initState() {
    super.initState();
    _pageController = PageController();
    // preload images
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (final image in pages) {
        precacheImage(AssetImage(image), context);
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// PAGEVIEW
          PageView.builder(
            controller: _pageController,
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return RepaintBoundary(
                child: Image.asset(
                  pages[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  filterQuality: FilterQuality.low,
                ),
              );
            },
          ),

          /// CONTENT
          SafeArea(
            top: false,
            child: Column(
              children: [
                const Spacer(),

                /// HEADING
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Text(headings[currentIndex],
                      textAlign: TextAlign.center,
                      style: AppTextStyles.onboardingBoldStyle),
                ),

                getVerticalSpace(height: .5.h),

                /// DETAILS
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Text(details[currentIndex],
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.onboardingRegularStyle),
                ),

                getVerticalSpace(height: 1.h),

                /// BOTTOM BAR
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  height: 5.6.h,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: AppColors.bottomBarBgColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// INDICATORS
                      Row(
                        children: List.generate(
                          pages.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.only(right: 6),
                            width: currentIndex == index ? 24 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: currentIndex == index
                                  ? Colors.orange
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),

                      /// NEXT BUTTON
                      InkWell(
                        onTap: () {
                          if (currentIndex < pages.length - 1) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        child: Text(
                          "Next",
                          style:AppTextStyles.textButtonStyle
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
