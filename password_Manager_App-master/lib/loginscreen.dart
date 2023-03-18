// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_gradients/flutter_gradients.dart';
// import 'package:password_manager/password.dart';
// import 'package:password_manager/resetpassword.dart';
// import 'package:password_manager/signupscreen.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:crypto/crypto.dart';
// import 'package:local_auth/local_auth.dart';
// import 'package:flutter/services.dart';
// import 'dart:convert';
// import 'dart:math';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   bool submitValid = false;

//   final LocalAuthentication auth = LocalAuthentication();
//   bool _canCheckBiometrics = false;
//   late List<BiometricType> _availableBiometrics;
//   String _authorized = 'Not Authorized';
//   bool _isAuthenticating = false;

//   @override
//   void initState() {
//     super.initState();
//     _checkBiometrics();
//   }

//   Future<void> _checkBiometrics() async {
//     bool canCheckBiometrics;
//     try {
//       canCheckBiometrics = await auth.canCheckBiometrics;
//     } on PlatformException catch (e) {
//       canCheckBiometrics = false;
//       print(e);
//     }
//     if (!mounted) return;

//     setState(() {
//       _canCheckBiometrics = canCheckBiometrics;
//     });
//   }

//   Future<void> _getAvailableBiometrics() async {
//     List<BiometricType> availableBiometrics;
//     try {
//       availableBiometrics = await auth.getAvailableBiometrics();
//     } on PlatformException catch (e) {
//       availableBiometrics = <BiometricType>[];
//       print(e);
//     }
//     if (!mounted) return;

//     setState(() {
//       _availableBiometrics = availableBiometrics;
//       print(_availableBiometrics);
//     });
//   }

//   Future<void> _authenticate() async {
//     bool authenticated = false;
//     try {
//       setState(() {
//         _isAuthenticating = true;
//         _authorized = 'Authenticating';
//       });
//       authenticated = await auth.authenticate(
//         localizedReason: 'Let OS determine authentication method',
//         options: AuthenticationOptions(useErrorDialogs: true, stickyAuth: true),
//       );
//       setState(() {
//         _isAuthenticating = false;
//       });
//     } on PlatformException catch (e) {
//       print(e);
//       setState(() {
//         _isAuthenticating = false;
//         _authorized = "Error - ${e.message}";
//       });
//       return;
//     }
//     if (!mounted) return;

//     setState(
//         () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
//   }

//   Future<void> _authenticateWithBiometrics() async {
//     bool authenticated = false;
//     try {
//       setState(() {
//         _isAuthenticating = true;
//         _authorized = 'Authenticating';
//       });
//       authenticated = await auth.authenticate(
//           localizedReason: 'Scan your fingerprint to authenticate',
//           options: AuthenticationOptions(
//               useErrorDialogs: true, stickyAuth: true, biometricOnly: true));
//       setState(() {
//         _isAuthenticating = false;
//         _authorized = 'Authenticating';
//       });
//     } on PlatformException catch (e) {
//       print(e);
//       setState(() {
//         _isAuthenticating = false;
//         _authorized = "Error - ${e.message}";
//         print(_authorized);
//         // Navigator.of(context).pushReplacement(MaterialPageRoute(
//         //     builder: (BuildContext context) =>
//         //         passwordspage(usersbox.getAt(0))));
//       });
//       return;
//     }
//     if (!mounted) return;

//     final String message = authenticated ? 'Authorized' : 'Not Authorized';
//     setState(() {
//       _authorized = message;
//       print(message);
//       if (_authorized == 'Authorized') {
//         // if (usersbox.keys.toList().length != 0) {
//         //   Navigator.of(context).pushReplacement(MaterialPageRoute(
//         //       builder: (BuildContext context) =>
//         //           passwordspage(usersbox.keyAt(0))));
//         // } else {
//         //   showDialog(
//         //       context: context,
//         //       builder: (_) => customerrordialog("Account doesn't exist"));
//         //   // _authenticateWithBiometrics();
//         // }
//       }
//     });
//   }

//   final _loginkey = GlobalKey<FormState>();
//   final _emailkey = GlobalKey<FormState>();

//   TextEditingController enteredusername = new TextEditingController();
//   TextEditingController enteredpassword = new TextEditingController();
//   TextEditingController _emailcontroller = TextEditingController();
//   TextEditingController _otpcontroller = TextEditingController();

//   var otp;

