import 'package:flutter/material.dart';
import 'package:newapp/itemScreenDetail.dart';
import 'package:newapp/meal_items_details.dart';
import 'my_shopping_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyShoppingApp(),
      debugShowCheckedModeBanner: false,
      title: "My Shopping Food App",

      routes: {
        // '/': (context) => const MyShoppingApp(),
        ItemScreenDetail.routeName: (context) => const ItemScreenDetail(),
        MealItemDetails.routeName: (context) => const MealItemDetails()
      },
      // initialRoute: '/',
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const MyShoppingApp(),
        );
      },
    );
  }
}
