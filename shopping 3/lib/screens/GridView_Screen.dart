import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/products_list.dart';
import '../widget/item_view.dart';

class GridViewScreen extends StatelessWidget {
  bool isFavorite;
  GridViewScreen({
    Key? key,
    required this.isFavorite,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final listDataLoded = Provider.of<ProductsData>(context);
    final listData =
        isFavorite ? listDataLoded.favoriteList : listDataLoded.productList;
    if (listData.isNotEmpty) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 300,
          childAspectRatio: 1.5,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: listData.length,
        itemBuilder: (BuildContext context, int index) {
          return ChangeNotifierProvider.value(
            value: listData[index],
            child: const ItemView(),
          );
        },
      );
    } else {
      return const Center(
        child: Text(
          'Item does\'t founded',
          style: TextStyle(fontSize: 30),
        ),
      );
    }
  }
}
