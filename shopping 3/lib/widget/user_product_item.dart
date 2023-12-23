import 'package:flutter/material.dart';
import 'package:online1/screens/product_edit_screen.dart';
import 'package:provider/provider.dart';
import 'package:online1/provider/products_list.dart';
import 'package:online1/screens/product_detail_screen.dart';

class UserProductItems extends StatelessWidget {
  const UserProductItems({Key? key}) : super(key: key);

  Widget _rowDesigner(String text, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loadData = Provider.of<ProductsData>(context);
    final listData = loadData.productList;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
          color: Colors.green,
          width: double.infinity,
          height: 150,
          child: Card(
            elevation: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _rowDesigner(
                    'Total item price', loadData.totalAmout.toString()),
                _rowDesigner(
                    'Heigest item price', loadData.heigestPrice.toString()),
                _rowDesigner('total item', loadData.totalItems.toString()),
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            height: 500,
            width: double.infinity,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Dismissible(
                  onDismissed: (direction) {},
                  confirmDismiss: (direction) {
                    return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Permission'),
                            content: const Text(
                                'Are you sure you want to delete ??'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Item removed..'),
                                      ),
                                    );
                                  },
                                  child: const Text('Yes')),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('Item not remove..')));
                                  },
                                  child: const Text('No')),
                            ],
                          );
                        });
                  },
                  background: Container(
                    margin: const EdgeInsets.all(4),
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                    child: const Icon(
                      Icons.delete,
                      size: 50,
                    ),
                  ),
                  direction: DismissDirection.endToStart,
                  key: ValueKey(listData[index].id),
                  child: Card(
                    color: const Color.fromARGB(255, 11, 205, 219),
                    elevation: 3,
                    child: ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        foregroundColor: Colors.amber,
                        radius: 30,
                        backgroundImage: NetworkImage(listData[index].imageUrl),
                      ),
                      title: Text(listData[index].title.toString(),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700)),
                      subtitle: Text(
                        listData[index].price.toString(),
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(ProductEditScreen.routeName);
                        },
                        icon: Icon(
                          color: Colors.green,
                          Icons.edit,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: listData.length,
            ),
          ),
        ),
      ],
    );
  }
}
