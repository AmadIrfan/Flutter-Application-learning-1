import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../modal/Transaction.dart';
import '../Widgets/chartBars.dart';

class charts extends StatelessWidget {
  List<Transactions> resentTransactions = [];

  charts(this.resentTransactions);

  List<Map<String, Object>> get groupedData {
    return List.generate(7, (index) {
      final weekDate = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (var i = 0; i < resentTransactions.length; i++) {
        if (resentTransactions[i].Date.day == weekDate.day &&
            resentTransactions[i].Date.month == weekDate.month &&
            resentTransactions[i].Date.year == weekDate.year) {
          totalSum += resentTransactions[i].Amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDate).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedData.fold(0.0, (sum, items) {
      return sum + (items['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: groupedData.map((data) {
            return Flexible(
              //   fit: FlexFit.tight,
              child: chartBars(
                  data['day'] as String,
                  (data['amount'] as double),
                  (totalSpending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / totalSpending)),
            );
          }).toList(),
        ),
      ),
    );
  }
}
