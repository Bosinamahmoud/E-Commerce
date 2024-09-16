import 'package:ecommerce/customs/bottomNavigator.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

class HistoryProducts extends StatelessWidget {
  final items;

  HistoryProducts({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "My History Products",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: getBottomNavigator(context, 2),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.502,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 15.0,
                ),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ItemsGrid(item: items[index]);
                })));
  }
}
