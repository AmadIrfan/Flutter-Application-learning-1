import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal/chartBars.dart';
import 'Transaction.dart';

class charts extends StatelessWidget {
  List<Transection> transaction = [];
  charts({required this.transaction});

  List<Map<String, Object>> get Groupedtransactions {
    return List.generate(7, ((index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalAmount = 0.0;
      for (var i = 0; i < transaction.length; i++) {
        if (transaction[i].Date.day == weekDay.day &&
            transaction[i].Date.month == weekDay.month &&
            transaction[i].Date.year == weekDay.year) {
          totalAmount += transaction[i].Amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 3),
        'Amount': totalAmount
      };
    })).toList();
  }

  double get totalSpanding {
    return Groupedtransactions.fold(0.0, (sum, element) {
      return sum + (element['Amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(Groupedtransactions);
    print(totalSpanding.toString());
    return Container(
        margin: EdgeInsets.all(10),
        height: 170,
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: Groupedtransactions.map((item) {
                return Expanded(
                  child: chartBsrs(
                      title: item['day'].toString(),
                      spandingAmount: item['Amount'] as double,
                      totalAmount: (item['Amount'] as double) / totalSpanding),
                );
              }).toList(),
            ),
          ), // ),
        ));
  }
}
