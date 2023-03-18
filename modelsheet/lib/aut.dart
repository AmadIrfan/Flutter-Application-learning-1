import 'package:flutter/material.dart';

import 'package:modelsheet/login.dart';
import 'package:modelsheet/signup.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: const Text('my app'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
            ],
            bottom: const TabBar(tabs: [
              Tab(
                text: 'Login',
                icon: Icon(Icons.login),
              ),
              Tab(
                icon: Icon(Icons.account_box),
                text: 'Sign Up',
              )
            ]),
          ),
          body: TabBarView(
            children: [
              LoginPage(),
              const SignUp(),
            ],
          ),
        ),
      ),
    );
  }
}
