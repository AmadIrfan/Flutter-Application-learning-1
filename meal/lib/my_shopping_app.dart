import 'package:flutter/material.dart';

import 'package:newapp/CategoryScreen.dart';
import 'package:newapp/favorite_Page.dart';

class MyShoppingApp extends StatefulWidget {
  const MyShoppingApp({super.key});

  @override
  State<MyShoppingApp> createState() => _MyShoppingAppState();
}

class _MyShoppingAppState extends State<MyShoppingApp> {
  var index = 0;
  final List _pages = [
    {'page': const CategoryScreen(), 'name': "My Foods"},
    {'page': const FavoritePage(), 'name': "Favorite Foods"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[400],
      appBar: AppBar(
        title: Text(
          _pages[index]['name'].toString(),
        ),
        centerTitle: true,
      ),
      body: _pages[index]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        // mouseCursor: MouseCursor.defer,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Theme.of(context).primaryColor,
        onTap: (indi) {
          setState(() {
            index = indi;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.category),
            label: 'Category',
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: 'Favorite',
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
