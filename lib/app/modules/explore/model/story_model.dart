class StoryModel {
  final String image;
  final String userName;
  final bool isAddStory;

  StoryModel({
    required this.image,
    required this.userName,
    this.isAddStory = false,
  });
}