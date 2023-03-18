import 'package:flutter/material.dart';
import 'Screens/Filter_screen.dart';

class Drawers extends StatelessWidget {
  const Drawers({Key? key}) : super(key: key);

  Widget _multiListTiles(String title, IconData? icon, Function onTopHandle) {
    return Column(
      children: [
        ListTile(
          onTap: () => onTopHandle(),
          leading: Icon(
            icon,
            size: 30,
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 25),
          ),
        ),
        const Divider(
          color: Colors.black,
          thickness: 1,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          height: 200,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          child: const Text(
            'Cooking App',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        _multiListTiles('Meal', Icons.restaurant, () {
          Navigator.of(context).pushNamed('/');
        }),
        _multiListTiles('Filters', Icons.settings, () {
          Navigator.of(context).pushNamed(FilterScreen.filterRout);
        }),
      ],
    );
  }
}
