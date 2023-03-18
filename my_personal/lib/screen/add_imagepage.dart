// ignore_for_file: file_names

import 'package:flutter/material.dart';

class PageDetail extends StatelessWidget {
  const PageDetail({super.key});
  static const routName = '/routName';
  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    String id = data['id'].toString();
    String imgPath = data['image'].toString();
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(id),
              centerTitle: true,
              background: Hero(
                tag: id,
                child: Image.asset(
                  imgPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [],
            ),
          ),
        ],
      ),
    );
  }
}
