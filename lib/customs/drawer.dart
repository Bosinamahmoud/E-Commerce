import 'package:ecommerce/classes/ScreenName.dart';
import 'package:ecommerce/screens/Cart.dart';
import 'package:ecommerce/screens/history.dart';
import 'package:flutter/material.dart';

import '../screens/Home.dart';

Widget getDrawer(){
  Color c= Colors.red;

  List<ScreenName>screens=[
    ScreenName(name: "Home", screen: Home(username: 'Touka')),
    ScreenName(name: "My Cart", screen: Cart()),
    ScreenName(name: "My History", screen: history()),

  ];
  return Drawer(
    backgroundColor: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){},
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.dark_mode_outlined, color: c))
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: c,
                      child: Icon(Icons.person, color: Colors.white, size: 50,),
                    ),
                    Column(
                      children: [
                        Text("Hi, Touka!"),
                        SizedBox(height: 8),
                        Text("View Profile")
                      ],
                    )
                  ],
                )

              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: screens.length,
                itemBuilder: (context , index){
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>screens[index].screen));
                },
                child: Text(screens[index].name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
              );
            }),
          )
        ],
      ),
    ),
  );
}
