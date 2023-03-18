import 'package:flutter/material.dart';
import 'Buttons.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  void incriment() {
    setState(() {
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Buttons"),
        ),
        body: Btns(incriment, index),
      ),
    );
  }
}
