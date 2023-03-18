import 'package:flutter/material.dart';

class questions extends StatelessWidget {
  String question;

  questions(this.question);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Text(
        question,
        style: TextStyle(fontSize: 19),
      ),
    );
  }
}
