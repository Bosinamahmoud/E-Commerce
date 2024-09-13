import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier{
  int counter=1;
  increamentCounter(){
    counter++;
    notifyListeners();
  }
  decrementCounter(){
    counter--;
    notifyListeners();
  }
}