import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _cartitem = {};

  Map<String, CartItem> get cartitem {
    return _cartitem;
  }

  void addDataInCart(String id, String title, double amount, int Quentity) {
    if (_cartitem.containsKey(id)) {
      _cartitem.update(
          id,
          (exist) => CartItem(
              id: exist.id,
              title: exist.title,
              price: exist.price,
              quantity: exist.quantity + 1));
    } else {
      _cartitem.putIfAbsent(
          id,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: amount,
              quantity: Quentity));
    }
    notifyListeners();
  }

  int get listLength {
    return _cartitem.length;
  }

  double get totalInvoice {
    double sum = 0.0;
    _cartitem.forEach((key, value) {
      sum += value.price * value.quantity;
    });
    return sum;
  }

  void clearCartItem() {
    _cartitem = {};
    notifyListeners();
  }

  void DeletItem(String idPro) {
    _cartitem.remove(idPro);
    notifyListeners();
  }
}
