import 'package:flutter/material.dart';
import './quiz.dart';
import './restart_quiz.dart';
import './score.dart';

class AppContent extends StatefulWidget {
  static const routeName = '/mainPage';
  const AppContent({Key? key}) : super(key: key);

  @override
  State<AppContent> createState() => _AppContentState();
}

class _AppContentState extends State<AppContent> {
  var qNo = 0;
  var _totalScore = 0;
  void questionHandler(int score) {
    setState(() {
      qNo = qNo + 1;
      _totalScore += score;
    });
  }

  void restartQuiz() {
    setState(() {
      qNo = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final questionAnswers = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': [
          {'choise': 'a', 'text': 'Black', 'score': 10},
          {'choise': 'b', 'text': 'Red', 'score': 5},
          {'choise': 'c', 'text': 'Green', 'score': 3},
          {'choise': 'd', 'text': 'White', 'score': 1},
        ],
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': [
          {'choise': 'a', 'text': 'Rabbit', 'score': 3},
          {'choise': 'b', 'text': 'Snake', 'score': 11},
          {'choise': 'c', 'text': 'Elephant', 'score': 5},
          {'choise': 'd', 'text': 'Lion', 'score': 9},
        ],
      },
      {
        'questionText': 'Who\'s your favorite instructor?',
        'answers': [
          {'choise': 'a', 'text': 'Moazzam', 'score': 1},
          {'choise': 'b', 'text': 'Amad', 'score': 1},
          {'choise': 'c', 'text': 'Yasir', 'score': 1},
          {'choise': 'd', 'text': 'Amna', 'score': 1},
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Quiz',
          style: TextStyle(fontSize: 30),
        ),
        elevation: 10,
      ),
      body: qNo < questionAnswers.length
          ? SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Quiz(
                      questionHandler: questionHandler,
                      qNo: qNo,
                      questionsAnswers: questionAnswers),
                ],
              ),
            )
          : RestartQuiz(restartHandler: restartQuiz),
      bottomSheet: Score(
        qNo: qNo,
        result: _totalScore,
        restarthandeler: restartQuiz,
      ),
    );
  }
}
