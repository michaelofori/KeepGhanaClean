import 'dart:io';

import 'package:carp_mobile_sensing/carp_mobile_sensing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keepghanaclean/components/my_button.dart';
import 'package:keepghanaclean/components/my_textfield.dart';
import 'package:keepghanaclean/model/post_model.dart';
import 'package:keepghanaclean/services/database_services.dart';

class Upload extends StatefulWidget {
  final XFile image;
  const Upload({required this.image, super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
    TextEditingController comment = TextEditingController();
  @override
  void initState() {
    widget.image;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Create a post"),
          backgroundColor: Color.fromARGB(255, 46, 90, 184),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Column(
              children: [
                Image.file(
                  File(widget.image.path),
                  height: size.height * 0.4,
                  width: size.width * 0.9,
                ),
                // Image.asset("assets/images/run.gif", height: size.height *0.4, width: size.width * 0.9,),
                const Spacer(
                  flex: 1,
                ),
                MyTextField(
                  controller: comment,
                  hintText: "Type some comment",
                ),
                const Spacer(
                  flex: 1,
                ),

                MyButton(text: "Create Post", onTap: () async{
                    DatabaseService.uploadImage(File(widget.image.path))
                    .then((imageUrl) async {
                      
                  PostModel post = PostModel(
                    userId: FirebaseAuth.instance.currentUser!.uid, 
                    username: FirebaseAuth.instance.currentUser!.displayName ?? "no name", 
                    comment: comment.text, 
                    imageUrl: imageUrl, 
                    createdAt: DateTime.now()
                    );
                      DatabaseService.createPost(post).then((value){
                        Fluttertoast.showToast(msg: "Post has been  uploaded");
                      });
                      
                        Navigator.pop(context);
                    },
                    );
                  
                }),
                const Spacer(
                  flex: 4,
                ),
              ],
            ),
          ),
        ));
  }
}
