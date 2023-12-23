import 'package:flutter/material.dart';
import 'package:online1/screens/product_edit_screen.dart';
import 'package:online1/widget/user_product_item.dart';

import '../screens/app_drawer.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({Key? key}) : super(key: key);
  static const routeName = '/userProductScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(ProductEditScreen.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: const UserProductItems(),
      drawer: const Drawer(
        child: AppDrawer(),
      ),
    );
  }
}
