import 'package:flutter/material.dart';
import 'package:newdiv1/models/product_data.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

import '../widget/item_build.dart';

class GridViews extends StatelessWidget {
  const GridViews({
    super.key,
    required this.isFavorite,
  });
  final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    final produtPList = isFavorite
        ? Provider.of<ProductsData>(
            context,
          ).favoriteItems
        : Provider.of<ProductsData>(
            context,
          ).itemsList;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        // crossAxisCount: 2,
        mainAxisExtent: 300,
        childAspectRatio: 1.5,
        crossAxisSpacing: 5,
        maxCrossAxisExtent: 300,
        mainAxisSpacing: 5,

        // crossAxisSpacing: 10,
      ),
      itemBuilder: ((context, index) => ChangeNotifierProvider.value(
            value: produtPList[index],
            child: const ItemBuild(),
          )),
      itemCount: produtPList.length,
    );
  }
}
