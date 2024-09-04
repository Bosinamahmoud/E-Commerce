import 'package:flutter/material.dart';

class Themeprovider extends ChangeNotifier {
  bool isLight=true;
  void toggelTheme(){
    isLight=!isLight;
    notifyListeners();
  }
}