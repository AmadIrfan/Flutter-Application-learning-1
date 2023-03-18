import 'package:flutter/material.dart';
import 'package:generatedynamicroute/main.dart';

import 'package:generatedynamicroute/route_name.dart';
import 'package:generatedynamicroute/sacreen2.dart';
import 'package:generatedynamicroute/screen1.dart';

class RouteDynamic {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RouteName.screen1:
        return MaterialPageRoute(
          settings: setting,
          builder: ((context) => const Screen1()),
        );
      case RouteName.screen2:
        return MaterialPageRoute(
          settings: setting,
          builder: ((context) => const Screen2()),
        );
      case RouteName.home:
        return MaterialPageRoute(
          settings: setting,
          builder: ((context) => const MyHomePage()),
        );
      default:
        return MaterialPageRoute(
          builder: ((context) => const Scaffold(
                body: Center(
                  child: Text('No route found'),
                ),
              )),
        );
    }
  }
}
