import 'package:flutter/material.dart';
import './AddTransection.dart';
import './cart.dart';

import './product.dart';
import './product_List.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<product> _productList = [
    product(
        id: DateTime.now().toString(),
        title: 'Shose',
        price: 29.9,
        dateTime: DateTime.now()),
    product(
        id: DateTime.now().toString(),
        title: 'Milk',
        price: 129.9,
        dateTime: DateTime.now()),
    product(
        id: DateTime.now().toString(),
        title: 'Mobile',
        price: 29.9,
        dateTime: DateTime.now()),
    product(
        id: DateTime.now().toString(),
        title: 'Shose',
        price: 29.9,
        dateTime: DateTime.now()),
    product(
        id: DateTime.now().toString(),
        title: 'Milk',
        price: 129.9,
        dateTime: DateTime.now()),
    product(
        id: DateTime.now().toString(),
        title: 'Mobile',
        price: 29.9,
        dateTime: DateTime.now()),
    product(
        id: DateTime.now().toString(),
        title: 'Shose',
        price: 29.9,
        dateTime: DateTime.now()),
    product(
        id: DateTime.now().toString(),
        title: 'Milk',
        price: 129.9,
        dateTime: DateTime.now()),
    product(
        id: DateTime.now().toString(),
        title: 'Mobile',
        price: 29.9,
        dateTime: DateTime.now()),
    product(
        id: DateTime.now().toString(),
        title: 'Shose',
        price: 29.9,
        dateTime: DateTime.now()),
    product(
        id: DateTime.now().toString(),
        title: 'Milk',
        price: 129.9,
        dateTime: DateTime.now()),
    product(
        id: DateTime.now().toString(),
        title: 'Mobile',
        price: 29.9,
        dateTime: DateTime.now()),
  ];
  List<product> get ProLists {
    return _productList.where((element) {
      return element.dateTime.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _deleteItem(String id) {
    setState(() {
      _productList.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My App'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                height: 270,
                child: Charts(transectionList: ProLists),
              ),
              Container(
                height: 450,
                width: double.infinity,
                child: ProductLists(
                  productList: ProLists,
                  function: _deleteItem,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AddTransection.routeName);
          },
          child: const Icon(Icons.add),
        ),
      ),
      routes: {
        AddTransection.routeName: (context) => const AddTransection(),
      },
    );
  }
}
