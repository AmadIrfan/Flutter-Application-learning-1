import 'package:flutter/material.dart';
import 'package:quiz/start_quiz.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Welcome to Quiz Application',
            style: TextStyle(fontSize: 40, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
                primary: const Color.fromARGB(255, 255, 255, 255),
                //  backgroundColor: Colors.white,
                elevation: 5,
                //  onSurface: Colors.red,
                padding: const EdgeInsets.all(10)),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(AppContent.routeName,
                  arguments: name.text);
            },
            icon: const Icon(
              Icons.start,
              size: 30,
            ),
            label: const Text(
              'Start Quiz',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
