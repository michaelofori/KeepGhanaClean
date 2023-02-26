
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

  static Future<void> getPostLikeCount() async {}

  static Future<void> getUserMetrics(String userId) async {}

  static Future<void> getUserMetricHistory(String userId) async{}

  static Future<void> getRecycleSites() async{}

  static Future<void> getLeaderboard() async {}

  static Future<String> uploadImage(File file) async {
    TaskSnapshot result = await storage.ref("userId/image").putFile(file);
    return result.ref.getDownloadURL();
  }



}