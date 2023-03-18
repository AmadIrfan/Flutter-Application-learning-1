import 'package:flutter/material.dart';

import './questions.dart';
import './answers.dart';

class Quiz extends StatelessWidget {
  final int qNo;
  final List<Map<String, Object>> questionsAnswers;
  final Function questionHandler;
  const Quiz(
      {Key? key,
      required this.questionHandler,
      required this.qNo,
      required this.questionsAnswers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'Answers the Following Questions...',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
          Question(question: questionsAnswers[qNo]['questionText'].toString()),
          ...(questionsAnswers[qNo]['answers'] as List<Map<String, Object>>)
              .map((inside) {
            return Answer(
              answer: inside['text'].toString(),
              choise: inside['choise'].toString(),
              questionHandler: () => questionHandler(inside['score'] as int),
            );
          }),
          const SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}
