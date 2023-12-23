import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:nativedevises/helper/db_helper.dart';
import '../model/place.dart';

class GreatPlace with ChangeNotifier {
  List<Place> _itemsList = [];

  List<Place> get items {
    return _itemsList;
  }

  void addPlace(String title, File img) {
    final myProduct = Place(
      id: DateTime.now().toString(),
      title: title,
      image: img,
      location: null,
    );
    _itemsList.add(myProduct);
    DbHalper.insertData(
      'Place',
      {
        'id': myProduct.id,
        'title': myProduct.title,
        'image': myProduct.image.path,
      },
    );
    notifyListeners();
  }

  Future<void> getAndSet() async {
    List dataList = await DbHalper.getAndSetData('Place');
    _itemsList = dataList
        .map(
          (item) => Place(
              id: item['id'],
              title: item['title'],
              location: null,
              image: File(item['image'])),
        )
        .toList();
    notifyListeners();
  }
}
