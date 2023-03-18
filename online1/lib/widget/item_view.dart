import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../provider/Cart_item.dart';
import 'package:online1/provider/product.dart';

class ItemView extends StatelessWidget {
  const ItemView({Key? key}) : super(key: key);

  void onTab(BuildContext context, String id) {
    Navigator.of(context)
        .pushNamed(ProductDetailScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Product>(context);

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: const Color.fromARGB(255, 44, 43, 43),
          leading: Consumer<Product>(
            builder: ((context, value, child) => IconButton(
                  icon: productData.isFavorite
                      ? const Icon(Icons.favorite)
                      : const Icon(Icons.favorite_border),
                  onPressed: () {
                    productData.isFavoriteChanged();
                  },
                )),
          ),
          title: Text(productData.title),
          trailing: IconButton(
            onPressed: () {
              Provider.of<CartItemsContainer>(context, listen: false)
                  .addIntoCarts(
                      productData.id, productData.title, productData.price);
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ),
        child: InkWell(
          onTap: () => onTab(context, productData.id),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Hero(
              tag: productData.id,
              child: Image.network(
                productData.imageUrl,
                scale: 1,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
