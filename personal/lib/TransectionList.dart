import 'Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final Function deleteTransaction;
  final List<Transection> transactions;
  TransactionList(
      {required this.transactions, required this.deleteTransaction});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Expanded(
                      child:
                          Text(transactions[index].Amount.toStringAsFixed(2))),
                ),
                title: Text(transactions[index].Title),
                subtitle:
                    Text(DateFormat.yMEd().format(transactions[index].Date)),
                trailing: IconButton(
                  onPressed: () => deleteTransaction(transactions[index].id),
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                ),
              ),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
