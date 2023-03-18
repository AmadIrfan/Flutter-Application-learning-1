import 'QuestionEditer.dart';
import 'ShowAnswers.dart';
import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  List<Map<String, Object>> questionsMap;
  final Function handler;
  final int qno;
  Quiz({required this.questionsMap, required this.handler, required this.qno});

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          child: Text(
            'Answer of the Following Questions.',
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ),
        NextQuestion(nextQuestion: questionsMap[qno]['Question'].toString()),
        ...(questionsMap[qno]['Answer'] as List<Map<String, Object>>)
            .map((value) {
          return AllAnswers(
              answerKey: value['Ans'],
              ansHandler: () => handler(value['Score'] as int));
        }).toList()
      ],
    );
  }
}
