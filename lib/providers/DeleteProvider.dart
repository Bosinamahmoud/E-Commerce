import 'package:flutter/cupertino.dart';

import '../classes/Item.dart';

class DeleteProvider extends ChangeNotifier{
  deleteItem({required final items, required final item}){
    items.remove(item);
    notifyListeners();
  }

  updateTotal({required Item item, required double total, required int quantity}){
    total-=item.price*quantity;
    notifyListeners();
  }
}