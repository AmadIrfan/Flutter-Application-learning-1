import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../provider/cart.dart';

class CartItems extends StatelessWidget {
  final String id;
  final String title;
  final String proId;
  final double price;
  final int quentity;
  const CartItems({
    Key? key,
    required this.id,
    required this.quentity,
    required this.price,
    required this.title,
    required this.proId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DataList = Provider.of<Cart>(context);
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        DataList.DeletItem(proId);
      },
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) {
              return AlertDialog(
                title: const Text('Permission'),
                content: const Text(
                    'Are you sure You want to delete item from cart ??'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop(false);
                    },
                    child: const Text('no'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop(true);
                    },
                    child: const Text('Yes'),
                  ),
                ],
              );
            });
      },
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
      child: Card(
        child: Container(
          //  color: Colors.red,
          child: ListTile(
            leading: CircleAvatar(
              radius: 40,
              child: FittedBox(child: Text(price.toStringAsFixed(2))),
            ),
            title: Text(title),
            subtitle: Text('\$ ${quentity * price}'),
            trailing: Text('${quentity} x'),
          ),
        ),
      ),
    );
  }
}
