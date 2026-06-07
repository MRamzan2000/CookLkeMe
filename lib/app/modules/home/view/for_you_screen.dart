import 'package:cooklkeme/app/modules/home/controller/feed_controller.dart';
import 'package:cooklkeme/app/modules/home/widgets/user_info_bar.dart';
import 'package:cooklkeme/app/modules/home/widgets/video_action_column.dart';
import 'package:cooklkeme/core/widgets/video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForYouScreen extends StatelessWidget {
  ForYouScreen({super.key});

  final controller = Get.put(FeedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<FeedController>(
        builder: (ctrl) {
          return PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: ctrl.videos.length,
            onPageChanged: ctrl.onPageChanged,
            itemBuilder: (context, index) {
              final video = ctrl.getController(index);

              if (video == null || !video.value.isInitialized) {
                return const Center(child: CircularProgressIndicator());
              }

              return Stack(
                fit: StackFit.expand,
                children: [
                  VideoPlayerWidget(controller: video),

                  GestureDetector(
                    onTap: () {
                      video.value.isPlaying ? video.pause() : video.play();
                      ctrl.update();
                    },
                  ),

                   VideoActionColumn(),

                   UserInfoBar(),
                ],
              );
            },
          );
        },
      ),
    );
  }
}