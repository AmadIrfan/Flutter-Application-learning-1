import 'package:flutter/material.dart';
import 'Quiz.dart';
import 'result.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _qno = 0;
  var _totalScore = 0;
  var questionsMap = [
    {
      'Question': 'What is Your Fav color ???',
      'Answer': [
        {'Ans': 'Rose', 'Score': 5},
        {'Ans': 'Rose1', 'Score': 4},
        {'Ans': 'Rose2', 'Score': 3},
        {'Ans': 'Rose3', 'Score': 2},
      ]
    },
    {
      'Question': 'What is Your Fav Subject ???',
      'Answer': [
        {'Ans': 'Math', 'Score': 5},
        {'Ans': 'Math1', 'Score': 4},
        {'Ans': 'Math2', 'Score': 3},
        {'Ans': 'Math3', 'Score': 2},
      ]
    },
    {
      'Question': 'What is Your Fav Sport ???',
      'Answer': [
        {'Ans': 'Cricket', 'Score': 5},
        {'Ans': 'Cricket1', 'Score': 4},
        {'Ans': 'Cricket2', 'Score': 3},
        {'Ans': 'Cricket3', 'Score': 2},
      ]
    },
    {
      'Question': 'What is Your Fav Person ???',
      'Answer': [
        {'Ans': 'Amad', 'Score': 5},
        {'Ans': 'Amad1', 'Score': 4},
        {'Ans': 'Amad2', 'Score': 3},
        {'Ans': 'Amad3', 'Score': 2},
      ]
    },
  ];

  void _Counter(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _qno = _qno + 1;
    });
  }

  void RestartQuiz() {
    setState(() {
      _qno = 0;
      _totalScore = 0;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Quiz Application '),
          ),
          body: _qno < questionsMap.length
              ? Quiz(questionsMap: questionsMap, handler: _Counter, qno: _qno)
              : Result(result: _totalScore, RestartQuiz: RestartQuiz),
        ));
  }
}
