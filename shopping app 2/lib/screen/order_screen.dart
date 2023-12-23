import 'package:flutter_application_impo/screen/appDrawer.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_impo/provider/order.dart';
import 'package:flutter_application_impo/widget/order_Item.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/OrderScreen';
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderList = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Your Order')),
      body: ListView.builder(
        itemCount: orderList.cartItem.length,
        itemBuilder: (BuildContext context, int index) {
          return OrderItems(order: orderList.cartItem[index]);
        },
      ),
      drawer: const Drawer(
        child: AppDrawer(),
      ),
    );
  }
}
