import 'package:flutter/material.dart';

class AllAnswers extends StatelessWidget {
  final answerKey;
  final Function ansHandler;
  AllAnswers({required this.answerKey, required this.ansHandler});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 100)),
        onPressed: () => ansHandler(),
        child: Text(
          answerKey,
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
