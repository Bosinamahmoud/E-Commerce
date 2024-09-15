import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../classes/Item.dart';
import 'TotalProvider.dart';
import 'counter_provider.dart';

class CartItemsProvider extends ChangeNotifier{
  List<Item> items;
  double total;
  String date;

  CartItemsProvider({required this.items, required this.total, required this.date});
}

/*
class CartProvider extends ChangeNotifier{
  List<Item> items=[];
  List <bool> itemPressed=[];
  bool isPressed=false;
  toggleBtn(Item item){
    int index = items.indexOf(item);

    itemPressed[index]=!itemPressed[index];
    notifyListeners();

  }
  addItem(context , Item item){
    if (!items.contains(item)) {
      items.add(item);
      int counter= Provider.of<CounterProvider>(context, listen: false).counter;
      Provider.of<TotalProvider>(context, listen: false).addTotal(price: item.price, quantity: counter);
    }
  }

  removeItem(context , Item item){
    items.remove(item);
    itemPressed.removeAt(items.indexOf(item));
    int counter= Provider.of<CounterProvider>(context, listen: false).counter;
    Provider.of<TotalProvider>(context, listen: false).addTotal(price: item.price, quantity: counter);
  }
}*/
