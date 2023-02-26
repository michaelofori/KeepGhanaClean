class PostCommentModel{
  String userId;
  String? commentId;
  String postId;
  String userImageUrl;
  String comment;
  DateTime createdAt;


  PostCommentModel({
    required this.userId,
    required this.userImageUrl,
    required this.comment,
    required this.commentId,
    required this.postId,
    required this.createdAt,

  });

  Map<String,dynamic> toJson() => {
    "userId" : userId,
    "userImageUrl" : userImageUrl,
    "comment" : comment,
    "commentId" : commentId!,
    "postId" : postId,
    "createdAt" : createdAt.toIso8601String(),
  };

  factory PostCommentModel.fromJson(Map<String,dynamic> map) => PostCommentModel(
    userId: map["userId"], 
    userImageUrl: map["userImageUrl"], 
    comment: map["comment"],
     commentId: map["commentId"]!,
     postId: map["postId"], 
    createdAt: DateTime.parse( map["createdAt"])
    );

}