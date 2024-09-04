import 'package:flutter/material.dart';
const COLOER_PRIMARY=Colors.blue;
ThemeData lightTheme =ThemeData(
brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
primaryColor:Colors.red,
elevatedButtonTheme: ElevatedButtonThemeData(style:ElevatedButton.styleFrom(
    backgroundColor: Colors.red,
)
)
    ,appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
)
);
ThemeData darkTheme =ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    primaryColor:Colors.red,
);