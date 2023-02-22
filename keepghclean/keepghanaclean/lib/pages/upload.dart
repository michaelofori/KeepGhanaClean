import 'package:flutter/material.dart';
import 'package:keepghanaclean/components/my_button.dart';
import 'package:keepghanaclean/components/my_textfield.dart';


class Upload extends StatefulWidget {
  const Upload({super.key});


  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {

 
 

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
              Image.asset("assets/images/run.gif", height: size.height *0.4, width: size.width * 0.9,),
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
