import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RNotifier extends StateNotifier<List<int>> {
  RNotifier() : super([]);

  void add(int number) {
    state = [...state, number];
  }
}

class MyClass with ChangeNotifier {
  int counter = 0;
  void increment() {
    counter++;
    notifyListeners();
  }
}
