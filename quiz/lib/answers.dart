import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String choise;
  final String answer;
  final Function questionHandler;
  const Answer(
      {Key? key,
      required this.choise,
      required this.answer,
      required this.questionHandler})
      : super(key: key);

  Widget _widgetBuilder(String text, double width, BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () => questionHandler(),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        width: width,
        //      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _widgetBuilder(choise, 50, context),
          _widgetBuilder(answer, 300, context),
        ],
      ),
    );
  }
}
