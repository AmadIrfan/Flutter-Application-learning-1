import 'package:flutter/material.dart';

class FiltersItem extends StatefulWidget {
  static const routFilter = '/RoutFilter';
  final Function updateSitch;
  final Map<String, bool> currentFilters;
  const FiltersItem(
      {Key? key, required this.updateSitch, required this.currentFilters})
      : super(key: key);

  @override
  State<FiltersItem> createState() => _FiltersItemState();
}

class _FiltersItemState extends State<FiltersItem> {
  var isGlutenFree = false;
  var isVegan = false;
  var isVegetarian = false;
  var isLactoseFree = false;
  @override
  void initState() {
    isGlutenFree = widget.currentFilters['Gluten'] as bool;
    isVegan = widget.currentFilters['vegan'] as bool;
    isVegetarian = widget.currentFilters['Vegetarian'] as bool;
    isLactoseFree = widget.currentFilters['LactoseFree'] as bool;
    // TODO: implement initState
    super.initState();
  }

  Widget _listTileSwitchs(
      String title, String subtitle, bool values, Function(bool)? onchange) {
    return SwitchListTile.adaptive(
      title: Text(title),
      value: values,
      subtitle: Text(subtitle),
      onChanged: onchange,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters '),
        actions: [
          IconButton(
              onPressed: () {
                Map<String, bool> filters = {
                  'Gluten': isGlutenFree,
                  'vegan': isVegan,
                  'Vegetarian': isVegetarian,
                  'LactoseFree': isLactoseFree,
                };
                widget.updateSitch(filters);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            child: const Text(
              "Filters",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _listTileSwitchs(
                    'LactoseFree', 'This contain on meal', isLactoseFree,
                    (value) {
                  setState(
                    () {
                      isLactoseFree = value;
                    },
                  );
                }),
                _listTileSwitchs('Gluten', 'This contain on meal', isGlutenFree,
                    (value) {
                  setState(() {
                    isGlutenFree = value;
                  });
                }),
                _listTileSwitchs('Vegan', 'This contain on meal', isVegan,
                    (value) {
                  setState(() {
                    isVegan = value;
                  });
                }),
                _listTileSwitchs(
                    'Vegetarian', 'This contain on meal', isVegetarian,
                    (value) {
                  setState(() {
                    isVegetarian = value;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
