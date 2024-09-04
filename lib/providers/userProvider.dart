import 'package:flutter/material.dart';

class userProvider extends ChangeNotifier{
  static String  _name="";
  static String _email="";
  String get name=>_name;
  String get email=>_email;
  void setName(String name){
    _name =name;
    notifyListeners();
  }
  void setEmail(String email){
    _email =email;
    notifyListeners();
  }


}