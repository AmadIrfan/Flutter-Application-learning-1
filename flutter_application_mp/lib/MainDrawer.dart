import 'package:flutter/material.dart';
import './FilterItem.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget _drawerlistTiles(String title, IconData icon, Function TopHendler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
      ),
      onTap: () => TopHendler(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          color: Theme.of(context).primaryColor,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Cooking App',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w900),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        _drawerlistTiles('Meal', Icons.restaurant, () {
          Navigator.of(context).pushNamed('/');
        }),
        _drawerlistTiles('Filters', Icons.settings, () {
          Navigator.of(context).pushNamed(FiltersItem.routFilter);
        }),
      ],
    ));
  }
}
