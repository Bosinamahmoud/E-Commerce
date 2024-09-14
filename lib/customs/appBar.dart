import 'package:ecommerce/classes/Item.dart';
import 'package:flutter/material.dart';

import '../classes/product_search_delegate.dart';
import 'filter.dart';

PreferredSizeWidget getAppBar({required String title,final items}) {
  Color c = Colors.red;

  return AppBar(
   // backgroundColor: Theme.of(context).primaryColor,
    title: Text(
      title,
      style: TextStyle( fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    leading: Builder(builder: (context) {
      return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(Icons.menu, color: Theme.of(context).primaryColor));
    }),
    actions: [
      Builder(builder: (context) {
        return IconButton(
            onPressed: () {
              Scaffold.of(context)
                  .showBottomSheet((context) {
                    return Filter(items: items,);
              });
            },
            icon: Icon(Icons.filter_list_outlined, color:  Theme.of(context).primaryColor));
      }),
      Builder(
        builder: (context) {
          return IconButton(onPressed: (){
            showSearch(context: context, delegate: productSearchDelegate(items: items));
          }, icon: Icon(Icons.search, color: Theme.of(context).primaryColor));
        }
      )
    ],
  );
}


