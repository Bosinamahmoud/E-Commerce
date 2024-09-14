import 'package:ecommerce/classes/Item.dart';
import 'package:flutter/cupertino.dart';

class TotalProvider extends ChangeNotifier{
  double total=0;

  addTotal({required double price, int quantity=1}){
    total+=price*quantity;
    notifyListeners();
  }

  removeTotal({required double price, int quantity=1}){
    total-=price*quantity;
    notifyListeners();
  }
}