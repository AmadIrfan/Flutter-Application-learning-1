import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class product with ChangeNotifier {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final double price;
  bool isFavorite;
  product({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.description,
    this.isFavorite = false,
  });

  Future<void> isFavroiteToggle() async {
    bool oldFav = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url = Uri.https('flutter-update-2690a-default-rtdb.firebaseio.com',
        '/product/$id.json');
    try {
      final response = await http.patch(url,
          body: json.encode({
            'isFavorite': isFavorite,
          }));
      if (response.statusCode >= 400) {
        isFavorite = oldFav;
        notifyListeners();
      }
    } catch (error) {
      isFavorite = oldFav;
      notifyListeners();
    }
  }
}
