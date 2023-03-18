import 'package:flutter/material.dart';
import 'package:modelsheet/desh.dart';
import 'package:modelsheet/profile.dart';
import 'package:modelsheet/reset_page.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});
  static const routeName = '/tabbarScreen';
  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _tabIndexController = 0;
  final List<Map<String, dynamic>> _pages = [
    {
      'title': 'Dashboard',
      'page': const Dashboard(),
    },
    {
      'title': 'Reset Password',
      'page': const ResetPasword(),
    },
    {
      'title': 'Profile',
      'page': const Profile(),
    }
  ];

  void _changeTabbaR(int index) {
    setState(() {
      _tabIndexController = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_tabIndexController]['title']),
      ),
      body: _pages[_tabIndexController]['page'],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        onTap: _changeTabbaR,
        unselectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _tabIndexController,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Reset Email'),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Profile'),
        ],
      ),
    );
  }
}
