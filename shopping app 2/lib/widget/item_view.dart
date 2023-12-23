import 'package:flutter_application_impo/provider/cart.dart';

import '../provider/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../provider/Product.dart';
import '../widget/view_item_detail.dart';

class ItemView extends StatelessWidget {
  const ItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final productItem = Provider.of<Product>(context);
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2)),
      child: GridTile(
        footer: GridTileBar(
          leading: Consumer<Product>(
            builder: (context, value, child) => IconButton(
                icon: Icon(productItem.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border),
                onPressed: () {
                  productItem.favroiteToggled();
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  if (productItem.isFavorite) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Added into Favorite '),
                        backgroundColor: Colors.grey));
                  } else {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Remove from Favorite'),
                        backgroundColor: Colors.grey));
                  }
                }),
          ),
          trailing: IconButton(
              onPressed: () {
                cart.addDataInCart(
                    productItem.id, productItem.title, productItem.price, 1);
              },
              icon: const Icon(Icons.shopping_cart)),
          backgroundColor: Colors.black,
          title: Text(productItem.title),
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ItemViewDetail.routeName, arguments: productItem.id);
          },
          splashColor: Theme.of(context).primaryColor,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            child: Image.network(
              productItem.imageUrl,
              scale: 1,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
