import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prper_provider_app/widgets/item.dart';

import '../modal/product.dart';

class GView extends StatelessWidget {
  const GView({super.key, required this.isFav});
  // ignore: prefer_typing_uninitialized_variables
  final isFav;
  @override
  Widget build(BuildContext context) {
    final list = isFav
        ? Provider.of<ProductDL>(context).favList
        : Provider.of<ProductDL>(context).item;

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 200,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return ChangeNotifierProvider.value(
          value: list[index],
          child: const ItemView(),
        );
      },
    );
  }
}
