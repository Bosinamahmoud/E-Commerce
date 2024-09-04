import 'package:ecommerce/classes/Item.dart';
import 'package:flutter/material.dart';

import 'filter.dart';

PreferredSizeWidget getAppBar() {
  Color c = Colors.red;

  return AppBar(
    backgroundColor: Colors.white,
    title: Text(
      "Shoppe",
      style: TextStyle(color: c, fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    leading: Builder(builder: (context) {
      return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(Icons.menu, color: c));
    }),
    actions: [
      Builder(builder: (context) {
        return IconButton(
            onPressed: () {
              Scaffold.of(context)
                  .showBottomSheet(backgroundColor: Colors.white, (context) {
                    return Filter();
              });
            },
            icon: Icon(Icons.filter_list_outlined, color: c));
      }),
    ],
  );
}


