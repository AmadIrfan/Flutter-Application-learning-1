import 'package:flutter/foundation.dart';
import '../provider/cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final DateTime dateTime;
  final List<CartItem> orderList;

  OrderItem({
    required this.id,
    required this.amount,
    required this.dateTime,
    required this.orderList,
  });
}

class Order with ChangeNotifier {
  final List<OrderItem> _orderItem = [];

  List<OrderItem> get cartItem {
    return _orderItem;
  }

  void addOrder(List<CartItem> orders, double amount) {
    if (orders.isEmpty) {
      return;
    }

    _orderItem.insert(
        0,
        OrderItem(
            id: DateTime.now().toString(),
            amount: amount,
            dateTime: DateTime.now(),
            orderList: orders));
    notifyListeners();
  }
}
