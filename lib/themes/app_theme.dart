import 'package:flutter/material.dart';
const COLOER_PRIMARY=Colors.blue;
ThemeData lightTheme =ThemeData(
brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
primaryColor:Color(0xffB29CE4),
elevatedButtonTheme: ElevatedButtonThemeData(style:ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
)
)
    ,appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
)
);
ThemeData darkTheme =ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    primaryColor:Color(0xffB29CE4),
);