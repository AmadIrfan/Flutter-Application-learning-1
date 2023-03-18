import 'package:flutter/Material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_mp/meal.dart';
import './Dummy_Category.dart';
import './meal_item.dart';

class CategoryScreenMeal extends StatefulWidget {
  final List<Meal> meals;
  const CategoryScreenMeal({Key? key, required this.meals}) : super(key: key);

  @override
  State<CategoryScreenMeal> createState() => _CategoryScreenMealState();
}

class _CategoryScreenMealState extends State<CategoryScreenMeal> {
  String title = '';
  String id = '';
  Color color = Colors.red;
  List<Meal> mealFinder = [];
  var _loadInitData = false;
  @override
  void didChangeDependencies() {
    if (!_loadInitData) {
      final routeArugs =
          ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
      title = routeArugs['title'].toString();
      color = routeArugs['color'] as Color;
      mealFinder = widget.meals.where((element) {
        return element.categories.contains(routeArugs['id'].toString());
      }).toList();
      _loadInitData = true;
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  void _deleteItem(String id) {
    setState(() {
      mealFinder.removeWhere((element) {
        return element.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: color,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return MealItems(
              deleteItem: _deleteItem,
              id: mealFinder[index].id,
              title: mealFinder[index].title,
              imageUrl: mealFinder[index].imageUrl,
              duration: mealFinder[index].duration,
              complexity: mealFinder[index].complexity,
              affordability: mealFinder[index].affordability);
        },
        itemCount: mealFinder.length,
      ),
    );
  }
}
