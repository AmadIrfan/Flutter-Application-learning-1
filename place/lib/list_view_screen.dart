import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:nativedevises/add_place_screen.dart';
import 'package:nativedevises/provider/greatPlace.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Great Pleace'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlace>(context).getAndSet(),
        builder: (context, snapshot) => Consumer<GreatPlace>(
          child: const Text('no item is added in list !!!'),
          builder: (context, gPlace, ch) => gPlace.items.isEmpty
              ? ch!
              : ListView.builder(
                  itemBuilder: ((context, index) => ListTile(
                        leading: CircleAvatar(
                          backgroundImage: FileImage(gPlace.items[index].image),
                        ),
                        title: Text(gPlace.items[index].title),
                      )),
                  itemCount: gPlace.items.length,
                ),
        ),
      ),
    );
  }
}
