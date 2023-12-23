import 'package:appy/screen/product_overview_secreen.dart';
import 'package:flutter/material.dart';
import '../screen/Order_screen.dart';
import '../screen/user_product_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).primaryColor,
          //   margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
          //       width: double.infinity,
          height: 200,
          child: const Text(
            'Welcome to AAI Shop',
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ListTile(
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(ProductOverviewScreen.routeName);
          },
          leading: const Icon(
            Icons.shopping_cart_sharp,
            size: 40,
            color: Colors.black,
          ),
          title: const Text(
            'AAI Shop',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(OrderItemScreen.routeName);
          },
          leading: const Icon(
            Icons.payment,
            size: 40,
            color: Colors.black,
          ),
          title: const Text(
            'Your Order ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(UserProductScreen.routeName);
          },
          leading: const Icon(
            Icons.shop,
            size: 40,
            color: Colors.black,
          ),
          title: const Text(
            'Your Items ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
