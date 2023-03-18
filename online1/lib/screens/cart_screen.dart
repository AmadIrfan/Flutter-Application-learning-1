import 'package:flutter/material.dart';
import 'package:online1/widget/cart_item.dart';
import 'package:provider/provider.dart';

import '../provider/Cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = '/cartScreen';
  @override
  Widget build(BuildContext context) {
    final loadData = Provider.of<CartItemsContainer>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(' YourCart '),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Amount ',
                      style: TextStyle(fontSize: 20),
                    ),
                    const Spacer(),
                    Chip(
                      label: Text(loadData.totalAmoutOfProduct.toString()),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Order now',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: 400,
              width: double.infinity,
              child: ListView.builder(
                itemCount: loadData.cartItemList.length,
                itemBuilder: (BuildContext context, int index) {
                  return CartItemswidget(
                      id: loadData.cartItemList.values.toList()[index].id,
                      price: loadData.cartItemList.values.toList()[index].price,
                      title: loadData.cartItemList.values.toList()[index].title,
                      quantity:
                          loadData.cartItemList.values.toList()[index].quentity,
                      productId: loadData.cartItemList.keys.toList()[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
