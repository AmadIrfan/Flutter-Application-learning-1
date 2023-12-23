import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prper_provider_app/modal/cart.dart';
import 'package:prper_provider_app/modal/order.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const routName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartProduct>(context, listen: false).items;
    final cartItems = Provider.of<CartProduct>(
      context,
    );
    final orderd = Provider.of<OrderProduct>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.only(
                top: 20,
                left: 10,
                right: 10,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total Price'),
                    const Spacer(),
                    Chip(
                      label: Text(
                        cartItems.totalPrice().toStringAsFixed(2),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        orderd.addOrders(
                          cartItems.totalPrice(),
                          cartData.values.toList(),
                        );
                        cartItems.emptyCart();
                      },
                      child: const Text('Order'),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 600,
                    child: ListView.builder(
                      itemCount: cartData.length,
                      itemBuilder: ((context, index) => Card(
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  width: 100,
                                  height: 100,
                                  child: ClipRRect(
                                    child: Image.network(
                                      cartData.values
                                          .toList()[index]
                                          .imageUrl
                                          .toString(),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      cartData.values.toList()[index].title,
                                    ),
                                    Text(
                                      "Price : ${cartData.values.toList()[index].price * cartData.values.toList()[index].quantity}",
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
