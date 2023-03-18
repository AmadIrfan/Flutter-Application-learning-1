import 'package:flutter/material.dart';
import 'package:my_personal/screen/add_imagePage.dart';
import './screen/my_homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      routes: {
        PageDetail.routName: (context) => const PageDetail(),
      },
    );
  }
}
