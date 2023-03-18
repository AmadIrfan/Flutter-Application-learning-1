import 'package:flutter/material.dart';

class ListBuilding extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final images;
  // ignore: prefer_typing_uninitialized_variables
  final title;

  const ListBuilding({super.key, required this.images, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: FileImage(images),
        ),
        title: Text(title),
      ),
    );
  }
}
