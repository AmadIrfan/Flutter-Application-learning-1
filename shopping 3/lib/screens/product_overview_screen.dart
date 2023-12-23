import 'package:flutter/material.dart';
import 'package:online1/provider/Cart_item.dart';
import 'package:online1/widget/badge.dart';
import 'package:provider/provider.dart';

import '../screens/cart_screen.dart';
import '../screens/app_drawer.dart';
import '../screens/GridView_Screen.dart';

enum FilterItems {
  all,
  favorite,
}

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var isFavorite = false;
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CartItemsContainer>(context).cartLength;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        actions: [
          Badge(
            value: data.toString(),
            color: Colors.orange,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
          PopupMenuButton(
              onSelected: (FilterItems value) {
                if (value == FilterItems.favorite) {
                  setState(() {
                    isFavorite = true;
                  });
                } else {
                  setState(() {
                    isFavorite = false;
                  });
                }
              },
              itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: FilterItems.all,
                      child: Text('All Items'),
                    ),
                    const PopupMenuItem(
                        value: FilterItems.favorite,
                        child: Text('Only Favorite'))
                  ])
        ],
      ),
      body: GridViewScreen(
        isFavorite: isFavorite,
      ),
      drawer: const Drawer(child: AppDrawer()),
    );
  }
}
