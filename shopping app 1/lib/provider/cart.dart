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

class Cart with ChangeNotifier {
  Map<String, CartItem> _itemsList = {};
  Map<String, CartItem> get itemList {
    return _itemsList;
  }

  void addData(String id, String title, double price) {
    if (_itemsList.containsKey(id)) {
      _itemsList.update(
          id,
          (existingItem) => CartItem(
              id: existingItem.id,
              price: existingItem.price,
              quentity: existingItem.quentity + 1,
              title: existingItem.title));
    } else {
      _itemsList.putIfAbsent(
          id,
          () => CartItem(
              id: DateTime.now().toString(),
              price: price,
              quentity: 1,
              title: title));
    }
    notifyListeners();
  }

  int get cartLength {
    return _itemsList.length;
  }

  double get TotalInvoice {
    double tot = 0.0;
    _itemsList.forEach((key, value) {
      tot += value.price * value.quentity;
    });
    return tot;
  }

  void deleteItem(String id) {
    _itemsList.remove(id);
    notifyListeners();
  }

  undoOrder(String id) {
    if (_itemsList[id]!.quentity > 1) {
      _itemsList.update(
          id,
          (value) => CartItem(
              id: value.id,
              price: value.price,
              quentity: value.quentity - 1,
              title: value.title));
    } else {
      _itemsList.remove(id);
    }
  }

  void emptyCart() {
    _itemsList = {};
    notifyListeners();
  }
}
