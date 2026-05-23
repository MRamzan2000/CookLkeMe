import 'package:cooklkeme/core/theme/app_colors.dart';
import 'package:cooklkeme/core/theme/app_text_styles.dart';
import 'package:cooklkeme/core/widgets/get_horizontal_space.dart';
import 'package:cooklkeme/core/widgets/get_vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PublishPost extends StatelessWidget {
  const PublishPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.px),
          child: Column(children: [
            _buildTopBar(),
            getVerticalSpace(height: 30.px),
            Row(children: [

            ],)
          ],),
        ),
      ),
    );
  }
  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: () {
               Get.back();
            },
            child: SvgPicture.asset("assets/icons/arrow_back_ios_new.svg",height: 28.px,)
        ),
        getHorizontalSpace(width: 30.px),

        // Next
        GestureDetector(
          onTap: () {

          },
          child: Text(
            'Post',
            style: AppTextStyles.semiBoldStyle.copyWith(
              color: AppColors.whiteColor,
              fontSize: 18.px,
            ),
          ),
        ),
      ],
    );
  }
}
