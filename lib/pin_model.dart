import 'package:flutter/material.dart';

class PinModel extends ChangeNotifier {
  List<int> pin = [];
  bool showPinSalah = false;

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

  void removeAll() {
    pin = [];

    Future.delayed(const Duration(milliseconds: 250), () => notifyListeners());
  }
}
