import 'dart:async';

import'package:flutter/material.dart';
// import 'package:flutter_gradients/flutter_gradients.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        (){}
            );
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          color: Colors.blueGrey,
          // gradient: RadialGradient(
          //   focal: Alignment.bottomLeft,
          //   focalRadius: 100.0,
          //   colors: [
          //   Color(0xAAed6ea0),
          //   Color(0xAAec8c69),
          // ])
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock,
              size: 250.0,
              // color: Color(0xAAec8c69),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              heightFactor: 6,
              child: Text(
                "PassMan",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              heightFactor: 1.5,
              child: Text(
                "Secure Password Manager App",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

