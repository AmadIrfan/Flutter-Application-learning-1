import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prper_provider_app/modal/cart.dart';
import 'package:prper_provider_app/modal/order.dart';
import 'package:prper_provider_app/modal/product.dart';
import 'package:prper_provider_app/windows/add_product.dart';
import 'package:prper_provider_app/windows/cart_screen.dart';
import 'package:prper_provider_app/windows/new_page_screen.dart';

import 'windows/home_page.dart';

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
          create: (context) => ProductDL(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderProduct(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProduct(),
        ),
      ],
      child: MaterialApp(
        title: 'app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          "/": (context) => const MyHomePage(),
          CartScreen.routName: (context) => const CartScreen(),
          AddProducts.routeName: (context) => const AddProducts(),
          NewPageScreen.routName: (context) => const NewPageScreen(),
        },
      ),
    );
  }
}
