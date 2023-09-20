import 'package:flutter/material.dart';

class PinModel extends ChangeNotifier {
  List<int> pin = [];

  void add(int number) {
    if (pin.length < 6) {
      pin.add(number);
      notifyListeners();
    }
  }

  void delete() {
    if (pin.isNotEmpty) {
      pin.removeLast();
      notifyListeners();
    }
  }
}
