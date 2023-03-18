import 'package:flutter/material.dart';
import 'fav_screen.dart';
import '../Drawer.dart';
import './Categories.dart';
import '../model/meal.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favList;
  const TabScreen({Key? key, required this.favList}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _tabBarIndex = 0;
  late List<Map<String, dynamic>> _page;
  @override
  void initState() {
    _page = [
      {'page': const Categories(), 'title': 'Meal App '},
      {
        'page': FavScreen(
          isFavMeal: widget.favList,
        ),
        'title': 'Favorite'
      }
    ];
    super.initState();
  }

  void _onTopBottomBar(int index) {
    setState(() {
      _tabBarIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_page[_tabBarIndex]['title'].toString()),
      ),
      drawer: const Drawer(
        child: Drawers(),
      ),
      body: _page[_tabBarIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          onTap: _onTopBottomBar,
          selectedItemColor: Colors.white,
          currentIndex: _tabBarIndex,
          items: const [
            BottomNavigationBarItem(label: 'Meals', icon: Icon(Icons.category)),
            BottomNavigationBarItem(label: 'Favorite', icon: Icon(Icons.star))
          ]),
    );
  }
}
