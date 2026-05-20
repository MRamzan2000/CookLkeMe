import 'package:cooklkeme/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'get_vertical_space.dart';

class VideoActionColumn extends StatelessWidget {
  const VideoActionColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.px),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _icon("assets/icons/like.svg", "225K"),
          _icon("assets/icons/comment.svg", "5K"),
          _icon("assets/icons/save.svg", "Save"),
          _icon("assets/icons/share.svg", "25K"),
          getVerticalSpace(height: 1.h),
          SizedBox(
              width: 12.w,
              child: Image.asset(
                "assets/images/applogo.png",
                height: 34.px,
                width: 34.px,
              )),
          getVerticalSpace(height: 15.h)

        ],
      ),
    );
  }

  Widget _icon(String icon, String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.5.h),
      child: SizedBox(
        width: 12.w,
        child: Column(
          children: [
            SvgPicture.asset(icon, height: 28.px),
             SizedBox(height: .6.h),
            Text(label,
              style: AppTextStyles.whiteRegularStyle
                  .copyWith(fontSize: 14.sp),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis)
              ,
          ],
        ),
      ),
    );
  }
}