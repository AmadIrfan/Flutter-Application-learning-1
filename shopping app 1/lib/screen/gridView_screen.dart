import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/item_view.dart';
import '../provider/Product_provider.dart';

class GridViewScreen extends StatelessWidget {
  final bool isFavorite;
  const GridViewScreen({Key? key, required this.isFavorite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataList = Provider.of<Products>(context);
    // print(isFavorite);
    final loadData = isFavorite ? dataList.favoriteItems : dataList.item;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          mainAxisExtent: 250,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5),
      itemBuilder: (BuildContext context, int index) {
        return ChangeNotifierProvider.value(
          value: loadData[index],
          child: const ItemView(),
        );
      },
      itemCount: loadData.length,
    );
  }
}
