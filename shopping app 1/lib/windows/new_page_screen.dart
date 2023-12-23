import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prper_provider_app/modal/product.dart';

class NewPageScreen extends StatelessWidget {
  const NewPageScreen({super.key});
  static const routName = 'newPage';
  @override
  Widget build(BuildContext context) {
    final details = ModalRoute.of(context)!.settings.arguments as String;
    final listItems = Provider.of<ProductDL>(context)
        .item
        .firstWhere((element) => element.id == details);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          // "amad"
          listItems.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  listItems.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            _itemBuilder(
              'Price',
              listItems.price.toString(),
            ),
            const SizedBox(
              height: 30,
            ),
            _itemBuilder(
              'Title',
              listItems.title,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Discription',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Wrap(
                // direction: Axis.horizontal,
                // alignment: WrapAlignment.spaceBetween,
                children: [
                  Text(listItems.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemBuilder(String name, String data) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.spaceBetween,
        children: [
          Text(name),
          Text(data),
        ],
      ),
    );
  }
}
