import 'package:flutter/material.dart';
import 'package:flutter_application_mp/Dummy_Category.dart';

import 'category_screen.dart';
import './Category_Screen_Meal.dart';
import './Category_item.dart';
import './meal_item.dart';
import './meal_detail.dart';
import './Tab_Screens.dart';
import './FilterItem.dart';
import 'meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'Gluten': false,
    'vegan': false,
    'Vegetarian': false,
    'LactoseFree': false,
  };
  List<Meal> _availableMeal = DUMMY_MEALS;

  void _filterSwitch(Map<String, bool> updatedFilter) {
    setState(() {
      _filters = updatedFilter;
      _availableMeal = DUMMY_MEALS.where((element) {
        if ((_filters['Gluten'] as bool) && !element.isGlutenFree) return false;
        if ((_filters['vegan'] as bool) && !element.isVegan) return false;

        if ((_filters['Vegetarian'] as bool) && !element.isVegetarian) {
          return false;
        }
        if ((_filters['LactoseFree'] as bool) && !element.isLactoseFree) {
          return false;
        } else
          return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //  home: const CategoryScreenItem(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => const TabScreens(),
        CategoryItem.screenName: (ctx) =>
            CategoryScreenMeal(meals: _availableMeal),
        MealItems.mealRout: (ctx) => const MealDetail(),
        FiltersItem.routFilter: ((context) =>
            FiltersItem(currentFilters: _filters, updateSitch: _filterSwitch)),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            builder: ((context) => const CategoryScreenItem()));
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: ((context) => const CategoryScreenItem()));
      },
    );
  }
}
