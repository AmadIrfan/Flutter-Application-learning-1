import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import './Product.dart';

class Products with ChangeNotifier {
  List<Product> _itemlist = [
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

  List<Product> get itemList {
    return _itemlist;
  }

  List<Product> get favoriteItem {
    return _itemlist.where((element) => element.isFavorite).toList();
  }

  Product findById(String proId) {
    return _itemlist.firstWhere((element) => element.id == proId);
  }

  Future<void> getDataFromServer() async {
    // final url = Uri.https(
    //     'flutter-my-cd8e0-default-rtdb.firebaseio.com', '/product.json');
    // final response = await http.get(url);
    // try {
    //   final extrectData = json.decode(response.body) as Map<String, dynamic>;
    //   List<Product> tempList = [];
    //   extrectData.forEach((proId, proData) {
    //     tempList.add(Product(
    //       id: proId,
    //       title: proData['title'],
    //       imageUrl: proData['imageUrl'],
    //       price: proData['price'],
    //       isFavorite: proData['isFavorite'],
    //       description: proData['description'],
    //     ));
    //     _itemlist = tempList;
    //     notifyListeners();
    //   });
    // } catch (error) {
    //   throw error;
    // }
  }

  Future<void> addProduct(Product productData) async {
    final url = Uri.https(
        'flutter-my-cd8e0-default-rtdb.firebaseio.com', '/product.json');
// json.decode(response.body)['name']
    final response = await http.post(url,
        body: json.encode({
          'title': productData.title,
          'imageUrl': productData.imageUrl,
          'price': productData.price,
          'description': productData.description,
        }));
    print(response.body);
    final newProduct = Product(
        id: json.decode(response.body)['name'],
        title: productData.title,
        imageUrl: productData.imageUrl,
        description: productData.description,
        price: productData.price);
    _itemlist.add(newProduct);
    notifyListeners();
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final url = Uri.https('flutter-update-2690a-default-rtdb.firebaseio.com',
        '/products/$id.json');
    final proIndex = _itemlist.indexWhere((element) => element.id == id);
    if (proIndex >= 0) {
      http.patch(url,
          body: json.encode({
            'title': newProduct.title,
            'price': newProduct.price,
            'ImageUrl': newProduct.imageUrl,
            'description': newProduct.description,
          }));
      _itemlist[proIndex] = newProduct;
      notifyListeners();
    }
  }

  void deleteProducts(String id) {
    _itemlist.removeWhere((element) => element.id == id);
  }
}
