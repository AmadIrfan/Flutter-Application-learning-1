import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/drawer_screen.dart';
import '../widgets/order_list.dart';
import '../provider/order.dart';

class OrderScreen extends StatefulWidget {
  static const routName = 'routeOrderPage';

  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final lisrOrder = Provider.of<OrderList>(context).order;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Page'),
      ),
      body: Wrap(
        children: lisrOrder
            .map(
              (e) => OrderLists(
                  amunt: e.amunt, dateTime: e.dateTime, product: e.product),
            )
            .toList(),
      ),
      drawer: const Drawer(
        child: HomeDrawer(),
      ),
    );
  }
}
