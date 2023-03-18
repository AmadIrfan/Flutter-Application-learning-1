import 'package:flutter/foundation.dart';

import '../provider/product.dart';

class ProductsData with ChangeNotifier {
  final List<Product> _productList = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  List<Product> get productList {
    return _productList;
  }

  List<Product> get favoriteList {
    return _productList.where((element) => element.isFavorite).toList();
  }

  double get totalAmout {
    double total = 0;
    for (var element in _productList) {
      total += element.price;
    }
    return total;
  }

  int get totalItems {
    return _productList.length;
  }

  double get heigestPrice {
    double max = 0;
    _productList.forEach((element) {
      if (element.price > max) {
        max = element.price;
      }
    });
    return max;
  }

  Product findById(String id) {
    return _productList.firstWhere((element) {
      return element.id == id;
    });
  }
}
