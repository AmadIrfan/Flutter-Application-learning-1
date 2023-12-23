import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  final Function updateFilters;
  final Map<String, bool> currentFilters;
  const FilterScreen(
      {Key? key, required this.updateFilters, required this.currentFilters})
      : super(key: key);
  static const filterRout = 'filterRout';
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var isGlutenFree = false;
  var isVegan = false;
  var isVegetarian = false;
  var isLactoseFree = false;
  @override
  void initState() {
    isGlutenFree = widget.currentFilters['isGlutenFree'] as bool;
    isVegan = widget.currentFilters['isVegan'] as bool;
    isVegetarian = widget.currentFilters['isVegetarian'] as bool;
    isLactoseFree = widget.currentFilters['isLactoseFree'] as bool;
    super.initState();
  }

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
            onPressed: () {
              final filters = {
                'isGlutenFree': isGlutenFree,
                'isVegan': isVegan,
                'isVegetarian': isVegetarian,
                "isLactoseFree": isLactoseFree,
              };
              widget.updateFilters(filters);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Column(
        children: [
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
              'GlutenFree', 'This Meal Contain only GlutenFree', isGlutenFree,
              (value) {
            setState(() {
              isGlutenFree = value;
            });
          }),
          _creatListTile('Vegan', 'This Meal Contain only Vegan', isVegan,
              (value) {
            setState(() {
              isVegan = value;
            });
          }),
          _creatListTile('LactoseFree', 'This Meal Contain only LactoseFree',
              isLactoseFree, (value) {
            setState(() {
              isLactoseFree = value;
            });
          }),
          _creatListTile(
              'Vegetarian', 'This Meal Contain only Vegetarian', isVegetarian,
              (value) {
            setState(() {
              isVegetarian = value;
            });
          }),
        ],
      ),
    );
  }
}
