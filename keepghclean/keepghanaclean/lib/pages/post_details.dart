import 'package:flutter/material.dart';
import 'package:keepghanaclean/components/app_title.dart';
import 'package:keepghanaclean/model/post_comment_model.dart';
import 'package:keepghanaclean/model/post_model.dart';
import 'package:keepghanaclean/pages/settings.dart';
import 'package:keepghanaclean/services/database_services.dart';

class PostDetails extends StatefulWidget {
  final PostModel post;
  const PostDetails({required this.post, super.key});

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Feed"),
        backgroundColor: Color.fromARGB(255, 46, 90, 184),
        actions: <Widget>[],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Image.network(widget.post.imageUrl,
                height: size.height * 0.3, width: double.maxFinite),
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.heart_broken,
                    color: Colors.pink,
                  ),
                  onPressed: () {},
                ),
                Text("3")
              ],
            ),
            RichText(
              text: TextSpan(
                  text: "${widget.post.username} ",
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: [
                    TextSpan(
                      text: widget.post.comment, //TODO get max count
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(
                color: Colors.grey.shade500,
                thickness: 1,
              ),
            ),
            FutureBuilder<List<PostCommentModel>>(
              future: DatabaseService.getPostComments(widget.post.postId!),
              builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if(snapshot.data!.isEmpty){
                  return Text("There are no comments for this post");
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length ,
                    itemBuilder: (context, index) => ListTile(
                      leading: Icon(Icons.account_balance),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("User name"),
                          Column(
                            children: [
                              Text("Mon",
                                  style: Theme.of(context).textTheme.bodySmall),
                              Text("12:45",
                                  style: Theme.of(context).textTheme.bodySmall)
                            ],
                          )
                        ],
                      ),
                      subtitle: Text("Some conts " * 15),
                    ),
                  ),
                );
              }
              return const CircularProgressIndicator();
            }))
          ],
        ),
      ),
    );
  }
}
