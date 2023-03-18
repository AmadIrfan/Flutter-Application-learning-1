import 'package:flutter/material.dart';

class RestartQuiz extends StatelessWidget {
  final Function restartQuiz;
  const RestartQuiz({super.key, required this.restartQuiz});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).backgroundColor,
          height: MediaQuery.of(context).size.height * 1,
          child: Center(
            child: TextButton(
              onPressed: () {
                restartQuiz();
              },
              child: Text('Restart Quiz',
                  style: Theme.of(context).textTheme.bodyText2),
            ),
          ),
        ),
      ],
    );
  }
}
