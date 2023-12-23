import 'package:flutter/material.dart';
import 'package:nativedevises/add_place_screen.dart';
import 'package:nativedevises/list_view_screen.dart';
import 'package:nativedevises/provider/greatPlace.dart';
import 'package:provider/provider.dart';

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
        home: const ListViewScreen(),
        routes: {
          AddPlaceScreen.routeName: (context) => const AddPlaceScreen(),
        },
      ),
    );
  }
}
