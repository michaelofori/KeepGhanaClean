import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keepghanaclean/model/post_model.dart';
import 'package:keepghanaclean/pages/post_details.dart';
import 'package:keepghanaclean/services/database_services.dart';

class PostTile extends StatelessWidget {
  final PostModel post;
  const PostTile({required this.post, super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PostDetails(post: post)));
      },
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              post.userId == FirebaseAuth.instance.currentUser!.uid
                  ? Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey, width: 0.5)),
                        child: IconButton(
                          visualDensity: VisualDensity.compact,
                          icon: const Icon(Icons.close),
                          onPressed: () async {
                            await DatabaseService.deletePost(post);
                          },
                        ),
                      ),
                    )
                  : SizedBox.fromSize(
                      size: Size.zero,
                    ),
              Image.network(
                post.imageUrl,
                height: 70,
                width: 150,
                fit: BoxFit.fill,
              ),
              LikeCount(post.postId!),
              RichText(
                text: TextSpan(
                    text: "${post.username}  ",
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: [
                      TextSpan(
                        text: post.comment, //TODO get max count
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ]),
              ),
              const Divider(
                height: 16,
                thickness: 5,
                color: Color.fromARGB(255, 51, 76, 122),
              ),
              const Text(
                "Comments ...",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LikeCount extends StatefulWidget {
  final String postId;
  const LikeCount(this.postId, {super.key});

  @override
  State<LikeCount> createState() => _LikeCountState();
}

class _LikeCountState extends State<LikeCount> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      initialData: 0,
      stream: DatabaseService.getPostLikeCount(widget.postId),
      // future: DatabaseService.getPostLikeCount(widget.postId),
      builder: (context, snapshot) => Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.heart_broken,
              color: Colors.pink,
            ),
            onPressed: () async {
              await DatabaseService.likePost(
                      postId: widget.postId,
                      userId: FirebaseAuth.instance.currentUser!.uid)
                  .then(
                (value) => setState(() {}),
              );
            },
          ),
          Text(snapshot.data!.toString())
        ],
      ),
    );
  }
}
