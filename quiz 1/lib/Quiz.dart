import 'package:flutter/material.dart';

import 'Answer.dart';
import 'Question.dart';

class Quiz extends StatelessWidget {
  final VoidCallback hand;
  final List<Map<String, Object>> ansQuest;
  final int qNo;

  Quiz(this.hand, this.ansQuest, this.qNo);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.black,
          padding: const EdgeInsets.all(12),
          width: double.infinity,
          child: const Text(
            "Answer The Following Questions",
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 247, 238, 238)),
            textAlign: TextAlign.center,
          ),
        ),
        questions(ansQuest[qNo]['questionsNo'].toString()),
        ...(ansQuest[qNo]['answerNo'] as List<String>).map((answ) {
          return ansWers(hand, answ.toString());
        }).toList(),
      ],
    );
  }
}
