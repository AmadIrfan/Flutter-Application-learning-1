// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar(
      {super.key,
      required this.amu,
      required this.days,
      required this.totalAmount});

  final String days;
  final double amu;
  final double totalAmount;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          children: [
            Container(
              height: constraints.maxHeight * 0.2,
              alignment: Alignment.center,
              child: FittedBox(
                child: Text(
                  days,
                  style: const TextStyle(fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.01,
            ),
            Container(
              height: constraints.maxHeight * 0.55,
              width: 40,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 85, 84, 84),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                    ),
                    child: FractionallySizedBox(
                      heightFactor: totalAmount,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.01,
            ),
            Container(
              height: constraints.maxHeight * 0.2,
              alignment: Alignment.center,
              child: FittedBox(
                child: Text(
                  style: const TextStyle(fontSize: 25),
                  amu.toStringAsFixed(1),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
