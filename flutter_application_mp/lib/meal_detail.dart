import 'package:flutter/Material.dart';
import 'package:flutter/material.dart';
import './Dummy_Category.dart';

class MealDetail extends StatelessWidget {
  const MealDetail({Key? key}) : super(key: key);
  Widget constainer(String text) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(25)),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget BuildContainer(Widget child) {
    return Container(
      height: 200,
      width: 350,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(15)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealArgu =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final _selectedMeal = DUMMY_MEALS.firstWhere(
      (element) => element.id == mealArgu['id'].toString(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: double.infinity,
                height: 300,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    fit: BoxFit.cover,
                    _selectedMeal.imageUrl,
                    width: double.infinity,
                  ),
                )),
            constainer('Ingredients'),
            BuildContainer(
              ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Theme.of(context).primaryColor,
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      _selectedMeal.ingredients[index],
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  );
                },
                itemCount: _selectedMeal.ingredients.length,
              ),
            ),
            constainer('Steps'),
            BuildContainer(
              ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(
                          _selectedMeal.steps[index],
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 8, 8, 8)),
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                },
                itemCount: _selectedMeal.steps.length,
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(mealArgu['id'].toString());
        },
      ),
    );
  }
}
