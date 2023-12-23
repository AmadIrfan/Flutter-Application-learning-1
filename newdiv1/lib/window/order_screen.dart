import 'package:flutter/material.dart';

import 'drawer.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  static const routName = '/AddPrder';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("order"),
      ),
      body: Column(
        children: const [
          Center(
            child: Text('Order Screen'),
          ),
        ],
      ),
      drawer: const Drawer(
        child: Drawers(),
      ),
    );
  }
}
