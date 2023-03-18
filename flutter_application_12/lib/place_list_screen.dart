// ignore_for_file: avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:flutter_application_12/widget/list_build.dart';
import './add_place_screen.dart';

import 'package:provider/provider.dart';
import './provider/grateplace.dart';

class PlaceListScreen extends StatelessWidget {
  const PlaceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Place'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceSceen.routename);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlace>(context, listen: false).getandSetData(),
        builder: (context, snapShot) => Consumer<GreatPlace>(
          builder: (context, gPlace, ch) =>
              snapShot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        if (gPlace.item.isEmpty) {
                          return const Center(
                            child: Text('No Place Added'),
                          );
                        } else {
                          return ListBuilding(
                              images: gPlace.item[index].image,
                              title: gPlace.item[index].title);
                        }
                      },
                      itemCount: gPlace.item.length,
                    ),
        ),
      ),
    );
  }
}
 // ignore: non_constant_identifier_names
        // builder: (context, GPlace, ch) => GPlace.item.isEmpty
        //     ? ch
        //     : ListView.builder(
        //         itemCount: GPlace.item.length,
        //         itemBuilder: (ctx, index) {
        //           return Text(GPlace.item[index].title);
        //         },
        //       ),