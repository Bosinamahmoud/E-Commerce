import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  int itemCount = 0;



  void addItem() {
    itemCount++;
    notifyListeners();
  }

  void removeItem() {
    if (itemCount > 0) {
      itemCount--;
      notifyListeners();
    }
  }
}