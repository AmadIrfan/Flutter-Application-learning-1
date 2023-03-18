import 'package:flutter/material.dart';
import '../model/meal.dart';

class MealItem extends StatelessWidget {
  static const MealItemDetail = '/MealItemDetail';

  final Affordability affordability;
  final String imageUrl;
  final Complexity complexity;
  final int duration;
  final String title;
  final String id;
  const MealItem(
      {Key? key,
      required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.affordability,
      required this.complexity})
      : super(key: key);

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return 'unknown';
    }
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      case Complexity.Simple:
        return 'Simple';
      default:
        return 'unknown';
    }
  }

  Widget _returnRow(String text, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(text)
      ],
    );
  }

  void _mealItemDetail(BuildContext context) {
    Navigator.of(context).pushNamed(MealItemDetail, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.blue,
      onTap: () => _mealItemDetail(context),
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 5,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    scale: 14.5,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    height: 250,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                    color: Colors.black54,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _returnRow('$duration min', Icons.schedule),
                  _returnRow(complexityText, Icons.work),
                  _returnRow(affordabilityText, Icons.attach_money),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
