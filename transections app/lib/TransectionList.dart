// ignore_for_file: file_names

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import './detailPage.dart';
import './modal/Transection.dart';

class TransectionList extends StatelessWidget {
  final Function deletItemFromList;
  final List<Transection> tList;
  const TransectionList(
      {super.key, required this.deletItemFromList, required this.tList});

  void viewDetailofPriduct(BuildContext context, String id) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return DetailPage(
        deleteItem: deletItemFromList,
        tList: tList,
        uid: id,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tList.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            onTap: () {
              viewDetailofPriduct(context, tList[index].id!);
            },
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: FittedBox(
                  child: Text(
                    tList[index].amount.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            title: Text(
              tList[index].title!,
              style: const TextStyle(fontSize: 18),
            ),
            subtitle: Text(
              DateFormat.yMEd().format(tList[index].dateTime!),
              softWrap: true,
              style: const TextStyle(fontSize: 18),
            ),
            trailing: IconButton(
              onPressed: (() {
                deletItemFromList(tList[index].id!);
              }),
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ),
        );
      },
    );
  }
}
