import 'package:flutter/material.dart';
import 'package:profapp/Dummy_category.dart';
import 'Dummy_category.dart';
import 'CategoryItem.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 20,
          mainAxisExtent: 200,
          mainAxisSpacing: 20),
      children: Dummy_Category.map((item) {
        return CategoryItem(title: item.title, id: item.id, color: item.color);
      }).toList(),
    );
  }
}
