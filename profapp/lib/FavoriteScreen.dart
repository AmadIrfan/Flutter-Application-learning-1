import 'package:flutter/material.dart';
import './meal.dart';
import './itemScreen.dart';

class FavroiteScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;
  const FavroiteScreen({Key? key, required this.favoriteMeal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return const Center(
        child: Text('FavScreen empty'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ItemScreen(
              id: favoriteMeal[index].id,
              title: favoriteMeal[index].title,
              imageUrl: favoriteMeal[index].imageUrl,
              duration: favoriteMeal[index].duration,
              complexity: favoriteMeal[index].complexity,
              affordability: favoriteMeal[index].affordability);
        },
        itemCount: favoriteMeal.length,
      );
    }
  }
}
