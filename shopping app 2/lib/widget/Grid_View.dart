import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_impo/provider/product_provider.dart';
import './item_view.dart';

class GridViews extends StatelessWidget {
  final bool isFavorite;
  const GridViews({Key? key, required this.isFavorite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loadData = Provider.of<Products>(context);
    final listData = isFavorite ? loadData.favoriteItem : loadData.itemList;
    if (listData.isNotEmpty) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 250,
          mainAxisSpacing: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            value: listData[index],
            child: const ItemView(),
          );
        },
        itemCount: listData.length,
      );
    } else {
      return const Center(
          child: Text(
        'No Favorite Items !!! ',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ));
    }
  }
}
