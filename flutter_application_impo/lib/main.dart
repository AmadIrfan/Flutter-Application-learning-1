import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import './screen/user_product_screen.dart';
import './screen/order_screen.dart';
import './provider/order.dart';
import './widget/view_item_detail.dart';
import './provider/cart.dart';
import './screen/Product_Overview_Screen.dart';
import './provider/product_provider.dart';
import './screen/cart_screen.dart';
import './screen/User_Edit_Product.dart';

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
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Order(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My shop',
        initialRoute: '/',
        routes: {
          '/': (context) => const ProductScreenOverview(),
          ItemViewDetail.routeName: (context) => const ItemViewDetail(),
          CartItemsScreen.routeName: (context) => const CartItemsScreen(),
          OrderScreen.routeName: (context) => const OrderScreen(),
          UserProductScreen.routeName: (context) => const UserProductScreen(),
          UseEditProducts.routeName: (context) => const UseEditProducts(),
        },
      ),
    );
  }
}
