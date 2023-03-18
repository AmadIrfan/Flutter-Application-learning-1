import 'package:appy/screen/Product_edit_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:appy/provider/Product_provider.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  const UserProductItem(
      {Key? key, required this.id, required this.title, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    return Column(
      children: [
        Dismissible(
          onDismissed: (direction) async {
            try {
              await Provider.of<Products>(context, listen: false)
                  .deleteProduct(id);
            } catch (error) {
              scaffold.showSnackBar(
                  const SnackBar(content: Text('Product not deleted')));
            }
          },
          confirmDismiss: (direction) {
            return showDialog(
                context: context,
                builder: (ctx) {
                  return AlertDialog(
                    content: const Text('Are You sure to Delete Your item'),
                    title: const Text('Permission'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(false);
                        },
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(true);
                        },
                        child: const Text('Yes'),
                      ),
                    ],
                  );
                });
          },
          direction: DismissDirection.endToStart,
          background: Container(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            alignment: Alignment.centerRight,
            color: Colors.red,
            child: Icon(
              color: Theme.of(context).primaryColor,
              size: 40,
              Icons.delete,
            ),
          ),
          key: ValueKey(id),
          child: Container(
            width: double.infinity,
            height: 70,
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
                title: Text(title),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(ProductEditScreen.routeName, arguments: id);
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
