import 'package:flutter/material.dart';
import '../model/meal.dart';
import './meal_tem.dart';

class FavScreen extends StatelessWidget {
  final List<Meal> isFavMeal;
  const FavScreen({Key? key, required this.isFavMeal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isFavMeal.isEmpty) {
      return const Center(
        child: Text('FavScreen empty'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return MealItem(
            affordability: isFavMeal[index].affordability,
            imageUrl: isFavMeal[index].imageUrl,
            complexity: isFavMeal[index].complexity,
            duration: isFavMeal[index].duration,
            title: isFavMeal[index].title,
            id: isFavMeal[index].id,
          );
        },
        itemCount: isFavMeal.length,
      );
    }
  }
}
