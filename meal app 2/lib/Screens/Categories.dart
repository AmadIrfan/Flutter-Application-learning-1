import 'package:flutter/material.dart';
import 'package:new1/model/Category.dart';
import '../Screens/category_item.dart';
import '../model/Dummy_Data.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: dummy_data.map((item) {
        return CategoryItem(id: item.id, title: item.title, color: item.color);
      }).toList(),
    );
  }
}
