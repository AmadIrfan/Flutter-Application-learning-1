import 'package:flutter/material.dart';
import './Fav_Screen.dart';
import './category_screen.dart';
import './MainDrawer.dart';

class TabScreens extends StatefulWidget {
  const TabScreens({Key? key}) : super(key: key);

  @override
  State<TabScreens> createState() => _TabScreensState();
}

class _TabScreensState extends State<TabScreens> {
  final List<Map<String, dynamic>> _page = [
    {'page': const CategoryScreenItem(), 'title': 'CategoryScreenItem'},
    {'page': const FavScreen(), 'title': 'Favroite'},
  ];

  int _onTabBottomIndex = 0;

  void _onBottomTab(int index) {
    setState(() {
      _onTabBottomIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_page[_onTabBottomIndex]['title']),
      ),
      body: _page[_onTabBottomIndex]['page'],
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          onTap: _onBottomTab,
          currentIndex: _onTabBottomIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favoruite')
          ]),
    );
  }
}









// class TabScreens extends StatefulWidget {
//   const TabScreens({Key? key}) : super(key: key);

//   @override
//   State<TabScreens> createState() => _TabScreensState();
// }

// class _TabScreensState extends State<TabScreens> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       initialIndex: 0,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Meal'),
//           bottom: const TabBar(tabs: [
//             Tab(
//               text: 'Category',
//               icon: Icon(Icons.category),
//             ),
//             Tab(
//               text: 'fav',
//               icon: Icon(Icons.star),
//             )
//           ]),
//         ),
//         body: const TabBarView(children: [CategoryScreenItem(), FavScreen()]),
//       ),
//     );
//   }
// }
