// import 'package:flutter/material.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:crypto/crypto.dart';
// import 'dart:convert';
// import 'package:flutter_gradients/flutter_gradients.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class ResetPassword extends StatefulWidget {
//   @override
//   _ResetPasswordState createState() => _ResetPasswordState();
// }

// class _ResetPasswordState extends State<ResetPassword> {
//   final _resetkey = GlobalKey<FormState>();

//   TextEditingController newpassword = new TextEditingController();
//   TextEditingController confirmnewpassword = new TextEditingController();
//   TextEditingController username = new TextEditingController();

//   Box userbox;

//   var hashednewpassword;

//   @override
//   void initState() {
//     super.initState();
//     userbox = Hive.box("users");
//   }

//   void mysnackbar(texttodisplay) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(
//           texttodisplay,
//           style: TextStyle(
//             fontSize: 20.0,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(
//         title: Text(
//           "Password Manager",
//           style: TextStyle(
//             fontSize: 22.0,
//           ),
//         ),
//         backgroundColor: Colors.blueGrey,
//         centerTitle: true,
//       ),
//       body: ListView(
//         padding: EdgeInsets.all(50.0),
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(30.0),
//             child: Center(
//               child: Text(
//                 "Reset Password",
//                 style: TextStyle(
//                   fontSize: 25.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           Form(
//             key: _resetkey,
//             child: Column(
//               children: [
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.85,
//                   child: TextFormField(
//                     controller: username,
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                     validator:
//                         RequiredValidator(errorText: "username required"),
//                     decoration: InputDecoration(
//                       labelText: 'Previous username',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                     ),
//                     obscureText: true,
//                   ),
//                 ),
//                 Padding(
//             padding: const EdgeInsets.all(15.0),
//           ),
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.85,
//                   child: TextFormField(
//                     controller: newpassword,
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                     validator: MultiValidator([
//                       RequiredValidator(errorText: "Password Required"),
//                       MinLengthValidator(6,
//                           errorText:
//                               "Password should be at least 6 characters long"),
//                     ]),
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                     ),
//                     obscureText: true,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(15.0),
//                 ),
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.85,
//                   child: TextFormField(
//                     controller: confirmnewpassword,
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                     validator: (val) =>
//                         MatchValidator(errorText: "Both passwords don't match")
//                             .validateMatch(val, newpassword.text),
//                     decoration: InputDecoration(
//                       labelText: 'Confirm Password',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                     ),
//                     obscureText: true,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(30.0),
//           ),
//           Container(
//             width: MediaQuery.of(context).size.width * 0.85,
//             height: MediaQuery.of(context).size.height * 0.06,
//             decoration: ShapeDecoration(
//               shape: StadiumBorder(),
//               gradient: FlutterGradients.warmFlame(
//                 tileMode: TileMode.clamp,
//                 type: GradientType.linear,
//               ),
//             ),
//             child: MaterialButton(
//               onPressed: () => {
//                 if (_resetkey.currentState.validate())
//                   {
//                     if (userbox.keys.toList().contains(username.text))
//                       {
//                         if (userbox.toMap().isNotEmpty)
//                           {
//                             hashednewpassword =
//                                 sha256.convert(utf8.encode(newpassword.text)),
//                             userbox.put(username.text, hashednewpassword.toString()),
//                             newpassword.clear(),
//                             confirmnewpassword.clear(),
//                             mysnackbar("Password has been reset successfully"),
//                             Navigator.pop(context),
//                           }
//                       }else{
//                         mysnackbar("Account not found"),
//                       }
//                   }
//               },
//               child: Text(
//                 'Submit',
//                 style: TextStyle(
//                   fontSize: 20.0,
//                   // color: Colors.white,
//                 ),
//               ),
//               shape: StadiumBorder(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
