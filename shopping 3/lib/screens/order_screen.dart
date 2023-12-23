import 'package:flutter/material.dart';
import '../screens/app_drawer.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);
  static const routeName = '/OrderPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: const Center(child: Text('No')),
      drawer: const Drawer(
        child: AppDrawer(),
      ),
    );
  }
}
