import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  const CategoryItem(
      {Key? key, required this.id, required this.title, required this.color})
      : super(key: key);
  static const screenName = '/categories.meal';
  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(screenName,
        arguments: {'title': title, 'color': color, 'id': id});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Colors.blue,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [color.withOpacity(1), color])),
        child: Text(title),
      ),
    );
  }
}
