import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  int result = 0;
  final Function RestartQuiz;
  Result({required this.result, required this.RestartQuiz});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Your Total score is : ${result}',
            style:
                TextStyle(fontSize: 30, decoration: TextDecoration.underline),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                primary: Colors.white,
              ),
              onPressed: () => RestartQuiz(),
              child: Text(
                "restartQuiz",
                style: TextStyle(
                    fontSize: 30, decoration: TextDecoration.underline),
              ))
        ],
      ),
    );
  }
}
