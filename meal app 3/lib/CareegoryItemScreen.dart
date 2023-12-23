import 'package:flutter/material.dart';
import './Dummy_category.dart';
import 'itemScreen.dart';

class CategoryitemScreen extends StatelessWidget {
  const CategoryitemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routDetail =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    final mealFinder = DUMMY_MEALS.where((element) {
      return element.categories.contains(routDetail['id']);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: routDetail['color'] as Color,
        title: Text(routDetail['title'].toString()),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ItemScreen(
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
