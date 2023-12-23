import 'package:flutter/material.dart';

import '../provider/cart.dart';

class OrderLists extends StatefulWidget {
  const OrderLists(
      {super.key,
      required this.amunt,
      required this.dateTime,
      required this.product});
  final DateTime dateTime;
  final double amunt;

  final List<CartItems> product;
  @override
  State<OrderLists> createState() => _OrderListsState();
}

class _OrderListsState extends State<OrderLists> {
  bool _isFav = false;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Card(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  widget.amunt.toStringAsFixed(2),
                ),
                subtitle: Text(widget.dateTime.toString()),
                leading: const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.brown,
                ),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      _isFav = !_isFav;
                    });
                  },
                  icon: Icon(
                    _isFav ? Icons.expand_less : Icons.expand_more,
                  ),
                ),
              ),
              if (_isFav)
                Container(
                  width: double.infinity,
                  height: widget.product.length * 50,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                  ),
                  child: ListView.builder(
                    itemCount: widget.product.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(widget.product[index].title),
                        trailing: Text('${widget.product[index].quantity} X'),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
