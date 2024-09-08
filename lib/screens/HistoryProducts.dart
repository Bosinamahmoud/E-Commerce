import 'package:ecommerce/customs/appBar.dart';
import 'package:ecommerce/customs/bottomNavigator.dart';
import 'package:ecommerce/customs/drawer.dart';
import 'package:ecommerce/screens/Checkout.dart';
import 'package:flutter/material.dart';

import '../classes/Item.dart';
import 'itemDescription.dart';

class HistoryProducts extends StatelessWidget {
  HistoryProducts({super.key});

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
        appBar: getAppBar(title: "History Cart"),
        drawer: getDrawer(),
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
                itemBuilder: (context, index){

                  return HistoryCartItems(item: items[index]);
                }
            )));
  }
}

class HistoryCartItems extends StatefulWidget {
  final Item item;

  const HistoryCartItems({super.key, required this.item});

  @override
  State<HistoryCartItems> createState() => _HistoryCartItemsState();
}

class _HistoryCartItemsState extends State<HistoryCartItems> {

  @override
  Widget build(BuildContext context) {
    Item item=widget.item;
    double h = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              item1: item,
            )));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5,
            )
          ],
        ),
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
                  padding: EdgeInsets.only(left: 118, top: 155),
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: IconButton(
                      onPressed: () {}, // No need for setState
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        (index < item.star) ? Icons.star : Icons.star_border,
                        color: Colors.yellow[600],
                        size: 18,
                      );
                    }),
                  ),
                  Text(
                    item.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    item.category.type,
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                  SizedBox(height: 3),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${item.price}\$",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          "${item.quantity}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
