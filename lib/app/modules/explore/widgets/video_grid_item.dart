import 'package:cooklkeme/app/modules/explore/controller/explore_controller.dart';
import 'package:cooklkeme/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoGridItem extends StatefulWidget {

  final String videoPath;
  final int index;

  const VideoGridItem({
    super.key,
    required this.videoPath,
    required this.index,
  });

  @override
  State<VideoGridItem> createState() =>
      _VideoGridItemState();
}

class _VideoGridItemState
    extends State<VideoGridItem>
    with AutomaticKeepAliveClientMixin {

  VideoPlayerController? _controller;

  final ExploreController exploreController =
  Get.find<ExploreController>();

  bool _isInitialized = false;

  @override
  bool get wantKeepAlive => true;

  Future<void> _initializeVideo() async {

    if (_controller != null) return;

    _controller = VideoPlayerController.asset(
      widget.videoPath,
    );

    await _controller!.initialize();

    await _controller!.setLooping(true);

    await _controller!.setVolume(0);

    _isInitialized = true;

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _playVideo() async {

    await _initializeVideo();

    if (!_controller!.value.isPlaying) {
      await _controller!.play();
    }
  }

  Future<void> _pauseVideo() async {

    if (_controller == null) return;

    if (_controller!.value.isPlaying) {
      await _controller!.pause();
    }
  }

  @override
  void dispose() {

    _controller?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return VisibilityDetector(

      key: Key('video-${widget.index}'),

      onVisibilityChanged: (info) async {

        final visiblePercentage =
            info.visibleFraction * 100;

        if (visiblePercentage > 70) {

          exploreController
              .setPlayingIndex(widget.index);

          await _playVideo();

        } else {

          await _pauseVideo();
        }
      },

      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.px),

        child: Container(
          color: Colors.black,

          child: _isInitialized
              ? Stack(
            fit: StackFit.expand,
            children: [

              FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller!
                      .value
                      .size
                      .width,

                  height: _controller!
                      .value
                      .size
                      .height,

                  child: VideoPlayer(
                    _controller!,
                  ),
                ),
              ),

              Positioned(
                bottom: 8.px,
                right: 8.px,
                child: Icon(
                  Icons.play_arrow,
                  color: AppColors.whiteColor,
                  size: 16.px,
                ),
              ),
            ],
          )
              : const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}