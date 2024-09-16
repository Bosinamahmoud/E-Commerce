import 'package:ecommerce/providers/cartProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../classes/Item.dart';
import 'CartItemsProvider.dart';
import 'counter_provider.dart';

class DeleteProvider extends ChangeNotifier{
  deleteItem({required context, required final item}){
    // List<Item> items=Provider.of<Cartprovider>(context, listen: false).items;
    // items.remove(item);

    Provider.of<Cartprovider>(context, listen:false).removeItem(context,item);

    Provider.of<CounterProvider>(context, listen:false).removeCounter(item:item);
    notifyListeners();
  }

}