import 'dart:math';

import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/order_screen.dart';
import '../screens/view_product_screen.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  late String img;
  @override
  void initState() {
    List image = [
      'assets/images/123.jpg',
      'assets/images/amad.png',
    ];
    super.initState();
    img = image[Random().nextInt(image.length)];
  }

  DateTime? datePicker;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: Stack(
            children: [
              CircleAvatar(
                radius: 100,
                backgroundColor: Colors.transparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    img,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        newMethod(
          'Home',
          Icons.home,
          () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: ((_) => const HomeScreen()),
              ),
            );
          },
        ),
        newMethod(
          'Order',
          Icons.trip_origin,
          () {
            Navigator.of(context).pushReplacementNamed(OrderScreen.routName);
          },
        ),
        newMethod(
          'Add Products',
          Icons.add_circle,
          () {
            Navigator.of(context)
                .pushReplacementNamed(ViewProductScreen.routeName);
          },
        ),
        Text(
          datePicker == null ? " No Date Selected " : datePicker.toString(),
        ),
        TextButton(
          onPressed: () => _showingDate(context),
          child: const Text("Data"),
        )
      ],
    );
  }

  void _showingDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2099),
    ).then((value) {
      if (value != null) {
        setState(() => datePicker = value);
      }
    });
  }

  Widget newMethod(String title, IconData icon, Function ontop) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
        color: Colors.orangeAccent,
      ),
      child: ListTile(
        onTap: () {
          ontop();
        },
        title: Text(title),
        leading: Icon(icon),
      ),
    );
  }
}
