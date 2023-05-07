import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:keepghanaclean/model/post_comment_model.dart';
import 'package:keepghanaclean/model/post_model.dart';

class DatabaseService{

  static FirebaseFirestore fire = FirebaseFirestore.instance;
  
  static FirebaseStorage storage = FirebaseStorage.instance;
 
 
  static Future<void> createPost(PostModel post) async{

    DocumentReference<Map<String, dynamic>> doc = fire.collection("posts").doc();
    post.postId = doc.id;

    await doc.set(post.toJson());

  }

  static Future<void> deletePost(PostModel postmodel) async {
    String postId = postmodel.postId!;
    DocumentReference<Map<String, dynamic>> post = fire.collection("posts").doc(postId);
    QuerySnapshot<Map<String, dynamic>> comments = await fire.collection("posts_comments").where("postId", isEqualTo: postId).get();
    QuerySnapshot<Map<String, dynamic>> likes = await fire.collection("posts_likes").where("postId", isEqualTo: postId).get();

    //delete post
    post.delete();
    //delete media
    storage.refFromURL(postmodel.imageUrl).delete();
    //delete comments
    comments.docs.forEach((element) {element.reference.delete();}); 
    //delete likes
    likes.docs.forEach((element) {element.reference.delete();}); 

  }

  static Future<List<PostModel>> getPosts() async{
    List<PostModel> posts = [];

    QuerySnapshot<Map<String, dynamic>> results = await fire.collection("posts").orderBy("createdAt").get();
    for (var element in results.docs) { 
      
      posts.add(PostModel.fromJson(element.data()));
    }
  
    return posts;
    

  }

  static Future<List<PostCommentModel>> getPostComments(String postId) async {
    List<PostCommentModel> comments = [];
    QuerySnapshot<Map<String, dynamic>> results = await fire.collection("post_comments").where("postId",isEqualTo: postId).get();

    for (QueryDocumentSnapshot<Map<String,dynamic>> element in results.docs){
      comments.add(PostCommentModel.fromJson(element.data()));
    }

    return comments;
  }

  static Future<void> createPostComment(PostCommentModel comment) async {

    DocumentReference<Map<String, dynamic>> doc = fire.collection("posts").doc();
    comment.postId = doc.id;

    await doc.set(comment.toJson());
  }

  static Stream<int> getPostLikeCount(String postId)  async *{
    Stream<QuerySnapshot<Map<String, dynamic>>> doc =  fire.collection("post_likes").where("postId", isEqualTo: postId).snapshots();
    int length = 0;
    doc.listen( (snap)async{
      length = snap.docs.length;

    }
    );
    yield length;

  }
 
  static Future<void> likePost({required String postId, required String userId}) async{
    Query<Map<String, dynamic>> like =  fire.collection("post_likes").where('postId', isEqualTo: postId).where("userId", isEqualTo: userId);

    if ((await like.count().get()).count == 1){
      //User has already liked the post
      await (await like.get()).docs.first.reference.delete();
       // print("likes00 - deleted like");

    } else {
      //Record a new like
     await fire.collection("post_likes").doc().set({"postId" : postId, "userId" : userId});

        //print("likes00 - new like");
      }
   // print("likes00");

  }

  static Future<bool> isPostLiked({required String postId, required String userId}) async {
    QuerySnapshot<Map<String, dynamic>> doc = await fire.collection("post_likes").where("postId", isEqualTo: postId).where("userId", isEqualTo: userId).limit(1).get();
    return doc.size ==1;
  }


  static Future<void> getUserMetrics(String userId) async {}

  static Future<void> getUserMetricHistory(String userId) async{}

  static Future<void> getRecycleSites() async{}

  static Future<void> getLeaderboard() async {}

  static Future<String> uploadImage(File file) async {
    TaskSnapshot result = await storage.ref("userId/image/${file.hashCode}").putFile(file);
    return result.ref.getDownloadURL();
  }



}