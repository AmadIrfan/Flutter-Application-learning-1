import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem(
      {Key? key, required this.id, required this.title, required this.color})
      : super(key: key);

  static const idBasedItems = '/idBasedItems';

  void _openCategoryItems(BuildContext context) {
    Navigator.of(context).pushNamed(idBasedItems,
        arguments: {'id': id, 'title': title, 'color': color});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openCategoryItems(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                colors: [color.withOpacity(1), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Text(title),
      ),
    );
  }
}
