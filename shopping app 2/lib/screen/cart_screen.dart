import 'package:flutter_application_impo/provider/order.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../provider/cart.dart';
import '../widget/item_view.dart';
import '../widget/cart_items.dart';

class CartItemsScreen extends StatelessWidget {
  const CartItemsScreen({Key? key}) : super(key: key);
  static const routeName = '/CartItemScreen';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 80,
            child: Card(
              // margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Total Orderd Price"),
                  const Spacer(),
                  Chip(label: Text(cart.totalInvoice.toStringAsFixed(2))),
                  TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return AlertDialog(
                                title: const Text('Perimssion'),
                                content: const Text(
                                    'are you sure you want to order ??'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop(false);
                                      ScaffoldMessenger.of(ctx)
                                          .hideCurrentSnackBar();
                                      ScaffoldMessenger.of(ctx)
                                          .showSnackBar(const SnackBar(
                                        content: Text('Oop\'s Try again !!!!'),
                                      ));
                                    },
                                    child: const Text('no'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop(true);
                                      final order = Provider.of<Order>(ctx,
                                          listen: false);
                                      order.addOrder(
                                          cart.cartitem.values.toList(),
                                          cart.totalInvoice);
                                      ScaffoldMessenger.of(ctx)
                                          .hideCurrentSnackBar();
                                      ScaffoldMessenger.of(ctx)
                                          .showSnackBar(const SnackBar(
                                        content: Text(
                                            'Your Order Has been Placed ...'),
                                      ));
                                      cart.clearCartItem();
                                    },
                                    child: const Text('yes'),
                                  ),
                                ],
                              );
                            });
                      },
                      child: const Text("Order Now"))
                ],
              ),
            ),
          ),
          Container(
            height: 200,
            width: double.infinity,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CartItems(
                    id: cart.cartitem.values.toList()[index].id,
                    proId: cart.cartitem.keys.toList()[index],
                    title: cart.cartitem.values.toList()[index].title,
                    price: cart.cartitem.values.toList()[index].price,
                    quentity: cart.cartitem.values.toList()[index].quantity);
              },
              itemCount: cart.cartitem.length,
            ),
          ),
        ],
      ),
    );
  }
}
