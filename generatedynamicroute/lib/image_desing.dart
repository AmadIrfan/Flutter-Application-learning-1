import 'package:flutter/material.dart';
import 'package:generatedynamicroute/modal/image_class.dart';
import 'package:generatedynamicroute/route_name.dart';
import 'package:provider/provider.dart';

class ImageDesign extends StatelessWidget {
  const ImageDesign({super.key});

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<ImageClass>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(RouteName.screen2, arguments: item.id);
      },
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.all(1),
        child: ListTile(
          trailing: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(RouteName.screen2, arguments: item.id);
            },
            icon: const Icon(
              Icons.navigate_next,
            ),
          ),
          title: Text(item.title),
          leading: SizedBox(
            height: 50,
            width: 50,
            child: ClipRRect(
              child: Hero(
                tag: item.id ,
                child: Image.asset(
                  item.img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
