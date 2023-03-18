import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem(
      {Key? key, required this.title, required this.id, required this.color})
      : super(key: key);

  static const routeName = '/routeNamerouteNameOfCategory';
  void _ontap(BuildContext context) {
    Navigator.of(context).pushNamed(routeName,
        arguments: {'id': id, 'title': title, 'color': color});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => _ontap(context),
        splashColor: Theme.of(context).primaryColor,
        child: Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  colors: [color.withOpacity(1), color],
                  end: Alignment.bottomRight,
                  begin: Alignment.topLeft)),
          child: Text(title),
        ));
  }
}
