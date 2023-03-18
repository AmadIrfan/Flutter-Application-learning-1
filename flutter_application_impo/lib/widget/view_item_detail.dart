import 'package:flutter/material.dart';
import 'package:flutter_application_impo/provider/Product.dart';
import 'package:provider/provider.dart';

import '../provider/product_provider.dart';

class ItemViewDetail extends StatelessWidget {
  static const routeName = '/ViewItemDetail';
  const ItemViewDetail({Key? key}) : super(key: key);
  Widget textEditer(String title, double width) {
    return Container(
      width: width,
      height: 55,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routId = ModalRoute.of(context)?.settings.arguments as String;

    final listItems = Provider.of<Products>(context);
    final dataList =
        listItems.itemList.firstWhere((element) => element.id == routId);
    return Scaffold(
      appBar: AppBar(title: Text(dataList.title), actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
              dataList.isFavorite ? Icons.favorite : Icons.favorite_border),
        ),
      ]),
      body: SingleChildScrollView(
        child: Column(children: [
          textEditer('Image', 300),
          Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 3)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(dataList.imageUrl),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textEditer('Price', 100.0),
              textEditer('\$ ${dataList.price.toStringAsFixed(2)} ', 150.0),
            ],
          ),
          textEditer('Description', 300),
          textEditer(dataList.description, double.infinity),
        ]),
      ),
    );
  }
}
