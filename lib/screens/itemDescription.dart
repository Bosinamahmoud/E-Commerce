import 'package:ecommerce/customs/appBar.dart';
import 'package:ecommerce/customs/bottomNavigator.dart';
import 'package:ecommerce/customs/drawer.dart';
import 'package:ecommerce/providers/CartItemsProvider.dart';
import 'package:ecommerce/providers/cartProvider.dart';
import 'package:ecommerce/screens/Cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../classes/Item.dart';

class ProductDetailPage extends StatelessWidget {
  final item1;

  ProductDetailPage({super.key, required this.item1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(item1.title)),
        // drawer: getDrawer(),
        bottomNavigationBar: getBottomNavigator(context, 0),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          item1.path,
                          height: 400,
                        ),
                        SizedBox(height: 16),
                        Text(
                          item1.title,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              Row(
                                  children:List.generate(5, (index) {
                                    return Icon(
                                      (index < item1.star) ? Icons.star : Icons.star_border,
                                      color: Colors.yellow[600],
                                      size: 20,
                                    );
                                  })
                              ),
                              Row(
                                children: [
                                  Text("Quantity:  ",  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[400])),
                                  Text(
                                    "${item1.quantity}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor),
                                  )
                                ],
                              )
                            ]

                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 7,
                                )
                              ]),
                          child: Text(item1.category.type,
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                        ),
                        SizedBox(height: 8),
                        Text(item1.description,  style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey)),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text("Price:  ",  style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[400])),
                            Text(
                              "${item1.price}\$",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            )
                          ],
                        ),

                        SizedBox(height: 100),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: Consumer<Cartprovider>(
                      builder: (context, cartProvider, child) {
                        return ElevatedButton(
                            onPressed: () {
                              print(item1);
                              if (!cartProvider.names.contains(item1.title)) {
                                Provider.of<Cartprovider>(context, listen: false)
                                    .addItem(context, item1);
                              } else
                                null;
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: cartProvider.names.contains(item1.title)
                                  ? Colors.grey
                                  : Colors.red,
                              minimumSize: Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              cartProvider.items.contains(item1)
                                  ? "ADDED TO CART"
                                  : 'ADD TO CART',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ));
                      })),
            ],
          ),
        ));
  }
}
