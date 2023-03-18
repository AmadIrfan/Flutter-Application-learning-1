import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import './cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final DateTime dateTime;
  final List<CartItem> orderList;

  OrderItem({
    required this.id,
    required this.amount,
    required this.dateTime,
    required this.orderList,
  });
}

class Order with ChangeNotifier {
  List<OrderItem> _orderItemList = [];

  List<OrderItem> get orderList {
    return _orderItemList;
  }

  Future<void> addorder(double amount, List<CartItem> orderList) async {
    final dateTime = DateTime.now();
    final url = Uri.https(
        'flutter-update-2690a-default-rtdb.firebaseio.com', '/order.json');
    // final response = await http.post(url,
    //     body: json.encode({
    //       'totalAmount': amount,
    //       'DateTime': dateTime.toIso8601String(),
    //       'products': orderList
    //           .map((cp) => {
    //                 'id': cp.id,
    //                 'title': cp.title,
    //                 'price': cp.price,
    //                 'quentity': cp.quentity,
    //               })
    //           .toList(),
    //     }));
    _orderItemList.insert(
        0,
        OrderItem(
            id: DateTime.now()
                .toString(), // json.decode(response.body)['name'],
            amount: amount,
            dateTime: DateTime.now(),
            orderList: orderList));
    notifyListeners();
  }

  Future<void> getandSet() async {
    final url = Uri.https(
        'flutter-update-2690a-default-rtdb.firebaseio.com', '/order.json');
    final response = await http.get(url);
    List<OrderItem> orderList = [];
    final extrectData = json.decode(response.body) as Map<String, dynamic>;
    if (extrectData.isEmpty) {
      return;
    }
    extrectData.forEach((proID, proValue) {
      orderList.add(
        OrderItem(
            id: proID,
            amount: proValue['totalAmount'],
            dateTime: DateTime.parse(proValue['DateTime']),
            orderList: (proValue['products'] as List<dynamic>)
                .map((item) => CartItem(
                    id: item['id'],
                    price: item['price'],
                    quentity: item['quentity'],
                    title: item['title']))
                .toList()),
      );
    });
    _orderItemList = orderList;
  }
}
