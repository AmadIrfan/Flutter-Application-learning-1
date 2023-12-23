import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });
  void isFavoriteToggle() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}

class ProductDL with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p8r',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p5',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p6',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p7',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];
  addProduct(Product pro) {
    Product prod = Product(
      id: DateTime.now().toString(),
      title: pro.title,
      imageUrl: pro.imageUrl,
      price: pro.price,
      description: pro.description,
    );
    _items.add(prod);
    notifyListeners();
  }

  List<Product> get item {
    return [..._items];
  }

  List<Product> get favList {
    return _items.where((element) => element.isFavorite).toList();
  }

  updatePro(String id, Product pro) {
    int idx = _items.indexWhere((element) => element.id == id);
    if (idx >= 0) {
      _items[idx] = pro;
    }
    notifyListeners();
  }

  searchById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  deleteProd(String id) {
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
