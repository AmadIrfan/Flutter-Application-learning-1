import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../provider/order.dart';

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
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      child: Card(
          margin: const EdgeInsets.all(5),
          child: Column(
            children: [
              Card(
                elevation: 5,
                child: ListTile(
                  title: Text(
                    '\$ ${widget.order.amount.round()}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    'Date : ${DateFormat('dd/mm/yyyy hh:mm').format(widget.order.dateTime)}',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      _expanded ? Icons.expand_less : Icons.expand_more,
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        if (_expanded) {
                          _expanded = !_expanded;
                        } else {
                          _expanded = !_expanded;
                        }
                      });
                    },
                  ),
                ),
              ),
              if (_expanded)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: widget.order.orderList.length * 20 + 40,
                  child: ListView(
                      children: widget.order.orderList.map((item) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Text('${item.quentity} x ${item.price}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600))
                      ],
                    );
                  }).toList()),
                ),
            ],
          )),
    );
  }
}
