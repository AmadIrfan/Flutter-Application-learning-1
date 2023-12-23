import 'package:flutter/material.dart';
import 'package:flutter_application_mp/category_item.dart';
import 'Dummy_Category.dart';

class CategoryScreenItem extends StatelessWidget {
  const CategoryScreenItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          mainAxisExtent: 200,
          maxCrossAxisExtent: 200),
      children: Dummy_Category.map((item) {
        return CategoryItem(id: item.id, title: item.title, color: item.color);
      }).toList(),
    );
  }
}
