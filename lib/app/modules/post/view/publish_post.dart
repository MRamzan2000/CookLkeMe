import 'package:cooklkeme/app/modules/post/controller/post_preview_controller.dart';
import 'package:cooklkeme/app/modules/post/controller/publish_post_controller.dart';
import 'package:cooklkeme/core/theme/app_colors.dart';
import 'package:cooklkeme/core/theme/app_text_styles.dart';
import 'package:cooklkeme/core/widgets/custom_text_field.dart';
import 'package:cooklkeme/core/widgets/get_horizontal_space.dart';
import 'package:cooklkeme/core/widgets/get_vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:video_player/video_player.dart';

class PublishPost extends StatelessWidget {
  final String tag;

  PublishPost({super.key, required this.tag});
  final PublishPostController controller = PublishPostController();

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<PostPreviewController>(tag: tag);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.px),
            child: Column(
              children: [
                _buildTopBar(),
                getVerticalSpace(height: 30.px),
                Row(
                  children: [
                    Expanded(flex: 5,
                        child:  Container(
                          padding: EdgeInsets.all(10.px),
                          decoration: BoxDecoration(
                            color: AppColors.textFieldBgColor,
                            borderRadius: BorderRadius.circular(20.px),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Description",
                                style: AppTextStyles.whiteRegularStyle.copyWith(
                                  color: AppColors.secondaryColor,
                                  fontSize: 16.px,
                                ),
                              ),
                              CustomTextField(
                                controller: controller.descriptionController,
                                focusNode: controller.descriptionFocusNode,
                                maxLines: 4,
                                borderRadius: 0,
                                enabled: true,
                                enabledBorderColor: Colors.transparent,
                                focusedBorderColor: Colors.transparent,
                                fillColor: Colors.transparent,
                                contentPadding: EdgeInsets.zero,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: ValueListenableBuilder<TextEditingValue>(
                                  valueListenable:
                                  controller.descriptionController,
                                  builder: (context, value, child) {
                                    return Text(
                                      "${value.text.length}/100",
                                      style: AppTextStyles.whiteRegularStyle
                                          .copyWith(
                                        color: AppColors.secondaryColor,
                                        fontSize: 14.px,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        )),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 15.h,
                        margin: EdgeInsets.only(left: 12.px),
                        decoration: BoxDecoration(
                          color: AppColors.textFieldBgColor,
                          borderRadius: BorderRadius.circular(15.px),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: ctrl.videoController.value.isInitialized
                            ? Stack(
                          fit: StackFit.expand,
                          children: [

                            /// Video
                            FittedBox(
                              fit: BoxFit.cover,
                              child: SizedBox(
                                width: ctrl.videoController.value.size.width,
                                height: ctrl.videoController.value.size.height,
                                child: VideoPlayer(ctrl.videoController),
                              ),
                            ),


                          ],
                        )
                            : const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),

                  ],
                ),
                getVerticalSpace(height: 16.px),

              ],
            ),
          ),
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
            child: SvgPicture.asset(
              "assets/icons/arrow_back_ios_new.svg",
              height: 28.px,
            )),
        getHorizontalSpace(width: 30.px),

        // Next
        GestureDetector(
          onTap: () {},
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
