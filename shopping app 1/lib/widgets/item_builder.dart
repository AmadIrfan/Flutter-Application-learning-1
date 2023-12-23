import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prper_provider_app/modal/order.dart';

class ItemBuilder extends StatefulWidget {
  const ItemBuilder({super.key});

  @override
  State<ItemBuilder> createState() => _ItemBuilderState();
}

class _ItemBuilderState extends State<ItemBuilder> {
  bool expended = false;
  @override
  Widget build(BuildContext context) {
    final listOrder = Provider.of<Order>(context);
    return Card(
      margin: const EdgeInsets.all(1),
      elevation: 2,
      child: Column(
        children: [
          ListTile(
            title: Text(
              listOrder.amount.toStringAsFixed(2),
            ),
            subtitle: Text(listOrder.dateTime.toString()),
            trailing: IconButton(
              icon: Icon(
                expended ? Icons.expand_less : Icons.expand_more,
              ),
              onPressed: () {
                setState(() {});
                expended = !expended;
              },
            ),
          ),
          if (expended)
            Container(
              padding: const EdgeInsets.all(4),
              key: ValueKey(listOrder.id),
              color: const Color.fromARGB(255, 112, 112, 112),
              height: listOrder.cart.length * 22,
              width: double.infinity,
              child: ListView(
                children: listOrder.cart
                    .map(
                      (e) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            e.title,
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            "${e.quantity} X",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
