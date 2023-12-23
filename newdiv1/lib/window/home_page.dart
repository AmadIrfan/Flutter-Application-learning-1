import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_item_model.dart';
import '../widget/badge.dart';
import '../window/add_product.dart';
import '../window/cart.dart';
import '../window/grid_view.dart';
import '../window/drawer.dart';

enum FilterScreen {
  all,
  favorite,
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Shop"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                AddProduct.routName,
              );
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
          Badge(
            value: Provider.of<CartItemsList>(context).getLength.toString(),
            color: const Color.fromARGB(255, 14, 255, 243),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  CartScreen.routName,
                );
              },
              icon: const Icon(
                Icons.shopping_cart,
              ),
            ),
          ),
          PopupMenuButton(
            onSelected: (filterValue) {
              if (filterValue == FilterScreen.favorite) {
                setState(() {
                  _isFavorite = true;
                });
              } else {
                setState(() {
                  _isFavorite = false;
                });
              }
            },
            itemBuilder: ((context) => [
                  const PopupMenuItem(
                    value: FilterScreen.all,
                    child: Text("All Items"),
                  ),
                  const PopupMenuItem(
                    value: FilterScreen.favorite,
                    child: Text("Favorite Items"),
                  )
                ]),
          ),
        ],
      ),
      body: GridViews(
        isFavorite: _isFavorite,
      ),
      drawer: const Drawer(
        child: Drawers(),
      ),
    );
  }
}
