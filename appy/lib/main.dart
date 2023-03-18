import 'package:appy/provider/auth.dart';
import 'package:appy/provider/product.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import './provider/order.dart';
import '../provider/Product_provider.dart';
import './screen/product_overview_secreen.dart';
import './provider/cart.dart';
import './screen/cart_screen.dart';
import './widget/view_item_detail.dart';
import './screen/Order_screen.dart';
import './screen/user_product_screen.dart';
import './screen/Product_edit_screen.dart';
import './screen/auth_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => Auth())),
        ChangeNotifierProvider(
          create: ((context) => Order()),
        ),
        ChangeNotifierProvider<Products>(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: ((context) => Cart()),
        ),
      ],
      child: Consumer<Auth>(
        builder: (context, auth, ch) => MaterialApp(
          title: 'My Shop',
          debugShowCheckedModeBanner: false,
          home: auth.isAuth ? const ProductOverviewScreen() : AuthScreen(),
          routes: {
            ProductOverviewScreen.routeName: (context) =>
                const ProductOverviewScreen(),
            CartScreen.routName: (context) => const CartScreen(),
            ViewItemDetail.routeName: (context) => const ViewItemDetail(),
            OrderItemScreen.routeName: (context) => const OrderItemScreen(),
            UserProductScreen.routeName: (context) => const UserProductScreen(),
            ProductEditScreen.routeName: (context) => const ProductEditScreen(),
          },
        ),
      ),
    );
  }
}
