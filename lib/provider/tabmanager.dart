import 'package:flutter/material.dart';

class TabManager extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void goToTab(index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
