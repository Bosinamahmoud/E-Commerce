import 'package:ecommerce/classes/Item.dart';
import 'package:ecommerce/customs/appBar.dart';
import 'package:ecommerce/customs/bottomNavigator.dart';
import 'package:ecommerce/customs/drawer.dart';
import 'package:ecommerce/customs/filter.dart';
import 'package:flutter/material.dart';
List<String> trendingPath = [
  "beauty",
  "fragrances",
  "furniture",
  "groceries",

];

class Catagory extends StatelessWidget {
  const Catagory({super.key});

  @override
  Widget build(BuildContext context) { double h = MediaQuery.of(context).size.height;
  double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:AppBar(title:Text("Catagories") ),
      bottomNavigationBar: getBottomNavigator(context, 0),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