//   void customsnackbar(texttodisplay) {
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
//                 bottom: MediaQuery.of(context).size.height * 0.04),
//             child: Center(
//               child: Text(
//                 'Password Manager',
//                 style: TextStyle(
//                   fontSize: 30.0,
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'Sign In',
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(15.0),
//                 ),
//                 Form(
//                   key: _loginkey,
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width * 0.85,
//                         child: TextFormField(
//                           controller: enteredusername,
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator:
//                               RequiredValidator(errorText: "Username Required"),
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
//                           controller: enteredpassword,
//                           obscureText: true,
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator:
//                               RequiredValidator(errorText: "Password Required"),
//                           decoration: InputDecoration(
//                             labelText: 'Password',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(35.0),
//                       ),
//                       !_canCheckBiometrics
//                           ? Container(
//                               width: MediaQuery.of(context).size.width * 0.85,
//                               height:
//                                   MediaQuery.of(context).size.height * 0.065,
//                               decoration: ShapeDecoration(
//                                 shape: StadiumBorder(),
//                                 gradient: FlutterGradients.warmFlame(
//                                   tileMode: TileMode.clamp,
//                                   type: GradientType.linear,
//                                 ),
//                               ),
//                               child: MaterialButton(
//                                 materialTapTargetSize:
//                                     MaterialTapTargetSize.shrinkWrap,
//                                 shape: StadiumBorder(),
//                                 onPressed: () {},
//                                 child: Text(
//                                   'Sign In',
//                                   style: TextStyle(
//                                     fontSize: 20.0,
//                                     // color: Colors.white,
//                                   ),
//                                 ),
//                                 hoverColor: Colors.black,
//                               ),
//                             )
//                           : Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.65,
//                                   height: MediaQuery.of(context).size.height *
//                                       0.065,
//                                   margin: EdgeInsets.symmetric(horizontal: 7.0),
//                                   decoration: ShapeDecoration(
//                                     shape: StadiumBorder(),
//                                     gradient: FlutterGradients.warmFlame(
//                                       tileMode: TileMode.clamp,
//                                       type: GradientType.linear,
//                                     ),
//                                   ),
//                                   child: MaterialButton(
//                                     materialTapTargetSize:
//                                         MaterialTapTargetSize.shrinkWrap,
//                                     shape: StadiumBorder(),
//                                     onPressed: () => {},
//                                     child: Text(
//                                       'Sign In',
//                                       style: TextStyle(
//                                         fontSize: 20.0,
//                                         // color: Colors.white,
//                                       ),
//                                     ),
//                                     hoverColor: Colors.black,
//                                   ),
//                                 ),
//                                 Container(
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.15,
//                                   height: MediaQuery.of(context).size.height *
//                                       0.075,
//                                   decoration: ShapeDecoration(
//                                     shape: StadiumBorder(),
//                                     // gradient: FlutterGradients.warmFlame(
//                                     //   tileMode: TileMode.clamp,
//                                     //   type: GradientType.linear,
//                                     // ),
//                                   ),
//                                   child: IconButton(
//                                     onPressed: () {
//                                       _authenticateWithBiometrics();
//                                     },
//                                     tooltip: "Fingerprint Login",
//                                     icon: Icon(
//                                       Icons.fingerprint_sharp,
//                                       color: Colors.black,
//                                       size: 45.0,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(25.0),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width * 0.85,
//                   height: MediaQuery.of(context).size.height * 0.06,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Don't have account? ",
//                         style: TextStyle(
//                           fontSize: 20.0,
//                           // color: Colors.blue[700],
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (BuildContext context) =>
//                                   SignupScreen()));
//                         },
//                         child: Text(
//                           'Sign Up',
//                           style: TextStyle(
//                             fontSize: 20.0,
//                             color: Colors.blue[800],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height * 0.07,
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width * 0.85,
//                   height: MediaQuery.of(context).size.height * 0.06,
//                   decoration: ShapeDecoration(
//                     shape: StadiumBorder(),
//                     gradient: FlutterGradients.colorfulPeach(),
//                   ),
//                   child: MaterialButton(
//                     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                     shape: StadiumBorder(),
//                     onPressed: () {
//                       showDialog(
//                           context: context,
//                           builder: (_) {
//                             return Center();
//                           });
//                     },
//                     child: Text(
//                       'Forgot Password',
//                       style: TextStyle(
//                         fontSize: 18.0,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
