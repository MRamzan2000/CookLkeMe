import 'package:cooklkeme/app/modules/home/controller/feed_controller.dart';
import 'package:cooklkeme/core/theme/app_text_styles.dart';
import 'package:cooklkeme/core/widgets/get_vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VideoActionColumn extends StatelessWidget {
   VideoActionColumn({super.key});
  final controller = Get.put(FeedController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _icon("assets/icons/like.svg", "225K",(){
          print("like");
        }),
        _icon("assets/icons/comment.svg", "5K",(){
          controller.showComments();

        }),
        _icon("assets/icons/save.svg", "Save",(){
          print("save");

        }),
        _icon("assets/icons/share.svg", "25K",(){
          print("share");

        }),
        getVerticalSpace(height: 1.h),
        SizedBox(
            width: 15.w,
            height: 4.5.h,
            child: Image.asset(
              "assets/icons/appicon.webp",
              fit: BoxFit.fill,
            )),
        getVerticalSpace(height: 15.h)
      ],
    );
  }

  Widget _icon(String icon, String label, Callback onTap) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.5.h),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 12.w,
          child: Column(
            children: [
              SvgPicture.asset(icon, height: 32.px),
              SizedBox(height: .6.h),
              Text(label,
                  style:
                      AppTextStyles.whiteRegularStyle.copyWith(fontSize: 14.sp),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ),
    );
  }
}
