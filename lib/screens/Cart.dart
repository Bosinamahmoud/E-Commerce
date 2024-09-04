import 'package:ecommerce/customs/appBar.dart';
import 'package:ecommerce/customs/bottomNavigator.dart';
import 'package:ecommerce/customs/drawer.dart';
import 'package:ecommerce/screens/Checkout.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  Cart({super.key});

  final List product = [
   // {"name": "Bag", "image": "assets/Bag.jpg", "details": "Details"},
    {"name": "blackBag", "image": "assets/blackBag.jpg", "details": "Details"},
   /* {
      "name": "blackShoes",
      "image": "assets/blackShoes.jpg",
      "details": "Details"
    },*/
    {"name": "greyBag", "image": "assets/greyBag.jpg", "details": "Details"},
    {
      "name": "RoseBlouse",
      "image": "assets/RoseBlouse.jpg",
      "details": "Details"
    },
    /*{
      "name": "whiteShoes",
      "image": "assets/whiteShoes.jpg",
      "details": "Details"
    },*/
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(""),),
        drawer: getDrawer(),
        bottomNavigationBar: getBottomNavigator(context , 1),
//backgroundColor: Colors.white,
        body: Stack(children: [
          ListView.builder(
            itemCount: product.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Image.asset(
                    product[index]["image"],
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width / 2,
                    fit: BoxFit.fill,
                  ),
                  Column(
                    children: [
                      Text(product[index]["name"]),
                      Text(product[index]["details"]),Text("price"),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(color:  Theme.of(context).primaryColor,
                            shape: BoxShape.circle),
                              child: Icon(Icons.remove,)
                          ),
                          Text("number"),
                          Container(child: Icon(Icons.add),decoration: BoxDecoration(color:  Theme.of(context).primaryColor,
                              shape: BoxShape.circle),),
                        ],
                      )

                    ],
                  )
                ],
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
                    backgroundColor:  Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Checkout()));
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
