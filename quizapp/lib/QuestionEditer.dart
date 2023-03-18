import 'package:flutter/material.dart';

class NextQuestion extends StatelessWidget {
  final nextQuestion;
  NextQuestion({required this.nextQuestion});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(border: Border.all(), color: Colors.green),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Text(
        nextQuestion,
        style: TextStyle(fontSize: 25, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
