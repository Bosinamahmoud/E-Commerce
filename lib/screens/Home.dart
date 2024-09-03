import 'package:ecommerce/screens/signUp.dart';
import 'package:flutter/material.dart';

import '../classes/Item.dart';
import '../customs/appBar.dart';
import '../customs/bottomNavigator.dart';
import '../customs/drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Item> items = [
    Item(
        title: 'Shirt',
        description: 'description',
        price: 200,
        q: 2,
        path: 'path',
        category: Category(type: "Fashion", color: Colors.pink)),
    Item(
        title: 'Computer',
        description: 'description',
        price: 200,
        q: 2,
        path: 'path',
        category: Category(type: "Electronics", color: Colors.blue)),
    Item(
        title: 'Broom',
        description: 'description',
        price: 200,
        q: 2,
        path: 'path',
        category: Category(type: "Home Appliances", color: Colors.deepPurple)),
    Item(
        title: 'Shirt',
        description: 'description',
        price: 200,
        q: 2,
        path: 'path',
        category: Category(type: "Fashion", color: Colors.pink)),
    Item(
        title: 'Computer',
        description: 'description',
        price: 200,
        q: 2,
        path: 'path',
        category: Category(type: "Electronics", color: Colors.blue)),
    Item(
        title: 'Broom',
        description: 'description',
        price: 200,
        q: 2,
        path: 'path',
        category: Category(type: "Home Appliances", color: Colors.deepPurple)),
    Item(
        title: 'Shirt',
        description: 'description',
        price: 200,
        q: 2,
        path: 'path',
        category: Category(type: "Fashion", color: Colors.pink)),
    Item(
        title: 'Computer',
        description: 'description',
        price: 200,
        q: 2,
        path: 'path',
        category: Category(type: "Electronics", color: Colors.blue)),
    Item(
        title: 'Broom',
        description: 'description',
        price: 200,
        q: 2,
        path: 'path',
        category: Category(type: "Home Appliances", color: Colors.deepPurple)),
  ];

  Color c= Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      drawer: getDrawer(),
      bottomNavigationBar: getBottomNavigator(0, context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              GridView.count(
                  childAspectRatio:0.6,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                  children: items.map((item) => ItemsGrid(item: item)).toList()),
            ],
          )
        ),
      ),
    );
  }
}

class ItemsGrid extends StatefulWidget {
  final Item item;

  const ItemsGrid({super.key, required this.item});

  @override
  State<ItemsGrid> createState() => _ItemsGridState();
}

class _ItemsGridState extends State<ItemsGrid> {
  Color? c=Colors.red;
  @override
  Widget build(BuildContext context) {
    final Item item = widget.item;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey[100],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                  color: Colors.teal[50],
                  child: Icon(
                    Icons.ac_unit,
                    size: 170,
                  )),
              Padding(
                padding: EdgeInsets.only(left: 120, top: 150),
                child: CircleAvatar(
                  backgroundColor: c,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.shopping_cart_outlined, color: Colors.white,),
                  ),
                ),
              )
            ],
          ),
          //SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: item.category.color,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(item.category.type, style: TextStyle(color: Colors.white),),
                  ),
                ),
                Text(
                  item.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("${item.price}\$",
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                    Text(
                      "${item.quantity}",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                    )
                  ],
                )
              ],

            ),
          ),
        ],
      ),
    );
  }
}



