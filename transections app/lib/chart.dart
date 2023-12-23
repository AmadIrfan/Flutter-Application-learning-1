import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transectionsapp/ChartBars.dart';
import 'package:transectionsapp/modal/Transection.dart';

class Charts extends StatelessWidget {
  final List<Transection> tList;
  const Charts({super.key, required this.tList});

  List<Map<String, Object>> get groupData {
    return List.generate(7, (index) {
      double totalsum = 0;
      final weekData = DateTime.now().subtract(
        Duration(days: index),
      );
      for (int i = 0; i < tList.length; i++) {
        if (tList[i].dateTime!.year == weekData.year &&
            tList[i].dateTime!.month == weekData.month &&
            tList[i].dateTime!.day == weekData.day) {
          totalsum = tList[i].amount! + totalsum;
        }
      }
      return {"day": DateFormat.E().format(weekData), 'amount': totalsum};
    }).reversed.toList();
  }

  double get totalAmount {
    return groupData.fold(0.0, (pValue, element) {
      return pValue + (element['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: Border.all(width: 4),
      borderOnForeground: true,
      // margin: const EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: groupData.map((e) {
            return Flexible(
                child: ChartBar(
              days: e['day'].toString(),
              amu: e['amount'] as double,
              totalAmount: totalAmount == 0.0
                  ? 0.0
                  : (e['amount'] as double) / totalAmount,
            ));
          }).toList(),
        ),
      ),
    );
  }
}
