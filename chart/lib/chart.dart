import 'package:flutter/Material.dart';
import './ChartBar.dart';
import 'package:intl/intl.dart';
import './Transaction.dart';

class Charts extends StatelessWidget {
  final List<Transaction> transection;
  const Charts({Key? key, required this.transection}) : super(key: key);

  List<Map<String, Object>> get _resentGroupedData {
    return List.generate(7, (index) {
      final weekDate = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;
      for (var obj in transection) {
        if (obj.date.month == weekDate.month &&
            obj.date.day == weekDate.day &&
            obj.date.year == weekDate.year) {
          totalSum += obj.amount;
        }
      }
      return {
        "day": DateFormat.E().format(weekDate).substring(0, 2),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalSpanding {
    return _resentGroupedData.fold(0.0, (sum, element) {
      return (sum + (element['amount'] as double));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: _resentGroupedData.map((item) {
            return ChratBars(
                title: item['day'].toString(),
                amount: item['amount'] as double,
                totAmount: totalSpanding == 0.0
                    ? 0.0
                    : ((item['amount'] as double) / totalSpanding));
          }).toList(),
        ),
      ),
    );
  }
}
