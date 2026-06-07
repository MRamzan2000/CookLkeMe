import 'package:cooklkeme/app/modules/home/services/video_manager_service.dart';
import 'package:cooklkeme/app/modules/home/widgets/comments_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'comments_controller.dart';

class FeedController extends GetxController {
  final VideoManagerService manager = Get.put(VideoManagerService());

  final List<String> videos = [
    "assets/videos/intro.mp4",

  ];

  int currentIndex = 0;

  @override
  void onInit() {
    super.onInit();
    loadInitial(0);
  }

  void loadInitial(int index) async {
    currentIndex = index;

    await manager.load(videos[index]);
    await manager.load(videos[index + 1]);

    manager.get(videos[index])?.play();

    update();
  }

  void onPageChanged(int index) async {
    currentIndex = index;

    await manager.load(videos[index]);
    manager.get(videos[index])?.play();

    manager.pauseAllExcept(videos[index]);

    // preload next
    if (index + 1 < videos.length) {
      manager.load(videos[index + 1]);
    }

    // cleanup memory
    manager.disposeFar([
      videos[index],
      if (index + 1 < videos.length) videos[index + 1],
      if (index - 1 >= 0) videos[index - 1],
    ]);

    update();
  }

  VideoPlayerController? getController(int index) {
    return manager.get(videos[index]);
  }

  void showComments() {
    Get.put(CommentsController());
    Get.bottomSheet(
      CommentsBottomSheet(),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }
}