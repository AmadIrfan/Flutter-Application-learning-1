import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/cart_screen.dart';
import '../provider/cart.dart';
import '../screens/drawer_screen.dart';
import '../widgets/badge.dart';
import '../widgets/grid_view.dart';

enum FilterSelect {
  all,
  favorite,
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Grid App'),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: ((context) => GestureDetector(
                      onTap: () {},
                      child: Container(),
                    )),
              );
            },
            icon: const Icon(Icons.add),
          ),
          Badge(
            value: cartData.getLengthOfCart.toString(),
            color: Colors.green,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routName);
              },
              icon: const Icon(Icons.shopping_bag),
            ),
          ),
          PopupMenuButton(
              onSelected: (value) {
                if (value == FilterSelect.all) {
                  setState(() {
                    isFav = false;
                  });
                } else {
                  setState(() {
                    isFav = true;
                  });
                }
              },
              itemBuilder: ((_) => const [
                    PopupMenuItem(
                      value: FilterSelect.favorite,
                      child: Text('Only Favorite '),
                    ),
                    PopupMenuItem(
                      value: FilterSelect.all,
                      child: Text('All Meals'),
                    ),
                  ]),
              icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: GView(
        isFav: isFav,
      ),
      drawer: const Drawer(
        child: HomeDrawer(),
      ),
    );
  }
}
