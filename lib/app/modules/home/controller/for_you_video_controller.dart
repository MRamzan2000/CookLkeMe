import 'package:get/get.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class ForYouVideoController extends GetxController {
  final Player player = Player();
  late final VideoController videoController;

  @override
  void onInit() {
    super.onInit();
    videoController = VideoController(player);

    loadAssetVideo('assets/videos/intro.mp4');
  }

  void loadAssetVideo(String path) async {
    final uri = 'asset:///$path';
    await player.open(Media(uri));
    player.play();
  }

  void changeAssetVideo(String path) async {
    final uri = 'asset:///$path';
    await player.pause();
    await player.open(Media(uri));
    player.play();
  }

  @override
  void onClose() {
    player.dispose();
    super.onClose();
  }
}