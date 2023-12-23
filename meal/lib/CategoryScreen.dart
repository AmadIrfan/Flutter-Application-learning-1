import 'package:flutter/material.dart';
import 'package:newapp/categoryScreenItem.dart';
import './model/dummy_meal.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        childAspectRatio: 3 / 2,
        mainAxisExtent: 150,
        crossAxisSpacing: 20,
        maxCrossAxisExtent: MediaQuery.of(context).size.width * 1,
      ),
      children: Dummy_meals.map(
        (e) {
          return CategoryScreenItem(
            color: e.color,
            id: e.id,
            name: e.title,
          );
        },
      ).toList(),
    );
  }
}
