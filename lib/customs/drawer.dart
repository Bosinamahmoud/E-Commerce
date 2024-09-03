import 'package:flutter/material.dart';

Widget getDrawer(){
  Color c= Colors.red;
  return Drawer(
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
        ],
      ),
    ),
  );
}
