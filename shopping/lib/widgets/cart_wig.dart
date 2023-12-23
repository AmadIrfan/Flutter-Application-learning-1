import 'package:flutter/material.dart';
import '../provider/cart.dart';
import 'package:provider/provider.dart';

class CartData extends StatelessWidget {
  const CartData({
    super.key,
    required this.id,
    required this.price,
    required this.quantity,
    required this.title,
    required this.proId,
  });
  final String proId;
  final String id;
  final String title;
  final double price;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Colors.red,
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(proId);
      },
      child: Card(
        elevation: 5,
        child: Container(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            title: Text(title),
            subtitle: Text('${price * quantity}'),
            leading: Expanded(
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.blueAccent,
                child: Text(
                  price.toStringAsFixed(2),
                ),
              ),
            ),
            trailing: Text("$quantity X"),
          ),
        ),
      ),
    );
  }
}
