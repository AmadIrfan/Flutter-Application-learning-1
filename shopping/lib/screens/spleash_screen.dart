import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newdiv/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: ((context) => const HomeScreen()),
      ));
    });
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
          children: const [
            Icon(
              Icons.shopping_cart_sharp,
              size: 250.0,
              // color: Color(0xAAec8c69),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              heightFactor: 6,
              child: Text(
                "Shop",
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
                "Shopping App",
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
