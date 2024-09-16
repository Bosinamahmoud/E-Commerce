import 'package:ecommerce/classes/Item.dart';
import 'package:ecommerce/screens/Home.dart';
import 'package:ecommerce/screens/itemDescription.dart';
import 'package:flutter/material.dart';

class ShowFilter extends StatelessWidget {
  final  items;

  ShowFilter({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filtered Items"),),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.502,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 15.0,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ItemsGrid(item: items[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

