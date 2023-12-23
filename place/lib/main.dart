import 'package:flutter/material.dart';
import './add_place_screen.dart';
import 'package:provider/provider.dart';

import '../provider/grateplace.dart';
import './place_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GreatPlace(),
      child: MaterialApp(
        title: 'Grate Place',
        home: const PlaceListScreen(),
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          //         accentColor: Colors.amber,
        ),
        routes: {
          AddPlaceSceen.routename: (context) => const AddPlaceSceen(),
        },
      ),
    );
  }
}
