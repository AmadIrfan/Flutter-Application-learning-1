import 'dart:ffi';

import 'package:flutter/material.dart';
import '../model/Dummy_Data.dart';

class MealItemDetail extends StatelessWidget {
  final Function favoriteMeal;
  final Function isFavr;

  MealItemDetail({required this.favoriteMeal, required this.isFavr});

  Widget nameContainerDesigner(String name) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          border: Border.all(width: 2)),
      alignment: Alignment.center,
      child: Text(
        name,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routId = ModalRoute.of(context)?.settings.arguments as String;
    final findMealItemDetail =
        DUMMY_MEALS.firstWhere((element) => element.id == routId);
    return Scaffold(
      appBar: AppBar(
        title: Text(findMealItemDetail.title),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  findMealItemDetail.imageUrl.toString(),
                  scale: 1,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            nameContainerDesigner('Ingredients'),
            Container(
              width: 300,
              height: 200,
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: ListView.builder(
                itemCount: findMealItemDetail.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        findMealItemDetail.ingredients[index],
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            nameContainerDesigner(" Steps "),
            Container(
              width: 300,
              height: 200,
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '#${index + 1} : ${findMealItemDetail.steps[index]} ',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  );
                },
                itemCount: findMealItemDetail.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => favoriteMeal(routId),
        child: Icon(isFavr(routId) ? Icons.star : Icons.star_border),
      ),
    );
  }
}
