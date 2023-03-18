import 'package:flutter/material.dart';
import 'package:profapp/itemScreen.dart';
import 'package:profapp/meal.dart';
import 'Tab_Bar_Screen.dart';
import './CategoryItem.dart';
import 'CareegoryItemScreen.dart';
import './itemDetailScreen.dart';
import 'filterScreen.dart';
import 'Dummy_category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _favoriteMeal = [];

  Map<String,bool> _filters={ isGlutenFree: true,
    'isVegan': true,
    isVegetarian: true,
    isLactoseFree: true,};

  void _isFavdToggle(String id) {
    final favindex = _favoriteMeal.indexWhere((element) {
      return element.id == id;
    });
    print(favindex);

    if (favindex >= 0) {
      setState(() {
        _favoriteMeal.removeAt(favindex);
      });
    } else {
      setState(() {
        _favoriteMeal
            .add(DUMMY_MEALS.firstWhere((element) => element.id == id));
      });
    }
  }

  bool _isInFavdList(String id) {
    return _favoriteMeal.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'myApp',
      debugShowCheckedModeBanner: false,
      //home: ,
      routes: {
        '/': (context) => TabBarScreen(favMeal: _favoriteMeal),
        CategoryItem.routeName: ((context) => const CategoryitemScreen()),
        ItemScreen.mealRout: (context) => ItemDetailScreen(
              favoriteMeal: _isFavdToggle,
              isFav: _isInFavdList,
            ),
        FilterScreen.filterRout: (context) => const FilterScreen()
      },
      initialRoute: '/',
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => TabBarScreen(favMeal: _favoriteMeal),
        );
      },
      onGenerateRoute: (settinges) {
        return MaterialPageRoute(
            builder: (context) => TabBarScreen(favMeal: _favoriteMeal));
      },
    );
  }
}
