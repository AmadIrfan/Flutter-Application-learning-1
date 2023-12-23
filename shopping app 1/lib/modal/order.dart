import 'package:flutter/cupertino.dart';
import 'package:prper_provider_app/modal/cart.dart';

class Order with ChangeNotifier {
  final String id;
  final double amount;
  final DateTime dateTime;
  final List<Cart> cart;

  Order({
    required this.id,
    required this.amount,
    required this.cart,
    required this.dateTime,
  });
}

class OrderProduct with ChangeNotifier {
  final List<Order> _orderItem = [];
  List<Order> get items {
    return _orderItem;
  }

  addOrders(
    double amount,
    List<Cart> cartItem,
  ) {
    if (cartItem.isEmpty) {
      return;
    } else {
      Order product = Order(
        id: DateTime.now.toString(),
        amount: amount,
        cart: cartItem,
        dateTime: DateTime.now(),
      );
      _orderItem.add(product);
    }
    notifyListeners();
  }
}
