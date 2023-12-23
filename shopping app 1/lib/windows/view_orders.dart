import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prper_provider_app/modal/order.dart';
import 'package:prper_provider_app/widgets/item_builder.dart';
import 'package:prper_provider_app/windows/drawers.dart';

class ViewOrders extends StatefulWidget {
  const ViewOrders({super.key});

  @override
  State<ViewOrders> createState() => _ViewOrdersState();
}

class _ViewOrdersState extends State<ViewOrders> {
  @override
  Widget build(BuildContext context) {
    final listOrder = Provider.of<OrderProduct>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: ListView.builder(
          itemCount: listOrder.length,
          itemBuilder: (BuildContext context, int index) {
            return ChangeNotifierProvider.value(
              value: listOrder[index],
              child: const ItemBuilder(),
            );
          }),
      drawer: const Drawer(
        child: Drawes(),
      ),
    );
  }
}
