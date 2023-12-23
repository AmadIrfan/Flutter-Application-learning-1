import 'package:flutter/material.dart';
import 'package:newapp/meal_item.dart';
import './model/dummy_meal.dart';

class ItemScreenDetail extends StatelessWidget {
  static const String routeName = 'itemDetailScreen';

  const ItemScreenDetail({super.key});
  @override
  Widget build(BuildContext context) {
    final detail =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final catId = detail['id'].toString();
    final catTitle = detail['title'].toString();
    final catDataList = dummyMeals.where((meal) {
      return meal.categories.contains(catId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: catDataList[index].id,
              imageUrl: catDataList[index].imageUrl,
              title: catDataList[index].title,
              duration: catDataList[index].duration,
              affordability: catDataList[index].affordability,
              complexity: catDataList[index].complexity);
        },
        itemCount: catDataList.length,
      ),
    );
  }
}
