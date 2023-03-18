import 'package:flutter/material.dart';
import 'meal.dart';

class ItemScreen extends StatelessWidget {
  final String title;
  final String id;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  // final Function deleteItem;
  static const mealRout = '/mealRout';

  const ItemScreen({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  }) : super(key: key);

  Widget _detailsAndIcon(String name, IconData? icon) {
    return Row(children: [
      Icon(icon),
      const SizedBox(
        width: 5,
      ),
      Text(name),
    ]);
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
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable ';
      case Affordability.Luxurious:
        return 'Luxurious ';
      case Affordability.Pricey:
        return 'Pricey ';
      default:
        return 'Unknown ';
    }
  }

  void _ontop(BuildContext context) {
    Navigator.of(context).pushNamed(mealRout, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _ontop(context),
      splashColor: Theme.of(context).primaryColor,
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              margin: const EdgeInsets.all(10),
              child: Stack(children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image.network(
                    imageUrl,
                    scale: 1,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    height: 250,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: const BoxDecoration(color: Colors.black54),
                    child: Text(
                      title,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _detailsAndIcon('$duration min', Icons.schedule),
                  _detailsAndIcon(complexityText, Icons.work),
                  _detailsAndIcon(affordabilityText, Icons.attach_money),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
