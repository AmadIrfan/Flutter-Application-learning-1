import 'package:flutter/material.dart';
import 'package:prper_provider_app/windows/home_page.dart';
import 'package:prper_provider_app/windows/user_view_product.dart';
import 'package:prper_provider_app/windows/view_orders.dart';

class Drawes extends StatelessWidget {
  const Drawes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: const StadiumBorder(),
          child: ListTile(
            leading: const Icon(Icons.home),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyHomePage(),
                ),
              );
            },
            title: const Text("Home"),
          ),
        ),
        Card(
          shape: const StadiumBorder(),
          child: ListTile(
            leading: const Icon(Icons.shopify),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: ((context) => const ViewOrders()),
                ),
              );
            },
            title: const Text("order"),
          ),
        ),
        Card(
          shape: const StadiumBorder(),
          child: ListTile(
            leading: const Icon(Icons.add),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: ((context) => const UserViewProduct()),
                ),
              );
            },
            title: const Text("Add Product"),
          ),
        ),
      ],
    );
  }
}
