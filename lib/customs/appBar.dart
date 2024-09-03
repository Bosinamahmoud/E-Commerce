import 'package:flutter/material.dart';

PreferredSizeWidget getAppBar(context){
  Color c= Colors.red;
  return AppBar(
    title: Text("Shoppe", style: TextStyle(color: c, fontWeight: FontWeight.bold),),
    centerTitle: true,
    leading: Builder(
        builder: (context) {
          return IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          }, icon: Icon(Icons.menu, color: c));
        }
    ),
    actions: [
      IconButton(onPressed: (){
        showBottomSheet(context: context, builder: (context){
          return Container(
            color: Colors.red,
          );
        });
      }, icon: Icon(Icons.filter_list_outlined, color: c)),

    ],
  );
}