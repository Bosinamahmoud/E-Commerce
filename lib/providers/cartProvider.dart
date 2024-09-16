import 'package:ecommerce/classes/Item.dart';
import 'package:ecommerce/providers/TotalProvider.dart';
import 'package:ecommerce/providers/counter_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Cartprovider extends ChangeNotifier{
  List<Item> items=[];
  List<String>names=[];

  addItem(context , final item){
    if (!names.contains(item.title)) {
      items.add(item);
      names.add(item.title);

      int counter= Provider.of<CounterProvider>(context, listen: false).getCounter(item);
      Provider.of<TotalProvider>(context, listen: false).addTotal(price: item.price, quantity: counter);
      notifyListeners();
    }
  }

  removeItem(context , final item){
    items.remove(item);
    names.remove(item.title);
    int counter= Provider.of<CounterProvider>(context, listen: false).getCounter(item);
    Provider.of<TotalProvider>(context, listen: false).removeTotal(price: item.price, quantity: counter);

    Provider.of<CounterProvider>(context, listen:false).removeCounter(item:item);
    notifyListeners();
  }

  clearItems(){
    items.clear();
    names.clear();
  }
}