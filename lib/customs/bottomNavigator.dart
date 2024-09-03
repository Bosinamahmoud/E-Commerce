import 'package:flutter/material.dart';

import '../screens/Home.dart';
import '../screens/Cart.dart';
import '../screens/history.dart';

Widget getBottomNavigator(int screenIdx, context){
  List<Widget> screens=[
    Home(),
    Cart(),
    history(),
  ];

  Color c= Colors.red;

  return BottomNavigationBar(
      selectedItemColor: c,
      unselectedItemColor: Colors.grey[350],
      currentIndex: screenIdx,
      onTap: (index){
        screenIdx=index;
        Navigator.push(context, MaterialPageRoute(builder: (context)=>screens[index]));
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home",),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined),label: "Cart",),
        BottomNavigationBarItem(icon:
        Icon(Icons.history,), label: "History"),
      ]);
}