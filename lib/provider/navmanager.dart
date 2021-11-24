import 'package:flutter/foundation.dart';

class NavManager extends ChangeNotifier{

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void goToNav(index){
    _selectedIndex = index;
    notifyListeners();
  }



}