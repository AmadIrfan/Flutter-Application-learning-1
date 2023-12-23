import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:prper_provider_app/modal/product.dart';
import 'package:prper_provider_app/windows/add_product.dart';
import 'package:prper_provider_app/windows/drawers.dart';

class UserViewProduct extends StatefulWidget {
  const UserViewProduct({super.key});

  @override
  State<UserViewProduct> createState() => _UserViewProductState();
}

class _UserViewProductState extends State<UserViewProduct> {
  @override
  Widget build(BuildContext context) {
    final list = Provider.of<ProductDL>(context).item;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const AddProducts()),
                ),
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
          children: list
              .map(
                (e) => Slidable(
                  key: ValueKey(e.id),
                  startActionPane: ActionPane(
                    motion: const StretchMotion(),
                    children: [
                      SlidableAction(
                        onPressed: ((context) {
                          Navigator.of(context).pushNamed(
                            AddProducts.routeName,
                            arguments: e.id,
                          );
                        }),
                        icon: Icons.delete,
                      ),
                      SlidableAction(
                        onPressed: ((context) {}),
                        icon: Icons.edit,
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AddProducts.routeName,
                          arguments: e.id);
                    },
                    child: Card(
                      elevation: 1,
                      margin: const EdgeInsets.all(3),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            e.imageUrl,
                          ),
                        ),
                        title: Text(e.title),
                      ),
                    ),
                  ),
                ),
              )
              .toList()),
      drawer: const Drawer(
        child: Drawes(),
      ),
    );
  }
}
