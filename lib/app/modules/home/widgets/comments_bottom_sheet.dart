import 'package:cooklkeme/app/modules/home/controller/comments_controller.dart';
import 'package:cooklkeme/core/theme/app_colors.dart';
import 'package:cooklkeme/core/theme/app_text_styles.dart';
import 'package:cooklkeme/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'comment_item.dart';
class CommentsBottomSheet extends StatelessWidget {
  CommentsBottomSheet({super.key});

  final controller = Get.put(CommentsController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.45,
      minChildSize: 0.4,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.backGroundColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(40.px),
            ),
          ),
          child: Column(
            children: [
              // drag handle (same)
              Container(
                margin: EdgeInsets.only(top: 1.4.h),
                width: 25.w,
                height: .4.h,
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              // title (same)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Comments (8596)",
                  style: AppTextStyles.whiteRegularStyle,
                ),
              ),

              // LIST (OPTIMIZED)
              Expanded(
                child: GetBuilder<CommentsController>(
                  builder: (controller) {
                    return ListView.builder(
                      controller: scrollController,
                      padding: EdgeInsets.zero,
                      itemCount: controller.dummyCommentList.length,
                      itemBuilder: (context, index) {
                        final comment =
                        controller.dummyCommentList[index];

                        return CommentItem(
                          comment: comment,
                          onLike: () => controller.toggleLike(index),
                        );
                      },
                    );
                  },
                ),
              ),

              // input (same UI)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.px,
                  vertical: 30.px,
                ),
                child: CustomTextField(
                  hintText: "Type your message ",
                  suffixIcon: "assets/icons/send_message.svg",
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}