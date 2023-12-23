import 'package:flutter/material.dart';
import 'package:newapp/meal_items_details.dart';
import 'package:newapp/model/meal.dart';
import './model/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.duration,
    required this.affordability,
    required this.complexity,
  });
  final String id;
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  void selectedMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealItemDetails.routeName, arguments: id);
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
      case Complexity.Challenging:
        return "Challenging";
      case Complexity.Hard:
        return "Hard";
      default:
        return "Unknown";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Hero(
                    tag: id,
                    child: Image.network(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 20,
                  child: Container(
                    width: 220,
                    padding: const EdgeInsets.all(10),
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 204, 204, 204),
                        overflow: TextOverflow.fade,
                      ),
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  rowBuilder("$duration min", Icons.schedule),
                  rowBuilder(complexityText, Icons.work),
                  rowBuilder(
                    affordabilityText,
                    Icons.attach_money,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rowBuilder(String text, IconData icon) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 6,
        ),
        Text(text),
      ],
    );
  }
}
