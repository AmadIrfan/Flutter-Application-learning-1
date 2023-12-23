import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../provider/order.dart' show OrderItem;

class OrderItems extends StatefulWidget {
  final OrderItem order;
  const OrderItems({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderItems> createState() => _OrderItemsState();
}

class _OrderItemsState extends State<OrderItems> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            leading: const CircleAvatar(
              radius: 30,
              child: Icon(Icons.dataset),
            ),
            title: Text(widget.order.amount.toStringAsFixed(2)),
            subtitle: Text(
                DateFormat('yyyy/mm/dd hh:mm').format(widget.order.dateTime)),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
            ),
          ),
        ),
        if (_expanded)
          Container(
            // decoration: BoxDecoration(
            //   border: Border.all(),
            //   borderRadius: BorderRadius.circular(15),
            // ),
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: (widget.order.orderList.length * 20) + 30,
            child: ListView(
              children: widget.order.orderList
                  .map(
                    (item) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '${item.price} x ${item.quantity}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        const Divider(
          thickness: 2,
        )
      ],
    );
  }
}
