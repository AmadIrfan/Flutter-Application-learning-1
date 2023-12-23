import 'package:intl/intl.dart';
import 'Transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transection;

  const TransactionList({Key? key, required this.transection})
      : super(key: key);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: FittedBox(
                  child: Text(
                      widget.transection[index].amount.toStringAsFixed(2))),
            ),
            title: Text(widget.transection[index].title),
            subtitle:
                Text(DateFormat.yMEd().format(widget.transection[index].date)),
          ),
        );
      },
      itemCount: widget.transection.length,
    );
  }
}
