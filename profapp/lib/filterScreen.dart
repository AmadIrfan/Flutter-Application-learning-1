import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);
  static const filterRout = 'filterRout';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var isGlutenFree = false;
  var isVegan = false;
  var isVegetarian = false;
  var isLactoseFree = false;
  Widget _creatListTile(
      String text, String subtext, bool val, Function(bool)? onchanged) {
    return SwitchListTile(
      value: val,
      onChanged: onchanged,
      title: Text(text),
      subtitle: Text(subtext),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(
            onPressed: (() {}),
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Column(children: [
        Container(
          width: double.infinity,
          //height: 50,
          padding: const EdgeInsets.all(10),
          child: const Text(
            ' Filters ',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        _creatListTile(
            'GlutenFree', 'This Meal D\'t contain GlutenFree', isGlutenFree,
            (value) {
          setState(() {
            isGlutenFree = value;
          });
        }),
        _creatListTile(
            'LactoseFree', 'This Meal D\'t contain LactoseFree', isLactoseFree,
            (value) {
          setState(() {
            isLactoseFree = value;
          });
        }),
        _creatListTile(
            'Vegetarian', 'This Meal D\'t contain Vegetarian', isVegetarian,
            (value) {
          setState(() {
            isVegetarian = value;
          });
        }),
        _creatListTile('Vegan', 'This Meal D\'t contain Vegan', isVegan,
            (value) {
          setState(() {
            isVegan = value;
          });
        }),
      ]),
    );
  }
}
