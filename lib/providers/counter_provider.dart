import 'package:flutter/material.dart';

import '../classes/Item.dart';

class CounterProvider extends ChangeNotifier{
  Map<Item, int> itemCounter={};

  int getCounter(final item) {
    if(!itemCounter.containsKey(item)) itemCounter[item]=1;

    return itemCounter[item]!;
  }

  bool increamentCounter({required Item item}){
    List<dynamic> quantity=item.quantity.split(" ");
    bool response=true;

    if(!itemCounter.containsKey(item)) itemCounter[item]=1;

    int left=int.parse(quantity[0]);
    if(left > itemCounter[item]!){
      itemCounter[item]=itemCounter[item]!+1;
      notifyListeners();
    }
    else response=false;
    return response;
  }

  bool decrementCounter({required Item item}){
    bool response=true;

    if(!itemCounter.containsKey(item)) itemCounter[item]=1;

    if(itemCounter[item]! >1){
      itemCounter[item] = itemCounter[item]! - 1;
      notifyListeners();}
    else response=false;
    return response;
  }

  removeCounter({required Item item}){
    itemCounter.remove(item);
  }
}