import 'package:flutter/cupertino.dart';

class Cart with ChangeNotifier {
  String id;
  String title;
  double price;
  int quantity;
  String imageUrl;
  Cart({
    required this.imageUrl,
    required this.id,
    required this.price,
    required this.quantity,
    required this.title,
  });
}

class CartProduct with ChangeNotifier {
  final Map<String, Cart> _cartItem = {};
  Map<String, Cart> get items {
    return {..._cartItem};
  }

  addToCart(
      String id, String title, int quantity, double price, String imageUrl) {
    if (_cartItem.containsKey(id)) {
      _cartItem.update(
        id,
        (value) => Cart(
          id: value.id,
          imageUrl: value.imageUrl,
          price: value.price,
          quantity: value.quantity + 1,
          title: value.title,
        ),
      );
    } else {
      _cartItem.putIfAbsent(
        id,
        () => Cart(
          id: DateTime.now().toString(),
          price: price,
          imageUrl: imageUrl,
          quantity: quantity,
          title: title,
        ),
      );
    }
    notifyListeners();
  }

  int get listLength {
    return _cartItem.length;
  }

  double totalPrice() {
    double total = 0.0;
    _cartItem.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  emptyCart() {
    _cartItem.clear();
    notifyListeners();
  }
}
