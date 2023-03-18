import 'package:flutter/material.dart';
import 'package:online1/provider/products_list.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  static const String routeName = '/productDetailScreen';

  Widget _widgetBuilder(String title, double width) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      child: Text(
        title,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final detail = ModalRoute.of(context)!.settings.arguments.toString();
    final detailData = Provider.of<ProductsData>(context).findById(detail);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(detailData.title),
      ),
      body: ListView(
        children: [
          _widgetBuilder('Image', double.infinity),
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Hero(
                tag: detailData.id,
                child: FadeInImage(
                    placeholder: const AssetImage(
                        'assets/image/product-placeholder.png'),
                    image: NetworkImage(
                      detailData.imageUrl,
                    )),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _widgetBuilder('Price', 150),
              _widgetBuilder('${detailData.price} /\$', 200),
            ],
          ),
          _widgetBuilder('Description', double.infinity),
          _widgetBuilder(detailData.description, double.infinity),
        ],
      ),
    );
  }
}
