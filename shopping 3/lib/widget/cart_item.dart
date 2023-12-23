import 'package:flutter/material.dart';
import 'package:online1/provider/Cart_item.dart';
import 'package:provider/provider.dart';

class CartItemswidget extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final double price;
  final int quantity;
  const CartItemswidget({
    Key? key,
    required this.id,
    required this.price,
    required this.title,
    required this.quantity,
    required this.productId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      confirmDismiss: (detail) {
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
                    ]));
      },
      onDismissed: (direction) {
        Provider.of<CartItemsContainer>(context, listen: false)
            .deleteCartItems(productId);
      },
      direction: DismissDirection.endToStart,
      background: Container(
        margin: const EdgeInsets.all(4),
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        child: Icon(
          color: Colors.grey,
          size: 40,
          Icons.delete,
        ),
      ),
      key: ValueKey(productId),
      child: Card(
        elevation: 5,
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Text(price.toString()),
          ),
          title: Text(title),
          subtitle: Text((price * quantity).toString()),
          trailing: Text('${quantity}x'),
        ),
      ),
    );
  }
}
