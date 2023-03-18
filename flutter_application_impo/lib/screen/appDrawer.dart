import 'package:flutter/material.dart';
import 'package:flutter_application_impo/screen/order_screen.dart';
import 'package:flutter_application_impo/screen/user_product_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
          decoration: const BoxDecoration(color: Colors.blue),
          width: double.infinity,
          child: const Text(
            'Wellcome AAI Shop',
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
          leading: const Icon(
            Icons.shopping_cart,
            size: 25,
          ),
          title: const Text('AAI Shop'),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
          },
          leading: const Icon(
            Icons.shopping_cart,
            size: 25,
          ),
          title: const Text('Order'),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(UserProductScreen.routeName);
          },
          leading: const Icon(
            Icons.shopping_cart,
            size: 25,
          ),
          title: const Text('Your Products'),
        ),
      ],
    );
  }
}
