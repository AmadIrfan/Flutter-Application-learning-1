import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import './product.dart';
import '../model/http_exception.dart';

class Products with ChangeNotifier {
  // final token;
  // Products(this.token);
  List<product> _items = [
    // product(
    //   id: 'p1',
    //   title: 'Red Shirt',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   imageUrl:
    //       'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    // ),
    product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    // product(
    //   id: 'p3',
    //   title: 'Yellow Scarf',
    //   description: 'Warm and cozy - exactly what you need for the winter.',
    //   price: 19.99,
    //   imageUrl:
    //       'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    // ),
    // product(
    //   id: 'p4',
    //   title: 'A Pan',
    //   description: 'Prepare any meal you want.',
    //   price: 49.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    // ),
    // product(
    //   id: 'p5',
    //   title: 'Children′s Clothing',
    //   description:
    //       'Product Type-Jacket For Boy /Denim Winter Jacket / Kid\'s Jacket , Fabric type- twill, denim, herringbone, corduroy, plaid, etc. satisfy your desire.Content-Cotton+Spandex;Cotton+Polyester;Cotton+Spandex+Polyester,etc. satisfy your desire.',
    //   price: 809.99,
    //   imageUrl:
    //       'https://image.made-in-china.com/43f34j00mndQKyrJGkzu/2018-New-Fashion-Baby-Boys-Clothes-Long-Sleeve-Jeans-Coat-Babe-Boys-Jeans-Jacket-Denim-Outerwear-Children-s-Clothing-Winter-Kids-Hip-Hop-Popular-Custom-Jacket.webp',
    // ),
    // product(
    //   id: 'p7',
    //   title: 'Single Wireless Bluetooth Earbud',
    //   description:
    //       '[Latest Bluetooth V5.0 Chip EDR/BLE +Noise Reduction][Barrier Free Transmission + Intelligent Compatibility][Light Weight+ Safe to Wear][Stereo Surround Sound + High-Quality Integrated Audio Chip][Button less + touch Control][Improved Battery Performance].',
    //   price: 499.99,
    //   imageUrl:
    //       'https://static-01.daraz.pk/p/0d92bec40b8d8e5e9f098f42af977ba2.jpg',
    // ),
  ];

  var _isFavorite = false;

  List<product> get favoriteItems {
    return _items.where((element) => element.isFavorite).toList();
  }

  List<product> get item {
    return _items;
  }

  Future<void> addToList(product pro) async {
    final url = Uri.https(
        'flutter-update-2690a-default-rtdb.firebaseio.com', '/product.json');
    final response = await http.post(url,
        body: json.encode({
          'title': pro.title,
          'imageUrl': pro.imageUrl,
          'isFavorite': pro.isFavorite,
          'price': pro.price,
          'description': pro.description,
        }));
    final newproduct = product(
      id: json.decode(response.body)['name'],
      title: pro.title,
      imageUrl: pro.imageUrl,
      price: pro.price,
      description: pro.description,
    );
    _items.add(newproduct);
    notifyListeners();
  }

  Future<void> getDataFromServer() async {
    final url = Uri.https(
        'flutter-update-2690a-default-rtdb.firebaseio.com', '/product.json');
    try {
      final response = await http.get(url);
      final extrectData = json.decode(response.body) as Map<String, dynamic>;
      List<product> dataList = [];
      extrectData.forEach((proID, productData) {
        dataList.add(product(
          id: proID,
          description: productData['description'].toString(),
          imageUrl: productData['imageUrl'].toString(),
          price: productData['price'],
          title: productData['title'].toString(),
        ));
      });
      print(extrectData);
      _items = dataList;
      notifyListeners();
    } catch (error) {
      // rethrow;
    }
  }

  product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> updateProduct(String id, product newProduct) async {
    final url = Uri.https('flutter-update-2690a-default-rtdb.firebaseio.com',
        '/product/$id.json');
    final index = _items.indexWhere((element) => element.id == id);
    if (index >= 0) {
      await http.patch(url,
          body: json.encode({
            'title': newProduct.title,
            'price': newProduct.price,
            'imageUrl': newProduct.imageUrl,
            'description': newProduct.description,
          }));
      _items[index] = newProduct;
    }
  }

  Future<void> deleteProduct(String id) async {
    final url = Uri.https('flutter-update-2690a-default-rtdb.firebaseio.com',
        '/product/$id.json');
    final productindex = _items.indexWhere((element) => element.id == id);
    product? existingProduct = _items[productindex];
    _items.removeAt(productindex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode > 400) {
      _items.insert(productindex, existingProduct);
      notifyListeners();
      throw HttpException('Could not deleted');
    }
    existingProduct = null;
  }
}
