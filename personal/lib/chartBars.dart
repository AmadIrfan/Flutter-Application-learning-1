import 'package:flutter/material.dart';

class chartBsrs extends StatelessWidget {
  final String title;
  final double spandingAmount;
  final double totalAmount;
  chartBsrs(
      {required this.title,
      required this.spandingAmount,
      required this.totalAmount});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(spandingAmount.toStringAsFixed(2)),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.black),
              borderRadius: BorderRadius.circular(10)),
          height: 80,
          width: 15,
          //   color: Colors.grey,
          child: Stack(children: [
            Container(
              child: FractionallySizedBox(
                heightFactor: totalAmount,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      border: Border.all(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: null,
                ),
              ),
            )
          ]),
        ),
        SizedBox(height: 10),
        Text(title),
      ],
    );
  }
}
