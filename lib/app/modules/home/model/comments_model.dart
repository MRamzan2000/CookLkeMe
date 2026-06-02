class CommentModel {
  final String id;
  final String userId;
  final String userName;
  final String userAvatar;
  final String commentText;
  final String timeAgo;
  final int likes;
  final bool isLiked;
  final List<CommentModel>? replies;

  CommentModel({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userAvatar,
    required this.commentText,
    required this.timeAgo,
    this.likes = 0,
    this.isLiked = false,
    this.replies,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      userName: json['userName'] ?? '',
      userAvatar: json['userAvatar'] ?? '',
      commentText: json['commentText'] ?? '',
      timeAgo: json['timeAgo'] ?? '',
      likes: json['likes'] ?? 0,
      isLiked: json['isLiked'] ?? false,
      replies: json['replies'] != null
          ? (json['replies'] as List)
          .map((e) => CommentModel.fromJson(e))
          .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'userName': userName,
      'userAvatar': userAvatar,
      'commentText': commentText,
      'timeAgo': timeAgo,
      'likes': likes,
      'isLiked': isLiked,
      'replies': replies?.map((e) => e.toJson()).toList(),
    };
  }

  CommentModel copyWith({
    String? id,
    String? userId,
    String? userName,
    String? userAvatar,
    String? commentText,
    String? timeAgo,
    int? likes,
    bool? isLiked,
    List<CommentModel>? replies,
  }) {
    return CommentModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userAvatar: userAvatar ?? this.userAvatar,
      commentText: commentText ?? this.commentText,
      timeAgo: timeAgo ?? this.timeAgo,
      likes: likes ?? this.likes,
      isLiked: isLiked ?? this.isLiked,
      replies: replies ?? this.replies,
    );
  }
}