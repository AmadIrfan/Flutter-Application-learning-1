import 'package:flutter/material.dart';
import './Answers.dart';
import './question.dart';

class QuizDotCom extends StatelessWidget {
  final List<Map<String, dynamic>> questionList;
  final int qNo;
  // ignore: prefer_typing_uninitialized_variables
  final hendalQuestions;
  const QuizDotCom(
      {super.key,
      required this.questionList,
      required this.hendalQuestions,
      required this.qNo});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      height: MediaQuery.of(context).size.height * 1,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Container(
          color: Colors.amber,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  'Please Answer These Questions...',
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Questions(
                question: questionList[qNo]['Question'].toString(),
              ),
              const SizedBox(
                height: 20,
              ),
              ...(questionList[qNo]['Answer'] as List).map(
                (e) {
                  return Answer(
                    e['Name'],
                    hendalQuestions,
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
