import 'package:flutter/material.dart';
import 'package:keepghanaclean/model/post_model.dart';
import 'package:keepghanaclean/pages/post_details.dart';

class PostTile extends StatelessWidget {
  final PostModel post;
  const PostTile({required this.post,super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> PostDetails(post: post)));
      },
      child: SizedBox(
          width: size.width * 0.6,
          height: size.height * 0.2,
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  decoration: BoxDecoration(
                    shape:BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.5
                    )
                  ),
                  child: IconButton(
                    visualDensity: VisualDensity.compact,
                    icon: const Icon(Icons.close),
                    onPressed: (){
                                
                    },
                  ),
                ),
              ),
              Image.network(post.imageUrl, height: 70, width: 150, fit: BoxFit.fill,),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.heart_broken, color: Colors.pink,),
                    onPressed: (){
          
                    },
                  ),
                  Text("3")
                ],
              ),
              RichText(
                text: TextSpan(
                  text: "${post.username}  ",
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: [
                    TextSpan(
                      text: post.comment,//TODO get max count
                  style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ]
                ),
              ),
            ],
          ),
          ),
        ),
      ),
    );
  }
}