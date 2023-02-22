import 'package:flutter/material.dart';
import 'package:keepghanaclean/components/app_title.dart';
import 'package:keepghanaclean/pages/settings.dart';

class PostDetails extends StatefulWidget {
  const PostDetails({super.key});

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
          actions: <Widget>[
            
          ],
        ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            SizedBox(height: 80),
            Image.asset("assets/images/run.gif", height: size.height * 0.3, width: double.maxFinite),
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
                          text: "Some comment about how fun the post"*6,//TODO get max count
                      style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ]
                    ),
                  ),
      
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:8.0),
                    child: Divider(color: Colors.grey.shade500, thickness: 1,),
                  ),
                  
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context,index)=> ListTile(
                        leading: Icon(Icons.account_balance),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("User name"),
                            Column(
                          children: [
                            Text("Mon", style:Theme.of(context).textTheme.bodySmall),
                            Text("12:45", style:Theme.of(context).textTheme.bodySmall)
                            ],
                        )
                          ],
                        ),
                        subtitle: Text("Some conts "*15),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}