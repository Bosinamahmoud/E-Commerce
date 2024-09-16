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

