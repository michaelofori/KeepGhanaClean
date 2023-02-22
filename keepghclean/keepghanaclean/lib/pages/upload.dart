import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keepghanaclean/components/my_button.dart';
import 'package:keepghanaclean/components/my_textfield.dart';


class Upload extends StatefulWidget {
  final XFile image;
  const Upload({required this.image,super.key});


  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {

  @override
  void initState() {
      widget.image;
    super.initState();
  }

 
 

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController comment = TextEditingController();

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
              Image.file(File(widget.image.path), height: size.height *0.4, width: size.width * 0.9,),
              // Image.asset("assets/images/run.gif", height: size.height *0.4, width: size.width * 0.9,),
              const Spacer(flex: 1,),
              MyTextField(controller: comment, hintText: "Type some comment",),
              const Spacer(flex: 1,),

        
              MyButton(
                text: "Create Post",
                onTap: (){
        
                }
              ),
              const Spacer(flex: 4,),

            ],
          ),
        ),
      )
    );
  }
}
