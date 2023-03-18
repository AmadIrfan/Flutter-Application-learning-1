//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Question.dart';
import 'Answer.dart';
import 'Quiz.dart';
import 'Result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _qNo = 0;
  int _totalScore = 0;
  void _inCrimenter() {
    setState(() {
      _qNo += 1;
    });
  }

  void resetStartQuiz() {
    setState(() {
      _qNo = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ansQuest = [
      {
        'questionsNo': 'What is your name ?? ',
        'answerNo': ['Amad ', 'saad', 'Ahmad', 'other']
      },
      {
        'questionsNo': 'What is your father Name ???',
        'answerNo': ['Irfan', 'Tariq ', 'Nasir', 'Akhter']
      },
      {
        'questionsNo': 'What is your brother name ???',
        'answerNo': ['Saad ', 'Amad', 'Ahmad', 'other']
      },
      {
        'questionsNo': 'What is your Oldest Czn name ???',
        'answerNo': ['other', 'saad', 'Ahmad', 'Amad ']
      },
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text("Amad irfan"),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(50),
            child: const Text(
              "Amad Irfan",
              style: TextStyle(fontSize: 50),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: _qNo < ansQuest.length
            ? Quiz(_inCrimenter, ansQuest, _qNo)
            : Container(
                width: double.infinity,
                height: double.infinity,
                child: Results(5, resetStartQuiz),
              ),
        floatingActionButton: FloatingActionButton(
            focusColor: Colors.amber,
            splashColor: Colors.black,
            hoverColor: Colors.yellow,
            autofocus: true,
            onPressed: resetStartQuiz,
            backgroundColor: Colors.red,
            child: const Icon(Icons.add)),
      ),
    );
  }
}
