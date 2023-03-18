import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_application_12/helpers/db_helpers.dart';
import '../model/place.dart';

class GreatPlace with ChangeNotifier {
  List<Place> _listItem = [];
  List<Place> get item {
    return _listItem;
  }

  void addPlace(String titles, File image) {
    final placeAdd = Place(
        id: DateTime.now().toString(),
        title: titles,
        location: null,
        image: image);
    _listItem.add(placeAdd);
    notifyListeners();
    DbHelper.insert(
      'user_places',
      {
        'id': placeAdd.id,
        'title': placeAdd.title,
        'image': placeAdd.image.path
      },
    );
  }

  Future<void> getandSetData() async {
    final dataList = await DbHelper.getandSetData('user_places');
    print(dataList.length);
    _listItem = dataList
        .map(
          (item) => Place(
              id: item['id'],
              title: item['title'],
              image: File(item['image']),
              location: null),
        )
        .toList();
    notifyListeners();
  }
}
