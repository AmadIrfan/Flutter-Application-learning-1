import 'package:appy/provider/order.dart';
import 'package:appy/widget/cart_screen_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';

class CartScreen extends StatelessWidget {
  static const routName = '/CartScreen';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),
      body: SingleChildScrollView(
        child: Container(
          height: 500,
          child: Column(
            children: [
              Card(
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Total Price ",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Spacer(),
                    Chip(
                      label: Text(cart.TotalInvoice.toStringAsFixed(2)),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    OrderButten(cart: cart)
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  height: 400,
                  child: ListView.builder(
                    itemCount: cart.itemList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CartScreenItem(
                          id: cart.itemList.values.toList()[index].id,
                          productId: cart.itemList.keys.toList()[index],
                          title: cart.itemList.values.toList()[index].title,
                          quantity:
                              cart.itemList.values.toList()[index].quentity,
                          price: cart.itemList.values.toList()[index].price);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderButten extends StatefulWidget {
  Cart cart;
  OrderButten({Key? key, required this.cart}) : super(key: key);

  @override
  State<OrderButten> createState() => _OrderButtenState();
}

class _OrderButtenState extends State<OrderButten> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
          onPressed: (widget.cart.TotalInvoice <= 0 || _isLoading)
              ? null
              : () async {
                  setState(() {
                    _isLoading = true;
                  });
                  // await Provider.of<Order>(context, listen: false).addorder(
                  //     widget.cart.TotalInvoice,
                  //     widget.cart.itemList.values.toList());
                  // setState(() {
                  //   _isLoading = false;
                  // });
                  widget.cart.emptyCart();
                },
          child: _isLoading
              ? const CircularProgressIndicator.adaptive()
              : const Text('Order Now')),
    );
  }
}
