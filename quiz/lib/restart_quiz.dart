import 'package:flutter/material.dart';

class RestartQuiz extends StatelessWidget {
  final Function restartHandler;
  const RestartQuiz({Key? key, required this.restartHandler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'No More Questions...',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          TextButton.icon(
            onPressed: () {
              restartHandler();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 40,
              color: Colors.blue,
            ),
            label: const Text('Restart Quiz',
                style: TextStyle(color: Colors.blue, fontSize: 30)),
          ),
        ],
      ),
    );
  }
}
