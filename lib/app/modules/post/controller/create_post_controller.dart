import 'dart:async';
import 'dart:io';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class CreatePostController extends GetxController {
  final isRecording = false.obs;
  final recordingSeconds = 0.obs;
  final currentFilter = Rx<AwesomeFilter>(AwesomeFilter.None);

  Timer? _timer;
  final _picker = ImagePicker();

  String get formattedTime {
    final m = recordingSeconds.value ~/ 60;
    final s = recordingSeconds.value % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  // ─── Camera Path ────────────────────────────────────────────────
  Future<String> getVideoPath() async {
    final dir = await getTemporaryDirectory();
    final folder = await Directory('${dir.path}/cooklkeme').create(recursive: true);
    return '${folder.path}/${DateTime.now().millisecondsSinceEpoch}.mp4';
  }

  // ─── Recording ──────────────────────────────────────────────────
  void toggleRecording(CameraState state) {
    final videoState = state.when(
      onPreparingCamera: (_) => null,
      onPhotoMode: (_) => null,
      onVideoMode: (s) => s,
      onVideoRecordingMode: (s) => s,
    );
    if (videoState == null) return;

    if (isRecording.value) {
      videoState.stopRecording();
      _stopTimer();
    } else {
      videoState.startRecording();
      _startTimer();
    }
  }

  void _startTimer() {
    recordingSeconds.value = 0;
    isRecording.value = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => recordingSeconds.value++);
  }

  void _stopTimer() {
    _timer?.cancel();
    isRecording.value = false;
    recordingSeconds.value = 0;
  }

  void applyFilter(CameraState state, AwesomeFilter filter) {
    currentFilter.value = filter;
    state.setFilter(filter);
    Get.back();
  }
  Future<void> pickFromGallery() async {
    final XFile? file = await _picker.pickVideo(source: ImageSource.gallery);
    if (file == null) return;
    _onVideoPicked(file.path);
  }

  void _onVideoPicked(String path) {
    // TODO: Get.to(() => PostPreviewScreen(videoPath: path));
  }

  void onMediaCaptured(MediaCapture event) {
    if (!event.isVideo) return;
    if (event.status == MediaCaptureStatus.success) {
      event.captureRequest.when(
        single: (single) {
          final path = single.file?.path;
          if (path != null) _onVideoPicked(path);
        },
        multiple: (_) {},
      );
    } else if (event.status == MediaCaptureStatus.failure) {
      Get.snackbar('Error', 'Video capture failed',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}