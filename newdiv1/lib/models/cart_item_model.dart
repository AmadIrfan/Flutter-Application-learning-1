import 'package:flutter/material.dart';

class CartItems with ChangeNotifier {
  final String id;
  final String prId;
  final String title;
  final double price;
  final int quantity;
  CartItems({
    required this.id,
    required this.prId,
    required this.title,
    required this.price,
    required this.quantity,
  });
}

class CartItemsList with ChangeNotifier {
  final Map<String, CartItems> _cartItemsList = {};
  Map<String, CartItems> get cartList {
    return _cartItemsList;
  }

  int get getLength {
    return _cartItemsList.length;
  }

  double get getTotalPrice {
    double total = 0.0;
    _cartItemsList.forEach((key, pro) {
      total = (pro.price * pro.quantity) + total;
    });
    return total;
  }

  void putDataIntoCart(
      String productId, double productPrice, String productTitle, String prd) {
    if (_cartItemsList.containsKey(productId)) {
      _cartItemsList.update(
        productId,
        (pro) => CartItems(
            id: pro.id,
            prId: pro.prId,
            title: pro.title,
            price: pro.price,
            quantity: pro.quantity + 1),
      );
    } else {
      _cartItemsList.putIfAbsent(
        productId,
        () => CartItems(
          id: DateTime.now().toString(),
          prId: prd,
          title: productTitle,
          price: productPrice,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void deleter(String productId) {
    _cartItemsList.remove(productId);
    notifyListeners();
  }
}
