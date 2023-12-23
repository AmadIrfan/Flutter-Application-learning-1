import 'package:flutter/cupertino.dart';
import '../provider/cart.dart';

class Order with ChangeNotifier {
  String id;
  double amunt;
  DateTime dateTime;
  List<CartItems> product;

  Order({
    required this.product,
    required this.amunt,
    required this.dateTime,
    required this.id,
  });
}

class OrderList with ChangeNotifier {
  final List<Order> _orderList = [];
  List<Order> get order {
    return _orderList;
  }

  void addOrder(List<CartItems> prod, double amount) {
    _orderList.insert(
      0,
      Order(
        product: prod,
        amunt: amount,
        dateTime: DateTime.now(),
        id: DateTime.now().toString(),
      ),
    );
    notifyListeners();
  }
}
