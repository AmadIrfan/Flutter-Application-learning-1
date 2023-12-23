import 'package:flutter/material.dart';
import 'package:profapp/meal.dart';
import 'FavoriteScreen.dart';
import 'categoryScreen.dart';
import './main_drawer.dart';

class TabBarScreen extends StatefulWidget {
  final List<Meal> favMeal;
  const TabBarScreen({Key? key, required this.favMeal}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  late List<Map<String, dynamic>> _page;
  var _pageIndex = 0;
  void _ontab(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  void initState() {
    _page = [
      {'page': const CategoryScreen(), 'title': 'Meal App'},
      {
        'page': FavroiteScreen(favoriteMeal: widget.favMeal),
        'title': 'Favroite Screen'
      }
    ];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_page[_pageIndex]['title'].toString()),
      ),
      drawer: const Drawer(child: MainDrawer()),
      body: _page[_pageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _pageIndex,
          onTap: _ontab,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(label: 'Meals', icon: Icon(Icons.category)),
            BottomNavigationBarItem(
                label: 'Favorite', icon: Icon(Icons.favorite))
          ]),
    );
  }
}
