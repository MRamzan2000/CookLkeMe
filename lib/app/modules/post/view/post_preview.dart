import 'package:cooklkeme/app/modules/post/controller/post_preview_controller.dart';
import 'package:cooklkeme/app/modules/post/view/publish_post.dart';
import 'package:cooklkeme/app/modules/post/widgets/post_preview_toolbar.dart';
import 'package:cooklkeme/app/modules/post/widgets/preview_video_player.dart';
import 'package:cooklkeme/app/modules/post/widgets/video_trimmer_widget.dart';
import 'package:cooklkeme/core/theme/app_colors.dart';
import 'package:cooklkeme/core/theme/app_text_styles.dart';
import 'package:cooklkeme/core/widgets/get_vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PostPreviewScreen extends StatefulWidget {

  final String videoPath;

  const PostPreviewScreen({super.key, required this.videoPath});

  @override
  State<PostPreviewScreen> createState() => _PostPreviewScreenState();
}

class _PostPreviewScreenState extends State<PostPreviewScreen> {
  late final PostPreviewController ctrl;

  @override
  void initState() {
    super.initState();
    ctrl = Get.put(
      PostPreviewController(videoPath: widget.videoPath),
      tag: widget.videoPath,
    );
  }

  @override
  void dispose() {
    if (Get.isRegistered<PostPreviewController>(tag: widget.videoPath)) {
      Get.delete<PostPreviewController>(tag: widget.videoPath);
    }
    super.dispose();
  }
  Widget _buildTopBar() {
    return Padding(
      padding: EdgeInsets.only(top: 14.px, bottom: 20.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
           Get.back();
            },
            child: SvgPicture.asset("assets/icons/arrow_back_ios_new.svg",height: 28.px,)
          ),

          // Next
          GestureDetector(
            onTap: () {
              ctrl.togglePlayPause(false);
              Get.to(() => PublishPost(tag: widget.videoPath ,));
            },
            child: Text(
              'Next',
              style: AppTextStyles.semiBoldStyle.copyWith(
                color: AppColors.secondaryColor,
                fontSize: 18.px,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          color: AppColors.backGroundColor,
          padding: EdgeInsets.symmetric(horizontal: 24.px),
          child: Column(
            children: [
              _buildTopBar(),
              Expanded(
                child: PreviewVideoPlayer(tag: widget.videoPath),
              ),

              getVerticalSpace(height: 12.px),
              Obx(() {
                if (!ctrl.showTrimmer.value) {
                  return const SizedBox.shrink();
                }
                return Padding(
                  padding: EdgeInsets.only(bottom: 14.px),
                  child: VideoTrimmerWidget(tag: widget.videoPath),
                );
              }),
              PostPreviewToolbar(tag: widget.videoPath),
              getVerticalSpace(height: 16.px),
            ],
          ),
        ),
      ),
    );
  }
}