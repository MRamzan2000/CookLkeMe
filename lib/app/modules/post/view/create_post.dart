import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:cooklkeme/app/modules/post/controller/create_post_controller.dart';
import 'package:cooklkeme/app/modules/post/widgets/camera_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePost extends StatelessWidget {
  const CreatePost({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(CreatePostController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: CameraAwesomeBuilder.awesome(
        previewPadding: EdgeInsets.zero,
        previewFit: CameraPreviewFit.cover,
        saveConfig: SaveConfig.photoAndVideo(
          initialCaptureMode: CaptureMode.video,
          videoOptions: VideoOptions(
            enableAudio: true,
            android: AndroidVideoOptions(
              bitrate: 6000000,
              fallbackStrategy: QualityFallbackStrategy.lower,
            ),
          ),
          photoPathBuilder: (sensors) async =>
              SingleCaptureRequest(await ctrl.getVideoPath(), sensors.first),
          videoPathBuilder: (sensors) async =>
              SingleCaptureRequest(await ctrl.getVideoPath(), sensors.first),
        ),
        sensorConfig: SensorConfig.single(
          sensor: Sensor.position(SensorPosition.back),
          flashMode: FlashMode.auto,
          aspectRatio: CameraAspectRatios.ratio_16_9,
        ),
        enablePhysicalButton: false,
        availableFilters: awesomePresetFiltersList,
        onMediaCaptureEvent: ctrl.onMediaCaptured,
        bottomActionsBuilder: (state) =>
            CameraBottomBar(state: state, ctrl: ctrl),


      ),
    );
  }
}