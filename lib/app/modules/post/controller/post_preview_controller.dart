import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class PostPreviewController extends GetxController
    with WidgetsBindingObserver {
  final String videoPath;

  PostPreviewController({required this.videoPath});

  late VideoPlayerController videoController;

  final isInitialized = false.obs;
  final isPlaying = false.obs;
  final isMuted = false.obs;
  final isLoading = true.obs;

  final currentPosition = Duration.zero.obs;
  final totalDuration = Duration.zero.obs;

  /// Normalised values
  final trimStart = 0.0.obs;
  final trimEnd = 1.0.obs;

  /// Whether the trimmer row is visible
  final showTrimmer = false.obs;

  /// Cumulative CW quarter-turns (0-3)
  final rotationQuarterTurns = 0.obs;

  /// Crop aspect ratio: null = free, else width/height
  final cropAspectRatio = Rxn<double>();

  Timer? _positionTimer;
  bool _disposed = false;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    _initializeVideo();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_disposed || !videoController.value.isInitialized) return;
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      videoController.pause();
    } else if (state == AppLifecycleState.resumed && isPlaying.value) {
      videoController.play();
    }
  }

  @override
  void onClose() {
    _disposed = true;
    WidgetsBinding.instance.removeObserver(this);
    _cancelTimer();
    videoController.removeListener(_videoListener);
    videoController.dispose();
    super.onClose();
  }

  Future<void> _initializeVideo() async {
    try {
      isLoading.value = true;
      videoController = VideoPlayerController.file(File(videoPath));
      await videoController.initialize();
      if (_disposed) return;
      totalDuration.value = videoController.value.duration;
      await videoController.setLooping(true);
      await videoController.play();
      isPlaying.value = true;
      isInitialized.value = true;
      videoController.addListener(_videoListener);
      _startPositionTimer();
    } catch (_) {
      if (!_disposed) {
        Get.snackbar('Error', 'Failed to initialize video',
            snackPosition: SnackPosition.BOTTOM);
      }
    } finally {
      if (!_disposed) isLoading.value = false;
    }
  }

  void _videoListener() {
    if (_disposed || !videoController.value.isInitialized) return;
    isPlaying.value = videoController.value.isPlaying;
  }

  void _startPositionTimer() {
    _cancelTimer();
    _positionTimer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      if (_disposed || !videoController.value.isInitialized) return;

      final pos = videoController.value.position;
      currentPosition.value = pos;

      // Auto-loop within trim window
      final dur = totalDuration.value;
      if (dur.inMilliseconds > 0) {
        final endMs = (trimEnd.value * dur.inMilliseconds).toInt();
        final startMs = (trimStart.value * dur.inMilliseconds).toInt();
        if (pos.inMilliseconds >= endMs) {
          videoController.seekTo(Duration(milliseconds: startMs));
        }
      }
    });
  }

  void _cancelTimer() {
    _positionTimer?.cancel();
    _positionTimer = null;
  }

  Future<void> togglePlayPause() async {
    if (!videoController.value.isInitialized) return;
    if (videoController.value.isPlaying) {
      await videoController.pause();
    } else {
      await videoController.play();
    }
  }

  Future<void> toggleMute() async {
    isMuted.toggle();
    await videoController.setVolume(isMuted.value ? 0 : 1);
  }

  Future<void> seekTo(Duration position) async {
    if (!videoController.value.isInitialized) return;
    await videoController.seekTo(position);
  }

  Future<void> seekByFraction(double fraction) async {
    if (totalDuration.value.inMilliseconds == 0) return;
    final ms = (fraction * totalDuration.value.inMilliseconds).toInt();
    await seekTo(Duration(milliseconds: ms));
  }

  void toggleTrimmer() => showTrimmer.toggle();

  void updateTrimStart(double value) {
    if (value < 0) value = 0;
    if (value >= trimEnd.value - 0.05) return;
    trimStart.value = value;
    seekByFraction(value);
  }

  void updateTrimEnd(double value) {
    if (value > 1) value = 1;
    if (value <= trimStart.value + 0.05) return;
    trimEnd.value = value;
  }

  Duration get trimStartDuration {
    return Duration(
        milliseconds:
        (trimStart.value * totalDuration.value.inMilliseconds).toInt());
  }

  Duration get trimEndDuration {
    return Duration(
        milliseconds:
        (trimEnd.value * totalDuration.value.inMilliseconds).toInt());
  }
  void rotateLeft() =>
      rotationQuarterTurns.value = (rotationQuarterTurns.value - 1) % 4;

  void rotateRight() =>
      rotationQuarterTurns.value = (rotationQuarterTurns.value + 1) % 4;

  void setCropRatio(double? ratio) => cropAspectRatio.value = ratio;

  String formatDuration(Duration d) {
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  double get positionFraction {
    if (totalDuration.value.inMilliseconds == 0) return 0;
    return currentPosition.value.inMilliseconds /
        totalDuration.value.inMilliseconds;
  }
}