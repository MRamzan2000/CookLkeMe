import 'package:cooklkeme/app/modules/explore/model/story_model.dart';
import 'package:cooklkeme/core/theme/app_colors.dart';
import 'package:cooklkeme/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StoryItemWidget extends StatelessWidget {
  final StoryModel model;
  final VoidCallback onTap;

  const StoryItemWidget({
    super.key,
    required this.model,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          SizedBox(
            width: 16.w,
            child: Stack(
              clipBehavior: Clip.none,
              children: [

                /// STORY BORDER
                Container(
                  padding: EdgeInsets.all(1.8.px),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:model.isAddStory?Border.all(color: Colors.transparent): Border.all(
                      color: AppColors.secondaryColor,
                      width: 1.px,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 28.px,
                    backgroundColor: Colors.grey.shade900,
                    backgroundImage: AssetImage(model.image),
                  ),
                ),

                /// ADD STORY BUTTON
                if (model.isAddStory)
                  Positioned(
                    right: 2,
                    bottom: 6,
                    child: SvgPicture.asset("assets/icons/add_story.svg",width: 24.px,)
                  ),
              ],
            ),
          ),

          SizedBox(height: 0.8.h),

          SizedBox(
            width: 16.w,
            child: Text(
              model.userName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppTextStyles.addStoryTextStyle
          ),)
        ],
      ),
    );
  }
}