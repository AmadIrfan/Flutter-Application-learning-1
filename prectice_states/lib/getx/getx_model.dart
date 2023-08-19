import 'package:get/get.dart';

class DataGetItem extends GetxController {
  // RxInt? id = 0.obs;
  int? id;
  // RxString? name = ''.obs;
  String? name;
  // RxString? email = ''.obs;
  String? email;
  DataGetItem({
    required this.id,
    required this.email,
    required this.name,
  });
}

class DataGetItemMethods extends GetxController {
  // final RxList<DataGetItem> _item = <DataGetItem>[].obs;
  // final RxList<DataGetItem> _item = [
  //   DataGetItem(id: 1, email: 'email 1', name: 'name 1'),
  // ].obs;

  final RxList<DataGetItem> _item = <DataGetItem>[
    DataGetItem(id: 1, email: 'email 1', name: 'name 1'),
    DataGetItem(id: 2, email: 'email 2', name: 'name 2'),
    DataGetItem(id: 3, email: 'email 3', name: 'name 3'),
  ].obs;

  RxList<DataGetItem> get item => _item;
  void addItem() {
    final item = DataGetItem(
      id: (_item.length + 1),
      email: 'email 3',
      name: 'name 3',
    );
    _item.add(item);
  }
}
