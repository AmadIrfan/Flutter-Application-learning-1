import 'package:flutter/material.dart';
import 'package:generatedynamicroute/route_name.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    //as Map<String, String>
    final routeData =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;

    return Scaffold(
      body: Center(
          child: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                RouteName.screen2,
                arguments: 'Amad',
              );
            },
            child: const Text('Screen 2'),
          ),
          Text(
            routeData['Name'].toString(),
          )
        ],
      )),
    );
  }
}
