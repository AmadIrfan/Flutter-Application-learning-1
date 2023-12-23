import 'package:newdiv1/widget/pages.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:newdiv1/models/cart_item_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const routName = '/cartScreen';
  @override
  Widget build(BuildContext context) {
    final cartList = Provider.of<CartItemsList>(context).cartList;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            width: double.infinity,
            height: 90,
            child: Card(
              color: Colors.green,
              elevation: 5,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Total Price ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Chip(
                      label: Text(
                        Provider.of<CartItemsList>(context)
                            .getTotalPrice
                            .toString(),
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Order',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 300,
            width: double.infinity,
            child: ListView.builder(
              itemCount: cartList.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  onDismissed: (direction) {
                    Provider.of<CartItemsList>(context, listen: false)
                        .deleter(cartList.keys.toList()[index]);
                  },
                  key: ValueKey(cartList.values.toList()[index].id.toString()),
                  child: Card(
                    elevation: 5,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Pages.routeName,
                            arguments: cartList.values.toList()[index].prId);
                        // print(cartList.values.toList()[index].prId);
                        // Naviga
                      },
                      child: Container(
                        margin: const EdgeInsets.all(3),
                        child: ListTile(
                          title: Text(
                            cartList.values.toList()[index].title,
                          ),
                          subtitle: Text(
                              '${cartList.values.toList()[index].price * cartList.values.toList()[index].quantity}'),
                          leading: Expanded(
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.blueAccent,
                              child: Text(
                                cartList.values
                                    .toList()[index]
                                    .price
                                    .toString(),
                              ),
                            ),
                          ),
                          trailing: Text(
                              '${cartList.values.toList()[index].quantity} X'),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
