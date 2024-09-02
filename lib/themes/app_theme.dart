import 'package:flutter/cupertino.dart';

class theme extends ChangeNotifier {
   bool isLight=true;
   void toggelTheme(){
      isLight=!isLight;
      notifyListeners();
   }
}