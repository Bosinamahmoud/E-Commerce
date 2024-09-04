import 'package:ecommerce/customs/appBar.dart';
import 'package:ecommerce/customs/bottomNavigator.dart';
import 'package:ecommerce/customs/drawer.dart';
import 'package:ecommerce/screens/Checkout.dart';
import 'package:flutter/material.dart';

import '../classes/Item.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(""),),
        drawer: getDrawer(),
        bottomNavigationBar: getBottomNavigator(context, 1),
//backgroundColor: Colors.white,
        body: Stack(children: [
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              Item item = items[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Theme.of(context).scaffoldBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 5,
                        )
                      ]),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          item.path,
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.width / 2,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        width: 35
                      ),
                      Column(
                        children: [
                          Text(item.title,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                          Text("${item.price}\$",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor:  Theme.of(context).primaryColor,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.remove,
                                    color: Theme.of(context).scaffoldBackgroundColor,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Text("1",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                              ),
                              CircleAvatar(
                                backgroundColor:  Theme.of(context).primaryColor,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.add,
                                    color: Theme.of(context).scaffoldBackgroundColor,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );

            },
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Checkout()));
                },
                child: Text(
                  "CHECKOUT",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ])

        /*GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisSpacing:4,crossAxisSpacing: 4),

          itemCount: product.length,
          itemBuilder: (context, i) {
            return Container(
              height:100,
               // color: Colors.blue,
                child: Row(
                  children: [
                    Container(
                height:MediaQuery.of(context).size.width / 2,
                width:MediaQuery.of(context).size.width / 2,
                child: Image.asset(product[i]["image"]),),
                    Container(child: Text(product[i]["details"]),),
//height:MediaQuery.of(context).size.width / 2 ,
                  ],
                ),


            );
          }),*/
        );
  }
}
