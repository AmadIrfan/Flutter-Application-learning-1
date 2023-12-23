import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:newdiv/widgets/item_bulid.dart';
import 'package:newdiv/provider/product_data.dart';

class GView extends StatelessWidget {
  const GView({super.key, required this.isFav});
  final bool isFav;
  @override
  Widget build(BuildContext context) {
    final proData = Provider.of<ProductsData>(context, listen: false);
    final listData = isFav ? proData.favoriteList : proData.itemsList;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 250,
          mainAxisSpacing: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 2,
        ),
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: listData[index],
          child: const ItemBuilder(),
        ),
        itemCount: listData.length,
      ),
    );
  }
}
