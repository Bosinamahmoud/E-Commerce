import 'package:ecommerce/classes/Item.dart';
import 'package:flutter/cupertino.dart';

class CategoryProvider extends ChangeNotifier{

  List<String> selectedCategories=[];

  addCategory(String category){
    selectedCategories.add(category);
    notifyListeners();
  }

  removeCategory(String category){
    selectedCategories.remove(category);
    notifyListeners();
  }
}