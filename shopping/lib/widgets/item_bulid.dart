import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/products.dart';
import '../provider/cart.dart';
// import '../provider/product_data.dart';
import '../screens/new_page_screen.dart';

class ItemBuilder extends StatelessWidget {
  const ItemBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dataList = Provider.of<Product>(context, listen: false);
    final data = Provider.of<Cart>(context, listen: false);
    // print(dataList.id);
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(NewPageScreen.routName, arguments: dataList.id);
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(color: Colors.green),
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(dataList.title),
            leading: Consumer<Product>(
              builder: (context, value, ch) => IconButton(
                onPressed: () {
                  dataList.isFavChange();
                },
                icon: Icon(
                  dataList.isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                data.addDataToCart(
                  dataList.id,
                  dataList.title,
                  dataList.price,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Product Added toCart'),
                  ),
                );
              },
              icon: const Icon(
                Icons.shopping_cart,
              ),
            ),
          ),
          child: ClipRRect(
            child: Image.network(
              dataList.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
