import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int counter = 1;

  bool increamentCounter({required String left}) {
    List<dynamic> quantity = left.split(" ");
    bool response = true;
    int l = int.parse(quantity[0]);
    if (l > counter) {
      counter++;
      notifyListeners();
    } else
      response = false;
    return response;
  }

  bool decrementCounter() {
    bool response = true;
    if (counter > 1) {
      counter--;
      notifyListeners();
    } else
      response = false;
    return response;
  }
}
