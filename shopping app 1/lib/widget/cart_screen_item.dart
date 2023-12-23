import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';

class CartScreenItem extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final double price;
  final int quantity;
  const CartScreenItem({
    Key? key,
    required this.id,
    required this.productId,
    required this.title,
    required this.quantity,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: Icon(
          color: Colors.grey,
          size: 40,
          Icons.delete,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (duration) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Are You Sure??'),
            content: const Text('You want to remove Item From Cart ??'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop(false);
                  },
                  child: const Text("No")),
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop(true);
                  },
                  child: const Text("Yes"))
            ],
          ),
        );
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).deleteItem(productId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              child: FittedBox(
                child: Text(
                  price.toString(),
                ),
              ),
            ),
            title: Text(title),
            subtitle: Text('\$ ${(price * quantity)}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
