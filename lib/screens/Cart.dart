import 'package:ecommerce/customs/appBar.dart';
import 'package:ecommerce/customs/bottomNavigator.dart';
import 'package:ecommerce/customs/drawer.dart';
import 'package:ecommerce/screens/Checkout.dart';
import 'package:flutter/material.dart';

import '../classes/Item.dart';
import 'itemDescription.dart';

class Cart extends StatelessWidget {
  Cart({super.key});

  List<Item> items = [
    Item(
        title: 'Shirt',
        description: 'description',
        price: 200,
        q: 2,
        star: 3,
        path: 'assets/T-shirt1.jpg',
        category: Category(type: "Fashion", color: Colors.pink)),
    Item(
        title: 'Computer',
        description: 'description',
        price: 200,
        q: 2,
        star: 5,
        path: 'assets/computer1.jpg',
        category: Category(type: "Electronics", color: Colors.blue)),
    Item(
        title: 'Broom',
        description: 'description',
        price: 200,
        q: 2,
        star: 1,
        path: 'assets/broom1.jpg',
        category: Category(type: "Home Appliances", color: Colors.deepPurple)),
    Item(
        title: 'Shirt',
        description: 'description',
        price: 200,
        q: 2,
        star: 3,
        path: 'assets/T-shirt1.jpg',
        category: Category(type: "Fashion", color: Colors.pink)),
    Item(
        title: 'Computer',
        description: 'description',
        price: 200,
        q: 2,
        star: 5,
        path: 'assets/computer1.jpg',
        category: Category(type: "Electronics", color: Colors.blue)),
    Item(
        title: 'Broom',
        description: 'description',
        price: 200,
        q: 2,
        star: 1,
        path: 'assets/broom1.jpg',
        category: Category(type: "Home Appliances", color: Colors.deepPurple)),
    Item(
        title: 'Shirt',
        description: 'description',
        price: 200,
        q: 2,
        star: 3,
        path: 'assets/T-shirt1.jpg',
        category: Category(type: "Fashion", color: Colors.pink)),
    Item(
        title: 'Computer',
        description: 'description',
        price: 200,
        q: 2,
        star: 5,
        path: 'assets/computer1.jpg',
        category: Category(type: "Electronics", color: Colors.blue)),
    Item(
        title: 'Broom',
        description: 'description',
        price: 200,
        q: 2,
        star: 1,
        path: 'assets/broom1.jpg',
        category: Category(type: "Home Appliances", color: Colors.deepPurple)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("My Cart")),
       // drawer: getDrawer(),
       // bottomNavigationBar: getBottomNavigator(context, 1),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(children: [
              ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  Item item = items[index];
                  return CartItems(item: item);
                },
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 10,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total:",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text("3000.00\$",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.red)),
                                ]),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10))),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Checkout()));
                              },
                              child: Text(
                                "CHECKOUT",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ])));
  }
}

class CartItems extends StatefulWidget {
  final Item item;

  const CartItems({super.key, required this.item});

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {

  @override
  Widget build(BuildContext context) {
    Item item = widget.item;
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5,
            )
          ],
        ),
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetailPage(
                        item1: item,
                      )));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      item.path,
                      width: w*0.3,
                      height: h*0.15,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
                    ),
                    Row(
                      children: [
                        Text("${item.price}\$",
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        SizedBox(width: 40),
                        Text(
                          "${item.quantity}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.grey[400],
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text("1",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 20)),
                        ),
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.grey[400],
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).primaryColor,
                    )),
              ],
            )),
      ),
    );
  }
}
