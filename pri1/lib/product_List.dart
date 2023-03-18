// ignore: file_names
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductLists extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final productList;
  final function;
  const ProductLists(
      {Key? key, required this.productList, required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.amber,
          child: Dismissible(
            onDismissed: (direction) {
              () => function(productList[index].id);
            },
            key: ValueKey(productList[index].id),
            child: Card(
              color: Color.fromARGB(255, 29, 71, 105),
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Text(
                    productList[index].price.toString(),
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                title: Text(
                  productList[index].title,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                subtitle: Text(
                  DateFormat.yMEd()
                      .format(productList[index].dateTime)
                      .toString(),
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
                trailing: const Text(
                  '1x',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
