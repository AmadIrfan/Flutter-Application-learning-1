import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prper_provider_app/modal/cart.dart';
import 'package:prper_provider_app/modal/product.dart';
import 'package:prper_provider_app/windows/new_page_screen.dart';

class ItemView extends StatelessWidget {
  const ItemView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Product>(context);
    final cart = Provider.of<CartProduct>(context, listen: false);
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(NewPageScreen.routName, arguments: data.id);
      },
      child: GridTile(
        footer: GridTileBar(
          leading: IconButton(
            onPressed: () {
              data.isFavoriteToggle();
            },
            icon:
                Icon(data.isFavorite ? Icons.favorite : Icons.favorite_border),
          ),
          trailing: IconButton(
            onPressed: () {
              cart.addToCart(data.id, data.title, 1, data.price, data.imageUrl);
            },
            icon: const Icon(Icons.shopping_cart),
          ),
          backgroundColor: Colors.black45,
          title: Text(
            data.title,
            textAlign: TextAlign.center,
          ),
        ),
        child: ClipRRect(
          child: Image.network(
            data.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
