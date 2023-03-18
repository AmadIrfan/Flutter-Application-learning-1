import 'package:flutter/material.dart';
import 'package:new1/Screens/meal_tem.dart';
import 'package:new1/model/Dummy_Data.dart';
import 'Screens/tabScreen.dart';
import 'Screens/Filter_screen.dart';
import './Screens/category_Meals_Screen.dart';
import './Screens/category_item.dart';
import './Screens/meal_tem.dart';
import './Screens/meal_item_detail.dart';
import './model/meal.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'isGlutenFree': false,
    'isVegan': false,
    'isVegetarian': false,
    "isLactoseFree": false,
  };

  List<Meal> _availableMeal = DUMMY_MEALS;
  List<Meal> _isFavoriteMeal = [];
  void _setFilters(Map<String, bool> updateFilters) {
    setState(() {
      _filters = updateFilters;

      _availableMeal = DUMMY_MEALS.where((element) {
        if (_filters['isGlutenFree'] as bool && !element.isGlutenFree) {
          return false;
        }
        if (_filters['isVegan'] as bool && !element.isVegan) {
          return false;
        }
        if (_filters['isVegetarian'] as bool && !element.isVegetarian) {
          return false;
        }
        if (_filters["isLactoseFree"] as bool && !element.isLactoseFree) {
          return false;
        } else {
          return true;
        }
      }).toList();
    });
  }

  void _isFavroiteToggle(String id) {
    final favIndex = _isFavoriteMeal.indexWhere((element) {
      return element.id == id;
    });
    if (favIndex >= 0) {
      setState(() {
        _isFavoriteMeal.removeAt(favIndex);
      });
    } else {
      setState(() {
        _isFavoriteMeal
            .add(DUMMY_MEALS.firstWhere((element) => element.id == id));
      });
    }
  }

  bool _isFavr(String id) {
    return _isFavoriteMeal.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal',
      //  home: ,
      initialRoute: '/',
      routes: {
        '/': (context) => TabScreen(favList: _isFavoriteMeal),
        FilterScreen.filterRout: (context) =>
            FilterScreen(currentFilters: _filters, updateFilters: _setFilters),
        CategoryItem.idBasedItems: (context) => CategoryMealsScreen(
              avaliableMeal: _availableMeal,
            ),
        MealItem.MealItemDetail: (context) =>
            MealItemDetail(favoriteMeal: _isFavroiteToggle, isFavr: _isFavr),
      },
    );
  }
}
