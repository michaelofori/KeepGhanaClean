// import 'package:flutter/material.dart';
// import 'package:keepghanaclean/pages/home_page.dart';
// import '../components/default_button.dart';
// import '../components/form_error.dart';
// import '../constants/app_properties.dart';
// import '../constants/size_config.dart';
// import '../database_manager.dart';
// import '../model/User.dart';

// class UserScreen extends StatefulWidget {
//   @override
//   _UserScreenState createState() => _UserScreenState();
// }

// class _UserScreenState extends State<UserScreen> {
//   var _formKey = GlobalKey<FormState>();
//   late String title;
//   final List<String> errors = [];

//   void addError({required String error}) {
//     if (!errors.contains(error))
//       setState(() {
//         errors.add(error);
//       });
//   }

//   void removeError({required String error}) {
//     if (errors.contains(error))
//       setState(() {
//         errors.remove(error);
//       });
//   }

//   Future addUser() async {
//     final user = User(
//       name: title,
//       id: 1001,
//     );

//     // await DatabaseManager.instance.insertUser(user);
//   }

//   void validateAndSave() async {
//     final FormState? form = _formKey.currentState;
//     if (form!.validate()) {
//       await addUser();
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => HomePage()));
//     } else {
//       print('Form is invalid');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Scaffold(
//             backgroundColor: white,
//             body: Form(
//                 key: _formKey,
//                 child: SingleChildScrollView(
//                     child: Container(
//                   padding: EdgeInsets.all(20),
//                   child: Column(
//                     children: [
//                       SizedBox(height: getProportionateScreenHeight(75)),
//                       SizedBox(height: getProportionateScreenHeight(25)),
//                       Text(
//                         "Create a username that can be used for identification",
//                         style: TextStyle(
//                           fontSize: getProportionateScreenWidth(18),
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(height: getProportionateScreenHeight(15)),
//                       buildUserName(),
//                       FormError(errors: errors),
//                       SizedBox(height: getProportionateScreenHeight(15)),
//                       SizedBox(height: getProportionateScreenHeight(20)),
//                       DefaultButton(
//                         text: "Create",
//                         press: () async {
//                           validateAndSave();
//                         },
//                       ),
//                     ],
//                   ),
//                 )))));
//   }

//   TextFormField buildUserName() {
//     return TextFormField(
//       keyboardType: TextInputType.text,
//       onSaved: (newValue) => title = newValue!,
//       onChanged: (value) {
//         title = value;
//         if (value.isNotEmpty) {
//           removeError(error: kItemName);
//         }
//         return null;
//       },
//       validator: (value) {
//         if (value!.isEmpty) {
//           addError(error: kItemName);
//           return "";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//         // labelText: "User name",
//         // hintText: "Enter user name",

//         // If  you are using latest version of flutter then lable text and hint text shown like this
//         // if you r using flutter less then 1.20.* then maybe this is not working properly
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//       ),
//     );
//   }
// }
