import 'package:flutter/material.dart';
import 'package:newdiv1/models/cart_item_model.dart';
import 'package:newdiv1/models/product_data.dart';
import 'package:newdiv1/widget/pages.dart';
import 'package:newdiv1/window/add_product.dart';
import 'package:newdiv1/window/cart.dart';
import 'package:newdiv1/window/drawer.dart';
import 'package:newdiv1/window/order_screen.dart';

// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

import './window/home_page.dart';

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
          create: ((context) => ProductsData()),
        ),
        ChangeNotifierProvider(
          create: (context) => CartItemsList(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Shop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
        routes: {
          Pages.routeName: (context) => const Pages(),
          AddProduct.routName: (context) => const AddProduct(),
          Drawers.routName: (context) => const Drawers(),
          CartScreen.routName: (context) => const CartScreen(),
          OrderScreen.routName: (context) => const OrderScreen(),
        },
      ),
    );
  }
}
