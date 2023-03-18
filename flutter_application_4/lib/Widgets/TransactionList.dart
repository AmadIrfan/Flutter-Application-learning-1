
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../modal/Transaction.dart';

class TransectionList extends StatelessWidget {
  final List<Transactions> transections;
  final Function deleteItem;
  TransectionList({required this.transections, required this.deleteItem});
  @override
  Widget build(BuildContext context) {
    return transections.isEmpty
        ? LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    child: const Text(
                      "Empty List",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      //   scale: 2.5,
                    ),
                  )
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                margin: const EdgeInsets.all(10),
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Text(transections[index].Amount.toStringAsFixed(2)),
                  ),
                  title: Text(transections[index].title),
                  subtitle: Text(
                      DateFormat.yMMMMd().format(transections[index].Date)),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? TextButton.icon(
                          onPressed: () => deleteItem(transections[index].id),
                          icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).errorColor,
                          ),
                          label: Text(
                            "Delete",
                            style:
                                TextStyle(color: Theme.of(context).errorColor),
                          ))
                      : IconButton(
                          icon: const Icon(
                            Icons.delete,
                          ),
                          color: Theme.of(context).errorColor,
                          onPressed: () => deleteItem(transections[index].id),
                        ),
                ),
              );
            },
            itemCount: transections.length,
          );
  }
}
