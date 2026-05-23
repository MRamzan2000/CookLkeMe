import 'dart:typed_data';

import 'package:cooklkeme/app/modules/post/controller/post_preview_controller.dart';
import 'package:cooklkeme/core/theme/app_colors.dart';
import 'package:cooklkeme/core/widgets/get_vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoTrimmerWidget extends StatefulWidget {
  final String tag;

  const VideoTrimmerWidget({super.key, required this.tag});

  @override
  State<VideoTrimmerWidget> createState() => _VideoTrimmerWidgetState();
}

class _VideoTrimmerWidgetState extends State<VideoTrimmerWidget> {
  final List<Uint8List?> _thumbnails = [];
  static const int _thumbCount = 11;
  bool _thumbsLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadThumbnails();
  }

  Future<void> _loadThumbnails() async {
    final ctrl =
    Get.find<PostPreviewController>(tag: widget.tag);

    // Wait until duration is known
    while (ctrl.totalDuration.value.inMilliseconds == 0) {
      await Future.delayed(const Duration(milliseconds: 100));
    }

    final durMs = ctrl.totalDuration.value.inMilliseconds;
    final thumbs = <Uint8List?>[];

    for (int i = 0; i < _thumbCount; i++) {
      final timeMs = (i / (_thumbCount - 1) * durMs).toInt();
      try {
        final bytes = await VideoThumbnail.thumbnailData(
          video: ctrl.videoPath,
          imageFormat: ImageFormat.JPEG,
          timeMs: timeMs,
          quality: 50,
        );
        thumbs.add(bytes);
      } catch (_) {
        thumbs.add(null);
      }
    }

    if (mounted) {
      setState(() {
        _thumbnails
          ..clear()
          ..addAll(thumbs);
        _thumbsLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ctrl =
    Get.find<PostPreviewController>(tag: widget.tag);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 60.px,
          child: LayoutBuilder(builder: (ctx, constraints) {
            final totalW = constraints.maxWidth;

            return Stack(
              children: [
                // Thumbnail strip
                Row(
                  children: List.generate(_thumbCount, (i) {
                    if (!_thumbsLoaded || i >= _thumbnails.length) {
                      return Expanded(
                          child: Container(
                              color: Colors.grey[850],
                              margin: const EdgeInsets.all(1)));
                    }
                    final bytes = _thumbnails[i];
                    return Expanded(
                      child: bytes != null
                          ? Image.memory(bytes,
                          fit: BoxFit.cover,
                          gaplessPlayback: true)
                          : Container(color: Colors.grey[850]),
                    );
                  }),
                ),

                // Orange border overlay for selected range
                Obx(() {
                  final start = ctrl.trimStart.value;
                  final end = ctrl.trimEnd.value;
                  return Positioned(
                    left: start * totalW,
                    width: (end - start) * totalW,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color:AppColors.secondaryColor, width: 2.5),
                      ),
                    ),
                  );
                }),




                // Start drag handle
                Obx(() => Positioned(
                  left: ctrl.trimStart.value * totalW - 10,
                  top: 0,
                  bottom: 0,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onHorizontalDragUpdate: (d) {
                      final delta = d.delta.dx / totalW;
                      ctrl.updateTrimStart(
                          ctrl.trimStart.value + delta);
                    },
                    child: Container(
                      width: 30.px,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(4.px),
                      ),
                      child: Icon(Icons.drag_handle,
                          color: AppColors.whiteColor, size: 12.px),
                    ),
                  ),
                )),

                // End drag handle
                Obx(() => Positioned(
                  left: ctrl.trimEnd.value * totalW - 10,
                  top: 0,
                  bottom: 0,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onHorizontalDragUpdate: (d) {
                      final delta = d.delta.dx / totalW;
                      ctrl.updateTrimEnd(
                          ctrl.trimEnd.value + delta);
                    },
                    child: Container(
                      width: 30.px,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(4.px),
                      ),
                      child:  Icon(Icons.drag_handle,
                          color: AppColors.whiteColor, size: 12.px),
                    ),
                  ),
                )),
              ],
            );
          }),
        ),


        getVerticalSpace(height: 12.px),
        Obx(() => Text(
          '${ctrl.formatDuration(ctrl.trimStartDuration)}  –  ${ctrl.formatDuration(ctrl.trimEndDuration)}',
          style: TextStyle(
              color: AppColors.secondaryColor,
              fontSize: 13.px,
              fontWeight: FontWeight.w600),
        )),
      ],
    );
  }
}