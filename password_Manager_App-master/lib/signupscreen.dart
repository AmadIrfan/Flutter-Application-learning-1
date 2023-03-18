// import 'package:flutter/material.dart';
// import 'package:flutter_gradients/flutter_gradients.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:password_manager/loginscreen.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:crypto/crypto.dart';
// import 'dart:convert';
// class SignupScreen extends StatefulWidget {
//   @override
//   _SignupScreenState createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController username = new TextEditingController();
//   TextEditingController email = new TextEditingController();
//   TextEditingController password = new TextEditingController();
//   TextEditingController confirmpassword = new TextEditingController();

//   Box usersbox;

//   var hashedpassword;

//   @override
//   void initState() {
//     super.initState();
//     usersbox = Hive.box("users");
//   }

//   Widget customdialog(txt, route) {
//     return AlertDialog(
//       actions: [
//         Text(
//           txt,
//           style: TextStyle(
//             fontSize: 20.0,
//             // color: Colors.white,
//           ),
//         ),
//         IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//             if (route) {
//               Navigator.of(context).pushReplacement(MaterialPageRoute(
//                   builder: (BuildContext context) => LoginScreen()));
//             }
//           },
//           icon: Icon(Icons.close_sharp),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height * 0.13,
//             width: MediaQuery.of(context).size.width,
//             decoration: ShapeDecoration(
//               shape: RoundedRectangleBorder(),
//               gradient: FlutterGradients.warmFlame(
//                 tileMode: TileMode.clamp,
//                 type: GradientType.linear,
//               ),
//             ),
//             margin: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).size.height * 0.05),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: Icon(Icons.arrow_back),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04),
//                   child: Text(
//                     'Password Manager',
//                     style: TextStyle(
//                       fontSize: 30.0,
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'Sign Up Here',
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                 ),
//                 Form(
//                   key: _formKey,
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(10.0),
//                       ),
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width * 0.85,
//                         child: TextFormField(
//                           controller: username,
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: RequiredValidator(errorText: "Username Required"),
//                           decoration: InputDecoration(
//                             labelText: 'Username',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(15.0),
//                       ),
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width * 0.85,
//                         child: TextFormField(
//                           controller: email,
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: EmailValidator(errorText: "Incorrect email"),
//                           decoration: InputDecoration(
//                             labelText: 'Email',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(15.0),
//                       ),
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width * 0.85,
//                         child: TextFormField(
//                           controller: password,
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: MultiValidator([
//                             RequiredValidator(errorText: "Password Required"),
//                             MinLengthValidator(6, errorText: "Password should be at least 6 characters long"),
//                           ]),
//                           decoration: InputDecoration(
//                             labelText: 'Password',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                           ),
//                           obscureText: true,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(15.0),
//                       ),
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width * 0.85,
//                         child: TextFormField(
//                           controller: confirmpassword,
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator:(val) => MatchValidator(errorText: "Both passwords don't match").validateMatch(val, password.text),
//                           decoration: InputDecoration(
//                             labelText: 'Confirm Password',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                           ),
//                           obscureText: true,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(30.0),
//                       ),
//                       Container(
//                   width: MediaQuery.of(context).size.width * 0.85,
//                   height: MediaQuery.of(context).size.height * 0.06,
//                   decoration: ShapeDecoration(
//                     shape: StadiumBorder(),
//                     gradient: FlutterGradients.warmFlame(
//                       tileMode: TileMode.clamp,
//                       type: GradientType.linear,
//                     ),
//                   ),
//                   child: MaterialButton(
//                     onPressed: () => {
//                          if(_formKey.currentState.validate()){
//                            if (usersbox.toMap().isEmpty)
//                                 {
//                                   hashedpassword = sha256.convert(utf8.encode(password.text)),
//                                   usersbox.put(username.text, hashedpassword.toString()),
//                                   usersbox.put("user_email", email.text),
//                                   username.clear(),
//                                   password.clear(),
//                                   confirmpassword.clear(),
//                                   email.clear(),
//                                   showDialog(
//                                       context: context,
//                                       builder: (_) => customdialog(
//                                           "Account Created Successfully.",
//                                           true)),
//                                 }
//                               else
//                                   {
//                                     showDialog(
//                                         context: context,
//                                         builder: (_) => customdialog(
//                                             "Account Already Exists", true)),
//                                   },
//                          }
//                     },
//                     child: Text(
//                       'Sign Up',
//                       style: TextStyle(
//                         fontSize: 20.0,
//                         // color: Colors.white,
//                       ),
//                     ),
//                     shape: StadiumBorder(),
//                   ),
//                 ),
//                     ],
//                   ),
//                 ),
                
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height * 0.05,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
