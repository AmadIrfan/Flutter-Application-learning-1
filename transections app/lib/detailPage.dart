// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transectionsapp/modal/Transection.dart';

class DetailPage extends StatelessWidget {
  final String uid;
  final List<Transection> tList;
  final Function deleteItem;
  const DetailPage(
      {super.key,
      required this.deleteItem,
      required this.uid,
      required this.tList});

  static const routName = '/DetailPage';

  Widget widgetBuilder(
      BuildContext ctx, String title, String other, Color cTop, Color cBottom) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: cTop,
                border: Border.all(width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              width: MediaQuery.of(ctx).size.width * 0.7,
              child: Text(
                title,
                style: const TextStyle(fontSize: 30, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: cBottom,
                border: Border.all(width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              width: MediaQuery.of(ctx).size.width * 0.7,
              child: Text(
                other,
                style: const TextStyle(fontSize: 30, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final detail = tList.firstWhere((element) => element.id == uid);

    return Scaffold(
        // appBar: AppBar(
        // ),
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          actions: [
            IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Delete '),
                        content: const Text('Are You sure you want to delete'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              deleteItem(detail.id!);
                              Navigator.of(context).pop(true);
                            },
                            child: const Text('yes'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: const Text('No'),
                          ),
                        ],
                      );
                    }).then((_) {
                  Navigator.of(context).pop(true);
                });
              },
            )
          ],
          expandedHeight: 300,
          pinned: true,
          backgroundColor: Colors.green,
          flexibleSpace: FlexibleSpaceBar(
            title: Hero(
              tag: detail.id!,
              child: Text(detail.title!),
            ),
            centerTitle: true,
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Column(
              children: [
                widgetBuilder(context, 'Title', detail.title!, Colors.black,
                    Colors.greenAccent),
                widgetBuilder(
                    context,
                    'Date',
                    DateFormat.yMEd().format(detail.dateTime!).toString(),
                    Colors.black,
                    Colors.greenAccent),
                widgetBuilder(context, 'Price', '${detail.amount!} RS',
                    Colors.black, Colors.greenAccent),
                const SizedBox(
                  height: 1000,
                ),
              ],
            ),
          ]),
        ),
      ],
    ));
  }
}
