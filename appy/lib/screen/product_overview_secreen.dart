import 'package:appy/provider/Product_provider.dart';
import 'package:appy/provider/cart.dart';
import 'package:appy/screen/appDrwar.dart';
import 'package:appy/widget/badge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'gridView_screen.dart';
import './cart_screen.dart';

enum FilterSelector {
  favorite,
  all,
}

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({Key? key}) : super(key: key);
  static const routeName = '/overviewScreen';
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _isFavroite = false;
  bool inIt = true;
  bool _isLoading = false;

  void onTab(BuildContext context) {
    Navigator.of(context).pushNamed(CartScreen.routName);
  }

  @override
  void didChangeDependencies() {
    if (inIt) {
      setState(() {
        _isLoading = true;
      });
      try {
        Provider.of<Products>(context).getDataFromServer().then((_) {
          setState(() {
            _isLoading = false;
          });
        });
      } catch (error) {
        throw Exception(error);
      }
    }
    inIt = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: [
          Consumer<Cart>(
              builder: (context, cart, chi) => Badge(
                    value: cart.cartLength.toString(),
                    color: Colors.orange,
                    child: IconButton(
                      onPressed: () => onTab(context),
                      icon: const Icon(
                        Icons.shopping_cart,
                      ),
                    ),
                  )),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            onSelected: (FilterSelector value) {
              setState(() {
                if (value == FilterSelector.favorite) {
                  _isFavroite = true;
                } else {
                  _isFavroite = false;
                }
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: FilterSelector.favorite,
                child: Text('only Favorite '),
              ),
              const PopupMenuItem(
                value: FilterSelector.all,
                child: Text('All Items '),
              )
            ],
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridViewScreen(isFavorite: _isFavroite),
      drawer: const Drawer(
        child: AppDrawer(),
      ),
    );
  }
}
