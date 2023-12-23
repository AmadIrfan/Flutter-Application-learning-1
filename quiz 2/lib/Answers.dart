import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  String? data;
  final Function? ansHandler;
  Answer(this.data, this.ansHandler);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            ansHandler!();
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 18),
          ),
          child: Text(
            data!,
            style: const TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
