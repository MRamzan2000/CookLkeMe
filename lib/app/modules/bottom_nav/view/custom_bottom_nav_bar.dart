import 'package:cooklkeme/app/modules/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:cooklkeme/core/theme/app_colors.dart';
import 'package:cooklkeme/core/theme/app_text_styles.dart';
import 'package:cooklkeme/core/widgets/custom_nav_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class CustomBottomNavScreen extends StatelessWidget {
  CustomBottomNavScreen({super.key});

  late final controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secondaryColor,
        onPressed: () {},
        shape: const CircleBorder(),
        child: Icon(
          Icons.add,
          size: 40.px,
          color: AppColors.whiteColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: Obx(
            () => BottomAppBar(
          padding: EdgeInsets.zero,
          color: Colors.transparent,
          child: ClipPath(
            clipper: CustomNavClipper(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.px), // SAME
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.bottomBarBgColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.px),
                  topRight: Radius.circular(15.px),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  controller.bottomBarIcons.length,
                      (index) {
                    final selected =
                        controller.selectedIndex.value == index;

                    return Padding(
                      // SAME spacing logic (UNCHANGED)
                      padding: EdgeInsets.only(
                        left: index == 2 ? 20 : 0,
                        right: index == 1 ? 20 : 0,
                      ),

                      child: GestureDetector(
                        onTap: () => controller.changeIndex(index),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              controller.bottomBarIcons[index],
                              height: 24.px,
                              width: 24.px,
                              colorFilter: ColorFilter.mode(
                                selected
                                    ? AppColors.secondaryColor
                                    : AppColors.textFieldIconColor,
                                BlendMode.srcIn,
                              ),
                            ),

                            SizedBox(height: .5.h),

                            Text(
                              controller.bottomBarText[index],
                              style: AppTextStyles.hintStyle.copyWith(
                                color: selected
                                    ? AppColors.secondaryColor
                                    : AppColors.textFieldIconColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}