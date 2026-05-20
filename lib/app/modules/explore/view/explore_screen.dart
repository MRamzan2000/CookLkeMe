import 'package:cooklkeme/app/modules/explore/controller/explore_controller.dart';
import 'package:cooklkeme/app/modules/explore/widgets/story_item.dart';
import 'package:cooklkeme/app/modules/explore/widgets/video_grid_item.dart';
import 'package:cooklkeme/core/theme/app_colors.dart';
import 'package:cooklkeme/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with AutomaticKeepAliveClientMixin {

  final ExploreController controller =
  Get.put(ExploreController());

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      backgroundColor: AppColors.primaryColor,

      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 20.px),
        backgroundColor: AppColors.primaryColor,
        leadingWidth: 12.w,
        centerTitle: true,

        leading: Padding(
          padding: EdgeInsets.only(left: 20.px),
          child: SvgPicture.asset(
            "assets/icons/watch.svg",
          ),
        ),

        title: Text(
          "Explore",
          style: AppTextStyles.appBarTitleStyle,
        ),

        actions: [
          Icon(
            Icons.search_rounded,
            size: 28.px,
            color: AppColors.whiteColor,
          ),
        ],

        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 12.h),
          child: SizedBox(
            height: 11.h,
            child: Obx(
                  () => ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: 18.px,
                ),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: controller.storyList.length,
                separatorBuilder: (_, __) =>
                    SizedBox(width: 2.w),
                itemBuilder: (context, index) {
                  final story =
                  controller.storyList[index];

                  return StoryItemWidget(
                    model: story,
                    onTap: () {},
                  );
                },
              ),
            ),
          ),
        ),
      ),

      body: GridView.builder(
        padding: EdgeInsets.only(top: 10.px),

        physics: const BouncingScrollPhysics(),

        cacheExtent: 400,

        itemCount: 30,

        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 4.2.px,
          crossAxisSpacing: 4.2.px,
          mainAxisExtent: 20.h,
        ),

        itemBuilder: (context, index) {

          final video =
          controller.videos[
          index % controller.videos.length];

          return VideoGridItem(
            index: index,
            videoPath: video,
          );
        },
      ),
    );
  }
}