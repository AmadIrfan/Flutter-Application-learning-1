import 'package:flutter/widgets.dart';

class DataItem with ChangeNotifier {
  String? name;
  String? id;
  String? email;
  DataItem({
    required this.id,
    required this.email,
    required this.name,
  });
}

class DataItemMethod with ChangeNotifier {
  final List<DataItem> _item = [
    DataItem(
      id: '1',
      email: 'amadirfan043@gmail.com',
      name: 'AmadIrfan',
    ),
    DataItem(
      id: '2',
      email: 'amadirfan143@gmail.com',
      name: 'AamadIrfan',
    ),
    DataItem(
      id: '3',
      email: 'amadirfan243@gmail.com',
      name: 'BamadIrfan',
    ),
    DataItem(
      id: '4',
      email: 'amadirfan343@gmail.com',
      name: 'CamadIrfan',
    ),
    DataItem(
      id: '5',
      email: 'amadirfan443@gmail.com',
      name: 'DamadIrfan',
    ),
  ];

  List<DataItem> get item {
    return [..._item];
  }

  void addData() {
    DataItem item = DataItem(
      id: (_item.length + 1).toString(),
      email: 'amadirfan443@gmail.com',
      name: 'DamadIrfan',
    );
    _item.add(item);
    notifyListeners();
  }
}
