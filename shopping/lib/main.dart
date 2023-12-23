import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/view_product_screen.dart';
import '../screens/add_products.dart';
import '../provider/cart.dart';
import '../provider/order.dart';
import '../screens/cart_screen.dart';
import '../screens/order_screen.dart';
import '../provider/product_data.dart';
import '../screens/new_page_screen.dart';
import '../screens/spleash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => OrderList()),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductsData(),
        ),
        ChangeNotifierProvider(
          create: ((context) => Cart()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Shop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          // accentColor: Colors.deepOrange,
        ),
        home: const SplashScreen(),
        //  const HomeScreen(),
        routes: {
          NewPageScreen.routName: (context) => const NewPageScreen(),
          CartScreen.routName: (context) => const CartScreen(),
          OrderScreen.routName: (context) => const OrderScreen(),
          AddProductScreen.routeName: (context) => const AddProductScreen(),
          ViewProductScreen.routeName: (context) => const ViewProductScreen(),
        },
      ),
    );
  }
}
