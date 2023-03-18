import 'dart:math';
import 'package:provider/provider.dart';
import '../provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_impo/provider/Product.dart';
import '../screen/User_Edit_Product.dart';

class UserProductDetail extends StatefulWidget {
  final Product proDetail;
  const UserProductDetail({Key? key, required this.proDetail})
      : super(key: key);

  @override
  State<UserProductDetail> createState() => _UserProductDetailState();
}

class _UserProductDetailState extends State<UserProductDetail> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 3,
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(widget.proDetail.imageUrl),
            ),
            title: Text(widget.proDetail.title),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
            ),
          ),
        ),
        if (_isExpanded)
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            width: double.infinity,
            margin: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(UseEditProducts.routeName,
                        arguments: widget.proDetail.id);
                  },
                  icon: Icon(
                    Icons.edit,
                    size: 35,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Provider.of<Products>(context, listen: false)
                        .deleteProducts(widget.proDetail.id);
                    //    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.delete,
                    size: 35,
                    color: Theme.of(context).errorColor,
                  ),
                ),
              ],
            ),
          ),
        const Divider(
          thickness: 3,
        ),
      ],
    );
  }
}
