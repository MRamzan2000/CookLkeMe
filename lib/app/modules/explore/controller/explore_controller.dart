import 'package:cooklkeme/app/modules/explore/model/story_model.dart';
import 'package:get/get.dart';

class ExploreController extends GetxController {

  final RxList<StoryModel> storyList = <StoryModel>[
    StoryModel(
      image: "assets/images/story.png",
      userName: "Add story",
      isAddStory: true,
    ),
    StoryModel(
      image: "assets/images/user1.jpeg",
      userName: "Jane",
    ),
    StoryModel(
      image: "assets/images/user2.jpeg",
      userName: "Lily",
    ),
    StoryModel(
      image: "assets/images/user3.jpeg",
      userName: "Claire",
    ),
    StoryModel(
      image: "assets/images/user4.jpeg",
      userName: "Esther",
    ),
    StoryModel(
      image: "assets/images/user5.jpeg",
      userName: "Julie",
    ),
  ].obs;
  final RxInt playingIndex = (-1).obs;

  final List<String> videos = [
    "assets/videos/intro.mp4",
    "assets/videos/sample1.mp4",
    "assets/videos/sample2.mp4",
    "assets/videos/sample3.mp4",
  ];

  void setPlayingIndex(int index) {
    if (playingIndex.value == index) return;
    playingIndex.value = index;
  }

}