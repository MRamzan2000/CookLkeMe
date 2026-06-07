import 'package:cooklkeme/app/modules/home/model/comments_model.dart';
import 'package:get/get.dart';

class CommentsController extends GetxController {

  final List<CommentModel> dummyCommentList = [];

  @override
  void onInit() {
    super.onInit();
    _loadDummyData();
  }

  void _loadDummyData() {
    dummyCommentList.addAll([
      CommentModel(
        id: "1",
        userId: "u1",
        userName: "Cody Fisher",
        userAvatar: "assets/images/avatar1.png",
        isLiked: true,
        likes: 225,
        commentText: "I don't have personal preferences, but I can help you",
        timeAgo: "Now",
      ),
      CommentModel(
        id: "2",
        userId: "u2",
        userName: "Jenny Wilson",
        userAvatar: "assets/images/avatar2.png",
        isLiked: true,
        likes: 225,
        commentText: "How does photosynthesis work?",
        timeAgo: "08:20 pm",
      ),
      CommentModel(
        id: "3",
        userId: "u3",
        userName: "Kristin Watson",
        userAvatar: "assets/images/avatar3.png",
        isLiked: false,
        likes: 0,
        commentText: "What's the weather like today?",
        timeAgo: "05:36 pm",
      ),
    ]);

    update(); // 👈 lightweight rebuild
  }

  void toggleLike(int index) {
    final item = dummyCommentList[index];

    dummyCommentList[index] = item.copyWith(
      isLiked: !item.isLiked,
      likes: item.isLiked ? item.likes - 1 : item.likes + 1,
    );

    update(); // only rebuild list
  }
}