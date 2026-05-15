import 'package:cooklkeme/app/modules/home/controller/for_you_video_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_kit_video/media_kit_video.dart';
class FollowingScreen extends StatelessWidget {
  FollowingScreen({super.key});

  final ForYouVideoController controller =
  Get.put(ForYouVideoController());

  final List<String> videoAssets = [
    "assets/videos/intro.mp4",
    "assets/videos/sample1.mp4",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: videoAssets.length,
        onPageChanged: (index) {
          controller.changeAssetVideo(videoAssets[index]);
        },
        itemBuilder: (context, index) {
          return SizedBox.expand(
            child: Video(
              controller: controller.videoController,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}