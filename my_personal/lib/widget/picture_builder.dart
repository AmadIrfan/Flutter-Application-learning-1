import 'package:flutter/material.dart';
import 'package:my_personal/screen/add_imagePage.dart';

class PictureBuilder extends StatelessWidget {
  const PictureBuilder({super.key, required this.imgSrc, required this.id});
  final String imgSrc;
  final String id;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          PageDetail.routName,
          arguments: {"id": id, "image": imgSrc},
        );
      },
      mouseCursor: MouseCursor.uncontrolled,
      // hoverColor: Colors.green,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(30),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Hero(
            tag: UniqueKey(),
            child: Image.asset(
              imgSrc,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
