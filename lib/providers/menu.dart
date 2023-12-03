import 'package:flutter/material.dart';

class Menu extends ChangeNotifier {
  double _position = 40;
  String _menu = 'Beranda';

  set position(double pos) {
    _position = pos;
    notifyListeners();
  }

  double get position => _position;

  set menu(String menu) {
    _menu = menu;
    notifyListeners();
  }

  String get menu => _menu;
}
