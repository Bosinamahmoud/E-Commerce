import 'package:ecommerce/screens/signUp.dart';
import 'package:flutter/material.dart';

import '../classes/Item.dart';
import '../customs/appBar.dart';
import '../customs/bottomNavigator.dart';
import '../customs/drawer.dart';

class Home extends StatefulWidget {
  final String username;

  const Home({super.key, required this.username});

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
        star:3,
        path: 'assets/T-shirt1.jpg',
        category: Category(type: "Fashion", color: Colors.pink)),
    Item(
        title: 'Computer',
        description: 'description',
        price: 200,
        q: 2,
        star:5,
        path: 'assets/computer1.jpg',
        category: Category(type: "Electronics", color: Colors.blue)),
    Item(
        title: 'Broom',
        description: 'description',
        price: 200,
        q: 2,
        star:1,
        path: 'assets/broom1.jpg',
        category: Category(type: "Home Appliances", color: Colors.deepPurple)),
    Item(
        title: 'Shirt',
        description: 'description',
        price: 200,
        q: 2,
        path: 'assets/T-shirt1.jpg',
        category: Category(type: "Fashion", color: Colors.pink)),
    Item(
        title: 'Computer',
        description: 'description',
        price: 200,
        q: 2,
        path: 'assets/computer1.jpg',
        category: Category(type: "Electronics", color: Colors.blue)),
    Item(
        title: 'Broom',
        description: 'description',
        price: 200,
        q: 2,
        path: 'assets/broom1.jpg',
        category: Category(type: "Home Appliances", color: Colors.deepPurple)),
  ];

  Color c = Colors.red;

  List<String> trendingPath = [
    "assets/trendin1.jpg",
    "assets/trendin2.jpg",
    "assets/trendin3.jpg",
    "assets/trendin4.jpg",
    "assets/trendin1.jpg",
  ];


  @override
  Widget build(BuildContext context) {
    String username = widget.username;

    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: getAppBar(),
      drawer: getDrawer(),
      bottomNavigationBar: getBottomNavigator(0, username, context),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "TRENDING",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                Container(
                  height: h * 0.23,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: trendingPath.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Container(
                            width: 270,
                            child: GestureDetector(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(trendingPath[index],
                                      width: 270,
                                      height: h * 0.23,
                                      fit: BoxFit.fill)),
                              onTap: () {},
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(height: 30),
                Text(
                  "PRODUCTS",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                GridView.count(
                    childAspectRatio: 0.545,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 15.0,
                    children:
                        items.map((item) => ItemsGrid(item: item)).toList()),
              ],
            )),
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
  Color? c = Colors.red;

  bool isCartPressed=false;
  @override
  Widget build(BuildContext context) {
    final Item item = widget.item;

    double h = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5,
            )
          ]),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                child: Image.asset(
                  "${item.path}",
                  width: 200,
                  height: h * 0.23,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 122, top: 155),
                child: CircleAvatar(
                  backgroundColor: c,
                  child: IconButton(
                    onPressed: () { setState((){
                      print(isCartPressed);
                      isCartPressed=!isCartPressed;});},
                    icon: Icon(
                      isCartPressed?Icons.shopping_cart:Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
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
                Row(
                    children: List.generate(5, (index) {
                      return Icon(
                            (index<item.star)?Icons.star:Icons.star_border,
                            color: Colors.yellow[600],
                            size: 18,
                          );
                    })),
                Text(
                  item.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  item.category.type,
                  style: TextStyle(color: Colors.grey[400]),),
                SizedBox(height: 3),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
