import 'dart:ffi';

import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final ResultsScore;
  final VoidCallback reStart;

  Results(this.ResultsScore, this.reStart);

  String get resultsText {
    String text = 'You did it baby ';
    if (ResultsScore < 5) {
      text = 'happy ';
    }
    if (ResultsScore >= 5 && ResultsScore <= 10) {
      text = 'WellDone ';
    } else {
      text = 'OOps Sorry try next ';
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            resultsText,
            style: const TextStyle(
              fontSize: 23,
            ),
          ),
        ),
        TextButton(
          onPressed: reStart,
          child: const Text(
            "Restart Quiz",
            style: TextStyle(color: Colors.red, fontSize: 30),
          ),
        )
      ],
    );
  }
}
