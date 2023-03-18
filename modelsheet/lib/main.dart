import 'package:flutter/material.dart' show BuildContext, Center, CircularProgressIndicator, ConnectionState, FutureBuilder, MaterialApp, ScaffoldMessenger, SnackBar, StatelessWidget, Text, Widget, WidgetsFlutterBinding, runApp;
import 'package:firebase_core/firebase_core.dart';
import 'package:modelsheet/aut.dart';

import './reset_page.dart';
import './TabBar_Screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  Future<FirebaseApp> myFirebaseApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: myFirebaseApp,
      builder: ((context, snapshot) {
        if (snapshot.hasError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Error Occurs Plz try later'),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return MaterialApp(
            home: const AuthScreen(),
            routes: {
              TabBarScreen.routeName: (context) => const TabBarScreen(),
              ResetPasword.routName: (context) => const ResetPasword(),
            },
          );
        }
      }),
    );
  }
}
