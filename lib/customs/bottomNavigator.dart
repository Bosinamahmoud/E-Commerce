import 'package:ecommerce/providers/cartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/Home.dart';
import '../screens/Cart.dart';
import '../screens/history.dart';

Widget getBottomNavigator(context, [int screenIdx=1]){
  List<Widget> screens=[
    Home(),
    Cart(),
    history(),
  ];

  Color c=  Theme.of(context).primaryColor;

  return BottomNavigationBar(
  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  selectedItemColor: c,
  unselectedItemColor: Colors.grey[350],
  currentIndex: screenIdx,
  onTap: (index){
  screenIdx=index;
  Navigator.push(context, MaterialPageRoute(builder: (context)=>screens[index]));
  },
  items: [
  BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home",),

  BottomNavigationBarItem(icon:       Icon(Icons.shopping_cart_outlined),

   /* Stack(
    children: [
      Icon(Icons.shopping_cart_outlined),

      Positioned(
        right: 0,
          top: 0,
          child: Container(
            //padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: BoxConstraints(
              minWidth: 20,
              minHeight: 20,
            ),
            child: Center(
              child: Text(
                '${Provider.of<CartProvider>(context).itemCount}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ))
    ],
  )*/
    label: "Cart",),
  BottomNavigationBarItem(icon:
  Icon(Icons.history,), label: "History"),
      ]);
}