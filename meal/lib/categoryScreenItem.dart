import 'package:flutter/material.dart';
import 'package:newapp/itemScreenDetail.dart';

class CategoryScreenItem extends StatelessWidget {
  const CategoryScreenItem(
      {super.key, required this.name, required this.color, required this.id});
  final Color color;
  final String id;
  final String name;

  void _selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      ItemScreenDetail.routeName,
      arguments: {'id': id, 'title': name, 'color': color},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: const Color.fromARGB(255, 63, 53, 53),
          ),
        ),
        child: InkWell(
          onTap: (() => _selectCategory(context)),
          splashColor: color,
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [color.withOpacity(0.7), color],
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              child: Container(
                width: 180,
                //height: ,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  name,
                  style: const TextStyle(fontSize: 25, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
