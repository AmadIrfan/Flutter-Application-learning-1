import 'package:flutter/material.dart';

class ansWers extends StatelessWidget {
  String Answ = '';
  final VoidCallback hendLer;
  ansWers(this.hendLer, this.Answ);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: hendLer,
        child: Text(Answ),
      ),
    );
  }
}
