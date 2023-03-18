import 'package:flutter/material.dart';

import '../screens/order_screen.dart';
import '../screens/user_product_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  Widget _listTileCreator(String title, IconData icon, Function onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(5),
        ),
        child: ListTile(
          onTap: () => onTap(),
          leading: Icon(
            icon,
            color: Colors.black,
            size: 40,
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).primaryColor,
          width: double.infinity,
          height: 250,
          padding: const EdgeInsets.symmetric(vertical: 80),
          child: const Text(
            'AAI Shop',
            style: TextStyle(fontSize: 50, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        const Divider(
          height: 20,
        ),
        _listTileCreator(
          'AAI Shop',
          Icons.shopping_bag_outlined,
          () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        _listTileCreator(
          'Orders',
          Icons.payment_outlined,
          () {
            Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
          },
        ),
        _listTileCreator(
          'Your Products',
          Icons.shop,
          () {
            Navigator.of(context)
                .pushReplacementNamed(UserProductScreen.routeName);
          },
        ),
      ],
    );
  }
}
