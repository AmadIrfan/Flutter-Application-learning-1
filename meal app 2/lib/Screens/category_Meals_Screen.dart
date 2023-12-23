import 'package:flutter/material.dart';
import 'package:new1/model/meal.dart';
import '../model/Dummy_Data.dart';
import '../Screens/meal_tem.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List<Meal> avaliableMeal;
  const CategoryMealsScreen({Key? key, required this.avaliableMeal})
      : super(key: key);
  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> mealList = [];
  String routId = '';
  String routTitle = '';
  final _isIndexStarted = false;
  Color routColor = Colors.black;

  void _deltetItem(String value) {
    setState(() {
      mealList.removeWhere((element) {
        return element.id == value;
      });
    });
  }

  @override
  didChangeDependencies() {
    if (!_isIndexStarted) {
      final itemDetail =
          ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
      routId = itemDetail['id'].toString();
      routTitle = itemDetail['title'].toString();
      routColor = itemDetail['color'] as Color;
      mealList = widget.avaliableMeal.where((item) {
        return item.categories.contains(routId);
      }).toList();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: routColor,
        title: Text(routTitle),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return MealItem(
            affordability: mealList[index].affordability,
            imageUrl: mealList[index].imageUrl,
            complexity: mealList[index].complexity,
            duration: mealList[index].duration,
            title: mealList[index].title,
            id: mealList[index].id,
          );
        },
        itemCount: mealList.length,
      ),
    );
  }
}
