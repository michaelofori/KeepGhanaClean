import 'package:flutter/material.dart';
import 'package:keepghanaclean/pages/post_details.dart';

class PostTile extends StatelessWidget {
  const PostTile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> PostDetails()));
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
              Image.asset("assets/images/run.gif", height: 70, width: 150),
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
                  text: "Username ",
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: [
                    TextSpan(
                      text: "Some comment about how fun the post"*2,//TODO get max count
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