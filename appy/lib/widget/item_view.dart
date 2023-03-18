import 'package:appy/widget/view_item_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:appy/provider/cart.dart';
import 'package:appy/provider/product.dart';

class ItemView extends StatelessWidget {
  //final String title;
  //final String id;
  //final String imageUrl;

  const ItemView({
    Key? key,
    //   required this.id,
    //   required this.imageUrl,
    //   required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productLoaded = Provider.of<product>(context);
    final cart = Provider.of<Cart>(context);

    void _onTab(BuildContext context) {
      Navigator.of(context)
          .pushNamed(ViewItemDetail.routeName, arguments: productLoaded.id);
    }

    return Container(
      margin: const EdgeInsets.all(5),
      child: GridTile(
        footer: GridTileBar(
            leading: Consumer<product>(
              builder: (context, value, child) => IconButton(
                icon: productLoaded.isFavorite
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border),
                onPressed: productLoaded.isFavroiteToggle,
              ),
            ),
            title: Text(productLoaded.title),
            trailing: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  cart.addData(productLoaded.id, productLoaded.title,
                      productLoaded.price);
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('Product added to cart'),
                    action: SnackBarAction(
                      label: 'undo',
                      onPressed: () {
                        cart.deleteItem(productLoaded.id);
                      },
                    ),
                  ));
                }),
            backgroundColor: Colors.black),
        child: InkWell(
          onTap: () => _onTab(context),
          child: Hero(
            tag: productLoaded.id,
            child: FadeInImage(
              placeholder:
                  const AssetImage('assets/images/product-placeholder.png'),
              image: NetworkImage(
                productLoaded.imageUrl,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
