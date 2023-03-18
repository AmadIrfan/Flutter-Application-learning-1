import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pri1/Carttems.dart';
import 'package:pri1/product.dart';

class Charts extends StatelessWidget {
  List<product> transectionList = [];
  Charts({Key? key, required this.transectionList}) : super(key: key);
  List<Map<String, Object>> get _listTransection {
    return List.generate(7, (element) {
      double totalSum = 0.0;
      final weekDays = DateTime.now().subtract(
        Duration(days: element),
      );
      for (product obj in transectionList) {
        if (obj.dateTime.day == weekDays.day &&
            obj.dateTime.year == weekDays.year &&
            obj.dateTime.month == weekDays.month) {
          totalSum += obj.price;
        }
      }
      return {
        'day': DateFormat.E().format(weekDays).substring(0, 3),
        'amount': totalSum,
      };
    }).toList();
  }

  double get _totalAmount {
    return _listTransection.fold(0.0, (sum, element) {
      return sum += element['amount'] as double;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(_listTransection);
    return Card(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _listTransection.map(
            (element) {
              return ChartItem(
                title: element['day'].toString(),
                amount: element['amount'] as double,
                totAmount: ((element['amount'] as double) / _totalAmount),
              );
            },
          ).toList()),
    );
  }
}
