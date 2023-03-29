

class PostModel{
  String imageUrl;
  String? postId;
  String comment;
  String userId;
  String username;
  DateTime createdAt;


  PostModel({
    required this.userId,
    required this.username,
    required this.comment,
    required this.imageUrl,
    required this.createdAt,
    this.postId
  });

  Map<String,dynamic> toJson() => {
    "userId": userId,
    "postId": postId!,
    "username": username,
    "comment": comment,
    "imageUrl": imageUrl,
    "createdAt": createdAt.toIso8601String(),
  };



  factory PostModel.fromJson(Map<String,dynamic> map) => PostModel(
    userId: map["userId"],
    username: map["username"],
    imageUrl: map["imageUrl"],
    createdAt: DateTime.parse( map["createdAt"]),
    comment: map["comment"],
    postId: map["postId"]!
  );
}