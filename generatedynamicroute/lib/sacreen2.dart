import 'package:flutter/material.dart';
import 'package:generatedynamicroute/modal/image_class.dart';
import 'package:generatedynamicroute/route_name.dart';
import 'package:provider/provider.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    final routeData = ModalRoute.of(context)!.settings.arguments as int;
    print(routeData);
    final item = Provider.of<ImageList>(context)
        .item
        .firstWhere(((element) => element.id == routeData));
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: item.id,
                child: Image.asset(
                  item.img,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(item.title),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ListTile(
                  title: Text(item.title),
                  subtitle: Text(
                    item.description,
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
