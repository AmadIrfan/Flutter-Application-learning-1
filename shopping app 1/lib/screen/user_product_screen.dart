import 'package:appy/provider/Product_provider.dart';
import 'package:appy/screen/appDrwar.dart';
import 'package:appy/widget/user_product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screen/Product_edit_screen.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/UserProductScreen';
  const UserProductScreen({Key? key}) : super(key: key);
  Future<void> onRefresh(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).getDataFromServer();
  }

  @override
  Widget build(BuildContext context) {
    final listData = Provider.of<Products>(context).item;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Own Products'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ProductEditScreen.routeName);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => onRefresh(context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemBuilder: (context, index) => UserProductItem(
                id: listData[index].id,
                title: listData[index].title,
                imageUrl: listData[index].imageUrl),
            itemCount: listData.length,
          ),
        ),
      ),
      drawer: const Drawer(
        child: AppDrawer(),
      ),
    );
  }
}
