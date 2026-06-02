import 'package:cooklkeme/app/modules/home/model/comments_model.dart';
import 'package:cooklkeme/core/theme/app_colors.dart';
import 'package:cooklkeme/core/theme/app_text_styles.dart';
import 'package:cooklkeme/core/widgets/get_horizontal_space.dart';
import 'package:cooklkeme/core/widgets/get_vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CommentItem extends StatelessWidget {
  final CommentModel comment;
  final VoidCallback onLike;

  const CommentItem({super.key,
    required this.comment,
    required this.onLike,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.px,
        vertical: 8.px,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 28.px,
            backgroundImage: AssetImage(comment.userAvatar),
          ),

          getHorizontalSpace(width: 3.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(comment.userName,
                    style: AppTextStyles.whiteRegularStyle.copyWith(
                      fontSize: 14.px
                    ),
                    overflow: TextOverflow.ellipsis),

                Text(comment.commentText,
                    style: AppTextStyles.hintStyle.copyWith(
                        fontSize: 14.px
                    ),
                    overflow: TextOverflow.ellipsis),

                Text(comment.timeAgo , style: AppTextStyles.whiteRegularStyle.copyWith(
                fontSize: 14.px
                ),),
              ],
            ),
          ),
          getHorizontalSpace(width: 5.w),

          Column(
            children: [
              GestureDetector(
                onTap: onLike,
                child: SvgPicture.asset(
                  comment.isLiked
                      ? "assets/icons/like.svg"
                      : "assets/icons/heart.svg",
                  height: comment.isLiked ? 26.px : 30.px,
                  colorFilter: ColorFilter.mode(
                    comment.isLiked
                        ? AppColors.secondaryColor
                        : AppColors.whiteColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),

              getVerticalSpace(height: .1.h),

              Text(comment.likes.toString(),
                style: AppTextStyles.whiteRegularStyle.copyWith(
                    fontSize: 14.px
                ),),
            ],
          ),
        ],
      ),
    );
  }
}