import 'package:flutter/material.dart';
import 'package:newdiv1/models/cart_item_model.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

import '../models/products.dart';

import '../widget/pages.dart';

class ItemBuild extends StatefulWidget {
  const ItemBuild({super.key});

  @override
  State<ItemBuild> createState() => _ItemBuildState();
}

class _ItemBuildState extends State<ItemBuild> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Product>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          Pages.routeName,
          arguments: data.id,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: GridTile(
            footer: GridTileBar(
              backgroundColor: Colors.red,
              leading: IconButton(
                onPressed: () {
                  data.favoriteChanger();
                },
                icon: Icon(
                  data.isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  Provider.of<CartItemsList>(context, listen: false)
                      .putDataIntoCart(
                    data.id,
                    data.price,
                    data.title,
                    data.id,
                  );
                },
                icon: const Icon(Icons.shopping_bag),
              ),
              title: Text(data.title),
            ),
            child: Image.network(
              data.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
//  Container(
//         width: double.infinity,
//         margin: const EdgeInsets.all(3),
//         decoration: BoxDecoration(
//           color: Colors.green,
//           borderRadius: BorderRadius.circular(5),
        