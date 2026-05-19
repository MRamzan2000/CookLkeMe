import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoManagerService extends GetxService {
  final Map<String, VideoPlayerController> _cache = {};

  Future<VideoPlayerController> load(String assetPath) async {
    if (_cache.containsKey(assetPath)) {
      return _cache[assetPath]!;
    }

    final controller = VideoPlayerController.asset(assetPath);
    await controller.initialize();
    controller.setLooping(true);

    _cache[assetPath] = controller;
    return controller;
  }

  VideoPlayerController? get(String assetPath) {
    return _cache[assetPath];
  }

  void pauseAllExcept(String active) {
    for (final entry in _cache.entries) {
      if (entry.key != active) {
        entry.value.pause();
      }
    }
  }

  void disposeFar(List<String> activeKeys) {
    final keys = _cache.keys.toList();

    for (final key in keys) {
      if (!activeKeys.contains(key)) {
        _cache[key]?.dispose();
        _cache.remove(key);
      }
    }
  }

  @override
  void onClose() {
    for (final c in _cache.values) {
      c.dispose();
    }
    super.onClose();
  }
}