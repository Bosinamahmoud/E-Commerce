/*
// lib/app_theme.dart

import 'package:flutter/material.dart';

// تعريف الثيم المخصص
class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.blue,
    accentColor: Colors.orange,
    backgroundColor: Colors.white,
    fontFamily: 'Roboto', // استخدام الخط المخصص

    // تخصيص أنماط النصوص
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
      bodyText1: TextStyle(fontSize: 16.0, color: Colors.black),
    ),
    // تخصيص الثيم للأزرار أو العناصر الأخرى
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.blue, // لون الخلفية للأزرار
        onPrimary: Colors.white, // لون النص للأزرار
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      ),
    ),
  );

  // يمكنك تعريف ثيمات إضافية، مثل الثيم الداكن (Dark Theme)
  static ThemeData darkTheme = ThemeData(
    primaryColor: Colors.grey[900],
    accentColor: Colors.orange,
    backgroundColor: Colors.black,
    fontFamily: 'Roboto',
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
      bodyText1: TextStyle(fontSize: 16.0, color: Colors.white),
    ),
  );
}*/
