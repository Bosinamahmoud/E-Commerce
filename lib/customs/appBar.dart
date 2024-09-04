import 'package:ecommerce/classes/Item.dart';
import 'package:flutter/material.dart';

import 'filter.dart';

PreferredSizeWidget getAppBar() {
  Color c = Colors.red;

  return AppBar(
   // backgroundColor: Theme.of(context).primaryColor,
    title: Text(
      "Shoppe",
      style: TextStyle( fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    leading: Builder(builder: (context) {
      return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(Icons.menu, color:  Theme.of(context).primaryColor));
    }),
    actions: [
      Builder(builder: (context) {
        return IconButton(
            onPressed: () {
              Scaffold.of(context)
                  .showBottomSheet((context) {
                    return Filter();
              });
            },
            icon: Icon(Icons.filter_list_outlined, color:  Theme.of(context).primaryColor));
      }),
    ],
  );
}


