import 'package:flutter/cupertino.dart';

class CartItems with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final int quantity;
  CartItems({
    required this.price,
    required this.id,
    required this.title,
    required this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItems> _cartItemList = {};
  Map<String, CartItems> get cartList {
    return {..._cartItemList};
  }

  void addDataToCart(String proId, String title, double price) {
    if (_cartItemList.containsKey(proId)) {
      _cartItemList.update(
        proId,
        (eValue) => CartItems(
          price: eValue.price,
          id: eValue.id,
          title: eValue.title,
          quantity: eValue.quantity + 1,
        ),
      );
    } else {
      _cartItemList.putIfAbsent(
          proId,
          () => CartItems(
              price: price,
              id: DateTime.now().toString(),
              title: title,
              quantity: 1));
    }
    notifyListeners();
  }

  int get getLengthOfCart {
    return _cartItemList.length;
  }

  double get cartPrice {
    var total = 0.0;
    _cartItemList.forEach((key, val) {
      total += val.price * val.quantity;
    });
    return total;
  }

  void removeItem(String proId) {
    _cartItemList.remove(proId);
    notifyListeners();
  }

  void clearCart() {
    _cartItemList = {};
    notifyListeners();
  }
}
