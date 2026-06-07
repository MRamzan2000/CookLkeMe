import 'package:cooklkeme/app/modules/post/controller/post_preview_controller.dart';
import 'package:cooklkeme/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class PreviewVideoPlayer extends StatelessWidget {
  final String tag;

  const PreviewVideoPlayer({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<PostPreviewController>(tag: tag);

    return Obx(() {
      if (ctrl.isLoading.value) {
        return  Center(
          child: CircularProgressIndicator(color: AppColors.secondaryColor),
        );
      }

      if (!ctrl.isInitialized.value) {
        return const Center(
          child: Text('Video not available',
              style: TextStyle(color: Colors.white)),
        );
      }

      final videoSize = ctrl.videoController.value.size;
      final isVertical = videoSize.height > videoSize.width;

      return GestureDetector(
        onTap: (){
          ctrl.togglePlayPause(true);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Obx(() {
              return RotatedBox(
                quarterTurns: ctrl.rotationQuarterTurns.value,
                child: ctrl.cropAspectRatio.value != null
                    ? AspectRatio(
                  aspectRatio: ctrl.cropAspectRatio.value!,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: videoSize.width,
                      height: videoSize.height,
                      child:
                      VideoPlayer(ctrl.videoController),
                    ),
                  ),
                )
                    : AspectRatio(
                  aspectRatio: isVertical
                      ? videoSize.width / videoSize.height
                      : videoSize.width / videoSize.height,
                  child: VideoPlayer(ctrl.videoController),
                ),
              );
            }),

            Obx(() => AnimatedOpacity(
              opacity: ctrl.isPlaying.value ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.55),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.play_arrow_rounded,
                    color: Colors.white, size: 38),
              ),
            )),
          ],
        ),
      );
    });
  }
}