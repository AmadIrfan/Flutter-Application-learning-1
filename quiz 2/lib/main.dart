import 'package:flutter/material.dart';
import 'package:new_quiz/quiz.dart';
import 'package:new_quiz/restart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyAppQuiz(),
      theme: ThemeData(
        primarySwatch: Colors.green,
        backgroundColor: Colors.blueGrey,
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
            backgroundColor: Colors.white,
            wordSpacing: 2,
            fontStyle: FontStyle.italic,
            fontSize: 30,
          ),
          bodyText2: TextStyle(
            color: Color.fromARGB(255, 119, 92, 9),
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
            backgroundColor: Colors.white,
            wordSpacing: 2,
            fontStyle: FontStyle.italic,
            fontSize: 50,
          ),
          labelMedium: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class MyAppQuiz extends StatefulWidget {
  const MyAppQuiz({super.key});

  @override
  State<MyAppQuiz> createState() => _MyAppQuizState();
}

class _MyAppQuizState extends State<MyAppQuiz> {
  int _quizAnswers = 0;

  final questionList = [
    {
      "Question": "What is your Name ?",
      "Answer": [
        {'Name': 'AmadIrfan', 'Score': 13},
        {'Name': 'AmnaZafar', 'Score': 10},
        {'Na me': 'Moazam', 'Score': 8},
        {'Name': 'Yasir', 'Score': 7},
        {'Name': 'Aleeza', 'Score': 6}
      ],
    },
    {
      "Question": "What is your father Name ?",
      "Answer": [
        {'Name': 'Irfan Mehmood', 'Score': 13},
        {'Name': 'Zafar Ali', 'Score': 10},
        {'Name': 'Muhammad Asslam', 'Score': 8},
        {'Name': 'Zafar Ali', 'Score': 7},
        {'Name': 'Shakil Ahmad', 'Score': 6}
      ],
    },
    {
      "Question": "What is your Favorite Color ?",
      "Answer": [
        {'Name': 'Red', 'Score': 13},
        {'Name': 'Green', 'Score': 10},
        {'Name': 'Yellow', 'Score': 8},
        {'Name': 'Grey', 'Score': 7},
        {'Name': 'Blue', 'Score': 6}
      ],
    },
    {
      "Question": "What is your University ?",
      "Answer": [
        {'Name': 'UET', 'Score': 13},
        {'Name': 'Punjab', 'Score': 10},
        {'Name': 'UCP', 'Score': 8},
        {'Name': 'Fast U', 'Score': 7},
        {'Name': 'NUST U', 'Score': 6}
      ],
    },
    {
      "Question": "What is your City Name ?",
      "Answer": [
        {'Name': 'Bhakkar', 'Score': 13},
        {'Name': 'Lahore', 'Score': 10},
        {'Name': 'Islamabad', 'Score': 8},
        {'Name': 'Karachi', 'Score': 7},
        {'Name': 'Multan', 'Score': 6}
      ],
    },
  ];

  void _restartQuiz() {
    setState(() {
      _quizAnswers = 0;
    });
  }

  void _ansIncrement() {
    setState(() {
      _quizAnswers += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mdQ = MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            'Quiz App',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        centerTitle: true,
      ),
      body: _quizAnswers < questionList.length
          ? QuizDotCom(
              questionList: questionList,
              qNo: _quizAnswers,
              hendalQuestions: _ansIncrement,
            )
          : RestartQuiz(restartQuiz: _restartQuiz),
      bottomSheet: mdQ
          ? Container(
              height: 0,
            )
          : Container(
              width: double.infinity,
              height: 75,
              alignment: Alignment.center,
              color: Theme.of(context).primaryColor,
              child: const Text(
                'AmadIrfan',
                style: TextStyle(fontSize: 30),
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).textTheme.bodyText1!.color,
        hoverColor: Colors.grey,
        onPressed: (() {
          _restartQuiz();
        }),
        child: const Icon(
          Icons.add,
          size: 50,
        ),
      ),
    );
  }
}
