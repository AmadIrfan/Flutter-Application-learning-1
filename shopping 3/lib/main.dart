import 'package:flutter/material.dart';
import 'package:online1/screens/auth_screen.dart';
import 'package:online1/screens/cart_screen.dart';
import 'package:online1/screens/product_detail_screen.dart';
import 'package:online1/screens/product_edit_screen.dart';
import 'package:provider/provider.dart';

import './provider/Cart_item.dart';
import 'package:online1/screens/order_screen.dart';
import 'package:online1/screens/user_product_screen.dart';
import './provider/products_list.dart';
import './screens/product_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => ProductsData()),
        ),
        ChangeNotifierProvider(
          create: ((context) => CartItemsContainer()),
        ),
      ],
      child: MaterialApp(
        home: AuthScreen(),
        // initialRoute: '/',
        routes: {
          //  '/': (context) => const ProductOverviewScreen(),
          ProductDetailScreen.routeName: (context) =>
              const ProductDetailScreen(),
          ProductEditScreen.routeName: (context) => const ProductEditScreen(),
          OrderScreen.routeName: (context) => const OrderScreen(),
          UserProductScreen.routeName: (context) => const UserProductScreen(),
          CartScreen.routeName: (context) => const CartScreen(),
        },
      ),
    );
  }
}
