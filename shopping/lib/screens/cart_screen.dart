import 'package:flutter/material.dart';
import '../provider/order.dart';
import "package:provider/provider.dart";
import "../provider/cart.dart";

import '../widgets/cart_wig.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const routName = '/CartScreen';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final listData = cart.cartList;
    final data = cart.cartPrice;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Cart Screen '),
              background: Hero(
                tag: 'aaa',
                child: Image.asset(
                  'assets/images/123.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Wrap(
                  children: [
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(10),
                      child: Card(
                        elevation: 4,
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Expanded(
                            child: Wrap(
                              direction: Axis.horizontal,
                              alignment: WrapAlignment.spaceBetween,
                              children: [
                                const Text("Total Amount"),
                                const Spacer(),
                                Chip(
                                  label: Text(
                                    data.toStringAsFixed(2),
                                  ),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                        255, 235, 209, 199),
                                  ),
                                  onPressed: () {
                                    Provider.of<OrderList>(context,
                                            listen: false)
                                        .addOrder(
                                            listData.values.toList(), data);
                                    cart.clearCart();
                                  },
                                  child: const Text('Order now'),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: listData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CartData(
                            proId: listData.keys.toList()[index],
                            id: listData.values.toList()[index].id,
                            title: listData.values.toList()[index].title,
                            price: listData.values
                                .toList()[index]
                                .price
                                .toDouble(),
                            quantity: listData.values.toList()[index].quantity,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
