import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prper_provider_app/modal/cart.dart';
import 'package:prper_provider_app/widgets/gview.dart';
import 'package:prper_provider_app/windows/badge.dart';
import 'package:prper_provider_app/windows/cart_screen.dart';

import 'drawers.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
            ),
          ),
          Consumer<CartProduct>(
            builder: (context, cart, child) => Badge(
              value: cart.listLength.toString(),
              color: Colors.red,
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    CartScreen.routName,
                  );
                },
                icon: const Icon(
                  Icons.shopping_cart,
                ),
              ),
            ),
          ),
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: (() {
                        setState(() {
                          isFav = true;
                        });
                      }),
                      child: const Text(' Favorite Items'),
                    ),
                    PopupMenuItem(
                      onTap: (() {
                        setState(() {
                          isFav = false;
                        });
                      }),
                      child: const Text(' All Items'),
                    ),
                  ]),
        ],
        title: const Text("App Shop"),
      ),
      body: GView(isFav: isFav),
      drawer: const Drawer(
        child: Drawes(),
      ),
    );
  }
}
