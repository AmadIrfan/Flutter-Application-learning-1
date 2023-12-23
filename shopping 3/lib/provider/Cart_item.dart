import 'package:flutter/foundation.dart';

class CartItem {
  String id;
  String title;
  double price;
  int quentity;

  CartItem({
    required this.id,
    required this.price,
    required this.quentity,
    required this.title,
  });
}

class CartItemsContainer with ChangeNotifier {
  final Map<String, CartItem> _cartItemList = {};
  Map<String, CartItem> get cartItemList {
    return _cartItemList;
  }

  void addIntoCarts(String id, String title, double price) {
    if (_cartItemList.containsKey(id)) {
      _cartItemList.update(
          id,
          (existingData) => CartItem(
                id: existingData.id,
                title: existingData.title,
                quentity: existingData.quentity + 1,
                price: existingData.price,
              ));
    } else {
      _cartItemList.putIfAbsent(
          id, () => CartItem(id: id, price: price, quentity: 1, title: title));
    }
    notifyListeners();
  }

  int get cartLength {
    return _cartItemList.length;
  }

  double get totalAmoutOfProduct {
    double totalAmount = 0.0;
    _cartItemList.forEach((key, item) {
      totalAmount += item.price * item.quentity;
    });
    return totalAmount;
  }

  void deleteCartItems(String productId) {
    _cartItemList.remove(productId);
    notifyListeners();
  }
}
