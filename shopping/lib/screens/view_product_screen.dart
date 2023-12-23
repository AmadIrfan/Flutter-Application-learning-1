import 'package:flutter/material.dart';
import 'package:newdiv/provider/product_data.dart';
import 'package:newdiv/screens/drawer_screen.dart';
import 'package:provider/provider.dart';
import '../screens/add_products.dart';

class ViewProductScreen extends StatelessWidget {
  const ViewProductScreen({super.key});
  static const routeName = '/routeName/ViewProductScreen';
  @override
  Widget build(BuildContext context) {
    final listData = Provider.of<ProductsData>(context).itemsList;
    return Scaffold(
        appBar: AppBar(
          title: const Text('View Product'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddProductScreen.routeName);
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: Column(
          children: listData
              .map((e) => Dismissible(
                    key: ValueKey(e.id),
                    onDismissed: (direction) {
                      Provider.of<ProductsData>(context, listen: false)
                          .deleteData(e.id);
                    },
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            AddProductScreen.routeName,
                            arguments: e.id,
                          );
                        },
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(e.imageUrl),
                        ),
                        title: Text(e.title),
                        subtitle: Text(e.description),
                        trailing: Text(e.price.toString()),
                      ),
                    ),
                  ))
              .toList(),
        ),
        drawer: const Drawer(
          child: HomeDrawer(),
        ));
  }
}
