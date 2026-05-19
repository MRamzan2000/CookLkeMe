import 'package:cooklkeme/core/theme/app_colors.dart';
import 'package:cooklkeme/core/theme/app_text_styles.dart';
import 'package:cooklkeme/core/widgets/get_horizontal_space.dart';
import 'package:cooklkeme/core/widgets/get_vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserInfoBar extends StatelessWidget {
  const UserInfoBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.px),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30.px,
                backgroundColor: AppColors.secondaryColor,
                backgroundImage:
                AssetImage("assets/images/profile.png"),
              ),
              getHorizontalSpace(width: 10.px),
              Text(
                "Layla Mohsin",
                style: AppTextStyles.semiBoldStyle,
              ),
              getHorizontalSpace(width: 12.px),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  minimumSize:
                  const WidgetStatePropertyAll(Size(60, 25)),
                  padding:
                  const WidgetStatePropertyAll(EdgeInsets.zero),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      side: BorderSide(color: AppColors.whiteColor),
                      borderRadius: BorderRadius.circular(7.px),
                    ),
                  ),
                ),
                child: Text(
                    "Follow",
                    style: AppTextStyles.buttonStyle
                ),
              ),
            ],
          ),
          SizedBox(
            width: 75.w,
            child: Text(
              "Hi everyone, what's on your mind today? Let's share and connect!",
              style: AppTextStyles.semiBoldStyle,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          getVerticalSpace(height: 3.h)

        ],
      ),
    );
  }
}