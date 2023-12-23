import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_impo/provider/product_provider.dart';
import 'package:flutter_application_impo/screen/appDrawer.dart';
import 'package:flutter_application_impo/widget/user_product_detail.dart';
import '../screen/User_Edit_Product.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/userProductOverView';
  const UserProductScreen({Key? key}) : super(key: key);
  Future<void> onRefreshPage(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).getDataFromServer();
  }

  @override
  Widget build(BuildContext context) {
    final userList = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(UseEditProducts.routeName);
              },
              icon: const Icon(Icons.add))
        ],
        title: const Text('Your Products'),
      ),
      body: RefreshIndicator(
        onRefresh: () => onRefreshPage(context),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListView.builder(
            itemBuilder: (context, index) => UserProductDetail(
              proDetail: userList.itemList[index],
            ),
            itemCount: userList.itemList.length,
          ),
        ),
      ),
      drawer: const Drawer(child: AppDrawer()),
    );
  }
}
