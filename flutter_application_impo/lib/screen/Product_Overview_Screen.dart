import 'package:flutter/material.dart';
import 'package:flutter_application_impo/provider/cart.dart';
import 'package:flutter_application_impo/screen/appDrawer.dart';
import 'package:flutter_application_impo/widget/Grid_View.dart';
import '../widget/badge.dart';
import 'package:provider/provider.dart';
import '../screen/cart_screen.dart';
import '../provider/product_provider.dart';

enum FilterSelector {
  favorite,
  all,
}

class ProductScreenOverview extends StatefulWidget {
  const ProductScreenOverview({Key? key}) : super(key: key);

  @override
  State<ProductScreenOverview> createState() => _ProductScreenOverviewState();
}

class _ProductScreenOverviewState extends State<ProductScreenOverview> {
  bool _isfavorite = false;
  bool inIt = true;
  bool isLoading = false;
  @override
  void didChangeDependencies() {
    if (inIt) {
      setState(() {
        isLoading = true;
      });
      Provider.of<Products>(context).getDataFromServer().then((value) {
        setState(() {
          isLoading = false;
        });
      });
    }
    inIt = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final dataLoaded = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('AAI Shop'), actions: [
        Badge(
          value: dataLoaded.listLength.toString(),
          color: Colors.amber,
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartItemsScreen.routeName);
              },
              icon: const Icon(Icons.shopping_cart)),
        ),
        PopupMenuButton(
            onSelected: ((FilterSelector value) {
              setState(() {
                if (FilterSelector.favorite == value) {
                  _isfavorite = true;
                } else {
                  _isfavorite = false;
                }
              });
            }),
            itemBuilder: (context) => const [
                  PopupMenuItem(
                    value: FilterSelector.favorite,
                    child: Text('Favorite Items'),
                  ),
                  PopupMenuItem(
                    value: FilterSelector.all,
                    child: Text('All Items'),
                  ),
                ])
      ]),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridViews(isFavorite: _isfavorite),
      drawer: const Drawer(
        child: AppDrawer(),
      ),
    );
  }
}
