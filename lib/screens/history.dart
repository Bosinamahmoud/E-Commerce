import 'package:ecommerce/customs/appBar.dart';
import 'package:ecommerce/customs/bottomNavigator.dart';
import 'package:flutter/material.dart';

class history extends StatelessWidget {
   history({super.key});
  final List product = [

    {"name": "blackBag", "image": "assets/blackBag.jpg", "details": "Details"},

    {"name": "greyBag", "image": "assets/greyBag.jpg", "details": "Details"},
    {
      "name": "RoseBlouse",
      "image": "assets/RoseBlouse.jpg",
      "details": "Details"
    },

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      bottomNavigationBar: getBottomNavigator(context , 0),
      body:   Column(
        children: [
          Text(
            "My Orders",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Expanded(

            child: ListView.builder(
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


                      ],
                    )
                  ],
                );

              },
            ),
          ),
        ],
      ),
    );
  }
}
